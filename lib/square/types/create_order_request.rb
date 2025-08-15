# frozen_string_literal: true

module Square
  class CreateOrderRequest < Internal::Types::Model
    field :order, Square::Order, optional: true, nullable: false
    field :idempotency_key, String, optional: true, nullable: false

  end
end
