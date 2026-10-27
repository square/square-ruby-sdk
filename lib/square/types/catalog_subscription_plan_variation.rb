# frozen_string_literal: true

require_relative "../../square"

module Square
  module Types
    # Describes a subscription plan variation. A subscription plan variation represents how the subscription for a
    # product or service is sold.
    # For more information, see [Subscription Plans and
    # Variations](https://developer.squareup.com/docs/subscriptions-api/plans-and-variations).
    class CatalogSubscriptionPlanVariation < Internal::Types::Model
      field :name, -> { String }, optional: false, nullable: false

      field :phases, -> { Internal::Types::Array[Square::Types::SubscriptionPhase] }, optional: false, nullable: false

      field :subscription_plan_id, -> { String }, optional: true, nullable: true

      field :monthly_billing_anchor_date, -> { Integer }, optional: true, nullable: true

      field :can_prorate, -> { Internal::Types::Boolean }, optional: true, nullable: true

      field :successor_plan_variation_id, -> { String }, optional: true, nullable: true
    end
  end
end
