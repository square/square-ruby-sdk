# frozen_string_literal: true

module Square
  # Represents a line item in an order. Each line item describes a different
  # product to purchase, with its own quantity and price details.
  class OrderLineItem < Internal::Types::Model
    field :uid, String, optional: true, nullable: false
    field :name, String, optional: true, nullable: false
    field :quantity, String, optional: false, nullable: false
    field :quantity_unit, Square::OrderQuantityUnit, optional: true, nullable: false
    field :note, String, optional: true, nullable: false
    field :catalog_object_id, String, optional: true, nullable: false
    field :catalog_version, Integer, optional: true, nullable: false
    field :variation_name, String, optional: true, nullable: false
    field :item_type, Square::OrderLineItemItemType, optional: true, nullable: false
    field :metadata, Internal::Types::Hash[String, String], optional: true, nullable: false
    field :modifiers, Internal::Types::Array[Square::OrderLineItemModifier], optional: true, nullable: false
    field :applied_taxes, Internal::Types::Array[Square::OrderLineItemAppliedTax], optional: true, nullable: false
    field :applied_discounts, Internal::Types::Array[Square::OrderLineItemAppliedDiscount], optional: true, nullable: false
    field :applied_service_charges, Internal::Types::Array[Square::OrderLineItemAppliedServiceCharge], optional: true, nullable: false
    field :base_price_money, Square::Money, optional: true, nullable: false
    field :variation_total_price_money, Square::Money, optional: true, nullable: false
    field :gross_sales_money, Square::Money, optional: true, nullable: false
    field :total_tax_money, Square::Money, optional: true, nullable: false
    field :total_discount_money, Square::Money, optional: true, nullable: false
    field :total_money, Square::Money, optional: true, nullable: false
    field :pricing_blocklists, Square::OrderLineItemPricingBlocklists, optional: true, nullable: false
    field :total_service_charge_money, Square::Money, optional: true, nullable: false

  end
end
