# frozen_string_literal: true

module Square
    module Types
        # Defines the fields that are included in the response body of
        # a request to the [TestWebhookSubscription](api-endpoint:WebhookSubscriptions-TestWebhookSubscription) endpoint.
        # 
        # Note: If there are errors processing the request, the [SubscriptionTestResult](entity:SubscriptionTestResult) field is not
        # present.
        class TestWebhookSubscriptionResponse < Square::Internal::Types::Model
            field :errors, Square::Internal::Types::Array[Square::Error], optional: true, nullable: false
            field :subscription_test_result, Square::SubscriptionTestResult, optional: true, nullable: false
        end
    end
end
