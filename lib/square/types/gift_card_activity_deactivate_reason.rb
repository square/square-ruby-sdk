# frozen_string_literal: true

require_relative "../../square"

module Square
  module Types
    module GiftCardActivityDeactivateReason
      extend Square::Internal::Types::Enum

      SUSPICIOUS_ACTIVITY = "SUSPICIOUS_ACTIVITY"
      UNKNOWN_REASON = "UNKNOWN_REASON"
      CHARGEBACK_DEACTIVATE = "CHARGEBACK_DEACTIVATE"
    end
  end
end
