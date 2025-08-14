
module Square
    module Types
        class RefundStatus
            extends Square::Internal::Types::Enum
            PENDING = "PENDING"
            APPROVED = "APPROVED"
            REJECTED = "REJECTED"
            FAILED = "FAILED"
        end
    end
end
