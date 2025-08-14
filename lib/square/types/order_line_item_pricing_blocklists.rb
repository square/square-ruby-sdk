# frozen_string_literal: true

module Square
  module Types
    # Describes pricing adjustments that are blocked from automatic
    # application to a line item. For more information, see
    # [Apply Taxes and Discounts](https://developer.squareup.com/docs/orders-api/apply-taxes-and-discounts).
    class OrderLineItemPricingBlocklists < Internal::Types::Model
      field :blocked_discounts, Internal::Types::Array[Square::OrderLineItemPricingBlocklistsBlockedDiscount], optional: true, nullable: false
      field :blocked_taxes, Internal::Types::Array[Square::OrderLineItemPricingBlocklistsBlockedTax], optional: true, nullable: false

    end
  end
end
