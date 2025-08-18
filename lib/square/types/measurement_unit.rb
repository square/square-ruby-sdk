# frozen_string_literal: true

module Square
  module Types
    # Represents a unit of measurement to use with a quantity, such as ounces
    # or inches. Exactly one of the following fields are required: `custom_unit`,
    # `area_unit`, `length_unit`, `volume_unit`, and `weight_unit`.
    class MeasurementUnit < Internal::Types::Model
      field :custom_unit, -> { Square::Types::MeasurementUnitCustom }, optional: true, nullable: false
      field :area_unit, -> { Square::Types::MeasurementUnitArea }, optional: true, nullable: false
      field :length_unit, -> { Square::Types::MeasurementUnitLength }, optional: true, nullable: false
      field :volume_unit, -> { Square::Types::MeasurementUnitVolume }, optional: true, nullable: false
      field :weight_unit, -> { Square::Types::MeasurementUnitWeight }, optional: true, nullable: false
      field :generic_unit, -> { String }, optional: true, nullable: false
      field :time_unit, -> { Square::Types::MeasurementUnitTime }, optional: true, nullable: false
      field :type, -> { Square::Types::MeasurementUnitUnitType }, optional: true, nullable: false

    end
  end
end
