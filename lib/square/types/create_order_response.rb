# frozen_string_literal: true

module Square
  module Types
    # Defines the fields that are included in the response body of
    # a request to the `CreateOrder` endpoint.
    # 
    # Either `errors` or `order` is present in a given response, but never both.
    class CreateOrderResponse < Internal::Types::Model
      field :order, Square::Types::Order, optional: true, nullable: false
      field :errors, Internal::Types::Array[Square::Types::Error], optional: true, nullable: false

    end
  end
end
