# frozen_string_literal: true

module Square
  module Types
    class CatalogObjectMeasurementUnit < CatalogObjectBase
      field :measurement_unit_data, -> { Square::Types::CatalogMeasurementUnit }, optional: true, nullable: false
    end
  end
end
