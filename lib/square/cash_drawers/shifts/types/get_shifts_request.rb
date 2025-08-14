
module Square
  module CashDrawers
    module Shifts
      class GetShiftsRequest
        field :shift_id, String, optional: false, nullable: false
        field :location_id, String, optional: false, nullable: false

      end
    end
  end
end
