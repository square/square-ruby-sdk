# frozen_string_literal: true

module Square
  # Defines the fields that are included in the response body of
  # a request to the `BatchRetrieveOrders` endpoint.
  class BatchGetOrdersResponse < Internal::Types::Model
    field :orders, Internal::Types::Array[Square::Order], optional: true, nullable: false
    field :errors, Internal::Types::Array[Square::Error], optional: true, nullable: false

  end
end
