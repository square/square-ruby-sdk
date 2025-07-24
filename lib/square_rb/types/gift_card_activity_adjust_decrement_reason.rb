# frozen_string_literal: true

module SquareApiClient
# Indicates the reason for deducting money from a [gift card](entity:GiftCard).
  class GiftCardActivityAdjustDecrementReason

    SUSPICIOUS_ACTIVITY = "SUSPICIOUS_ACTIVITY"
    BALANCE_ACCIDENTALLY_INCREASED = "BALANCE_ACCIDENTALLY_INCREASED"
    SUPPORT_ISSUE = "SUPPORT_ISSUE"
    PURCHASE_WAS_REFUNDED = "PURCHASE_WAS_REFUNDED"

  end
end