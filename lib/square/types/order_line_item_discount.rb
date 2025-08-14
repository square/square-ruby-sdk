# frozen_string_literal: true

module Square
    module Types
        # Represents a discount that applies to one or more line items in an
        # order.
        # 
        # Fixed-amount, order-scoped discounts are distributed across all non-zero line item totals.
        # The amount distributed to each line item is relative to the
        # amount contributed by the item to the order subtotal.
        class OrderLineItemDiscount < Square::Internal::Types::Model
            field :uid, String, optional: true, nullable: false
            field :catalog_object_id, String, optional: true, nullable: false
            field :catalog_version, Integer, optional: true, nullable: false
            field :name, String, optional: true, nullable: false
            field :type, Square::OrderLineItemDiscountType, optional: true, nullable: false
            field :percentage, String, optional: true, nullable: false
            field :amount_money, Square::Money, optional: true, nullable: false
            field :applied_money, Square::Money, optional: true, nullable: false
            field :metadata, Square::Internal::Types::Hash[String, String], optional: true, nullable: false
            field :scope, Square::OrderLineItemDiscountScope, optional: true, nullable: false
            field :reward_ids, Square::Internal::Types::Array[String], optional: true, nullable: false
            field :pricing_rule_id, String, optional: true, nullable: false
        end
    end
end
