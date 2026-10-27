# frozen_string_literal: true

require_relative "../../square"

module Square
  module Types
    # Defines an appointment slot that encapsulates the appointment segments, location and starting time available for
    # booking.
    class Availability < Internal::Types::Model
      field :start_at, -> { String }, optional: true, nullable: true

      field :location_id, -> { String }, optional: true, nullable: false

      field :appointment_segments, -> { Internal::Types::Array[Square::Types::AppointmentSegment] }, optional: true, nullable: true
    end
  end
end
