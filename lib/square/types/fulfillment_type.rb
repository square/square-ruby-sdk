
module Square
  class FulfillmentType
    includes Square::Internal::Types::Enum
    PICKUP = "PICKUP"
    SHIPMENT = "SHIPMENT"
    DELIVERY = "DELIVERY"
  end
end
