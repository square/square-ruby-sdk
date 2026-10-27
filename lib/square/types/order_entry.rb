# frozen_string_literal: true

require_relative "../../square"

module Square
  module Types
    # A lightweight description of an [order](entity:Order) that is returned when
    # `returned_entries` is `true` on a [SearchOrdersRequest](api-endpoint:Orders-SearchOrders).
    class OrderEntry < Internal::Types::Model
      field :order_id, -> { String }, optional: true, nullable: true

      field :version, -> { Integer }, optional: true, nullable: false

      field :location_id, -> { String }, optional: true, nullable: true
    end
  end
end
