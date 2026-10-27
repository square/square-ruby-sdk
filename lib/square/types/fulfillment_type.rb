# frozen_string_literal: true

require_relative "../../square"

module Square
  module Types
    module FulfillmentType
      extend Square::Internal::Types::Enum

      PICKUP = "PICKUP"
      SHIPMENT = "SHIPMENT"
      DELIVERY = "DELIVERY"
      IN_STORE = "IN_STORE"
    end
  end
end
