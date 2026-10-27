# frozen_string_literal: true

require_relative "../../square"

module Square
  module Types
    # Contains the name and abbreviation for standard measurement unit.
    class StandardUnitDescription < Internal::Types::Model
      field :unit, -> { Square::Types::MeasurementUnit }, optional: true, nullable: false

      field :name, -> { String }, optional: true, nullable: true

      field :abbreviation, -> { String }, optional: true, nullable: true
    end
  end
end
