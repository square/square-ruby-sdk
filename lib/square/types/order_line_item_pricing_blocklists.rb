# frozen_string_literal: true

module Square
    module Types
        # Describes pricing adjustments that are blocked from automatic
        # application to a line item. For more information, see
        # [Apply Taxes and Discounts](https://developer.squareup.com/docs/orders-api/apply-taxes-and-discounts).
        class OrderLineItemPricingBlocklists < Square::Internal::Types::Model
            field :blocked_discounts, Square::Internal::Types::Array[Square::OrderLineItemPricingBlocklistsBlockedDiscount], optional: true, nullable: false
            field :blocked_taxes, Square::Internal::Types::Array[Square::OrderLineItemPricingBlocklistsBlockedTax], optional: true, nullable: false
        end
    end
end
