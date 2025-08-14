
module Square
  class TimecardFilterStatus
    includes Square::Internal::Types::Enum
    OPEN = "OPEN"
    CLOSED = "CLOSED"
  end
end
