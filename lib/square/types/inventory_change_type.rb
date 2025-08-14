
module Square
    module Types
        class InventoryChangeType < Square::Internal::Types::Enum
            PHYSICAL_COUNT = "PHYSICAL_COUNT"
            ADJUSTMENT = "ADJUSTMENT"
            TRANSFER = "TRANSFER"
        end
    end
end
