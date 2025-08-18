# frozen_string_literal: true

module Square
  module Types
    module OrderFulfillmentType
      extend Square::Internal::Types::Enum
      PICKUP = "PICKUP"
      SHIPMENT = "SHIPMENT"
      DELIVERY = "DELIVERY"end
  end
end
