
module Square
  class InvoicePaymentReminderStatus
    includes Square::Internal::Types::Enum
    PENDING = "PENDING"
    NOT_APPLICABLE = "NOT_APPLICABLE"
    SENT = "SENT"
  end
end
