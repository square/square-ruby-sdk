# frozen_string_literal: true

module Square
  module Types
    class OrderFulfillmentUpdatedObject < Internal::Types::Model
      field :order_fulfillment_updated, -> { Square::Types::OrderFulfillmentUpdated }, optional: true, nullable: false

    end
  end
end
