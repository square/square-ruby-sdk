
module Square
  class DeviceCodeStatus
    include Square::Internal::Types::Enum
    UNKNOWN = "UNKNOWN"
    UNPAIRED = "UNPAIRED"
    PAIRED = "PAIRED"
    EXPIRED = "EXPIRED"
  end
end
