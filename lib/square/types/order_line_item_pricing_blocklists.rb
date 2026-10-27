# frozen_string_literal: true

require_relative "../../square"

module Square
  module Types
    # Describes pricing adjustments that are blocked from automatic
    # application to a line item. For more information, see
    # [Apply Taxes and Discounts](https://developer.squareup.com/docs/orders-api/apply-taxes-and-discounts).
    class OrderLineItemPricingBlocklists < Internal::Types::Model
      field :blocked_discounts, -> { Internal::Types::Array[Square::Types::OrderLineItemPricingBlocklistsBlockedDiscount] }, optional: true, nullable: true

      field :blocked_taxes, -> { Internal::Types::Array[Square::Types::OrderLineItemPricingBlocklistsBlockedTax] }, optional: true, nullable: true

      field :blocked_service_charges, -> { Internal::Types::Array[Square::Types::OrderLineItemPricingBlocklistsBlockedServiceCharge] }, optional: true, nullable: true
    end
  end
end
