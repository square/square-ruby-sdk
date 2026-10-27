# frozen_string_literal: true

require_relative "../../square"

module Square
  module Types
    # Represents a change in state or quantity of product inventory at a
    # particular time and location.
    class InventoryAdjustment < Internal::Types::Model
      field :id, -> { String }, optional: true, nullable: false

      field :reference_id, -> { String }, optional: true, nullable: true

      field :from_state, -> { Square::Types::InventoryState }, optional: true, nullable: false

      field :to_state, -> { Square::Types::InventoryState }, optional: true, nullable: false

      field :from_location_id, -> { String }, optional: true, nullable: true

      field :to_location_id, -> { String }, optional: true, nullable: true

      field :catalog_object_id, -> { String }, optional: true, nullable: true

      field :catalog_object_type, -> { String }, optional: true, nullable: true

      field :quantity, -> { String }, optional: true, nullable: true

      field :total_price_money, -> { Square::Types::Money }, optional: true, nullable: false

      field :occurred_at, -> { String }, optional: true, nullable: true

      field :created_at, -> { String }, optional: true, nullable: false

      field :source, -> { Square::Types::SourceApplication }, optional: true, nullable: false

      field :employee_id, -> { String }, optional: true, nullable: true

      field :team_member_id, -> { String }, optional: true, nullable: true

      field :transaction_id, -> { String }, optional: true, nullable: false

      field :refund_id, -> { String }, optional: true, nullable: false

      field :purchase_order_id, -> { String }, optional: true, nullable: false

      field :goods_receipt_id, -> { String }, optional: true, nullable: false

      field :adjustment_group, -> { Square::Types::InventoryAdjustmentGroup }, optional: true, nullable: false

      field :cost_money, -> { Square::Types::Money }, optional: true, nullable: false

      field :vendor_id, -> { String }, optional: true, nullable: true

      field :physical_count_id, -> { String }, optional: true, nullable: false

      field :reason_id, -> { Square::Types::InventoryAdjustmentReasonId }, optional: true, nullable: false
    end
  end
end
