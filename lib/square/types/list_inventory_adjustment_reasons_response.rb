# frozen_string_literal: true

module Square
  module Types
    # Represents an output from a call to
    # [ListInventoryAdjustmentReasons](api-endpoint:Inventory-ListInventoryAdjustmentReasons).
    class ListInventoryAdjustmentReasonsResponse < Internal::Types::Model
      field :errors, -> { Internal::Types::Array[Square::Types::Error] }, optional: true, nullable: false
      field :adjustment_reasons, -> { Internal::Types::Array[Square::Types::InventoryAdjustmentReason] }, optional: true, nullable: false
    end
  end
end
