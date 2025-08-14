
module Square
  class DeviceCodeStatus
    includes Square::Internal::Types::Enum
    UNKNOWN = "UNKNOWN"
    UNPAIRED = "UNPAIRED"
    PAIRED = "PAIRED"
    EXPIRED = "EXPIRED"
  end
end
