
module Square
    module Bookings
        class GetBookingsRequest < Square::Internal::Types::Model
            field :booking_id, String, optional: false, nullable: false
        end
    end
end
