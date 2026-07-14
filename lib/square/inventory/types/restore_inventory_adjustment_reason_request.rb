# frozen_string_literal: true

module Square
  module Inventory
    module Types
      class RestoreInventoryAdjustmentReasonRequest < Internal::Types::Model
        field :reason_id, -> { Square::Types::InventoryAdjustmentReasonId }, optional: false, nullable: false
      end
    end
  end
end
