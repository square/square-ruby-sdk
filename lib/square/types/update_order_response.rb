# frozen_string_literal: true

module Square
  # Defines the fields that are included in the response body of
  # a request to the [UpdateOrder](api-endpoint:Orders-UpdateOrder) endpoint.
  class UpdateOrderResponse < Internal::Types::Model
    field :order, Square::Order, optional: true, nullable: false
    field :errors, Internal::Types::Array[Square::Error], optional: true, nullable: false

  end
end
