
module Square
    module Bookings
        class ListBookingsRequest
            field :limit, Integer, optional: true, nullable: false
            field :cursor, String, optional: true, nullable: false
            field :customer_id, String, optional: true, nullable: false
            field :team_member_id, String, optional: true, nullable: false
            field :location_id, String, optional: true, nullable: false
            field :start_at_min, String, optional: true, nullable: false
            field :start_at_max, String, optional: true, nullable: false
        end
    end
end
