module Square
  # LocationsApi
  class LocationsApi < BaseApi
    def initialize(config, http_call_back: nil)
      super(config, http_call_back: http_call_back)
    end

    # Provides information of all locations of a business.
    # Most other Connect API endpoints have a required `location_id` path
    # parameter.
    # The `id` field of the [`Location`](#type-location) objects returned by
    # this
    # endpoint correspond to that `location_id` parameter.
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
      ApiResponse.new(_response, data: decoded, errors: _errors)
    end

    # Creates a location.
    # For more information about locations, see [Locations API
    # Overview](https://developer.squareup.com/docs/locations-api).
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

    # Retrieves details of a location. You can specify "main"
    # as the location ID to retrieve details of the
    # main location. For more information,
    # see [Locations API
    # Overview](https://developer.squareup.com/docs/docs/locations-api).
    # @param [String] location_id Required parameter: The ID of the location to
    # retrieve. If you specify the string "main", then the endpoint returns the
    # main location.
    # @return [RetrieveLocationResponse Hash] response from the API call
    def retrieve_location(location_id:)
      # Prepare query url.
      _query_builder = config.get_base_uri
      _query_builder << '/v2/locations/{location_id}'
      _query_builder = APIHelper.append_url_with_template_parameters(
        _query_builder,
        'location_id' => location_id
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
        'location_id' => location_id
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
  end
end
