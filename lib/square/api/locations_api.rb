module Square
  # LocationsApi
  class LocationsApi < BaseApi
    def initialize(config, http_call_back: nil)
      super(config, http_call_back: http_call_back)
    end

    # Provides details about all of the seller's locations,
    # including those with an inactive status.
    # @return [ListLocationsResponse Hash] response from the API call
    def list_locations
      # Prepare query url.
      _query_builder = config.get_base_uri
      _query_builder << '/v2/locations'
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

    # Creates a [location](https://developer.squareup.com/docs/locations-api).
    # Creating new locations allows for separate configuration of receipt
    # layouts, item prices,
    # and sales reports. Developers can use locations to separate sales activity
    # via applications
    # that integrate with Square from sales activity elsewhere in a seller's
    # account.
    # Locations created programmatically with the Locations API will last
    # forever and
    # are visible to the seller for their own management, so ensure that
    # each location has a sensible and unique name.
    # @param [CreateLocationRequest] body Required parameter: An object
    # containing the fields to POST for the request.  See the corresponding
    # object definition for field details.
    # @return [CreateLocationResponse Hash] response from the API call
    def create_location(body:)
      # Prepare query url.
      _query_builder = config.get_base_uri
      _query_builder << '/v2/locations'
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

    # Retrieves details of a single location. Specify "main"
    # as the location ID to retrieve details of the [main
    # location](https://developer.squareup.com/docs/locations-api#about-the-main
    # -location).
    # @param [String] location_id Required parameter: The ID of the location to
    # retrieve. Specify the string "main" to return the main location.
    # @return [RetrieveLocationResponse Hash] response from the API call
    def retrieve_location(location_id:)
      # Prepare query url.
      _query_builder = config.get_base_uri
      _query_builder << '/v2/locations/{location_id}'
      _query_builder = APIHelper.append_url_with_template_parameters(
        _query_builder,
        'location_id' => { 'value' => location_id, 'encode' => true }
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

    # Updates a location.
    # @param [String] location_id Required parameter: The ID of the location to
    # update.
    # @param [UpdateLocationRequest] body Required parameter: An object
    # containing the fields to POST for the request.  See the corresponding
    # object definition for field details.
    # @return [UpdateLocationResponse Hash] response from the API call
    def update_location(location_id:,
                        body:)
      # Prepare query url.
      _query_builder = config.get_base_uri
      _query_builder << '/v2/locations/{location_id}'
      _query_builder = APIHelper.append_url_with_template_parameters(
        _query_builder,
        'location_id' => { 'value' => location_id, 'encode' => true }
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
  end
end
