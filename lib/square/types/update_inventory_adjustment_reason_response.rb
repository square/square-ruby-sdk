# frozen_string_literal: true

module Square
  module Types
    # Represents an output from a call to
    # [UpdateInventoryAdjustmentReason](api-endpoint:Inventory-UpdateInventoryAdjustmentReason).
    class UpdateInventoryAdjustmentReasonResponse < Internal::Types::Model
      field :errors, -> { Internal::Types::Array[Square::Types::Error] }, optional: true, nullable: false
      field :adjustment_reason, -> { Square::Types::InventoryAdjustmentReason }, optional: true, nullable: false
    end
  end
end
