module Square
  # CustomerCustomAttributesApi
  class CustomerCustomAttributesApi < BaseApi
    def initialize(config, http_call_back: nil)
      super(config, http_call_back: http_call_back)
    end

    # Lists the customer-related custom attribute definitions that belong to a
    # Square seller account.
    # When all response pages are retrieved, the results include all custom
    # attribute definitions
    # that are visible to the requesting application, including those that are
    # created by other
    # applications and set to `VISIBILITY_READ_ONLY` or
    # `VISIBILITY_READ_WRITE_VALUES`.
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
    # @return [ListCustomerCustomAttributeDefinitionsResponse Hash] response from the API call
    def list_customer_custom_attribute_definitions(limit: nil,
                                                   cursor: nil)
      # Prepare query url.
      _query_builder = config.get_base_uri
      _query_builder << '/v2/customers/custom-attribute-definitions'
      _query_builder = APIHelper.append_url_with_query_parameters(
        _query_builder,
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

    # Creates a customer-related custom attribute definition for a Square seller
    # account. Use this
    # endpoint to define a custom attribute that can be associated with customer
    # profiles.
    # A custom attribute definition specifies the `key`, `visibility`, `schema`,
    # and other properties
    # for a custom attribute. After the definition is created, you can call
    # [UpsertCustomerCustomAttribute]($e/CustomerCustomAttributes/UpsertCustomer
    # CustomAttribute) or
    # [BulkUpsertCustomerCustomAttributes]($e/CustomerCustomAttributes/BulkUpser
    # tCustomerCustomAttributes)
    # to set the custom attribute for customer profiles in the seller's Customer
    # Directory.
    # Sellers can view all custom attributes in exported customer data,
    # including those set to
    # `VISIBILITY_HIDDEN`.
    # @param [CreateCustomerCustomAttributeDefinitionRequest] body Required
    # parameter: An object containing the fields to POST for the request.  See
    # the corresponding object definition for field details.
    # @return [CreateCustomerCustomAttributeDefinitionResponse Hash] response from the API call
    def create_customer_custom_attribute_definition(body:)
      # Prepare query url.
      _query_builder = config.get_base_uri
      _query_builder << '/v2/customers/custom-attribute-definitions'
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

    # Deletes a customer-related custom attribute definition from a Square
    # seller account.
    # Deleting a custom attribute definition also deletes the corresponding
    # custom attribute from
    # all customer profiles in the seller's Customer Directory.
    # Only the definition owner can delete a custom attribute definition.
    # @param [String] key Required parameter: The key of the custom attribute
    # definition to delete.
    # @return [DeleteCustomerCustomAttributeDefinitionResponse Hash] response from the API call
    def delete_customer_custom_attribute_definition(key:)
      # Prepare query url.
      _query_builder = config.get_base_uri
      _query_builder << '/v2/customers/custom-attribute-definitions/{key}'
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

    # Retrieves a customer-related custom attribute definition from a Square
    # seller account.
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
    # @return [RetrieveCustomerCustomAttributeDefinitionResponse Hash] response from the API call
    def retrieve_customer_custom_attribute_definition(key:,
                                                      version: nil)
      # Prepare query url.
      _query_builder = config.get_base_uri
      _query_builder << '/v2/customers/custom-attribute-definitions/{key}'
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

    # Updates a customer-related custom attribute definition for a Square seller
    # account.
    # Use this endpoint to update the following fields: `name`, `description`,
    # `visibility`, or the
    # `schema` for a `Selection` data type.
    # Only the definition owner can update a custom attribute definition. Note
    # that sellers can view
    # all custom attributes in exported customer data, including those set to
    # `VISIBILITY_HIDDEN`.
    # @param [String] key Required parameter: The key of the custom attribute
    # definition to update.
    # @param [UpdateCustomerCustomAttributeDefinitionRequest] body Required
    # parameter: An object containing the fields to POST for the request.  See
    # the corresponding object definition for field details.
    # @return [UpdateCustomerCustomAttributeDefinitionResponse Hash] response from the API call
    def update_customer_custom_attribute_definition(key:,
                                                    body:)
      # Prepare query url.
      _query_builder = config.get_base_uri
      _query_builder << '/v2/customers/custom-attribute-definitions/{key}'
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

    # Creates or updates custom attributes for customer profiles as a bulk
    # operation.
    # Use this endpoint to set the value of one or more custom attributes for
    # one or more customer profiles.
    # A custom attribute is based on a custom attribute definition in a Square
    # seller account, which is
    # created using the
    # [CreateCustomerCustomAttributeDefinition]($e/CustomerCustomAttributes/Crea
    # teCustomerCustomAttributeDefinition) endpoint.
    # This `BulkUpsertCustomerCustomAttributes` endpoint accepts a map of 1 to
    # 25 individual upsert
    # requests and returns a map of individual upsert responses. Each upsert
    # request has a unique ID
    # and provides a customer ID and custom attribute. Each upsert response is
    # returned with the ID
    # of the corresponding request.
    # To create or update a custom attribute owned by another application, the
    # `visibility` setting
    # must be `VISIBILITY_READ_WRITE_VALUES`.
    # @param [BulkUpsertCustomerCustomAttributesRequest] body Required
    # parameter: An object containing the fields to POST for the request.  See
    # the corresponding object definition for field details.
    # @return [BulkUpsertCustomerCustomAttributesResponse Hash] response from the API call
    def bulk_upsert_customer_custom_attributes(body:)
      # Prepare query url.
      _query_builder = config.get_base_uri
      _query_builder << '/v2/customers/custom-attributes/bulk-upsert'
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

    # Lists the custom attributes associated with a customer profile.
    # You can use the `with_definitions` query parameter to also retrieve custom
    # attribute definitions
    # in the same call.
    # When all response pages are retrieved, the results include all custom
    # attributes that are
    # visible to the requesting application, including those that are owned by
    # other applications
    # and set to `VISIBILITY_READ_ONLY` or `VISIBILITY_READ_WRITE_VALUES`.
    # @param [String] customer_id Required parameter: The ID of the target
    # [customer profile]($m/Customer).
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
    # @param [Boolean] with_definitions Optional parameter: Indicates whether to
    # return the [custom attribute definition]($m/CustomAttributeDefinition) in
    # the `definition` field of each custom attribute. Set this parameter to
    # `true` to get the name and description of each custom attribute,
    # information about the data type, or other definition details. The default
    # value is `false`.
    # @return [ListCustomerCustomAttributesResponse Hash] response from the API call
    def list_customer_custom_attributes(customer_id:,
                                        limit: nil,
                                        cursor: nil,
                                        with_definitions: false)
      # Prepare query url.
      _query_builder = config.get_base_uri
      _query_builder << '/v2/customers/{customer_id}/custom-attributes'
      _query_builder = APIHelper.append_url_with_template_parameters(
        _query_builder,
        'customer_id' => { 'value' => customer_id, 'encode' => true }
      )
      _query_builder = APIHelper.append_url_with_query_parameters(
        _query_builder,
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

    # Deletes a custom attribute associated with a customer profile.
    # To delete a custom attribute owned by another application, the
    # `visibility` setting must be
    # `VISIBILITY_READ_WRITE_VALUES`.
    # @param [String] customer_id Required parameter: The ID of the target
    # [customer profile]($m/Customer).
    # @param [String] key Required parameter: The key of the custom attribute to
    # delete. This key must match the `key` of a custom attribute definition in
    # the Square seller account. If the requesting application is not the
    # definition owner, you must use the qualified key.
    # @return [DeleteCustomerCustomAttributeResponse Hash] response from the API call
    def delete_customer_custom_attribute(customer_id:,
                                         key:)
      # Prepare query url.
      _query_builder = config.get_base_uri
      _query_builder << '/v2/customers/{customer_id}/custom-attributes/{key}'
      _query_builder = APIHelper.append_url_with_template_parameters(
        _query_builder,
        'customer_id' => { 'value' => customer_id, 'encode' => true },
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

    # Retrieves a custom attribute associated with a customer profile.
    # You can use the `with_definition` query parameter to also retrieve the
    # custom attribute definition
    # in the same call.
    # To retrieve a custom attribute owned by another application, the
    # `visibility` setting must be
    # `VISIBILITY_READ_ONLY` or `VISIBILITY_READ_WRITE_VALUES`.
    # @param [String] customer_id Required parameter: The ID of the target
    # [customer profile]($m/Customer).
    # @param [String] key Required parameter: The key of the custom attribute to
    # retrieve. This key must match the `key` of a custom attribute definition
    # in the Square seller account. If the requesting application is not the
    # definition owner, you must use the qualified key.
    # @param [Boolean] with_definition Optional parameter: Indicates whether to
    # return the [custom attribute definition]($m/CustomAttributeDefinition) in
    # the `definition` field of the custom attribute. Set this parameter to
    # `true` to get the name and description of the custom attribute,
    # information about the data type, or other definition details. The default
    # value is `false`.
    # @param [Integer] version Optional parameter: The current version of the
    # custom attribute, which is used for strongly consistent reads to guarantee
    # that you receive the most up-to-date data. When included in the request,
    # Square returns the specified version or a higher version if one exists. If
    # the specified version is higher than the current version, Square returns a
    # `BAD_REQUEST` error.
    # @return [RetrieveCustomerCustomAttributeResponse Hash] response from the API call
    def retrieve_customer_custom_attribute(customer_id:,
                                           key:,
                                           with_definition: false,
                                           version: nil)
      # Prepare query url.
      _query_builder = config.get_base_uri
      _query_builder << '/v2/customers/{customer_id}/custom-attributes/{key}'
      _query_builder = APIHelper.append_url_with_template_parameters(
        _query_builder,
        'customer_id' => { 'value' => customer_id, 'encode' => true },
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

    # Creates or updates a custom attribute for a customer profile.
    # Use this endpoint to set the value of a custom attribute for a specified
    # customer profile.
    # A custom attribute is based on a custom attribute definition in a Square
    # seller account, which
    # is created using the
    # [CreateCustomerCustomAttributeDefinition]($e/CustomerCustomAttributes/Crea
    # teCustomerCustomAttributeDefinition) endpoint.
    # To create or update a custom attribute owned by another application, the
    # `visibility` setting
    # must be `VISIBILITY_READ_WRITE_VALUES`.
    # @param [String] customer_id Required parameter: The ID of the target
    # [customer profile]($m/Customer).
    # @param [String] key Required parameter: The key of the custom attribute to
    # create or update. This key must match the `key` of a custom attribute
    # definition in the Square seller account. If the requesting application is
    # not the definition owner, you must use the qualified key.
    # @param [UpsertCustomerCustomAttributeRequest] body Required parameter: An
    # object containing the fields to POST for the request.  See the
    # corresponding object definition for field details.
    # @return [UpsertCustomerCustomAttributeResponse Hash] response from the API call
    def upsert_customer_custom_attribute(customer_id:,
                                         key:,
                                         body:)
      # Prepare query url.
      _query_builder = config.get_base_uri
      _query_builder << '/v2/customers/{customer_id}/custom-attributes/{key}'
      _query_builder = APIHelper.append_url_with_template_parameters(
        _query_builder,
        'customer_id' => { 'value' => customer_id, 'encode' => true },
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
