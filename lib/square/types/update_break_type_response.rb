# frozen_string_literal: true

module Square
  # A response to a request to update a `BreakType`. The response contains
  # the requested `BreakType` objects and might contain a set of `Error` objects if
  # the request resulted in errors.
  class UpdateBreakTypeResponse < Internal::Types::Model
    field :break_type, Square::BreakType, optional: true, nullable: false
    field :errors, Internal::Types::Array[Square::Error], optional: true, nullable: false

  end
end
