
module Square
    module Types
        class DeviceCodeStatus
            extends Square::Internal::Types::Enum
            UNKNOWN = "UNKNOWN"
            UNPAIRED = "UNPAIRED"
            PAIRED = "PAIRED"
            EXPIRED = "EXPIRED"
        end
    end
end
