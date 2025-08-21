# frozen_string_literal: true

module Square
  module Webhooks
    module Subscriptions
      module Types
        class UpdateWebhookSubscriptionRequest < Internal::Types::Model
          field :subscription_id, -> { String }, optional: false, nullable: false
          field :subscription, -> { Square::Types::WebhookSubscription }, optional: true, nullable: false
        end
      end
    end
  end
end
