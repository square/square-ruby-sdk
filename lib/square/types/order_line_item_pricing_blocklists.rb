# frozen_string_literal: true

module Square
  module Types
    # Describes pricing adjustments that are blocked from automatic
    # application to a line item. For more information, see
    # [Apply Taxes and Discounts](https://developer.squareup.com/docs/orders-api/apply-taxes-and-discounts).
    class OrderLineItemPricingBlocklists < Internal::Types::Model
      field :blocked_discounts, lambda {
        Internal::Types::Array[Square::Types::OrderLineItemPricingBlocklistsBlockedDiscount]
      }, optional: true, nullable: false
      field :blocked_taxes, lambda {
        Internal::Types::Array[Square::Types::OrderLineItemPricingBlocklistsBlockedTax]
      }, optional: true, nullable: false
    end
  end
end
