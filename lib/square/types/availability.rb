# frozen_string_literal: true

module Square
    module Types
        # Defines an appointment slot that encapsulates the appointment segments, location and starting time available for booking.
        class Availability < Square::Internal::Types::Model
            field :start_at, String, optional: true, nullable: false
            field :location_id, String, optional: true, nullable: false
            field :appointment_segments, Square::Internal::Types::Array[Square::AppointmentSegment], optional: true, nullable: false
        end
    end
end
