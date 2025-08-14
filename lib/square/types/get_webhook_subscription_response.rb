# frozen_string_literal: true

module Square
    module Types
        # Defines the fields that are included in the response body of
        # a request to the [RetrieveWebhookSubscription](api-endpoint:WebhookSubscriptions-RetrieveWebhookSubscription) endpoint.
        # 
        # Note: if there are errors processing the request, the [Subscription](entity:WebhookSubscription) will not be
        # present.
        class GetWebhookSubscriptionResponse < Square::Internal::Types::Model
            field :errors, Square::Internal::Types::Array[Square::Types::Error], optional: true, nullable: false
            field :subscription, Square::WebhookSubscription, optional: true, nullable: false
        end
    end
end
