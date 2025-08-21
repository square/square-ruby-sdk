# frozen_string_literal: true

module Square
  module Types
    # Represents a booking as a time-bound service contract for a seller's staff member to provide a specified service
    # at a given location to a requesting customer in one or more appointment segments.
    class Booking < Internal::Types::Model
      field :id, -> { String }, optional: true, nullable: false
      field :version, -> { Integer }, optional: true, nullable: false
      field :status, -> { Square::Types::BookingStatus }, optional: true, nullable: false
      field :created_at, -> { String }, optional: true, nullable: false
      field :updated_at, -> { String }, optional: true, nullable: false
      field :start_at, -> { String }, optional: true, nullable: false
      field :location_id, -> { String }, optional: true, nullable: false
      field :customer_id, -> { String }, optional: true, nullable: false
      field :customer_note, -> { String }, optional: true, nullable: false
      field :seller_note, -> { String }, optional: true, nullable: false
      field :appointment_segments, lambda {
        Internal::Types::Array[Square::Types::AppointmentSegment]
      }, optional: true, nullable: false
      field :transition_time_minutes, -> { Integer }, optional: true, nullable: false
      field :all_day, -> { Internal::Types::Boolean }, optional: true, nullable: false
      field :location_type, lambda {
        Square::Types::BusinessAppointmentSettingsBookingLocationType
      }, optional: true, nullable: false
      field :creator_details, -> { Square::Types::BookingCreatorDetails }, optional: true, nullable: false
      field :source, -> { Square::Types::BookingBookingSource }, optional: true, nullable: false
      field :address, -> { Square::Types::Address }, optional: true, nullable: false
    end
  end
end
