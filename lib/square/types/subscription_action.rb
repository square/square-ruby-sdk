# frozen_string_literal: true

module Square
    module Types
        # Represents an action as a pending change to a subscription.
        class SubscriptionAction < Internal::Types::Model
            field :id, String, optional: true, nullable: false
            field :type, Square::SubscriptionActionType, optional: true, nullable: false
            field :effective_date, String, optional: true, nullable: false
            field :monthly_billing_anchor_date, Integer, optional: true, nullable: false
            field :phases, Internal::Types::Array[Square::Phase], optional: true, nullable: false
            field :new_plan_variation_id, String, optional: true, nullable: false
        end
    end
end
