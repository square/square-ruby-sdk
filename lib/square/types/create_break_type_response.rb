# frozen_string_literal: true

module Square
  # The response to the request to create a `BreakType`. The response contains
  # the created `BreakType` object and might contain a set of `Error` objects if
  # the request resulted in errors.
  class CreateBreakTypeResponse < Internal::Types::Model
    field :break_type, Square::BreakType, optional: true, nullable: false
    field :errors, Internal::Types::Array[Square::Error], optional: true, nullable: false

  end
end
