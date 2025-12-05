# frozen_string_literal: true

require "custom/test_helper"

describe Square::Internal::Types::Boolean do
  describe ".coerce" do
    it "coerces true/false" do
      assert Square::Internal::Types::Boolean.coerce(true)
      refute Square::Internal::Types::Boolean.coerce(false)
    end

    it "coerces an Integer" do
      assert Square::Internal::Types::Boolean.coerce(1)
      refute Square::Internal::Types::Boolean.coerce(0)
    end

    it "coerces a String" do
      assert Square::Internal::Types::Boolean.coerce("1")
      assert Square::Internal::Types::Boolean.coerce("true")
      refute Square::Internal::Types::Boolean.coerce("0")
    end

    it "passes through other values with strictness off" do
      obj = Object.new

      assert_equal obj, Square::Internal::Types::Boolean.coerce(obj)
    end

    it "raises an error with other values with strictness on" do
      assert_raises Square::Internal::Errors::TypeError do
        Square::Internal::Types::Boolean.coerce(Object.new, strict: true)
      end
    end
  end
end
