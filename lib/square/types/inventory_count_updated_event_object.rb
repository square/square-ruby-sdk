# frozen_string_literal: true

module Square
  class InventoryCountUpdatedEventObject < Internal::Types::Model
    field :inventory_counts, Internal::Types::Array[Square::InventoryCount], optional: true, nullable: false

  end
end
