# frozen_string_literal: true

module Square
  module Types
    # Identifies a standard or custom inventory adjustment reason.
    class InventoryAdjustmentReasonId < Internal::Types::Model
      field :type, -> { Square::Types::InventoryAdjustmentReasonIdType }, optional: false, nullable: false
      field :custom_reason_id, -> { String }, optional: true, nullable: false
    end
  end
end
