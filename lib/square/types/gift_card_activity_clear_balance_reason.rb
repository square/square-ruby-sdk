
module Square
  class GiftCardActivityClearBalanceReason
    includes Square::Internal::Types::Enum
    SUSPICIOUS_ACTIVITY = "SUSPICIOUS_ACTIVITY"
    REUSE_GIFTCARD = "REUSE_GIFTCARD"
    UNKNOWN_REASON = "UNKNOWN_REASON"
  end
end
