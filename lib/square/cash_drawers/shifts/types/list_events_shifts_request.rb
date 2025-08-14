
module Square
    module CashDrawers
        module Shifts
            class ListEventsShiftsRequest
                field :shift_id, String, optional: false, nullable: false
                field :location_id, String, optional: false, nullable: false
                field :limit, Integer, optional: true, nullable: false
                field :cursor, String, optional: true, nullable: false
            end
        end
    end
end
