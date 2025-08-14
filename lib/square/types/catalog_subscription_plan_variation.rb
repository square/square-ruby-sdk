# frozen_string_literal: true

module Square
    module Types
        # Describes a subscription plan variation. A subscription plan variation represents how the subscription for a product or service is sold.
        # For more information, see [Subscription Plans and Variations](https://developer.squareup.com/docs/subscriptions-api/plans-and-variations).
        class CatalogSubscriptionPlanVariation < Square::Internal::Types::Model
            field :name, String, optional: false, nullable: false
            field :phases, Square::Internal::Types::Array[Square::SubscriptionPhase], optional: false, nullable: false
            field :subscription_plan_id, String, optional: true, nullable: false
            field :monthly_billing_anchor_date, Integer, optional: true, nullable: false
            field :can_prorate, Square::Internal::Types::Boolean, optional: true, nullable: false
            field :successor_plan_variation_id, String, optional: true, nullable: false
        end
    end
end
