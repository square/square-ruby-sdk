# frozen_string_literal: true

module Square
  module Types
    # Defines the fields that are included in the response body of
    # a request to the [UpdateWebhookSubscription](api-endpoint:WebhookSubscriptions-UpdateWebhookSubscription) endpoint.
    # 
    # Note: If there are errors processing the request, the [Subscription](entity:WebhookSubscription) is not
    # present.
    class UpdateWebhookSubscriptionResponse < Internal::Types::Model
      field :errors, Internal::Types::Array[Square::Error], optional: true, nullable: false
      field :subscription, Square::WebhookSubscription, optional: true, nullable: false

    end
  end
end
