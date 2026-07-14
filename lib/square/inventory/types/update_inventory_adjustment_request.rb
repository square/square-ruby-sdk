# frozen_string_literal: true

module Square
  module Inventory
    module Types
      class UpdateInventoryAdjustmentRequest < Internal::Types::Model
        field :idempotency_key, -> { String }, optional: false, nullable: false
        field :adjustment, -> { Square::Types::InventoryAdjustment }, optional: false, nullable: false
      end
    end
  end
end
