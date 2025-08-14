
module Square
    module Types
        class LoyaltyPromotionStatus
            extends Square::Internal::Types::Enum
            ACTIVE = "ACTIVE"
            ENDED = "ENDED"
            CANCELED = "CANCELED"
            SCHEDULED = "SCHEDULED"
        end
    end
end
