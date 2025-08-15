# frozen_string_literal: true

module Square
  # Defines the fields that are included in the response body of
  # a request to the [ListWebhookSubscriptions](api-endpoint:WebhookSubscriptions-ListWebhookSubscriptions) endpoint.
  # 
  # Note: if there are errors processing the request, the subscriptions field will not be
  # present.
  class ListWebhookSubscriptionsResponse < Internal::Types::Model
    field :errors, Internal::Types::Array[Square::Error], optional: true, nullable: false
    field :subscriptions, Internal::Types::Array[Square::WebhookSubscription], optional: true, nullable: false
    field :cursor, String, optional: true, nullable: false

  end
end
