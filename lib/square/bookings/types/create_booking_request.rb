
module Square
  module Bookings
    module Types
      class CreateBookingRequest < Internal::Types::Model
        field :idempotency_key, -> { String }, optional: true, nullable: false
        field :booking, -> { Square::Types::Booking }, optional: false, nullable: false

      end
    end
  end
end
