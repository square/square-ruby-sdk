
module Square
  class EmployeeStatus
    includes Square::Internal::Types::Enum
    ACTIVE = "ACTIVE"
    INACTIVE = "INACTIVE"
  end
end
