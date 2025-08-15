# frozen_string_literal: true

module Square
  # Defines the fields that are included in the response body of
  # a request to the [RetrieveWebhookSubscription](api-endpoint:WebhookSubscriptions-RetrieveWebhookSubscription) endpoint.
  # 
  # Note: if there are errors processing the request, the [Subscription](entity:WebhookSubscription) will not be
  # present.
  class GetWebhookSubscriptionResponse < Internal::Types::Model
    field :errors, Internal::Types::Array[Square::Error], optional: true, nullable: false
    field :subscription, Square::WebhookSubscription, optional: true, nullable: false

  end
end
