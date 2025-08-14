
module Square
  class GiftCardActivityDeactivateReason
    includes Square::Internal::Types::Enum
    SUSPICIOUS_ACTIVITY = "SUSPICIOUS_ACTIVITY"
    UNKNOWN_REASON = "UNKNOWN_REASON"
    CHARGEBACK_DEACTIVATE = "CHARGEBACK_DEACTIVATE"
  end
end
