# frozen_string_literal: true

module Square
  module Types
    # Defines the fields that are included in the response body of
    # a request to the [DeleteWebhookSubscription](api-endpoint:WebhookSubscriptions-DeleteWebhookSubscription)
    # endpoint.
    class DeleteWebhookSubscriptionResponse < Internal::Types::Model
      field :errors, -> { Internal::Types::Array[Square::Types::Error] }, optional: true, nullable: false
    end
  end
end
