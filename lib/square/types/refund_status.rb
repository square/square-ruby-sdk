
module Square
  class RefundStatus
    include Square::Internal::Types::Enum
    PENDING = "PENDING"
    APPROVED = "APPROVED"
    REJECTED = "REJECTED"
    FAILED = "FAILED"
  end
end
