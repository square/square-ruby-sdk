
module Square
  class OrderState
    includes Square::Internal::Types::Enum
    OPEN = "OPEN"
    COMPLETED = "COMPLETED"
    CANCELED = "CANCELED"
    DRAFT = "DRAFT"
  end
end
