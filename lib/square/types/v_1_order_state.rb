
module Square
    module Types
        class V1OrderState < Square::Internal::Types::Enum
            PENDING = "PENDING"
            OPEN = "OPEN"
            COMPLETED = "COMPLETED"
            CANCELED = "CANCELED"
            REFUNDED = "REFUNDED"
            REJECTED = "REJECTED"
        end
    end
end
