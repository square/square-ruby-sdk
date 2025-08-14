# frozen_string_literal: true

module Square
    module Types
        # Represents a discount being returned that applies to one or more return line items in an
        # order.
        # 
        # Fixed-amount, order-scoped discounts are distributed across all non-zero return line item totals.
        # The amount distributed to each return line item is relative to that item’s contribution to the
        # order subtotal.
        class OrderReturnDiscount < Internal::Types::Model
            field :uid, String, optional: true, nullable: false
            field :source_discount_uid, String, optional: true, nullable: false
            field :catalog_object_id, String, optional: true, nullable: false
            field :catalog_version, Integer, optional: true, nullable: false
            field :name, String, optional: true, nullable: false
            field :type, Square::OrderLineItemDiscountType, optional: true, nullable: false
            field :percentage, String, optional: true, nullable: false
            field :amount_money, Square::Money, optional: true, nullable: false
            field :applied_money, Square::Money, optional: true, nullable: false
            field :scope, Square::OrderLineItemDiscountScope, optional: true, nullable: false
        end
    end
end
