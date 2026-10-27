# frozen_string_literal: true

require_relative "../../square"

module Square
  module Types
    # Describes a subscription plan. A subscription plan represents what you want to sell in a subscription model, and
    # includes references to each of the associated subscription plan variations.
    # For more information, see [Subscription Plans and
    # Variations](https://developer.squareup.com/docs/subscriptions-api/plans-and-variations).
    class CatalogSubscriptionPlan < Internal::Types::Model
      field :name, -> { String }, optional: false, nullable: false

      field :phases, -> { Internal::Types::Array[Square::Types::SubscriptionPhase] }, optional: true, nullable: true

      field :subscription_plan_variations, -> { Internal::Types::Array[Square::Types::CatalogObject] }, optional: true, nullable: true

      field :eligible_item_ids, -> { Internal::Types::Array[String] }, optional: true, nullable: true

      field :eligible_category_ids, -> { Internal::Types::Array[String] }, optional: true, nullable: true

      field :all_items, -> { Internal::Types::Boolean }, optional: true, nullable: true
    end
  end
end
