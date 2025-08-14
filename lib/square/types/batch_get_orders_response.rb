# frozen_string_literal: true

module Square
    module Types
        # Defines the fields that are included in the response body of
        # a request to the `BatchRetrieveOrders` endpoint.
        class BatchGetOrdersResponse < Square::Internal::Types::Model
            field :orders, Square::Internal::Types::Array[Square::Order], optional: true, nullable: false
            field :errors, Square::Internal::Types::Array[Square::Error], optional: true, nullable: false
        end
    end
end
