# frozen_string_literal: true

module Square
  module Inventory
    module Types
      class CreateInventoryAdjustmentReasonRequest < Internal::Types::Model
        field :idempotency_key, -> { String }, optional: false, nullable: false
        field :adjustment_reason, -> { Square::Types::InventoryAdjustmentReason }, optional: false, nullable: false
      end
    end
  end
end
