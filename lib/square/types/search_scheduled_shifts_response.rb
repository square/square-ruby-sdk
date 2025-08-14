# frozen_string_literal: true

module Square
    module Types
        # Represents a [SearchScheduledShifts](api-endpoint:Labor-SearchScheduledShifts) response.
        # Either `scheduled_shifts` or `errors` is present in the response.
        class SearchScheduledShiftsResponse < Square::Internal::Types::Model
            field :scheduled_shifts, Square::Internal::Types::Array[Square::ScheduledShift], optional: true, nullable: false
            field :cursor, String, optional: true, nullable: false
            field :errors, Square::Internal::Types::Array[Square::Error], optional: true, nullable: false
        end
    end
end
