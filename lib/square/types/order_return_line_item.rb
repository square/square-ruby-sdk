# frozen_string_literal: true

module Square
    module Types
        # The line item being returned in an order.
        class OrderReturnLineItem < Square::Internal::Types::Model
            field :uid, String, optional: true, nullable: false
            field :source_line_item_uid, String, optional: true, nullable: false
            field :name, String, optional: true, nullable: false
            field :quantity, String, optional: false, nullable: false
            field :quantity_unit, Square::OrderQuantityUnit, optional: true, nullable: false
            field :note, String, optional: true, nullable: false
            field :catalog_object_id, String, optional: true, nullable: false
            field :catalog_version, Integer, optional: true, nullable: false
            field :variation_name, String, optional: true, nullable: false
            field :item_type, Square::OrderLineItemItemType, optional: true, nullable: false
            field :return_modifiers, Square::Internal::Types::Array[Square::OrderReturnLineItemModifier], optional: true, nullable: false
            field :applied_taxes, Square::Internal::Types::Array[Square::OrderLineItemAppliedTax], optional: true, nullable: false
            field :applied_discounts, Square::Internal::Types::Array[Square::OrderLineItemAppliedDiscount], optional: true, nullable: false
            field :base_price_money, Square::Money, optional: true, nullable: false
            field :variation_total_price_money, Square::Money, optional: true, nullable: false
            field :gross_return_money, Square::Money, optional: true, nullable: false
            field :total_tax_money, Square::Money, optional: true, nullable: false
            field :total_discount_money, Square::Money, optional: true, nullable: false
            field :total_money, Square::Money, optional: true, nullable: false
            field :applied_service_charges, Square::Internal::Types::Array[Square::OrderLineItemAppliedServiceCharge], optional: true, nullable: false
            field :total_service_charge_money, Square::Money, optional: true, nullable: false
        end
    end
end
