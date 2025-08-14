
module Square
  class TimecardStatus
    include Square::Internal::Types::Enum
    OPEN = "OPEN"
    CLOSED = "CLOSED"
  end
end
