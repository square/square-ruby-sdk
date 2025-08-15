# frozen_string_literal: true

module Square
  class CalculateOrderResponse < Internal::Types::Model
    field :order, Square::Order, optional: true, nullable: false
    field :errors, Internal::Types::Array[Square::Error], optional: true, nullable: false

  end
end
