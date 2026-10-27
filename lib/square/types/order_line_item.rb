# frozen_string_literal: true

require_relative "../../square"

module Square
  module Types
    # Represents a line item in an order. Each line item describes a different
    # product to purchase, with its own quantity and price details.
    class OrderLineItem < Internal::Types::Model
      field :uid, -> { String }, optional: true, nullable: true

      field :name, -> { String }, optional: true, nullable: true

      field :quantity, -> { String }, optional: false, nullable: false

      field :quantity_unit, -> { Square::Types::OrderQuantityUnit }, optional: true, nullable: false

      field :note, -> { String }, optional: true, nullable: true

      field :catalog_object_id, -> { String }, optional: true, nullable: true

      field :catalog_version, -> { Integer }, optional: true, nullable: true

      field :variation_name, -> { String }, optional: true, nullable: true

      field :item_type, -> { Square::Types::OrderLineItemItemType }, optional: true, nullable: false

      field :metadata, -> { Internal::Types::Hash[String, String] }, optional: true, nullable: true

      field :modifiers, -> { Internal::Types::Array[Square::Types::OrderLineItemModifier] }, optional: true, nullable: true

      field :applied_taxes, -> { Internal::Types::Array[Square::Types::OrderLineItemAppliedTax] }, optional: true, nullable: true

      field :applied_discounts, -> { Internal::Types::Array[Square::Types::OrderLineItemAppliedDiscount] }, optional: true, nullable: true

      field :applied_service_charges, -> { Internal::Types::Array[Square::Types::OrderLineItemAppliedServiceCharge] }, optional: true, nullable: true

      field :base_price_money, -> { Square::Types::Money }, optional: true, nullable: false

      field :variation_total_price_money, -> { Square::Types::Money }, optional: true, nullable: false

      field :gross_sales_money, -> { Square::Types::Money }, optional: true, nullable: false

      field :total_tax_money, -> { Square::Types::Money }, optional: true, nullable: false

      field :total_discount_money, -> { Square::Types::Money }, optional: true, nullable: false

      field :total_money, -> { Square::Types::Money }, optional: true, nullable: false

      field :pricing_blocklists, -> { Square::Types::OrderLineItemPricingBlocklists }, optional: true, nullable: false

      field :total_service_charge_money, -> { Square::Types::Money }, optional: true, nullable: false
    end
  end
end
