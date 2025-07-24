# frozen_string_literal: true

module SquareApiClient
# Supported types of an action as a pending change to a subscription.
  class SubscriptionActionType

    CANCEL = "CANCEL"
    PAUSE = "PAUSE"
    RESUME = "RESUME"
    SWAP_PLAN = "SWAP_PLAN"
    CHANGE_BILLING_ANCHOR_DATE = "CHANGE_BILLING_ANCHOR_DATE"

  end
end