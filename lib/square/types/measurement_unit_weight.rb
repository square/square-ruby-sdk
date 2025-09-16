# frozen_string_literal: true

module Square
  module Types
    module MeasurementUnitWeight
      extend Square::Internal::Types::Enum

      IMPERIAL_WEIGHT_OUNCE = "IMPERIAL_WEIGHT_OUNCE"
      IMPERIAL_POUND = "IMPERIAL_POUND"
      IMPERIAL_STONE = "IMPERIAL_STONE"
      METRIC_MILLIGRAM = "METRIC_MILLIGRAM"
      METRIC_GRAM = "METRIC_GRAM"
      METRIC_KILOGRAM = "METRIC_KILOGRAM"
    end
  end
end
