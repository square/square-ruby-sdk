# frozen_string_literal: true

module Square
    module Types
        # Represents a single physical count, inventory, adjustment, or transfer
        # that is part of the history of inventory changes for a particular
        # [CatalogObject](entity:CatalogObject) instance.
        class InventoryChange < Square::Internal::Types::Model
            field :type, Square::InventoryChangeType, optional: true, nullable: false
            field :physical_count, Square::InventoryPhysicalCount, optional: true, nullable: false
            field :adjustment, Square::InventoryAdjustment, optional: true, nullable: false
            field :transfer, Square::InventoryTransfer, optional: true, nullable: false
            field :measurement_unit, Square::CatalogMeasurementUnit, optional: true, nullable: false
            field :measurement_unit_id, String, optional: true, nullable: false
        end
    end
end
