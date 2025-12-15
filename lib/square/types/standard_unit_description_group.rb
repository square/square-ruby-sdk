# frozen_string_literal: true

module Square
  module Types
    # Group of standard measurement units.
    class StandardUnitDescriptionGroup < Internal::Types::Model
      field :standard_unit_descriptions, -> { Internal::Types::Array[Square::Types::StandardUnitDescription] }, optional: true, nullable: false
      field :language_code, -> { String }, optional: true, nullable: false
    end
  end
end
