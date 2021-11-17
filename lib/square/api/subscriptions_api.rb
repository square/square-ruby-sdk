module Square
  # SubscriptionsApi
  class SubscriptionsApi < BaseApi
    def initialize(config, http_call_back: nil)
      super(config, http_call_back: http_call_back)
    end

    # Creates a subscription to a subscription plan by a customer.
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
    # subscriptions](https://developer.squareup.com/docs/subscriptions-api/overv
    # iew#retrieve-subscriptions).
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

    # Retrieves a subscription.
    # @param [String] subscription_id Required parameter: The ID of the
    # subscription to retrieve.
    # @param [String] include Optional parameter: A query parameter to specify
    # related information to be included in the response.   The supported query
    # parameter values are:   - `actions`: to include scheduled actions on the
    # targeted subscription.
    # @return [RetrieveSubscriptionResponse Hash] response from the API call
    def retrieve_subscription(subscription_id:,
                              include: nil)
      # Prepare query url.
      _query_builder = config.get_base_uri
      _query_builder << '/v2/subscriptions/{subscription_id}'
      _query_builder = APIHelper.append_url_with_template_parameters(
        _query_builder,
        'subscription_id' => { 'value' => subscription_id, 'encode' => true }
      )
      _query_builder = APIHelper.append_url_with_query_parameters(
        _query_builder,
        'include' => include
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

    # Updates a subscription. You can set, modify, and clear the
    # `subscription` field values.
    # @param [String] subscription_id Required parameter: The ID of the
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

    # Deletes a scheduled action for a subscription.
    # @param [String] subscription_id Required parameter: The ID of the
    # subscription the targeted action is to act upon.
    # @param [String] action_id Required parameter: The ID of the targeted
    # action to be deleted.
    # @return [DeleteSubscriptionActionResponse Hash] response from the API call
    def delete_subscription_action(subscription_id:,
                                   action_id:)
      # Prepare query url.
      _query_builder = config.get_base_uri
      _query_builder << '/v2/subscriptions/{subscription_id}/actions/{action_id}'
      _query_builder = APIHelper.append_url_with_template_parameters(
        _query_builder,
        'subscription_id' => { 'value' => subscription_id, 'encode' => true },
        'action_id' => { 'value' => action_id, 'encode' => true }
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

    # Schedules a `CANCEL` action to cancel an active subscription
    # by setting the `canceled_date` field to the end of the active billing
    # period
    # and changing the subscription status from ACTIVE to CANCELED after this
    # date.
    # @param [String] subscription_id Required parameter: The ID of the
    # subscription to cancel.
    # @return [CancelSubscriptionResponse Hash] response from the API call
    def cancel_subscription(subscription_id:)
      # Prepare query url.
      _query_builder = config.get_base_uri
      _query_builder << '/v2/subscriptions/{subscription_id}/cancel'
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
      _request = config.http_client.post(
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

    # Lists all events for a specific subscription.
    # In the current implementation, only `START_SUBSCRIPTION` and
    # `STOP_SUBSCRIPTION` (when the subscription was canceled) events are
    # returned.
    # @param [String] subscription_id Required parameter: The ID of the
    # subscription to retrieve the events for.
    # @param [String] cursor Optional parameter: When the total number of
    # resulting subscription events exceeds the limit of a paged response, 
    # specify the cursor returned from a preceding response here to fetch the
    # next set of results. If the cursor is unset, the response contains the
    # last page of the results.  For more information, see
    # [Pagination](https://developer.squareup.com/docs/working-with-apis/paginat
    # ion).
    # @param [Integer] limit Optional parameter: The upper limit on the number
    # of subscription events to return in a paged response.
    # @return [ListSubscriptionEventsResponse Hash] response from the API call
    def list_subscription_events(subscription_id:,
                                 cursor: nil,
                                 limit: nil)
      # Prepare query url.
      _query_builder = config.get_base_uri
      _query_builder << '/v2/subscriptions/{subscription_id}/events'
      _query_builder = APIHelper.append_url_with_template_parameters(
        _query_builder,
        'subscription_id' => { 'value' => subscription_id, 'encode' => true }
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
      ApiResponse.new(
        _response, data: decoded, errors: _errors
      )
    end

    # Schedules a `PAUSE` action to pause an active subscription.
    # @param [String] subscription_id Required parameter: The ID of the
    # subscription to pause.
    # @param [PauseSubscriptionRequest] body Required parameter: An object
    # containing the fields to POST for the request.  See the corresponding
    # object definition for field details.
    # @return [PauseSubscriptionResponse Hash] response from the API call
    def pause_subscription(subscription_id:,
                           body:)
      # Prepare query url.
      _query_builder = config.get_base_uri
      _query_builder << '/v2/subscriptions/{subscription_id}/pause'
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

    # Schedules a `RESUME` action to resume a paused or a deactivated
    # subscription.
    # @param [String] subscription_id Required parameter: The ID of the
    # subscription to resume.
    # @param [ResumeSubscriptionRequest] body Required parameter: An object
    # containing the fields to POST for the request.  See the corresponding
    # object definition for field details.
    # @return [ResumeSubscriptionResponse Hash] response from the API call
    def resume_subscription(subscription_id:,
                            body:)
      # Prepare query url.
      _query_builder = config.get_base_uri
      _query_builder << '/v2/subscriptions/{subscription_id}/resume'
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

    # Schedules a `SWAP_PLAN` action to swap a subscription plan in an existing
    # subscription.
    # @param [String] subscription_id Required parameter: The ID of the
    # subscription to swap the subscription plan for.
    # @param [SwapPlanRequest] body Required parameter: An object containing the
    # fields to POST for the request.  See the corresponding object definition
    # for field details.
    # @return [SwapPlanResponse Hash] response from the API call
    def swap_plan(subscription_id:,
                  body:)
      # Prepare query url.
      _query_builder = config.get_base_uri
      _query_builder << '/v2/subscriptions/{subscription_id}/swap-plan'
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
