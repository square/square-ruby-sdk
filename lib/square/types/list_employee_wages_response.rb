# frozen_string_literal: true

module Square
    module Types
        # The response to a request for a set of `EmployeeWage` objects. The response contains
        # a set of `EmployeeWage` objects.
        class ListEmployeeWagesResponse < Square::Internal::Types::Model
            field :employee_wages, Square::Internal::Types::Array[Square::EmployeeWage], optional: true, nullable: false
            field :cursor, String, optional: true, nullable: false
            field :errors, Square::Internal::Types::Array[Square::Error], optional: true, nullable: false
        end
    end
end
