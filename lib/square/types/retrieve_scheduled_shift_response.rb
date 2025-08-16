# frozen_string_literal: true

module Square
  module Types
    # Represents a [RetrieveScheduledShift](api-endpoint:Labor-RetrieveScheduledShift) response.
    # Either `scheduled_shift` or `errors` is present in the response.
    class RetrieveScheduledShiftResponse < Internal::Types::Model
      field :scheduled_shift, Square::ScheduledShift, optional: true, nullable: false
      field :errors, Internal::Types::Array[Square::Error], optional: true, nullable: false

    end
  end
end
