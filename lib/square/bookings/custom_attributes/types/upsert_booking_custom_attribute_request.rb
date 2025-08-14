
module Square
  module Bookings
    module CustomAttributes
      class UpsertBookingCustomAttributeRequest
        field :booking_id, String, optional: false, nullable: false
        field :key, String, optional: false, nullable: false
      end
    end
  end
end
