# frozen_string_literal: true

module Square
    module Types
        class ListEmployeesResponse < Internal::Types::Model
            field :employees, Internal::Types::Array[Square::Employee], optional: true, nullable: false
            field :cursor, String, optional: true, nullable: false
            field :errors, Internal::Types::Array[Square::Error], optional: true, nullable: false
        end
    end
end
