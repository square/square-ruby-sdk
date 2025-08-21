# frozen_string_literal: true

module Square
  module Types
    # Describes a phase in a subscription plan variation. For more information, see [Subscription Plans and Variations](https://developer.squareup.com/docs/subscriptions-api/plans-and-variations).
    class SubscriptionPhase < Internal::Types::Model
      field :uid, -> { String }, optional: true, nullable: false
      field :cadence, -> { Square::Types::SubscriptionCadence }, optional: false, nullable: false
      field :periods, -> { Integer }, optional: true, nullable: false
      field :recurring_price_money, -> { Square::Types::Money }, optional: true, nullable: false
      field :ordinal, -> { Integer }, optional: true, nullable: false
      field :pricing, -> { Square::Types::SubscriptionPricing }, optional: true, nullable: false
    end
  end
end
