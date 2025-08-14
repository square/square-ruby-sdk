# frozen_string_literal: true

module Square
    module Types
        # The response to a request to update a `Shift`. The response contains
        # the updated `Shift` object and might contain a set of `Error` objects if
        # the request resulted in errors.
        class UpdateShiftResponse < Square::Internal::Types::Model
            field :shift, Square::Shift, optional: true, nullable: false
            field :errors, Square::Internal::Types::Array[Square::Error], optional: true, nullable: false
        end
    end
end
