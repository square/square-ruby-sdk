# frozen_string_literal: true

require_relative "../../square"

module Square
  module Types
    # Describes the pricing for the subscription.
    class SubscriptionPricing < Internal::Types::Model
      field :type, -> { Square::Types::SubscriptionPricingType }, optional: true, nullable: false

      field :discount_ids, -> { Internal::Types::Array[String] }, optional: true, nullable: true

      field :price_money, -> { Square::Types::Money }, optional: true, nullable: false
    end
  end
end
