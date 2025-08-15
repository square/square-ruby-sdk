
module Square
  class CashDrawerShiftState
    include Square::Internal::Types::Enum
    OPEN = "OPEN"
    ENDED = "ENDED"
    CLOSED = "CLOSED"
  end
end
