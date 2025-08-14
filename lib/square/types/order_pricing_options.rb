# frozen_string_literal: true

module Square
    module Types
        # Pricing options for an order. The options affect how the order's price is calculated.
        # They can be used, for example, to apply automatic price adjustments that are based on preconfigured
        # [pricing rules](entity:CatalogPricingRule).
        class OrderPricingOptions < Internal::Types::Model
            field :auto_apply_discounts, Internal::Types::Boolean, optional: true, nullable: false
            field :auto_apply_taxes, Internal::Types::Boolean, optional: true, nullable: false
        end
    end
end
