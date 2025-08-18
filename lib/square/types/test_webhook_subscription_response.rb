# frozen_string_literal: true

module Square
  module Types
    # Defines the fields that are included in the response body of
    # a request to the [TestWebhookSubscription](api-endpoint:WebhookSubscriptions-TestWebhookSubscription) endpoint.
    # 
    # Note: If there are errors processing the request, the [SubscriptionTestResult](entity:SubscriptionTestResult) field is not
    # present.
    class TestWebhookSubscriptionResponse < Internal::Types::Model
      field :errors, Internal::Types::Array[Square::Types::Error], optional: true, nullable: false
      field :subscription_test_result, Square::Types::SubscriptionTestResult, optional: true, nullable: false

    end
  end
end
