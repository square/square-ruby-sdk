# frozen_string_literal: true

module Square
  module Types
    # Represents a change in state or quantity of product inventory at a
    # particular time and location.
    class InventoryAdjustment < Internal::Types::Model
      field :id, String, optional: true, nullable: false
      field :reference_id, String, optional: true, nullable: false
      field :from_state, Square::InventoryState, optional: true, nullable: false
      field :to_state, Square::InventoryState, optional: true, nullable: false
      field :location_id, String, optional: true, nullable: false
      field :catalog_object_id, String, optional: true, nullable: false
      field :catalog_object_type, String, optional: true, nullable: false
      field :quantity, String, optional: true, nullable: false
      field :total_price_money, Square::Money, optional: true, nullable: false
      field :occurred_at, String, optional: true, nullable: false
      field :created_at, String, optional: true, nullable: false
      field :source, Square::SourceApplication, optional: true, nullable: false
      field :employee_id, String, optional: true, nullable: false
      field :team_member_id, String, optional: true, nullable: false
      field :transaction_id, String, optional: true, nullable: false
      field :refund_id, String, optional: true, nullable: false
      field :purchase_order_id, String, optional: true, nullable: false
      field :goods_receipt_id, String, optional: true, nullable: false
      field :adjustment_group, Square::InventoryAdjustmentGroup, optional: true, nullable: false

    end
  end
end
