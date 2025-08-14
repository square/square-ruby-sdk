# frozen_string_literal: true

module Square
    module Types
        # The response to a request to delete a `Timecard`. The response might contain a set of 
        # `Error` objects if the request resulted in errors.
        class DeleteTimecardResponse < Internal::Types::Model
            field :errors, Internal::Types::Array[Square::Error], optional: true, nullable: false
        end
    end
end
