
module Square
  module Webhooks
    module Subscriptions
      module Types
        class CreateWebhookSubscriptionRequest < Internal::Types::Model
          field :idempotency_key, -> { String }, optional: true, nullable: false
          field :subscription, -> { Square::Types::WebhookSubscription }, optional: false, nullable: false

        end
      end
    end
  end
end
