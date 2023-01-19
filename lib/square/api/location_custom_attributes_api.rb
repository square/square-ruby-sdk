module Square
  # LocationCustomAttributesApi
  class LocationCustomAttributesApi < BaseApi
    def initialize(config, http_call_back: nil)
      super(config, http_call_back: http_call_back)
    end

    # Lists the location-related [custom attribute
    # definitions]($m/CustomAttributeDefinition) that belong to a Square seller
    # account.
    # When all response pages are retrieved, the results include all custom
    # attribute definitions
    # that are visible to the requesting application, including those that are
    # created by other
    # applications and set to `VISIBILITY_READ_ONLY` or
    # `VISIBILITY_READ_WRITE_VALUES`.
    # @param [VisibilityFilter] visibility_filter Optional parameter: Filters
    # the `CustomAttributeDefinition` results by their `visibility` values.
    # @param [Integer] limit Optional parameter: The maximum number of results
    # to return in a single paged response. This limit is advisory. The response
    # might contain more or fewer results. The minimum value is 1 and the
    # maximum value is 100. The default value is 20. For more information, see
    # [Pagination](https://developer.squareup.com/docs/build-basics/common-api-p
    # atterns/pagination).
    # @param [String] cursor Optional parameter: The cursor returned in the
    # paged response from the previous call to this endpoint. Provide this
    # cursor to retrieve the next page of results for your original request. For
    # more information, see
    # [Pagination](https://developer.squareup.com/docs/build-basics/common-api-p
    # atterns/pagination).
    # @return [ListLocationCustomAttributeDefinitionsResponse Hash] response from the API call
    def list_location_custom_attribute_definitions(visibility_filter: nil,
                                                   limit: nil,
                                                   cursor: nil)
      # Prepare query url.
      _query_builder = config.get_base_uri
      _query_builder << '/v2/locations/custom-attribute-definitions'
      _query_builder = APIHelper.append_url_with_query_parameters(
        _query_builder,
        'visibility_filter' => visibility_filter,
        'limit' => limit,
        'cursor' => cursor
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

    # Creates a location-related [custom attribute
    # definition]($m/CustomAttributeDefinition) for a Square seller account.
    # Use this endpoint to define a custom attribute that can be associated with
    # locations.
    # A custom attribute definition specifies the `key`, `visibility`, `schema`,
    # and other properties
    # for a custom attribute. After the definition is created, you can call
    # [UpsertLocationCustomAttribute]($e/LocationCustomAttributes/UpsertLocation
    # CustomAttribute) or
    # [BulkUpsertLocationCustomAttributes]($e/LocationCustomAttributes/BulkUpser
    # tLocationCustomAttributes)
    # to set the custom attribute for locations.
    # @param [CreateLocationCustomAttributeDefinitionRequest] body Required
    # parameter: An object containing the fields to POST for the request.  See
    # the corresponding object definition for field details.
    # @return [CreateLocationCustomAttributeDefinitionResponse Hash] response from the API call
    def create_location_custom_attribute_definition(body:)
      # Prepare query url.
      _query_builder = config.get_base_uri
      _query_builder << '/v2/locations/custom-attribute-definitions'
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

    # Deletes a location-related [custom attribute
    # definition]($m/CustomAttributeDefinition) from a Square seller account.
    # Deleting a custom attribute definition also deletes the corresponding
    # custom attribute from
    # all locations.
    # Only the definition owner can delete a custom attribute definition.
    # @param [String] key Required parameter: The key of the custom attribute
    # definition to delete.
    # @return [DeleteLocationCustomAttributeDefinitionResponse Hash] response from the API call
    def delete_location_custom_attribute_definition(key:)
      # Prepare query url.
      _query_builder = config.get_base_uri
      _query_builder << '/v2/locations/custom-attribute-definitions/{key}'
      _query_builder = APIHelper.append_url_with_template_parameters(
        _query_builder,
        'key' => { 'value' => key, 'encode' => true }
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

    # Retrieves a location-related [custom attribute
    # definition]($m/CustomAttributeDefinition) from a Square seller account.
    # To retrieve a custom attribute definition created by another application,
    # the `visibility`
    # setting must be `VISIBILITY_READ_ONLY` or `VISIBILITY_READ_WRITE_VALUES`.
    # @param [String] key Required parameter: The key of the custom attribute
    # definition to retrieve. If the requesting application is not the
    # definition owner, you must use the qualified key.
    # @param [Integer] version Optional parameter: The current version of the
    # custom attribute definition, which is used for strongly consistent reads
    # to guarantee that you receive the most up-to-date data. When included in
    # the request, Square returns the specified version or a higher version if
    # one exists. If the specified version is higher than the current version,
    # Square returns a `BAD_REQUEST` error.
    # @return [RetrieveLocationCustomAttributeDefinitionResponse Hash] response from the API call
    def retrieve_location_custom_attribute_definition(key:,
                                                      version: nil)
      # Prepare query url.
      _query_builder = config.get_base_uri
      _query_builder << '/v2/locations/custom-attribute-definitions/{key}'
      _query_builder = APIHelper.append_url_with_template_parameters(
        _query_builder,
        'key' => { 'value' => key, 'encode' => true }
      )
      _query_builder = APIHelper.append_url_with_query_parameters(
        _query_builder,
        'version' => version
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

    # Updates a location-related [custom attribute
    # definition]($m/CustomAttributeDefinition) for a Square seller account.
    # Use this endpoint to update the following fields: `name`, `description`,
    # `visibility`, or the
    # `schema` for a `Selection` data type.
    # Only the definition owner can update a custom attribute definition.
    # @param [String] key Required parameter: The key of the custom attribute
    # definition to update.
    # @param [UpdateLocationCustomAttributeDefinitionRequest] body Required
    # parameter: An object containing the fields to POST for the request.  See
    # the corresponding object definition for field details.
    # @return [UpdateLocationCustomAttributeDefinitionResponse Hash] response from the API call
    def update_location_custom_attribute_definition(key:,
                                                    body:)
      # Prepare query url.
      _query_builder = config.get_base_uri
      _query_builder << '/v2/locations/custom-attribute-definitions/{key}'
      _query_builder = APIHelper.append_url_with_template_parameters(
        _query_builder,
        'key' => { 'value' => key, 'encode' => true }
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

    # Deletes [custom attributes]($m/CustomAttribute) for locations as a bulk
    # operation.
    # To delete a custom attribute owned by another application, the
    # `visibility` setting must be
    # `VISIBILITY_READ_WRITE_VALUES`.
    # @param [BulkDeleteLocationCustomAttributesRequest] body Required
    # parameter: An object containing the fields to POST for the request.  See
    # the corresponding object definition for field details.
    # @return [BulkDeleteLocationCustomAttributesResponse Hash] response from the API call
    def bulk_delete_location_custom_attributes(body:)
      # Prepare query url.
      _query_builder = config.get_base_uri
      _query_builder << '/v2/locations/custom-attributes/bulk-delete'
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

    # Creates or updates [custom attributes]($m/CustomAttribute) for locations
    # as a bulk operation.
    # Use this endpoint to set the value of one or more custom attributes for
    # one or more locations.
    # A custom attribute is based on a custom attribute definition in a Square
    # seller account, which is
    # created using the
    # [CreateLocationCustomAttributeDefinition]($e/LocationCustomAttributes/Crea
    # teLocationCustomAttributeDefinition) endpoint.
    # This `BulkUpsertLocationCustomAttributes` endpoint accepts a map of 1 to
    # 25 individual upsert
    # requests and returns a map of individual upsert responses. Each upsert
    # request has a unique ID
    # and provides a location ID and custom attribute. Each upsert response is
    # returned with the ID
    # of the corresponding request.
    # To create or update a custom attribute owned by another application, the
    # `visibility` setting
    # must be `VISIBILITY_READ_WRITE_VALUES`.
    # @param [BulkUpsertLocationCustomAttributesRequest] body Required
    # parameter: An object containing the fields to POST for the request.  See
    # the corresponding object definition for field details.
    # @return [BulkUpsertLocationCustomAttributesResponse Hash] response from the API call
    def bulk_upsert_location_custom_attributes(body:)
      # Prepare query url.
      _query_builder = config.get_base_uri
      _query_builder << '/v2/locations/custom-attributes/bulk-upsert'
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

    # Lists the [custom attributes]($m/CustomAttribute) associated with a
    # location.
    # You can use the `with_definitions` query parameter to also retrieve custom
    # attribute definitions
    # in the same call.
    # When all response pages are retrieved, the results include all custom
    # attributes that are
    # visible to the requesting application, including those that are owned by
    # other applications
    # and set to `VISIBILITY_READ_ONLY` or `VISIBILITY_READ_WRITE_VALUES`.
    # @param [String] location_id Required parameter: The ID of the target
    # [location]($m/Location).
    # @param [VisibilityFilter] visibility_filter Optional parameter: Filters
    # the `CustomAttributeDefinition` results by their `visibility` values.
    # @param [Integer] limit Optional parameter: The maximum number of results
    # to return in a single paged response. This limit is advisory. The response
    # might contain more or fewer results. The minimum value is 1 and the
    # maximum value is 100. The default value is 20. For more information, see
    # [Pagination](https://developer.squareup.com/docs/build-basics/common-api-p
    # atterns/pagination).
    # @param [String] cursor Optional parameter: The cursor returned in the
    # paged response from the previous call to this endpoint. Provide this
    # cursor to retrieve the next page of results for your original request. For
    # more information, see
    # [Pagination](https://developer.squareup.com/docs/build-basics/common-api-p
    # atterns/pagination).
    # @param [TrueClass|FalseClass] with_definitions Optional parameter:
    # Indicates whether to return the [custom attribute
    # definition]($m/CustomAttributeDefinition) in the `definition` field of
    # each custom attribute. Set this parameter to `true` to get the name and
    # description of each custom attribute, information about the data type, or
    # other definition details. The default value is `false`.
    # @return [ListLocationCustomAttributesResponse Hash] response from the API call
    def list_location_custom_attributes(location_id:,
                                        visibility_filter: nil,
                                        limit: nil,
                                        cursor: nil,
                                        with_definitions: false)
      # Prepare query url.
      _query_builder = config.get_base_uri
      _query_builder << '/v2/locations/{location_id}/custom-attributes'
      _query_builder = APIHelper.append_url_with_template_parameters(
        _query_builder,
        'location_id' => { 'value' => location_id, 'encode' => true }
      )
      _query_builder = APIHelper.append_url_with_query_parameters(
        _query_builder,
        'visibility_filter' => visibility_filter,
        'limit' => limit,
        'cursor' => cursor,
        'with_definitions' => with_definitions
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

    # Deletes a [custom attribute]($m/CustomAttribute) associated with a
    # location.
    # To delete a custom attribute owned by another application, the
    # `visibility` setting must be
    # `VISIBILITY_READ_WRITE_VALUES`.
    # @param [String] location_id Required parameter: The ID of the target
    # [location]($m/Location).
    # @param [String] key Required parameter: The key of the custom attribute to
    # delete. This key must match the `key` of a custom attribute definition in
    # the Square seller account. If the requesting application is not the
    # definition owner, you must use the qualified key.
    # @return [DeleteLocationCustomAttributeResponse Hash] response from the API call
    def delete_location_custom_attribute(location_id:,
                                         key:)
      # Prepare query url.
      _query_builder = config.get_base_uri
      _query_builder << '/v2/locations/{location_id}/custom-attributes/{key}'
      _query_builder = APIHelper.append_url_with_template_parameters(
        _query_builder,
        'location_id' => { 'value' => location_id, 'encode' => true },
        'key' => { 'value' => key, 'encode' => true }
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

    # Retrieves a [custom attribute]($m/CustomAttribute) associated with a
    # location.
    # You can use the `with_definition` query parameter to also retrieve the
    # custom attribute definition
    # in the same call.
    # To retrieve a custom attribute owned by another application, the
    # `visibility` setting must be
    # `VISIBILITY_READ_ONLY` or `VISIBILITY_READ_WRITE_VALUES`.
    # @param [String] location_id Required parameter: The ID of the target
    # [location]($m/Location).
    # @param [String] key Required parameter: The key of the custom attribute to
    # retrieve. This key must match the `key` of a custom attribute definition
    # in the Square seller account. If the requesting application is not the
    # definition owner, you must use the qualified key.
    # @param [TrueClass|FalseClass] with_definition Optional parameter:
    # Indicates whether to return the [custom attribute
    # definition]($m/CustomAttributeDefinition) in the `definition` field of the
    # custom attribute. Set this parameter to `true` to get the name and
    # description of the custom attribute, information about the data type, or
    # other definition details. The default value is `false`.
    # @param [Integer] version Optional parameter: The current version of the
    # custom attribute, which is used for strongly consistent reads to guarantee
    # that you receive the most up-to-date data. When included in the request,
    # Square returns the specified version or a higher version if one exists. If
    # the specified version is higher than the current version, Square returns a
    # `BAD_REQUEST` error.
    # @return [RetrieveLocationCustomAttributeResponse Hash] response from the API call
    def retrieve_location_custom_attribute(location_id:,
                                           key:,
                                           with_definition: false,
                                           version: nil)
      # Prepare query url.
      _query_builder = config.get_base_uri
      _query_builder << '/v2/locations/{location_id}/custom-attributes/{key}'
      _query_builder = APIHelper.append_url_with_template_parameters(
        _query_builder,
        'location_id' => { 'value' => location_id, 'encode' => true },
        'key' => { 'value' => key, 'encode' => true }
      )
      _query_builder = APIHelper.append_url_with_query_parameters(
        _query_builder,
        'with_definition' => with_definition,
        'version' => version
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

    # Creates or updates a [custom attribute]($m/CustomAttribute) for a
    # location.
    # Use this endpoint to set the value of a custom attribute for a specified
    # location.
    # A custom attribute is based on a custom attribute definition in a Square
    # seller account, which
    # is created using the
    # [CreateLocationCustomAttributeDefinition]($e/LocationCustomAttributes/Crea
    # teLocationCustomAttributeDefinition) endpoint.
    # To create or update a custom attribute owned by another application, the
    # `visibility` setting
    # must be `VISIBILITY_READ_WRITE_VALUES`.
    # @param [String] location_id Required parameter: The ID of the target
    # [location]($m/Location).
    # @param [String] key Required parameter: The key of the custom attribute to
    # create or update. This key must match the `key` of a custom attribute
    # definition in the Square seller account. If the requesting application is
    # not the definition owner, you must use the qualified key.
    # @param [UpsertLocationCustomAttributeRequest] body Required parameter: An
    # object containing the fields to POST for the request.  See the
    # corresponding object definition for field details.
    # @return [UpsertLocationCustomAttributeResponse Hash] response from the API call
    def upsert_location_custom_attribute(location_id:,
                                         key:,
                                         body:)
      # Prepare query url.
      _query_builder = config.get_base_uri
      _query_builder << '/v2/locations/{location_id}/custom-attributes/{key}'
      _query_builder = APIHelper.append_url_with_template_parameters(
        _query_builder,
        'location_id' => { 'value' => location_id, 'encode' => true },
        'key' => { 'value' => key, 'encode' => true }
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
