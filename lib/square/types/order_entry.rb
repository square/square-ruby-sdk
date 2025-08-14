# frozen_string_literal: true

module Square
  module Types
    # A lightweight description of an [order](entity:Order) that is returned when
    # `returned_entries` is `true` on a [SearchOrdersRequest](api-endpoint:Orders-SearchOrders).
    class OrderEntry < Internal::Types::Model
      field :order_id, String, optional: true, nullable: false
      field :version, Integer, optional: true, nullable: false
      field :location_id, String, optional: true, nullable: false

    end
  end
end
