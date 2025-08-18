
module Square
  module Orders
    module Types
      class BatchGetOrdersRequest < Internal::Types::Model
        field :location_id, String, optional: true, nullable: false
        field :order_ids, Internal::Types::Array[String], optional: false, nullable: false

      end
    end
  end
end
