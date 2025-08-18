
module Square
  module Bookings
    module Types
      class CancelBookingRequest < Internal::Types::Model
        field :booking_id, String, optional: false, nullable: false
        field :idempotency_key, String, optional: true, nullable: false
        field :booking_version, Integer, optional: true, nullable: false

      end
    end
  end
end
