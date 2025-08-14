
module Square
    module Types
        class PayoutStatus < Square::Internal::Types::Enum
            SENT = "SENT"
            FAILED = "FAILED"
            PAID = "PAID"
        end
    end
end
