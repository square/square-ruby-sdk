
module Square
  class CashDrawerShiftState
    includes Square::Internal::Types::Enum
    OPEN = "OPEN"
    ENDED = "ENDED"
    CLOSED = "CLOSED"
  end
end
