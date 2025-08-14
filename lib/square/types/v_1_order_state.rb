
module Square
  class V1OrderState
    includes Square::Internal::Types::Enum
    PENDING = "PENDING"
    OPEN = "OPEN"
    COMPLETED = "COMPLETED"
    CANCELED = "CANCELED"
    REFUNDED = "REFUNDED"
    REJECTED = "REJECTED"
  end
end
