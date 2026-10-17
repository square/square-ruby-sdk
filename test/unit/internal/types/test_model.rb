# frozen_string_literal: true

require "test_helper"

describe Square::Internal::Types::Model do
  module StringInteger
    extend Square::Internal::Types::Union

    member String
    member Integer
  end

  class ExampleModel < Square::Internal::Types::Model
    field :name, String
    field :rating, StringInteger, optional: true
    field :year, Integer, optional: true, nullable: true, api_name: "yearOfRelease"
  end

  class ExampleModelInheritance < ExampleModel
    field :director, String
  end

  class ExampleWithDefaults < ExampleModel
    field :type, String, default: "example"
  end

  class ExampleChild < Square::Internal::Types::Model
    field :value, String
  end

  class ExampleParent < Square::Internal::Types::Model
    field :child, ExampleChild
  end

  describe ".field" do
    before do
      @example = ExampleModel.new(name: "Inception", rating: 4)
    end

    it "defines fields on model" do
      assert_equal %i[name rating year], ExampleModel.fields.keys
    end

    it "defines fields from parent models" do
      assert_equal %i[name rating year director], ExampleModelInheritance.fields.keys
    end

    it "sets the field's type" do
      assert_equal String, ExampleModel.fields[:name].type
      assert_equal StringInteger, ExampleModel.fields[:rating].type
    end

    it "sets the `default` option" do
      assert_equal "example", ExampleWithDefaults.fields[:type].default
    end

    it "defines getters" do
      assert_respond_to @example, :name
      assert_respond_to @example, :rating

      assert_equal "Inception", @example.name
      assert_equal 4, @example.rating
    end

    it "defines setters" do
      assert_respond_to @example, :name=
      assert_respond_to @example, :rating=

      @example.name = "Inception 2"
      @example.rating = 5

      assert_equal "Inception 2", @example.name
      assert_equal 5, @example.rating
    end
  end

  describe "#initialize" do
    it "sets the data" do
      example = ExampleModel.new(name: "Inception", rating: 4)

      assert_equal "Inception", example.name
      assert_equal 4, example.rating
    end

    it "allows extra fields to be set" do
      example = ExampleModel.new(name: "Inception", rating: 4, director: "Christopher Nolan")

      assert_equal "Christopher Nolan", example.director
    end

    it "sets the defaults where applicable" do
      example_using_defaults = ExampleWithDefaults.new

      assert_equal "example", example_using_defaults.type

      example_without_defaults = ExampleWithDefaults.new(type: "not example")

      assert_equal "not example", example_without_defaults.type
    end

    it "coerces child models" do
      parent = ExampleParent.new(child: { value: "foobar" })

      assert_kind_of ExampleChild, parent.child
    end

    it "uses the api_name to pull the value" do
      example = ExampleModel.new({ name: "Inception", yearOfRelease: 2014 })

      assert_equal 2014, example.year
      refute_respond_to example, :yearOfRelease
    end
  end

  describe "falsy values and serialization" do
    class BooleanModel < Square::Internal::Types::Model
      field :enabled, Square::Internal::Types::Boolean, optional: true, default: true
      field :disabled, Square::Internal::Types::Boolean, optional: true, default: false
      field :aliased, Square::Internal::Types::Boolean, optional: true, api_name: "apiFlag"
    end

    it "preserves false rather than deleting it or applying the default" do
      model = BooleanModel.new(enabled: false, apiFlag: false)

      assert_same false, model.enabled
      assert_same false, model.disabled
      assert_same false, model.aliased
      assert_equal({ "enabled" => false, "disabled" => false, "apiFlag" => false }, model.to_h)
      assert_same false, BooleanModel.new(aliased: false).aliased
    end

    it "leaves the caller's hash unchanged while accepting string and API keys" do
      values = { "name" => "Inception", "yearOfRelease" => "2014" }.freeze
      model = ExampleModel.new(values)

      assert_equal 2014, model.year
      assert_equal({ "name" => "Inception", "yearOfRelease" => "2014" }, values)
    end

    it "keeps nullable values as nil in serialized output" do
      assert_nil ExampleModel.new(name: "Inception").to_h["yearOfRelease"]
    end

    it "recursively serializes maps and nested arrays of models" do
      model = ExampleModel.new(name: "Inception", nested: { children: [[ExampleChild.new(value: "child")]] })

      assert_equal({ children: [[{ "value" => "child" }]] }, model.to_h["nested"])
    end
  end

  describe "#inspect" do
    class SensitiveModel < Square::Internal::Types::Model
      field :username, String
      field :password, String
      field :client_secret, String
      field :access_token, String
      field :api_key, String
    end

    it "redacts sensitive fields" do
      model = SensitiveModel.new(
        username: "user123",
        password: "secret123",
        client_secret: "cs_abc",
        access_token: "token_xyz",
        api_key: "key_123"
      )

      inspect_output = model.inspect

      assert_includes inspect_output, "username=\"user123\""
      assert_includes inspect_output, "password=[REDACTED]"
      assert_includes inspect_output, "client_secret=[REDACTED]"
      assert_includes inspect_output, "access_token=[REDACTED]"
      assert_includes inspect_output, "api_key=[REDACTED]"
      refute_includes inspect_output, "secret123"
      refute_includes inspect_output, "cs_abc"
      refute_includes inspect_output, "token_xyz"
      refute_includes inspect_output, "key_123"
    end

    it "does not redact non-sensitive fields" do
      example = ExampleModel.new(name: "Inception", rating: 4)
      inspect_output = example.inspect

      assert_includes inspect_output, "name=\"Inception\""
      assert_includes inspect_output, "rating=4"
    end
  end
end
