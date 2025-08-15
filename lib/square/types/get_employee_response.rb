# frozen_string_literal: true

module Square
  class GetEmployeeResponse < Internal::Types::Model
    field :employee, Square::Employee, optional: true, nullable: false
    field :errors, Internal::Types::Array[Square::Error], optional: true, nullable: false

  end
end
