# frozen_string_literal: true

module Square
  module Employees
    module Types
      class GetEmployeesRequest < Internal::Types::Model
        field :id, -> { String }, optional: false, nullable: false
      end
    end
  end
end
