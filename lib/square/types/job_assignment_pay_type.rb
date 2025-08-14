
module Square
  class JobAssignmentPayType
    includes Square::Internal::Types::Enum
    NONE = "NONE"
    HOURLY = "HOURLY"
    SALARY = "SALARY"
  end
end
