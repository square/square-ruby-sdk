# frozen_string_literal: true

module Square
  module Labor
    module EmployeeWages
      module Types
        class ListEmployeeWagesRequest < Internal::Types::Model
          field :employee_id, -> { String }, optional: true, nullable: true

          field :limit, -> { Integer }, optional: true, nullable: true

          field :cursor, -> { String }, optional: true, nullable: true
        end
      end
    end
  end
end
