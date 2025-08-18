# frozen_string_literal: true

module Square
  module Types
    module MeasurementUnitLength
      extend Square::Internal::Types::Enum
      IMPERIAL_INCH = "IMPERIAL_INCH"
      IMPERIAL_FOOT = "IMPERIAL_FOOT"
      IMPERIAL_YARD = "IMPERIAL_YARD"
      IMPERIAL_MILE = "IMPERIAL_MILE"
      METRIC_MILLIMETER = "METRIC_MILLIMETER"
      METRIC_CENTIMETER = "METRIC_CENTIMETER"
      METRIC_METER = "METRIC_METER"
      METRIC_KILOMETER = "METRIC_KILOMETER"end
  end
end
