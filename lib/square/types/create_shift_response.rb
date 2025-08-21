# frozen_string_literal: true

module Square
  module Types
    # The response to a request to create a `Shift`. The response contains
    # the created `Shift` object and might contain a set of `Error` objects if
    # the request resulted in errors.
    class CreateShiftResponse < Internal::Types::Model
      field :shift, -> { Square::Types::Shift }, optional: true, nullable: false
      field :errors, -> { Internal::Types::Array[Square::Types::Error] }, optional: true, nullable: false
    end
  end
end
