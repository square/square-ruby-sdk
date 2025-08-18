# frozen_string_literal: true

module Square
  module Types
    # A response to a request to get a `Shift`. The response contains
    # the requested `Shift` object and might contain a set of `Error` objects if
    # the request resulted in errors.
    class GetShiftResponse < Internal::Types::Model
      field :shift, Square::Types::Shift, optional: true, nullable: false
      field :errors, Internal::Types::Array[Square::Types::Error], optional: true, nullable: false

    end
  end
end
