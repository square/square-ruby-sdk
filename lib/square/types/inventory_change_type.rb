# frozen_string_literal: true

module Square
  module Types
    module InventoryChangeType
      extend Square::Internal::Types::Enum

      PHYSICAL_COUNT = "PHYSICAL_COUNT"
      ADJUSTMENT = "ADJUSTMENT"
      TRANSFER = "TRANSFER"
    end
  end
end
