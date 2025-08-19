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

    it "defines the accessors" do
      assert_respond_to @example, :name
      assert_respond_to @example, :rating
    end

    it "defines the setters" do
      assert_respond_to @example, :name=
      assert_respond_to @example, :rating=
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

  describe "#to_h" do
    it "adds optional and nullable fields to output" do
      skip "Skipping for now."
      example = ExampleModel.new(
        name: "Inception"
      )

      output = example.to_h

      assert_equal "Inception", output[:name]

      # `rating` is optional but not nullable, so we don't return it at all if it is not present
      refute_includes output.keys, :rating

      # `year` is optional AND nullable, so we return a nil value
      assert_includes output.keys, :yearOfRelease
      assert_nil output[:yearOfRelease]
    end
  end
end
