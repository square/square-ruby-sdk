# frozen_string_literal: true

module Square
    module Types
        class ListEmployeesResponse < Square::Internal::Types::Model
            field :employees, Square::Internal::Types::Array[Square::Employee], optional: true, nullable: false
            field :cursor, String, optional: true, nullable: false
            field :errors, Square::Internal::Types::Array[Square::Types::Error], optional: true, nullable: false
        end
    end
end
