
module Square
  class OrderState
    include Square::Internal::Types::Enum
    OPEN = "OPEN"
    COMPLETED = "COMPLETED"
    CANCELED = "CANCELED"
    DRAFT = "DRAFT"
  end
end
