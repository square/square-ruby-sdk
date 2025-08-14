
module Square
    module Types
        class OrderFulfillmentType < Square::Internal::Types::Enum
            PICKUP = "PICKUP"
            SHIPMENT = "SHIPMENT"
            DELIVERY = "DELIVERY"
        end
    end
end
