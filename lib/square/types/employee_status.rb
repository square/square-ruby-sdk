
module Square
  class EmployeeStatus
    include Square::Internal::Types::Enum
    ACTIVE = "ACTIVE"
    INACTIVE = "INACTIVE"
  end
end
