# frozen_string_literal: true

require_relative "../../square"

module Square
  module Types
    # Group of standard measurement units.
    class StandardUnitDescriptionGroup < Internal::Types::Model
      field :standard_unit_descriptions, -> { Internal::Types::Array[Square::Types::StandardUnitDescription] }, optional: true, nullable: true

      field :language_code, -> { String }, optional: true, nullable: true
    end
  end
end
