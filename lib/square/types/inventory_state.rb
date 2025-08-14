
module Square
    module Types
        module InventoryState
            extends Square::Internal::Types::Enum
            CUSTOM = "CUSTOM"
            IN_STOCK = "IN_STOCK"
            SOLD = "SOLD"
            RETURNED_BY_CUSTOMER = "RETURNED_BY_CUSTOMER"
            RESERVED_FOR_SALE = "RESERVED_FOR_SALE"
            SOLD_ONLINE = "SOLD_ONLINE"
            ORDERED_FROM_VENDOR = "ORDERED_FROM_VENDOR"
            RECEIVED_FROM_VENDOR = "RECEIVED_FROM_VENDOR"
            IN_TRANSIT_TO = "IN_TRANSIT_TO"
            NONE = "NONE"
            WASTE = "WASTE"
            UNLINKED_RETURN = "UNLINKED_RETURN"
            COMPOSED = "COMPOSED"
            DECOMPOSED = "DECOMPOSED"
            SUPPORTED_BY_NEWER_VERSION = "SUPPORTED_BY_NEWER_VERSION"
            IN_TRANSIT = "IN_TRANSIT"end
    end
end
