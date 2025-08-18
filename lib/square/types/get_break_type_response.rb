# frozen_string_literal: true

module Square
  module Types
    # The response to a request to get a `BreakType`. The response contains
    # the requested `BreakType` objects and might contain a set of `Error` objects if
    # the request resulted in errors.
    class GetBreakTypeResponse < Internal::Types::Model
      field :break_type, Square::Types::BreakType, optional: true, nullable: false
      field :errors, Internal::Types::Array[Square::Types::Error], optional: true, nullable: false

    end
  end
end
