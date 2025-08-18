# frozen_string_literal: true

module Square
  module Types
    # The information needed to define a custom unit, provided by the seller.
    class MeasurementUnitCustom < Internal::Types::Model
      field :name, String, optional: false, nullable: false
      field :abbreviation, String, optional: false, nullable: false

    end
  end
end
