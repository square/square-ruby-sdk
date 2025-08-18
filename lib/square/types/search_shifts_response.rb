# frozen_string_literal: true

module Square
  module Types
    # The response to a request for `Shift` objects. The response contains
    # the requested `Shift` objects and might contain a set of `Error` objects if
    # the request resulted in errors.
    class SearchShiftsResponse < Internal::Types::Model
      field :shifts, Internal::Types::Array[Square::Types::Shift], optional: true, nullable: false
      field :cursor, String, optional: true, nullable: false
      field :errors, Internal::Types::Array[Square::Types::Error], optional: true, nullable: false

    end
  end
end
