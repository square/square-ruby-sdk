
module Square
    module Orders
        class PayOrderRequest < Square::Internal::Types::Model
            field :order_id, String, optional: false, nullable: false
        end
    end
end
