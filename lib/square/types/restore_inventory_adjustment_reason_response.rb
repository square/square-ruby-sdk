# frozen_string_literal: true

module Square
  module Types
    # Represents an output from a call to
    # [RestoreInventoryAdjustmentReason](api-endpoint:Inventory-RestoreInventoryAdjustmentReason).
    class RestoreInventoryAdjustmentReasonResponse < Internal::Types::Model
      field :errors, -> { Internal::Types::Array[Square::Types::Error] }, optional: true, nullable: false
      field :adjustment_reason, -> { Square::Types::InventoryAdjustmentReason }, optional: true, nullable: false
    end
  end
end
