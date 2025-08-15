# frozen_string_literal: true

module Square
  # Represents an [UpdateScheduledShift](api-endpoint:Labor-UpdateScheduledShift) response.
  # Either `scheduled_shift` or `errors` is present in the response.
  class UpdateScheduledShiftResponse < Internal::Types::Model
    field :scheduled_shift, Square::ScheduledShift, optional: true, nullable: false
    field :errors, Internal::Types::Array[Square::Error], optional: true, nullable: false

  end
end
