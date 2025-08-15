
module Square
  class SubscriptionActionType
    include Square::Internal::Types::Enum
    CANCEL = "CANCEL"
    PAUSE = "PAUSE"
    RESUME = "RESUME"
    SWAP_PLAN = "SWAP_PLAN"
    CHANGE_BILLING_ANCHOR_DATE = "CHANGE_BILLING_ANCHOR_DATE"
  end
end
