module Square
  # TerminalApi
  class TerminalApi < BaseApi
    def initialize(config, http_call_back: nil)
      super(config, http_call_back: http_call_back)
    end

    # Creates a new Terminal checkout request and sends it to the specified
    # device to take a payment for the requested amount.
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

    # Retrieves a filtered list of Terminal checkout requests created by the
    # account making the request.
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

    # Retrieves a Terminal checkout request by checkout_id.
    # @param [String] checkout_id Required parameter: Unique ID for the desired
    # `TerminalCheckout`
    # @return [GetTerminalCheckoutResponse Hash] response from the API call
    def get_terminal_checkout(checkout_id:)
      # Prepare query url.
      _query_builder = config.get_base_uri
      _query_builder << '/v2/terminals/checkouts/{checkout_id}'
      _query_builder = APIHelper.append_url_with_template_parameters(
        _query_builder,
        'checkout_id' => checkout_id
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

    # Cancels a Terminal checkout request, if the status of the request permits
    # it.
    # @param [String] checkout_id Required parameter: Unique ID for the desired
    # `TerminalCheckout`
    # @return [CancelTerminalCheckoutResponse Hash] response from the API call
    def cancel_terminal_checkout(checkout_id:)
      # Prepare query url.
      _query_builder = config.get_base_uri
      _query_builder << '/v2/terminals/checkouts/{checkout_id}/cancel'
      _query_builder = APIHelper.append_url_with_template_parameters(
        _query_builder,
        'checkout_id' => checkout_id
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
  end
end
