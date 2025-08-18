# frozen_string_literal: true

module Square
  module Types
    # Represents the unit used to measure a `CatalogItemVariation` and
    # specifies the precision for decimal quantities.
    class CatalogMeasurementUnit < Internal::Types::Model
      field :measurement_unit, -> { Square::Types::MeasurementUnit }, optional: true, nullable: false
      field :precision, -> { Integer }, optional: true, nullable: false

    end
  end
end
