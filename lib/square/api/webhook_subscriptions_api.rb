module Square
  # WebhookSubscriptionsApi
  class WebhookSubscriptionsApi < BaseApi
    # Lists all webhook event types that can be subscribed to.
    # @param [String] api_version Optional parameter: The API version for which
    # to list event types. Setting this field overrides the default version used
    # by the application.
    # @return [ApiResponse]  the complete http response with raw body and status code.
    def list_webhook_event_types(api_version: nil)
      new_api_call_builder
        .request(new_request_builder(HttpMethodEnum::GET,
                                     '/v2/webhooks/event-types',
                                     'default')
                   .query_param(new_parameter(api_version, key: 'api_version'))
                   .header_param(new_parameter('application/json', key: 'accept'))
                   .auth(Single.new('global')))
        .response(new_response_handler
                    .deserializer(APIHelper.method(:json_deserialize))
                    .is_api_response(true)
                    .convertor(ApiResponse.method(:create)))
        .execute
    end

    # Lists all webhook subscriptions owned by your application.
    # @param [String] cursor Optional parameter: A pagination cursor returned by
    # a previous call to this endpoint. Provide this to retrieve the next set of
    # results for your original query.  For more information, see
    # [Pagination](https://developer.squareup.com/docs/build-basics/common-api-p
    # atterns/pagination).
    # @param [TrueClass | FalseClass] include_disabled Optional parameter:
    # Includes disabled [Subscription](entity:WebhookSubscription)s. By default,
    # all enabled [Subscription](entity:WebhookSubscription)s are returned.
    # @param [SortOrder] sort_order Optional parameter: Sorts the returned list
    # by when the [Subscription](entity:WebhookSubscription) was created with
    # the specified order. This field defaults to ASC.
    # @param [Integer] limit Optional parameter: The maximum number of results
    # to be returned in a single page. It is possible to receive fewer results
    # than the specified limit on a given page. The default value of 100 is also
    # the maximum allowed value.  Default: 100
    # @return [ApiResponse]  the complete http response with raw body and status code.
    def list_webhook_subscriptions(cursor: nil,
                                   include_disabled: false,
                                   sort_order: nil,
                                   limit: nil)
      new_api_call_builder
        .request(new_request_builder(HttpMethodEnum::GET,
                                     '/v2/webhooks/subscriptions',
                                     'default')
                   .query_param(new_parameter(cursor, key: 'cursor'))
                   .query_param(new_parameter(include_disabled, key: 'include_disabled'))
                   .query_param(new_parameter(sort_order, key: 'sort_order'))
                   .query_param(new_parameter(limit, key: 'limit'))
                   .header_param(new_parameter('application/json', key: 'accept'))
                   .auth(Single.new('global')))
        .response(new_response_handler
                    .deserializer(APIHelper.method(:json_deserialize))
                    .is_api_response(true)
                    .convertor(ApiResponse.method(:create)))
        .execute
    end

    # Creates a webhook subscription.
    # @param [CreateWebhookSubscriptionRequest] body Required parameter: An
    # object containing the fields to POST for the request.  See the
    # corresponding object definition for field details.
    # @return [ApiResponse]  the complete http response with raw body and status code.
    def create_webhook_subscription(body:)
      new_api_call_builder
        .request(new_request_builder(HttpMethodEnum::POST,
                                     '/v2/webhooks/subscriptions',
                                     'default')
                   .header_param(new_parameter('application/json', key: 'Content-Type'))
                   .body_param(new_parameter(body))
                   .header_param(new_parameter('application/json', key: 'accept'))
                   .body_serializer(proc do |param| param.to_json unless param.nil? end)
                   .auth(Single.new('global')))
        .response(new_response_handler
                    .deserializer(APIHelper.method(:json_deserialize))
                    .is_api_response(true)
                    .convertor(ApiResponse.method(:create)))
        .execute
    end

    # Deletes a webhook subscription.
    # @param [String] subscription_id Required parameter: [REQUIRED] The ID of
    # the [Subscription](entity:WebhookSubscription) to delete.
    # @return [ApiResponse]  the complete http response with raw body and status code.
    def delete_webhook_subscription(subscription_id:)
      new_api_call_builder
        .request(new_request_builder(HttpMethodEnum::DELETE,
                                     '/v2/webhooks/subscriptions/{subscription_id}',
                                     'default')
                   .template_param(new_parameter(subscription_id, key: 'subscription_id')
                                    .should_encode(true))
                   .header_param(new_parameter('application/json', key: 'accept'))
                   .auth(Single.new('global')))
        .response(new_response_handler
                    .deserializer(APIHelper.method(:json_deserialize))
                    .is_api_response(true)
                    .convertor(ApiResponse.method(:create)))
        .execute
    end

    # Retrieves a webhook subscription identified by its ID.
    # @param [String] subscription_id Required parameter: [REQUIRED] The ID of
    # the [Subscription](entity:WebhookSubscription) to retrieve.
    # @return [ApiResponse]  the complete http response with raw body and status code.
    def retrieve_webhook_subscription(subscription_id:)
      new_api_call_builder
        .request(new_request_builder(HttpMethodEnum::GET,
                                     '/v2/webhooks/subscriptions/{subscription_id}',
                                     'default')
                   .template_param(new_parameter(subscription_id, key: 'subscription_id')
                                    .should_encode(true))
                   .header_param(new_parameter('application/json', key: 'accept'))
                   .auth(Single.new('global')))
        .response(new_response_handler
                    .deserializer(APIHelper.method(:json_deserialize))
                    .is_api_response(true)
                    .convertor(ApiResponse.method(:create)))
        .execute
    end

    # Updates a webhook subscription.
    # @param [String] subscription_id Required parameter: [REQUIRED] The ID of
    # the [Subscription](entity:WebhookSubscription) to update.
    # @param [UpdateWebhookSubscriptionRequest] body Required parameter: An
    # object containing the fields to POST for the request.  See the
    # corresponding object definition for field details.
    # @return [ApiResponse]  the complete http response with raw body and status code.
    def update_webhook_subscription(subscription_id:,
                                    body:)
      new_api_call_builder
        .request(new_request_builder(HttpMethodEnum::PUT,
                                     '/v2/webhooks/subscriptions/{subscription_id}',
                                     'default')
                   .template_param(new_parameter(subscription_id, key: 'subscription_id')
                                    .should_encode(true))
                   .header_param(new_parameter('application/json', key: 'Content-Type'))
                   .body_param(new_parameter(body))
                   .header_param(new_parameter('application/json', key: 'accept'))
                   .body_serializer(proc do |param| param.to_json unless param.nil? end)
                   .auth(Single.new('global')))
        .response(new_response_handler
                    .deserializer(APIHelper.method(:json_deserialize))
                    .is_api_response(true)
                    .convertor(ApiResponse.method(:create)))
        .execute
    end

    # Updates a webhook subscription by replacing the existing signature key
    # with a new one.
    # @param [String] subscription_id Required parameter: [REQUIRED] The ID of
    # the [Subscription](entity:WebhookSubscription) to update.
    # @param [UpdateWebhookSubscriptionSignatureKeyRequest] body Required
    # parameter: An object containing the fields to POST for the request.  See
    # the corresponding object definition for field details.
    # @return [ApiResponse]  the complete http response with raw body and status code.
    def update_webhook_subscription_signature_key(subscription_id:,
                                                  body:)
      new_api_call_builder
        .request(new_request_builder(HttpMethodEnum::POST,
                                     '/v2/webhooks/subscriptions/{subscription_id}/signature-key',
                                     'default')
                   .template_param(new_parameter(subscription_id, key: 'subscription_id')
                                    .should_encode(true))
                   .header_param(new_parameter('application/json', key: 'Content-Type'))
                   .body_param(new_parameter(body))
                   .header_param(new_parameter('application/json', key: 'accept'))
                   .body_serializer(proc do |param| param.to_json unless param.nil? end)
                   .auth(Single.new('global')))
        .response(new_response_handler
                    .deserializer(APIHelper.method(:json_deserialize))
                    .is_api_response(true)
                    .convertor(ApiResponse.method(:create)))
        .execute
    end

    # Tests a webhook subscription by sending a test event to the notification
    # URL.
    # @param [String] subscription_id Required parameter: [REQUIRED] The ID of
    # the [Subscription](entity:WebhookSubscription) to test.
    # @param [TestWebhookSubscriptionRequest] body Required parameter: An object
    # containing the fields to POST for the request.  See the corresponding
    # object definition for field details.
    # @return [ApiResponse]  the complete http response with raw body and status code.
    def test_webhook_subscription(subscription_id:,
                                  body:)
      new_api_call_builder
        .request(new_request_builder(HttpMethodEnum::POST,
                                     '/v2/webhooks/subscriptions/{subscription_id}/test',
                                     'default')
                   .template_param(new_parameter(subscription_id, key: 'subscription_id')
                                    .should_encode(true))
                   .header_param(new_parameter('application/json', key: 'Content-Type'))
                   .body_param(new_parameter(body))
                   .header_param(new_parameter('application/json', key: 'accept'))
                   .body_serializer(proc do |param| param.to_json unless param.nil? end)
                   .auth(Single.new('global')))
        .response(new_response_handler
                    .deserializer(APIHelper.method(:json_deserialize))
                    .is_api_response(true)
                    .convertor(ApiResponse.method(:create)))
        .execute
    end
  end
end
