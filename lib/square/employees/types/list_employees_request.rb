
module Square
  module Employees
    module Types
      class ListEmployeesRequest < Internal::Types::Model
        field :location_id, -> { String }, optional: true, nullable: false
        field :status, -> { Square::Types::EmployeeStatus }, optional: true, nullable: false
        field :limit, -> { Integer }, optional: true, nullable: false
        field :cursor, -> { String }, optional: true, nullable: false

      end
    end
  end
end
