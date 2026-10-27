# frozen_string_literal: true

module Square
  module Employees
    module Types
      class ListEmployeesRequest < Internal::Types::Model
        field :location_id, -> { String }, optional: true, nullable: true

        field :status, -> { Square::Types::EmployeeStatus }, optional: true, nullable: true

        field :limit, -> { Integer }, optional: true, nullable: true

        field :cursor, -> { String }, optional: true, nullable: true
      end
    end
  end
end
