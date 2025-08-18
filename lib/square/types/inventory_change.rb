# frozen_string_literal: true

module Square
  module Types
    # Represents a single physical count, inventory, adjustment, or transfer
    # that is part of the history of inventory changes for a particular
    # [CatalogObject](entity:CatalogObject) instance.
    class InventoryChange < Internal::Types::Model
      field :type, -> { Square::Types::InventoryChangeType }, optional: true, nullable: false
      field :physical_count, -> { Square::Types::InventoryPhysicalCount }, optional: true, nullable: false
      field :adjustment, -> { Square::Types::InventoryAdjustment }, optional: true, nullable: false
      field :transfer, -> { Square::Types::InventoryTransfer }, optional: true, nullable: false
      field :measurement_unit, -> { Square::Types::CatalogMeasurementUnit }, optional: true, nullable: false
      field :measurement_unit_id, -> { String }, optional: true, nullable: false

    end
  end
end
