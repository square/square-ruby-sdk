# frozen_string_literal: true

module Square
    module Types
        # Either the `order_entries` or `orders` field is set, depending on whether
        # `return_entries` is set on the [SearchOrdersRequest](api-endpoint:Orders-SearchOrders).
        class SearchOrdersResponse < Square::Internal::Types::Model
            field :order_entries, Square::Internal::Types::Array[Square::OrderEntry], optional: true, nullable: false
            field :orders, Square::Internal::Types::Array[Square::Order], optional: true, nullable: false
            field :cursor, String, optional: true, nullable: false
            field :errors, Square::Internal::Types::Array[Square::Error], optional: true, nullable: false
        end
    end
end
