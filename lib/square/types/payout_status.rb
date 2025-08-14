
module Square
  class PayoutStatus
    includes Square::Internal::Types::Enum
    SENT = "SENT"
    FAILED = "FAILED"
    PAID = "PAID"
  end
end
