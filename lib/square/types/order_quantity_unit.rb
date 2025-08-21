# frozen_string_literal: true

module Square
  module Types
    # Contains the measurement unit for a quantity and a precision that
    # specifies the number of digits after the decimal point for decimal quantities.
    class OrderQuantityUnit < Internal::Types::Model
      field :measurement_unit, -> { Square::Types::MeasurementUnit }, optional: true, nullable: false
      field :precision, -> { Integer }, optional: true, nullable: false
      field :catalog_object_id, -> { String }, optional: true, nullable: false
      field :catalog_version, -> { Integer }, optional: true, nullable: false
    end
  end
end
