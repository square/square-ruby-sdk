
module Square
  module V1Transactions
    class V1UpdateOrderRequest < Internal::Types::Model
      field :location_id, String, optional: false, nullable: false
      field :order_id, String, optional: false, nullable: false
    end
  end
end
