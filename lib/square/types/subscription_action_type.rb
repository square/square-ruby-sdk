
module Square
    module Types
        class SubscriptionActionType < Square::Internal::Types::Enum
            CANCEL = "CANCEL"
            PAUSE = "PAUSE"
            RESUME = "RESUME"
            SWAP_PLAN = "SWAP_PLAN"
            CHANGE_BILLING_ANCHOR_DATE = "CHANGE_BILLING_ANCHOR_DATE"
        end
    end
end
