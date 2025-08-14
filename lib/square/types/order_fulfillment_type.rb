
module Square
  class OrderFulfillmentType
    includes Square::Internal::Types::Enum
    PICKUP = "PICKUP"
    SHIPMENT = "SHIPMENT"
    DELIVERY = "DELIVERY"
  end
end
