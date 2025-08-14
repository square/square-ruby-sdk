
module Square
    module Payouts
        class ListEntriesPayoutsRequest
            field :payout_id, String, optional: false, nullable: false
            field :sort_order, Square::SortOrder, optional: true, nullable: false
            field :cursor, String, optional: true, nullable: false
            field :limit, Integer, optional: true, nullable: false
        end
    end
end
