# frozen_string_literal: true

module Square
  module Types
    class CatalogObjectMeasurementUnit < Internal::Types::Model
      field :measurement_unit_data, -> { Square::Types::CatalogMeasurementUnit }, optional: true, nullable: false
    end
  end
end
