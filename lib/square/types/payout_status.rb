
module Square
    module Types
        class PayoutStatus
            extends Square::Internal::Types::Enum
            SENT = "SENT"
            FAILED = "FAILED"
            PAID = "PAID"
        end
    end
end
