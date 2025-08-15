# frozen_string_literal: true

module Square
  class OrderCreatedObject < Internal::Types::Model
    field :order_created, Square::OrderCreated, optional: true, nullable: false

  end
end
