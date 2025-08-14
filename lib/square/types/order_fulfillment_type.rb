
module Square
    module Types
        class OrderFulfillmentType
            extends Square::Internal::Types::Enum
            PICKUP = "PICKUP"
            SHIPMENT = "SHIPMENT"
            DELIVERY = "DELIVERY"
        end
    end
end
