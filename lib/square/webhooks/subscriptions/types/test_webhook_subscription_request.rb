# frozen_string_literal: true

module Square
  module Webhooks
    module Subscriptions
      module Types
        class TestWebhookSubscriptionRequest < Internal::Types::Model
          field :subscription_id, -> { String }, optional: false, nullable: false
          field :event_type, -> { String }, optional: true, nullable: false
        end
      end
    end
  end
end
