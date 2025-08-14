
module Square
  class FulfillmentType
    include Square::Internal::Types::Enum
    PICKUP = "PICKUP"
    SHIPMENT = "SHIPMENT"
    DELIVERY = "DELIVERY"
  end
end
