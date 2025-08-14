# frozen_string_literal: true

module Square
  module Types
    class InventoryCountUpdatedEventObject < Internal::Types::Model
      field :inventory_counts, Internal::Types::Array[Square::InventoryCount], optional: true, nullable: false

    end
  end
end
