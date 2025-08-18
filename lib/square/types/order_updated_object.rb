# frozen_string_literal: true

module Square
  module Types
    class OrderUpdatedObject < Internal::Types::Model
      field :order_updated, -> { Square::Types::OrderUpdated }, optional: true, nullable: false

    end
  end
end
