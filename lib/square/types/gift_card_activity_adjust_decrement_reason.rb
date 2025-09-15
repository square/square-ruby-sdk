# frozen_string_literal: true

module Square
  module Types
    module GiftCardActivityAdjustDecrementReason
      extend Square::Internal::Types::Enum

      SUSPICIOUS_ACTIVITY = "SUSPICIOUS_ACTIVITY"
      BALANCE_ACCIDENTALLY_INCREASED = "BALANCE_ACCIDENTALLY_INCREASED"
      SUPPORT_ISSUE = "SUPPORT_ISSUE"
      PURCHASE_WAS_REFUNDED = "PURCHASE_WAS_REFUNDED"
    end
  end
end
