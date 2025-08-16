# frozen_string_literal: true

module Square
  module Types
    # The response to a request to delete a `Shift`. The response might contain a set of 
    # `Error` objects if the request resulted in errors.
    class DeleteShiftResponse < Internal::Types::Model
      field :errors, Internal::Types::Array[Square::Error], optional: true, nullable: false

    end
  end
end
