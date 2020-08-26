module Square
  # SubscriptionsApi
  class SubscriptionsApi < BaseApi
    def initialize(config, http_call_back: nil)
      super(config, http_call_back: http_call_back)
    end

    # Creates a subscription for a customer to a subscription plan.
    # If you provide a card on file in the request, Square charges the card for
    # the subscription. Otherwise, Square bills an invoice to the customer's
    # email
    # address. The subscription starts immediately, unless the request includes
    # the optional `start_date`. Each individual subscription is associated with
    # a particular location.
    # @param [CreateSubscriptionRequest] body Required parameter: An object
    # containing the fields to POST for the request.  See the corresponding
    # object definition for field details.
    # @return [CreateSubscriptionResponse Hash] response from the API call
    def create_subscription(body:)
      # Prepare query url.
      _query_builder = config.get_base_uri
      _query_builder << '/v2/subscriptions'
      _query_url = APIHelper.clean_url _query_builder

      # Prepare headers.
      _headers = {
        'accept' => 'application/json',
        'content-type' => 'application/json; charset=utf-8'
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
      ApiResponse.new(_response, data: decoded, errors: _errors)
    end

    # Searches for subscriptions.
    # Results are ordered chronologically by subscription creation date. If
    # the request specifies more than one location ID,
    # the endpoint orders the result
    # by location ID, and then by creation date within each location. If no
    # locations are given
    # in the query, all locations are searched.
    # You can also optionally specify `customer_ids` to search by customer.
    # If left unset, all customers
    # associated with the specified locations are returned.
    # If the request specifies customer IDs, the endpoint orders results
    # first by location, within location by customer ID, and within
    # customer by subscription creation date.
    # For more information, see
    # [Retrieve
    # subscriptions](https://developer.squareup.com/docs/docs/subscriptions-api/
    # overview#retrieve-subscriptions).
    # @param [SearchSubscriptionsRequest] body Required parameter: An object
    # containing the fields to POST for the request.  See the corresponding
    # object definition for field details.
    # @return [SearchSubscriptionsResponse Hash] response from the API call
    def search_subscriptions(body:)
      # Prepare query url.
      _query_builder = config.get_base_uri
      _query_builder << '/v2/subscriptions/search'
      _query_url = APIHelper.clean_url _query_builder

      # Prepare headers.
      _headers = {
        'accept' => 'application/json',
        'content-type' => 'application/json; charset=utf-8'
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
      ApiResponse.new(_response, data: decoded, errors: _errors)
    end

    # Retrieves a subscription.
    # @param [String] subscription_id Required parameter: The ID of the
    # subscription to retrieve.
    # @return [RetrieveSubscriptionResponse Hash] response from the API call
    def retrieve_subscription(subscription_id:)
      # Prepare query url.
      _query_builder = config.get_base_uri
      _query_builder << '/v2/subscriptions/{subscription_id}'
      _query_builder = APIHelper.append_url_with_template_parameters(
        _query_builder,
        'subscription_id' => subscription_id
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
      ApiResponse.new(_response, data: decoded, errors: _errors)
    end

    # Updates a subscription. You can set, modify, and clear the
    # `subscription` field values.
    # @param [String] subscription_id Required parameter: The ID for the
    # subscription to update.
    # @param [UpdateSubscriptionRequest] body Required parameter: An object
    # containing the fields to POST for the request.  See the corresponding
    # object definition for field details.
    # @return [UpdateSubscriptionResponse Hash] response from the API call
    def update_subscription(subscription_id:,
                            body:)
      # Prepare query url.
      _query_builder = config.get_base_uri
      _query_builder << '/v2/subscriptions/{subscription_id}'
      _query_builder = APIHelper.append_url_with_template_parameters(
        _query_builder,
        'subscription_id' => subscription_id
      )
      _query_url = APIHelper.clean_url _query_builder

      # Prepare headers.
      _headers = {
        'accept' => 'application/json',
        'content-type' => 'application/json; charset=utf-8'
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
      ApiResponse.new(_response, data: decoded, errors: _errors)
    end

    # Sets the `canceled_date` field to the end of the active billing period.
    # After this date, the status changes from ACTIVE to CANCELED.
    # @param [String] subscription_id Required parameter: The ID of the
    # subscription to cancel.
    # @return [CancelSubscriptionResponse Hash] response from the API call
    def cancel_subscription(subscription_id:)
      # Prepare query url.
      _query_builder = config.get_base_uri
      _query_builder << '/v2/subscriptions/{subscription_id}/cancel'
      _query_builder = APIHelper.append_url_with_template_parameters(
        _query_builder,
        'subscription_id' => subscription_id
      )
      _query_url = APIHelper.clean_url _query_builder

      # Prepare headers.
      _headers = {
        'accept' => 'application/json'
      }

      # Prepare and execute HttpRequest.
      _request = config.http_client.post(
        _query_url,
        headers: _headers
      )
      OAuth2.apply(config, _request)
      _response = execute_request(_request)

      # Return appropriate response type.
      decoded = APIHelper.json_deserialize(_response.raw_body)
      _errors = APIHelper.map_response(decoded, ['errors'])
      ApiResponse.new(_response, data: decoded, errors: _errors)
    end

    # Lists all events for a specific subscription.
    # In the current implementation, only `START_SUBSCRIPTION` and
    # `STOP_SUBSCRIPTION` (when the subscription was canceled) events are
    # returned.
    # @param [String] subscription_id Required parameter: The ID of the
    # subscription to retrieve the events for.
    # @param [String] cursor Optional parameter: A pagination cursor returned by
    # a previous call to this endpoint. Provide this to retrieve the next set of
    # results for the original query.  For more information, see
    # [Pagination](https://developer.squareup.com/docs/docs/working-with-apis/pa
    # gination).
    # @param [Integer] limit Optional parameter: The upper limit on the number
    # of subscription events to return  in the response.   Default: `200`
    # @return [ListSubscriptionEventsResponse Hash] response from the API call
    def list_subscription_events(subscription_id:,
                                 cursor: nil,
                                 limit: nil)
      # Prepare query url.
      _query_builder = config.get_base_uri
      _query_builder << '/v2/subscriptions/{subscription_id}/events'
      _query_builder = APIHelper.append_url_with_template_parameters(
        _query_builder,
        'subscription_id' => subscription_id
      )
      _query_builder = APIHelper.append_url_with_query_parameters(
        _query_builder,
        'cursor' => cursor,
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
      ApiResponse.new(_response, data: decoded, errors: _errors)
    end
  end
end
