# frozen_string_literal: true

module SquareApiClient
# Indicates the reason for deactivating a [gift card](entity:GiftCard).
  class GiftCardActivityDeactivateReason

    SUSPICIOUS_ACTIVITY = "SUSPICIOUS_ACTIVITY"
    UNKNOWN_REASON = "UNKNOWN_REASON"
    CHARGEBACK_DEACTIVATE = "CHARGEBACK_DEACTIVATE"

  end
end