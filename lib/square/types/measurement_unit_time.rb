
module Square
  class MeasurementUnitTime
    include Square::Internal::Types::Enum
    GENERIC_MILLISECOND = "GENERIC_MILLISECOND"
    GENERIC_SECOND = "GENERIC_SECOND"
    GENERIC_MINUTE = "GENERIC_MINUTE"
    GENERIC_HOUR = "GENERIC_HOUR"
    GENERIC_DAY = "GENERIC_DAY"
  end
end
