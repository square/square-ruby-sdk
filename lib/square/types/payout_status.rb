
module Square
  class PayoutStatus
    include Square::Internal::Types::Enum
    SENT = "SENT"
    FAILED = "FAILED"
    PAID = "PAID"
  end
end
