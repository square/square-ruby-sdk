# frozen_string_literal: true

module Square
    module Types
        # Describes the pricing for the subscription.
        class SubscriptionPricing < Square::Internal::Types::Model
            field :type, Square::SubscriptionPricingType, optional: true, nullable: false
            field :discount_ids, Square::Internal::Types::Array[String], optional: true, nullable: false
            field :price_money, Square::Money, optional: true, nullable: false
        end
    end
end
