# frozen_string_literal: true

module Square
  module Types
    # Represents a [CreateScheduledShift](api-endpoint:Labor-CreateScheduledShift) response.
    # Either `scheduled_shift` or `errors` is present in the response.
    class CreateScheduledShiftResponse < Internal::Types::Model
      field :scheduled_shift, Square::ScheduledShift, optional: true, nullable: false
      field :errors, Internal::Types::Array[Square::Error], optional: true, nullable: false

    end
  end
end
