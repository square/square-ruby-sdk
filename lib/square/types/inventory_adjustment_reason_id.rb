# frozen_string_literal: true

require_relative "../../square"

module Square
  module Types
    # Identifies a standard or custom inventory adjustment reason.
    class InventoryAdjustmentReasonId < Internal::Types::Model
      field :type, -> { Square::Types::InventoryAdjustmentReasonIdType }, optional: false, nullable: false

      field :custom_reason_id, -> { String }, optional: true, nullable: true
    end
  end
end
