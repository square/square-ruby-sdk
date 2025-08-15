
module Square
  module Types
    module RefundStatus
      extends Square::Internal::Types::Enum
      PENDING = "PENDING"
      APPROVED = "APPROVED"
      REJECTED = "REJECTED"
      FAILED = "FAILED"end
  end
end
