# frozen_string_literal: true

module Square
  module Types
    # A response to a request to get an `EmployeeWage`. The response contains
    # the requested `EmployeeWage` objects and might contain a set of `Error` objects if
    # the request resulted in errors.
    class GetEmployeeWageResponse < Internal::Types::Model
      field :employee_wage, Square::Types::EmployeeWage, optional: true, nullable: false
      field :errors, Internal::Types::Array[Square::Types::Error], optional: true, nullable: false

    end
  end
end
