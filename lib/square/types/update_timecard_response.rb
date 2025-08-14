# frozen_string_literal: true

module Square
    module Types
        # The response to a request to update a `Timecard`. The response contains
        # the updated `Timecard` object and might contain a set of `Error` objects if
        # the request resulted in errors.
        class UpdateTimecardResponse < Square::Internal::Types::Model
            field :timecard, Square::Timecard, optional: true, nullable: false
            field :errors, Square::Internal::Types::Array[Square::Types::Error], optional: true, nullable: false
        end
    end
end
