
module Square
    module Types
        class InvoicePaymentReminderStatus
            extends Square::Internal::Types::Enum
            PENDING = "PENDING"
            NOT_APPLICABLE = "NOT_APPLICABLE"
            SENT = "SENT"
        end
    end
end
