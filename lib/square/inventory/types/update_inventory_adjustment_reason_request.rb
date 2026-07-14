# frozen_string_literal: true

module Square
  module Inventory
    module Types
      class UpdateInventoryAdjustmentReasonRequest < Internal::Types::Model
        field :reason_id, -> { Square::Types::InventoryAdjustmentReasonId }, optional: false, nullable: false
        field :adjustment_reason, -> { Square::Types::InventoryAdjustmentReason }, optional: false, nullable: false
      end
    end
  end
end
