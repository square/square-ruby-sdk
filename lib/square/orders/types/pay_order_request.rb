
module Square
  module Orders
    class PayOrderRequest < Internal::Types::Model
      field :order_id, String, optional: false, nullable: false
    end
  end
end
