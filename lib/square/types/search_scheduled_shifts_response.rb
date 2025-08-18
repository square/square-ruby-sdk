# frozen_string_literal: true

module Square
  module Types
    # Represents a [SearchScheduledShifts](api-endpoint:Labor-SearchScheduledShifts) response.
    # Either `scheduled_shifts` or `errors` is present in the response.
    class SearchScheduledShiftsResponse < Internal::Types::Model
      field :scheduled_shifts, Internal::Types::Array[Square::Types::ScheduledShift], optional: true, nullable: false
      field :cursor, String, optional: true, nullable: false
      field :errors, Internal::Types::Array[Square::Types::Error], optional: true, nullable: false

    end
  end
end
