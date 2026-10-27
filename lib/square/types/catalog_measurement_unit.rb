# frozen_string_literal: true

require_relative "../../square"

module Square
  module Types
    # Represents the unit used to measure a `CatalogItemVariation` and
    # specifies the precision for decimal quantities.
    class CatalogMeasurementUnit < Internal::Types::Model
      field :measurement_unit, -> { Square::Types::MeasurementUnit }, optional: true, nullable: false

      field :precision, -> { Integer }, optional: true, nullable: true
    end
  end
end
