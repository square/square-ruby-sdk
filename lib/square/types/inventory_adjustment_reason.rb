# frozen_string_literal: true

module Square
  module Types
    # Represents an inventory adjustment reason.
    class InventoryAdjustmentReason < Internal::Types::Model
      field :id, -> { Square::Types::InventoryAdjustmentReasonId }, optional: false, nullable: false
      field :name, -> { String }, optional: true, nullable: false
      field :direction, -> { Square::Types::InventoryAdjustmentReasonDirection }, optional: true, nullable: false
      field :created_at, -> { String }, optional: true, nullable: false
      field :updated_at, -> { String }, optional: true, nullable: false
      field :is_deleted, -> { Internal::Types::Boolean }, optional: true, nullable: false
    end
  end
end
