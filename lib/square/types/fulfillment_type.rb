
module Square
    module Types
        class FulfillmentType < Square::Internal::Types::Enum
            PICKUP = "PICKUP"
            SHIPMENT = "SHIPMENT"
            DELIVERY = "DELIVERY"
        end
    end
end
