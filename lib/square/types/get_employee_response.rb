# frozen_string_literal: true

module Square
    module Types
        class GetEmployeeResponse < Square::Internal::Types::Model
            field :employee, Square::Employee, optional: true, nullable: false
            field :errors, Square::Internal::Types::Array[Square::Error], optional: true, nullable: false
        end
    end
end
