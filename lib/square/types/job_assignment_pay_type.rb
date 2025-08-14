
module Square
  class JobAssignmentPayType
    include Square::Internal::Types::Enum
    NONE = "NONE"
    HOURLY = "HOURLY"
    SALARY = "SALARY"
  end
end
