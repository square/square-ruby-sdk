
module Square
  class RefundStatus
    includes Square::Internal::Types::Enum
    PENDING = "PENDING"
    APPROVED = "APPROVED"
    REJECTED = "REJECTED"
    FAILED = "FAILED"
  end
end
