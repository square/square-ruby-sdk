
module Square
  class TimecardStatus
    includes Square::Internal::Types::Enum
    OPEN = "OPEN"
    CLOSED = "CLOSED"
  end
end
