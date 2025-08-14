# frozen_string_literal: true

module Square
    module Types
        # Describes changes to a subscription and the subscription status.
        class SubscriptionEvent < Square::Internal::Types::Model
            field :id, String, optional: false, nullable: false
            field :subscription_event_type, Square::SubscriptionEventSubscriptionEventType, optional: false, nullable: false
            field :effective_date, String, optional: false, nullable: false
            field :monthly_billing_anchor_date, Integer, optional: true, nullable: false
            field :info, Square::SubscriptionEventInfo, optional: true, nullable: false
            field :phases, Square::Internal::Types::Array[Square::Phase], optional: true, nullable: false
            field :plan_variation_id, String, optional: false, nullable: false
        end
    end
end
