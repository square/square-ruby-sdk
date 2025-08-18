# frozen_string_literal: true

module Square
  module Types
    # Describes the pricing for the subscription.
    class SubscriptionPricing < Internal::Types::Model
      field :type, Square::Types::SubscriptionPricingType, optional: true, nullable: false
      field :discount_ids, Internal::Types::Array[String], optional: true, nullable: false
      field :price_money, Square::Types::Money, optional: true, nullable: false

    end
  end
end
