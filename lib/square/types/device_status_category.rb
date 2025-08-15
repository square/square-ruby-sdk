
module Square
  class DeviceStatusCategory
    include Square::Internal::Types::Enum
    AVAILABLE = "AVAILABLE"
    NEEDS_ATTENTION = "NEEDS_ATTENTION"
    OFFLINE = "OFFLINE"
  end
end
