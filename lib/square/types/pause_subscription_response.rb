# frozen_string_literal: true

module Square
    module Types
        # Defines output parameters in a response from the
        # [PauseSubscription](api-endpoint:Subscriptions-PauseSubscription) endpoint.
        class PauseSubscriptionResponse < Square::Internal::Types::Model
            field :errors, Square::Internal::Types::Array[Square::Error], optional: true, nullable: false
            field :subscription, Square::Subscription, optional: true, nullable: false
            field :actions, Square::Internal::Types::Array[Square::SubscriptionAction], optional: true, nullable: false
        end
    end
end
