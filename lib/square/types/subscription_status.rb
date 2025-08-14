
module Square
    module Types
        class SubscriptionStatus < Square::Internal::Types::Enum
            PENDING = "PENDING"
            ACTIVE = "ACTIVE"
            CANCELED = "CANCELED"
            DEACTIVATED = "DEACTIVATED"
            PAUSED = "PAUSED"
        end
    end
end
