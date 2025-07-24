# frozen_string_literal: true

module square.rb
# Indicates how the inventory change was applied to a tracked product quantity.
  class InventoryChangeType

    PHYSICAL_COUNT = "PHYSICAL_COUNT"
    ADJUSTMENT = "ADJUSTMENT"
    TRANSFER = "TRANSFER"

  end
end