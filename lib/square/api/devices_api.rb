module Square
  # DevicesApi
  class DevicesApi < BaseApi
    def initialize(config, http_call_back: nil)
      super(config, http_call_back: http_call_back)
    end

    # Lists all DeviceCodes associated with the merchant.
    # @param [String] cursor Optional parameter: A pagination cursor returned by
    # a previous call to this endpoint. Provide this to retrieve the next set of
    # results for your original query.  See [Paginating
    # results](#paginatingresults) for more information.
    # @param [String] location_id Optional parameter: If specified, only returns
    # DeviceCodes of the specified location. Returns DeviceCodes of all
    # locations if empty.
    # @param [ProductType] product_type Optional parameter: If specified, only
    # returns DeviceCodes targeting the specified product type. Returns
    # DeviceCodes of all product types if empty.
    # @return [ListDeviceCodesResponse Hash] response from the API call
    def list_device_codes(cursor: nil,
                          location_id: nil,
                          product_type: nil)
      # Prepare query url.
      _query_builder = config.get_base_uri
      _query_builder << '/v2/devices/codes'
      _query_builder = APIHelper.append_url_with_query_parameters(
        _query_builder,
        'cursor' => cursor,
        'location_id' => location_id,
        'product_type' => product_type
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

    # Creates a DeviceCode that can be used to login to a Square Terminal device
    # to enter the connected
    # terminal mode.
    # @param [CreateDeviceCodeRequest] body Required parameter: An object
    # containing the fields to POST for the request.  See the corresponding
    # object definition for field details.
    # @return [CreateDeviceCodeResponse Hash] response from the API call
    def create_device_code(body:)
      # Prepare query url.
      _query_builder = config.get_base_uri
      _query_builder << '/v2/devices/codes'
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

    # Retrieves DeviceCode with the associated ID.
    # @param [String] id Required parameter: The unique identifier for the
    # device code.
    # @return [GetDeviceCodeResponse Hash] response from the API call
    def get_device_code(id:)
      # Prepare query url.
      _query_builder = config.get_base_uri
      _query_builder << '/v2/devices/codes/{id}'
      _query_builder = APIHelper.append_url_with_template_parameters(
        _query_builder,
        'id' => id
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
