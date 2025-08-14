
module Square
  class GiftCardActivityAdjustIncrementReason
    includes Square::Internal::Types::Enum
    COMPLIMENTARY = "COMPLIMENTARY"
    SUPPORT_ISSUE = "SUPPORT_ISSUE"
    TRANSACTION_VOIDED = "TRANSACTION_VOIDED"
  end
end
