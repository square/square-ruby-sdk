
module Square
    module Types
        class RefundStatus < Square::Internal::Types::Enum
            PENDING = "PENDING"
            APPROVED = "APPROVED"
            REJECTED = "REJECTED"
            FAILED = "FAILED"
        end
    end
end
