
module Square
    module Devices
        class ListDevicesRequest
            field :cursor, String, optional: true, nullable: false
            field :sort_order, Square::SortOrder, optional: true, nullable: false
            field :limit, Integer, optional: true, nullable: false
            field :location_id, String, optional: true, nullable: false
        end
    end
end
