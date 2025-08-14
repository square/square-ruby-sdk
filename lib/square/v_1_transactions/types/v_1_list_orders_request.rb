
module Square
    module V1Transactions
        class V1ListOrdersRequest
            field :location_id, String, optional: false, nullable: false
            field :order, Square::SortOrder, optional: true, nullable: false
            field :limit, Integer, optional: true, nullable: false
            field :batch_token, String, optional: true, nullable: false
        end
    end
end
