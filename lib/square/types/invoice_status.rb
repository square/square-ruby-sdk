
module Square
    module Types
        module InvoiceStatus
            extends Square::Internal::Types::Enum
            DRAFT = "DRAFT"
            UNPAID = "UNPAID"
            SCHEDULED = "SCHEDULED"
            PARTIALLY_PAID = "PARTIALLY_PAID"
            PAID = "PAID"
            PARTIALLY_REFUNDED = "PARTIALLY_REFUNDED"
            REFUNDED = "REFUNDED"
            CANCELED = "CANCELED"
            FAILED = "FAILED"
            PAYMENT_PENDING = "PAYMENT_PENDING"end
    end
end
