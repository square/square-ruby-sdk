
module Square
  module Employees
    class ListEmployeesRequest < Internal::Types::Model
      field :location_id, String, optional: true, nullable: false
      field :status, Square::EmployeeStatus, optional: true, nullable: false
      field :limit, Integer, optional: true, nullable: false
      field :cursor, String, optional: true, nullable: false

    end
  end
end
