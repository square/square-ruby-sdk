module Square
  # VendorsApi
  class VendorsApi < BaseApi
    def initialize(config, http_call_back: nil)
      super(config, http_call_back: http_call_back)
    end

    # Creates one or more [Vendor]($m/Vendor) objects to represent suppliers to
    # a seller.
    # @param [BulkCreateVendorsRequest] body Required parameter: An object
    # containing the fields to POST for the request.  See the corresponding
    # object definition for field details.
    # @return [BulkCreateVendorsResponse Hash] response from the API call
    def bulk_create_vendors(body:)
      # Prepare query url.
      _query_builder = config.get_base_uri
      _query_builder << '/v2/vendors/bulk-create'
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

    # Retrieves one or more vendors of specified [Vendor]($m/Vendor) IDs.
    # @param [BulkRetrieveVendorsRequest] body Required parameter: An object
    # containing the fields to POST for the request.  See the corresponding
    # object definition for field details.
    # @return [BulkRetrieveVendorsResponse Hash] response from the API call
    def bulk_retrieve_vendors(body:)
      # Prepare query url.
      _query_builder = config.get_base_uri
      _query_builder << '/v2/vendors/bulk-retrieve'
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

    # Updates one or more of existing [Vendor]($m/Vendor) objects as suppliers
    # to a seller.
    # @param [BulkUpdateVendorsRequest] body Required parameter: An object
    # containing the fields to POST for the request.  See the corresponding
    # object definition for field details.
    # @return [BulkUpdateVendorsResponse Hash] response from the API call
    def bulk_update_vendors(body:)
      # Prepare query url.
      _query_builder = config.get_base_uri
      _query_builder << '/v2/vendors/bulk-update'
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

    # Creates a single [Vendor]($m/Vendor) object to represent a supplier to a
    # seller.
    # @param [CreateVendorRequest] body Required parameter: An object containing
    # the fields to POST for the request.  See the corresponding object
    # definition for field details.
    # @return [CreateVendorResponse Hash] response from the API call
    def create_vendor(body:)
      # Prepare query url.
      _query_builder = config.get_base_uri
      _query_builder << '/v2/vendors/create'
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

    # Searches for vendors using a filter against supported [Vendor]($m/Vendor)
    # properties and a supported sorter.
    # @param [SearchVendorsRequest] body Required parameter: An object
    # containing the fields to POST for the request.  See the corresponding
    # object definition for field details.
    # @return [SearchVendorsResponse Hash] response from the API call
    def search_vendors(body:)
      # Prepare query url.
      _query_builder = config.get_base_uri
      _query_builder << '/v2/vendors/search'
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

    # Retrieves the vendor of a specified [Vendor]($m/Vendor) ID.
    # @param [String] vendor_id Required parameter: ID of the
    # [Vendor]($m/Vendor) to retrieve.
    # @return [RetrieveVendorResponse Hash] response from the API call
    def retrieve_vendor(vendor_id:)
      # Prepare query url.
      _query_builder = config.get_base_uri
      _query_builder << '/v2/vendors/{vendor_id}'
      _query_builder = APIHelper.append_url_with_template_parameters(
        _query_builder,
        'vendor_id' => { 'value' => vendor_id, 'encode' => true }
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

    # Updates an existing [Vendor]($m/Vendor) object as a supplier to a seller.
    # @param [UpdateVendorRequest] body Required parameter: An object containing
    # the fields to POST for the request.  See the corresponding object
    # definition for field details.
    # @param [String] vendor_id Required parameter: Example:
    # @return [UpdateVendorResponse Hash] response from the API call
    def update_vendor(body:,
                      vendor_id:)
      # Prepare query url.
      _query_builder = config.get_base_uri
      _query_builder << '/v2/vendors/{vendor_id}'
      _query_builder = APIHelper.append_url_with_template_parameters(
        _query_builder,
        'vendor_id' => { 'value' => vendor_id, 'encode' => true }
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
