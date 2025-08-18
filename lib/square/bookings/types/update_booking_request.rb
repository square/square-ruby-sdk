
module Square
  module Bookings
    module Types
      class UpdateBookingRequest < Internal::Types::Model
        field :booking_id, -> { String }, optional: false, nullable: false
        field :idempotency_key, -> { String }, optional: true, nullable: false
        field :booking, -> { Square::Types::Booking }, optional: false, nullable: false

      end
    end
  end
end
