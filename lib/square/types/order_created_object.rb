# frozen_string_literal: true

require_relative "../../square"

module Square
  module Types
    class OrderCreatedObject < Internal::Types::Model
      field :order_created, -> { Square::Types::OrderCreated }, optional: true, nullable: false
    end
  end
end
