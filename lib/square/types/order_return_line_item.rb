# frozen_string_literal: true

module Square
  module Types
    # The line item being returned in an order.
    class OrderReturnLineItem < Internal::Types::Model
      field :uid, -> { String }, optional: true, nullable: false
      field :source_line_item_uid, -> { String }, optional: true, nullable: false
      field :name, -> { String }, optional: true, nullable: false
      field :quantity, -> { String }, optional: false, nullable: false
      field :quantity_unit, -> { Square::Types::OrderQuantityUnit }, optional: true, nullable: false
      field :note, -> { String }, optional: true, nullable: false
      field :catalog_object_id, -> { String }, optional: true, nullable: false
      field :catalog_version, -> { Integer }, optional: true, nullable: false
      field :variation_name, -> { String }, optional: true, nullable: false
      field :item_type, -> { Square::Types::OrderLineItemItemType }, optional: true, nullable: false
      field :return_modifiers, -> { Internal::Types::Array[Square::Types::OrderReturnLineItemModifier] }, optional: true, nullable: false
      field :applied_taxes, -> { Internal::Types::Array[Square::Types::OrderLineItemAppliedTax] }, optional: true, nullable: false
      field :applied_discounts, -> { Internal::Types::Array[Square::Types::OrderLineItemAppliedDiscount] }, optional: true, nullable: false
      field :base_price_money, -> { Square::Types::Money }, optional: true, nullable: false
      field :variation_total_price_money, -> { Square::Types::Money }, optional: true, nullable: false
      field :gross_return_money, -> { Square::Types::Money }, optional: true, nullable: false
      field :total_tax_money, -> { Square::Types::Money }, optional: true, nullable: false
      field :total_discount_money, -> { Square::Types::Money }, optional: true, nullable: false
      field :total_money, -> { Square::Types::Money }, optional: true, nullable: false
      field :applied_service_charges, -> { Internal::Types::Array[Square::Types::OrderLineItemAppliedServiceCharge] }, optional: true, nullable: false
      field :total_service_charge_money, -> { Square::Types::Money }, optional: true, nullable: false
    end
  end
end
