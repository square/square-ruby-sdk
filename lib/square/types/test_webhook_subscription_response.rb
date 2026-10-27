# frozen_string_literal: true

require_relative "../../square"

module Square
  module Types
    # Defines the fields that are included in the response body of a request to the TestWebhookSubscription endpoint.
    class TestWebhookSubscriptionResponse < Internal::Types::Model
      field :errors, -> { Internal::Types::Array[Square::Types::Error] }, optional: true, nullable: false

      field :subscription_test_result, -> { Square::Types::SubscriptionTestResult }, optional: true, nullable: false

      field :notification_url, -> { String }, optional: true, nullable: false

      field :status_code, -> { Integer }, optional: true, nullable: true

      field :passes_filter, -> { Internal::Types::Boolean }, optional: true, nullable: true

      field :payload, -> { Internal::Types::Hash[String, Object] }, optional: true, nullable: true
    end
  end
end
