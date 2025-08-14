
module Square
  class InventoryChangeType
    includes Square::Internal::Types::Enum
    PHYSICAL_COUNT = "PHYSICAL_COUNT"
    ADJUSTMENT = "ADJUSTMENT"
    TRANSFER = "TRANSFER"
  end
end
