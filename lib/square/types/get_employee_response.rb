# frozen_string_literal: true

module Square
  module Types
    class GetEmployeeResponse < Internal::Types::Model
      field :employee, -> { Square::Types::Employee }, optional: true, nullable: false
      field :errors, -> { Internal::Types::Array[Square::Types::Error] }, optional: true, nullable: false

    end
  end
end
