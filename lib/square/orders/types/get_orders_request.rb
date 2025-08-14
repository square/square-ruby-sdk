
module Square
    module Orders
        class GetOrdersRequest < Square::Internal::Types::Model
            field :order_id, String, optional: false, nullable: false
        end
    end
end
