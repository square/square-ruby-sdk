
module Square
  module Webhooks
    module Subscriptions
      module Types
        class UpdateWebhookSubscriptionSignatureKeyRequest < Internal::Types::Model
          field :subscription_id, String, optional: false, nullable: false
          field :idempotency_key, String, optional: true, nullable: false

        end
      end
    end
  end
end
