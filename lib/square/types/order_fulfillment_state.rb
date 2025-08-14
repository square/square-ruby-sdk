
module Square
    module Types
        class OrderFulfillmentState < Square::Internal::Types::Enum
            PROPOSED = "PROPOSED"
            RESERVED = "RESERVED"
            PREPARED = "PREPARED"
            COMPLETED = "COMPLETED"
            CANCELED = "CANCELED"
            FAILED = "FAILED"
        end
    end
end
