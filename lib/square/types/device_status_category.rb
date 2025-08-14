
module Square
  class DeviceStatusCategory
    includes Square::Internal::Types::Enum
    AVAILABLE = "AVAILABLE"
    NEEDS_ATTENTION = "NEEDS_ATTENTION"
    OFFLINE = "OFFLINE"
  end
end
