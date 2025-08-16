# frozen_string_literal: true

module Square
  module Types
    # Describes a subscription plan. A subscription plan represents what you want to sell in a subscription model, and includes references to each of the associated subscription plan variations.
    # For more information, see [Subscription Plans and Variations](https://developer.squareup.com/docs/subscriptions-api/plans-and-variations).
    class CatalogSubscriptionPlan < Internal::Types::Model
      field :name, String, optional: false, nullable: false
      field :phases, Internal::Types::Array[Square::SubscriptionPhase], optional: true, nullable: false
      field :subscription_plan_variations, Internal::Types::Array[Square::CatalogObject], optional: true, nullable: false
      field :eligible_item_ids, Internal::Types::Array[String], optional: true, nullable: false
      field :eligible_category_ids, Internal::Types::Array[String], optional: true, nullable: false
      field :all_items, Internal::Types::Boolean, optional: true, nullable: false

    end
  end
end
