# frozen_string_literal: true

module Square
    module Types
        # The response to a request to create a `Shift`. The response contains
        # the created `Shift` object and might contain a set of `Error` objects if
        # the request resulted in errors.
        class CreateShiftResponse < Square::Internal::Types::Model
            field :shift, Square::Shift, optional: true, nullable: false
            field :errors, Square::Internal::Types::Array[Square::Types::Error], optional: true, nullable: false
        end
    end
end
