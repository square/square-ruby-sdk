# frozen_string_literal: true

require_relative "../../square"

module Square
  module Types
    module InventoryChangeType
      extend Square::Internal::Types::Enum

      PHYSICAL_COUNT = "PHYSICAL_COUNT"
      ADJUSTMENT = "ADJUSTMENT"
    end
  end
end
