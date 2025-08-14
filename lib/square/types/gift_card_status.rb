
module Square
    module Types
        class GiftCardStatus
            extends Square::Internal::Types::Enum
            ACTIVE = "ACTIVE"
            DEACTIVATED = "DEACTIVATED"
            BLOCKED = "BLOCKED"
            PENDING = "PENDING"
        end
    end
end
