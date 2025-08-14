# frozen_string_literal: true

module Square
    module Types
        # Defines output parameters in a response of the 
        # [SwapPlan](api-endpoint:Subscriptions-SwapPlan) endpoint.
        class SwapPlanResponse < Square::Internal::Types::Model
            field :errors, Square::Internal::Types::Array[Square::Types::Error], optional: true, nullable: false
            field :subscription, Square::Subscription, optional: true, nullable: false
            field :actions, Square::Internal::Types::Array[Square::SubscriptionAction], optional: true, nullable: false
        end
    end
end
