module Square
  # TerminalApi
  class TerminalApi < BaseApi
    def initialize(config, http_call_back: nil)
      super(config, http_call_back: http_call_back)
    end

    # Creates a Terminal action request and sends it to the specified device.
    # @param [CreateTerminalActionRequest] body Required parameter: An object
    # containing the fields to POST for the request.  See the corresponding
    # object definition for field details.
    # @return [CreateTerminalActionResponse Hash] response from the API call
    def create_terminal_action(body:)
      # Prepare query url.
      _query_builder = config.get_base_uri
      _query_builder << '/v2/terminals/actions'
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

    # Retrieves a filtered list of Terminal action requests created by the
    # account making the request. Terminal action requests are available for 30
    # days.
    # @param [SearchTerminalActionsRequest] body Required parameter: An object
    # containing the fields to POST for the request.  See the corresponding
    # object definition for field details.
    # @return [SearchTerminalActionsResponse Hash] response from the API call
    def search_terminal_actions(body:)
      # Prepare query url.
      _query_builder = config.get_base_uri
      _query_builder << '/v2/terminals/actions/search'
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

    # Retrieves a Terminal action request by `action_id`. Terminal action
    # requests are available for 30 days.
    # @param [String] action_id Required parameter: Unique ID for the desired
    # `TerminalAction`
    # @return [GetTerminalActionResponse Hash] response from the API call
    def get_terminal_action(action_id:)
      # Prepare query url.
      _query_builder = config.get_base_uri
      _query_builder << '/v2/terminals/actions/{action_id}'
      _query_builder = APIHelper.append_url_with_template_parameters(
        _query_builder,
        'action_id' => { 'value' => action_id, 'encode' => true }
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

    # Cancels a Terminal action request if the status of the request permits it.
    # @param [String] action_id Required parameter: Unique ID for the desired
    # `TerminalAction`
    # @return [CancelTerminalActionResponse Hash] response from the API call
    def cancel_terminal_action(action_id:)
      # Prepare query url.
      _query_builder = config.get_base_uri
      _query_builder << '/v2/terminals/actions/{action_id}/cancel'
      _query_builder = APIHelper.append_url_with_template_parameters(
        _query_builder,
        'action_id' => { 'value' => action_id, 'encode' => true }
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

    # Creates a Terminal checkout request and sends it to the specified device
    # to take a payment
    # for the requested amount.
    # @param [CreateTerminalCheckoutRequest] body Required parameter: An object
    # containing the fields to POST for the request.  See the corresponding
    # object definition for field details.
    # @return [CreateTerminalCheckoutResponse Hash] response from the API call
    def create_terminal_checkout(body:)
      # Prepare query url.
      _query_builder = config.get_base_uri
      _query_builder << '/v2/terminals/checkouts'
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

    # Returns a filtered list of Terminal checkout requests created by the
    # application making the request. Only Terminal checkout requests created
    # for the merchant scoped to the OAuth token are returned. Terminal checkout
    # requests are available for 30 days.
    # @param [SearchTerminalCheckoutsRequest] body Required parameter: An object
    # containing the fields to POST for the request.  See the corresponding
    # object definition for field details.
    # @return [SearchTerminalCheckoutsResponse Hash] response from the API call
    def search_terminal_checkouts(body:)
      # Prepare query url.
      _query_builder = config.get_base_uri
      _query_builder << '/v2/terminals/checkouts/search'
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

    # Retrieves a Terminal checkout request by `checkout_id`. Terminal checkout
    # requests are available for 30 days.
    # @param [String] checkout_id Required parameter: The unique ID for the
    # desired `TerminalCheckout`.
    # @return [GetTerminalCheckoutResponse Hash] response from the API call
    def get_terminal_checkout(checkout_id:)
      # Prepare query url.
      _query_builder = config.get_base_uri
      _query_builder << '/v2/terminals/checkouts/{checkout_id}'
      _query_builder = APIHelper.append_url_with_template_parameters(
        _query_builder,
        'checkout_id' => { 'value' => checkout_id, 'encode' => true }
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

    # Cancels a Terminal checkout request if the status of the request permits
    # it.
    # @param [String] checkout_id Required parameter: The unique ID for the
    # desired `TerminalCheckout`.
    # @return [CancelTerminalCheckoutResponse Hash] response from the API call
    def cancel_terminal_checkout(checkout_id:)
      # Prepare query url.
      _query_builder = config.get_base_uri
      _query_builder << '/v2/terminals/checkouts/{checkout_id}/cancel'
      _query_builder = APIHelper.append_url_with_template_parameters(
        _query_builder,
        'checkout_id' => { 'value' => checkout_id, 'encode' => true }
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

    # Creates a request to refund an Interac payment completed on a Square
    # Terminal. Refunds for Interac payments on a Square Terminal are supported
    # only for Interac debit cards in Canada. Other refunds for Terminal
    # payments should use the Refunds API. For more information, see [Refunds
    # API]($e/Refunds).
    # @param [CreateTerminalRefundRequest] body Required parameter: An object
    # containing the fields to POST for the request.  See the corresponding
    # object definition for field details.
    # @return [CreateTerminalRefundResponse Hash] response from the API call
    def create_terminal_refund(body:)
      # Prepare query url.
      _query_builder = config.get_base_uri
      _query_builder << '/v2/terminals/refunds'
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

    # Retrieves a filtered list of Interac Terminal refund requests created by
    # the seller making the request. Terminal refund requests are available for
    # 30 days.
    # @param [SearchTerminalRefundsRequest] body Required parameter: An object
    # containing the fields to POST for the request.  See the corresponding
    # object definition for field details.
    # @return [SearchTerminalRefundsResponse Hash] response from the API call
    def search_terminal_refunds(body:)
      # Prepare query url.
      _query_builder = config.get_base_uri
      _query_builder << '/v2/terminals/refunds/search'
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

    # Retrieves an Interac Terminal refund object by ID. Terminal refund objects
    # are available for 30 days.
    # @param [String] terminal_refund_id Required parameter: The unique ID for
    # the desired `TerminalRefund`.
    # @return [GetTerminalRefundResponse Hash] response from the API call
    def get_terminal_refund(terminal_refund_id:)
      # Prepare query url.
      _query_builder = config.get_base_uri
      _query_builder << '/v2/terminals/refunds/{terminal_refund_id}'
      _query_builder = APIHelper.append_url_with_template_parameters(
        _query_builder,
        'terminal_refund_id' => { 'value' => terminal_refund_id, 'encode' => true }
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

    # Cancels an Interac Terminal refund request by refund request ID if the
    # status of the request permits it.
    # @param [String] terminal_refund_id Required parameter: The unique ID for
    # the desired `TerminalRefund`.
    # @return [CancelTerminalRefundResponse Hash] response from the API call
    def cancel_terminal_refund(terminal_refund_id:)
      # Prepare query url.
      _query_builder = config.get_base_uri
      _query_builder << '/v2/terminals/refunds/{terminal_refund_id}/cancel'
      _query_builder = APIHelper.append_url_with_template_parameters(
        _query_builder,
        'terminal_refund_id' => { 'value' => terminal_refund_id, 'encode' => true }
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
  end
end
