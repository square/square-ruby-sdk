module Square
  # WebhookSubscriptionsApi
  class WebhookSubscriptionsApi < BaseApi
    def initialize(config, http_call_back: nil)
      super(config, http_call_back: http_call_back)
    end

    # Lists all webhook event types that can be subscribed to.
    # @param [String] api_version Optional parameter: The API version for which
    # to list event types. Setting this field overrides the default version used
    # by the application.
    # @return [ListWebhookEventTypesResponse Hash] response from the API call
    def list_webhook_event_types(api_version: nil)
      # Prepare query url.
      _query_builder = config.get_base_uri
      _query_builder << '/v2/webhooks/event-types'
      _query_builder = APIHelper.append_url_with_query_parameters(
        _query_builder,
        'api_version' => api_version
      )
      _query_url = APIHelper.clean_url _query_builder

      # Prepare headers.
      _headers = {
        'accept' => 'application/json'
      }

      # Prepare and execute HttpRequest.
      _request = config.http_client.get(
        _query_url,
        headers: _headers
      )
      OAuth2.apply(config, _request)
      _response = execute_request(_request)

      # Return appropriate response type.
      decoded = APIHelper.json_deserialize(_response.raw_body)
      _errors = APIHelper.map_response(decoded, ['errors'])
      ApiResponse.new(
        _response, data: decoded, errors: _errors
      )
    end

    # Lists all webhook subscriptions owned by your application.
    # @param [String] cursor Optional parameter: A pagination cursor returned by
    # a previous call to this endpoint. Provide this to retrieve the next set of
    # results for your original query.  For more information, see
    # [Pagination](https://developer.squareup.com/docs/basics/api101/pagination)
    # .
    # @param [TrueClass|FalseClass] include_disabled Optional parameter:
    # Includes disabled [Subscription]($m/WebhookSubscription)s. By default, all
    # enabled [Subscription]($m/WebhookSubscription)s are returned.
    # @param [SortOrder] sort_order Optional parameter: Sorts the returned list
    # by when the [Subscription]($m/WebhookSubscription) was created with the
    # specified order. This field defaults to ASC.
    # @param [Integer] limit Optional parameter: The maximum number of results
    # to be returned in a single page. It is possible to receive fewer results
    # than the specified limit on a given page. The default value of 100 is also
    # the maximum allowed value.  Default: 100
    # @return [ListWebhookSubscriptionsResponse Hash] response from the API call
    def list_webhook_subscriptions(cursor: nil,
                                   include_disabled: false,
                                   sort_order: nil,
                                   limit: nil)
      # Prepare query url.
      _query_builder = config.get_base_uri
      _query_builder << '/v2/webhooks/subscriptions'
      _query_builder = APIHelper.append_url_with_query_parameters(
        _query_builder,
        'cursor' => cursor,
        'include_disabled' => include_disabled,
        'sort_order' => sort_order,
        'limit' => limit
      )
      _query_url = APIHelper.clean_url _query_builder

      # Prepare headers.
      _headers = {
        'accept' => 'application/json'
      }

      # Prepare and execute HttpRequest.
      _request = config.http_client.get(
        _query_url,
        headers: _headers
      )
      OAuth2.apply(config, _request)
      _response = execute_request(_request)

      # Return appropriate response type.
      decoded = APIHelper.json_deserialize(_response.raw_body)
      _errors = APIHelper.map_response(decoded, ['errors'])
      ApiResponse.new(
        _response, data: decoded, errors: _errors
      )
    end

    # Creates a webhook subscription.
    # @param [CreateWebhookSubscriptionRequest] body Required parameter: An
    # object containing the fields to POST for the request.  See the
    # corresponding object definition for field details.
    # @return [CreateWebhookSubscriptionResponse Hash] response from the API call
    def create_webhook_subscription(body:)
      # Prepare query url.
      _query_builder = config.get_base_uri
      _query_builder << '/v2/webhooks/subscriptions'
      _query_url = APIHelper.clean_url _query_builder

      # Prepare headers.
      _headers = {
        'accept' => 'application/json',
        'Content-Type' => 'application/json'
      }

      # Prepare and execute HttpRequest.
      _request = config.http_client.post(
        _query_url,
        headers: _headers,
        parameters: body.to_json
      )
      OAuth2.apply(config, _request)
      _response = execute_request(_request)

      # Return appropriate response type.
      decoded = APIHelper.json_deserialize(_response.raw_body)
      _errors = APIHelper.map_response(decoded, ['errors'])
      ApiResponse.new(
        _response, data: decoded, errors: _errors
      )
    end

    # Deletes a webhook subscription.
    # @param [String] subscription_id Required parameter: [REQUIRED] The ID of
    # the [Subscription]($m/WebhookSubscription) to delete.
    # @return [DeleteWebhookSubscriptionResponse Hash] response from the API call
    def delete_webhook_subscription(subscription_id:)
      # Prepare query url.
      _query_builder = config.get_base_uri
      _query_builder << '/v2/webhooks/subscriptions/{subscription_id}'
      _query_builder = APIHelper.append_url_with_template_parameters(
        _query_builder,
        'subscription_id' => { 'value' => subscription_id, 'encode' => true }
      )
      _query_url = APIHelper.clean_url _query_builder

      # Prepare headers.
      _headers = {
        'accept' => 'application/json'
      }

      # Prepare and execute HttpRequest.
      _request = config.http_client.delete(
        _query_url,
        headers: _headers
      )
      OAuth2.apply(config, _request)
      _response = execute_request(_request)

      # Return appropriate response type.
      decoded = APIHelper.json_deserialize(_response.raw_body)
      _errors = APIHelper.map_response(decoded, ['errors'])
      ApiResponse.new(
        _response, data: decoded, errors: _errors
      )
    end

    # Retrieves a webhook subscription identified by its ID.
    # @param [String] subscription_id Required parameter: [REQUIRED] The ID of
    # the [Subscription]($m/WebhookSubscription) to retrieve.
    # @return [RetrieveWebhookSubscriptionResponse Hash] response from the API call
    def retrieve_webhook_subscription(subscription_id:)
      # Prepare query url.
      _query_builder = config.get_base_uri
      _query_builder << '/v2/webhooks/subscriptions/{subscription_id}'
      _query_builder = APIHelper.append_url_with_template_parameters(
        _query_builder,
        'subscription_id' => { 'value' => subscription_id, 'encode' => true }
      )
      _query_url = APIHelper.clean_url _query_builder

      # Prepare headers.
      _headers = {
        'accept' => 'application/json'
      }

      # Prepare and execute HttpRequest.
      _request = config.http_client.get(
        _query_url,
        headers: _headers
      )
      OAuth2.apply(config, _request)
      _response = execute_request(_request)

      # Return appropriate response type.
      decoded = APIHelper.json_deserialize(_response.raw_body)
      _errors = APIHelper.map_response(decoded, ['errors'])
      ApiResponse.new(
        _response, data: decoded, errors: _errors
      )
    end

    # Updates a webhook subscription.
    # @param [String] subscription_id Required parameter: [REQUIRED] The ID of
    # the [Subscription]($m/WebhookSubscription) to update.
    # @param [UpdateWebhookSubscriptionRequest] body Required parameter: An
    # object containing the fields to POST for the request.  See the
    # corresponding object definition for field details.
    # @return [UpdateWebhookSubscriptionResponse Hash] response from the API call
    def update_webhook_subscription(subscription_id:,
                                    body:)
      # Prepare query url.
      _query_builder = config.get_base_uri
      _query_builder << '/v2/webhooks/subscriptions/{subscription_id}'
      _query_builder = APIHelper.append_url_with_template_parameters(
        _query_builder,
        'subscription_id' => { 'value' => subscription_id, 'encode' => true }
      )
      _query_url = APIHelper.clean_url _query_builder

      # Prepare headers.
      _headers = {
        'accept' => 'application/json',
        'Content-Type' => 'application/json'
      }

      # Prepare and execute HttpRequest.
      _request = config.http_client.put(
        _query_url,
        headers: _headers,
        parameters: body.to_json
      )
      OAuth2.apply(config, _request)
      _response = execute_request(_request)

      # Return appropriate response type.
      decoded = APIHelper.json_deserialize(_response.raw_body)
      _errors = APIHelper.map_response(decoded, ['errors'])
      ApiResponse.new(
        _response, data: decoded, errors: _errors
      )
    end

    # Updates a webhook subscription by replacing the existing signature key
    # with a new one.
    # @param [String] subscription_id Required parameter: [REQUIRED] The ID of
    # the [Subscription]($m/WebhookSubscription) to update.
    # @param [UpdateWebhookSubscriptionSignatureKeyRequest] body Required
    # parameter: An object containing the fields to POST for the request.  See
    # the corresponding object definition for field details.
    # @return [UpdateWebhookSubscriptionSignatureKeyResponse Hash] response from the API call
    def update_webhook_subscription_signature_key(subscription_id:,
                                                  body:)
      # Prepare query url.
      _query_builder = config.get_base_uri
      _query_builder << '/v2/webhooks/subscriptions/{subscription_id}/signature-key'
      _query_builder = APIHelper.append_url_with_template_parameters(
        _query_builder,
        'subscription_id' => { 'value' => subscription_id, 'encode' => true }
      )
      _query_url = APIHelper.clean_url _query_builder

      # Prepare headers.
      _headers = {
        'accept' => 'application/json',
        'Content-Type' => 'application/json'
      }

      # Prepare and execute HttpRequest.
      _request = config.http_client.post(
        _query_url,
        headers: _headers,
        parameters: body.to_json
      )
      OAuth2.apply(config, _request)
      _response = execute_request(_request)

      # Return appropriate response type.
      decoded = APIHelper.json_deserialize(_response.raw_body)
      _errors = APIHelper.map_response(decoded, ['errors'])
      ApiResponse.new(
        _response, data: decoded, errors: _errors
      )
    end

    # Tests a webhook subscription by sending a test event to the notification
    # URL.
    # @param [String] subscription_id Required parameter: [REQUIRED] The ID of
    # the [Subscription]($m/WebhookSubscription) to test.
    # @param [TestWebhookSubscriptionRequest] body Required parameter: An object
    # containing the fields to POST for the request.  See the corresponding
    # object definition for field details.
    # @return [TestWebhookSubscriptionResponse Hash] response from the API call
    def test_webhook_subscription(subscription_id:,
                                  body:)
      # Prepare query url.
      _query_builder = config.get_base_uri
      _query_builder << '/v2/webhooks/subscriptions/{subscription_id}/test'
      _query_builder = APIHelper.append_url_with_template_parameters(
        _query_builder,
        'subscription_id' => { 'value' => subscription_id, 'encode' => true }
      )
      _query_url = APIHelper.clean_url _query_builder

      # Prepare headers.
      _headers = {
        'accept' => 'application/json',
        'Content-Type' => 'application/json'
      }

      # Prepare and execute HttpRequest.
      _request = config.http_client.post(
        _query_url,
        headers: _headers,
        parameters: body.to_json
      )
      OAuth2.apply(config, _request)
      _response = execute_request(_request)

      # Return appropriate response type.
      decoded = APIHelper.json_deserialize(_response.raw_body)
      _errors = APIHelper.map_response(decoded, ['errors'])
      ApiResponse.new(
        _response, data: decoded, errors: _errors
      )
    end
  end
end
