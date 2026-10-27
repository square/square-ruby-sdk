# frozen_string_literal: true

require_relative "../../square"

module Square
  module Types
    module OrderFulfillmentType
      extend Square::Internal::Types::Enum

      PICKUP = "PICKUP"
      SHIPMENT = "SHIPMENT"
      DELIVERY = "DELIVERY"
    end
  end
end
