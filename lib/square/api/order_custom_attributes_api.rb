module Square
  # OrderCustomAttributesApi
  class OrderCustomAttributesApi < BaseApi
    def initialize(config, http_call_back: nil)
      super(config, http_call_back: http_call_back)
    end

    # Lists the order-related [custom attribute
    # definitions]($m/CustomAttributeDefinition) that belong to a Square seller
    # account.
    # When all response pages are retrieved, the results include all custom
    # attribute definitions
    # that are visible to the requesting application, including those that are
    # created by other
    # applications and set to `VISIBILITY_READ_ONLY` or
    # `VISIBILITY_READ_WRITE_VALUES`. Note that
    # seller-defined custom attributes (also known as custom fields) are always
    # set to `VISIBILITY_READ_WRITE_VALUES`.
    # @param [VisibilityFilter] visibility_filter Optional parameter: Requests
    # that all of the custom attributes be returned, or only those that are
    # read-only or read-write.
    # @param [String] cursor Optional parameter: The cursor returned in the
    # paged response from the previous call to this endpoint.  Provide this
    # cursor to retrieve the next page of results for your original request. 
    # For more information, see
    # [Pagination](https://developer.squareup.com/docs/working-with-apis/paginat
    # ion).
    # @param [Integer] limit Optional parameter: The maximum number of results
    # to return in a single paged response. This limit is advisory.  The
    # response might contain more or fewer results. The minimum value is 1 and
    # the maximum value is 100.  The default value is 20. For more information,
    # see
    # [Pagination](https://developer.squareup.com/docs/working-with-apis/paginat
    # ion).
    # @return [ListOrderCustomAttributeDefinitionsResponse Hash] response from the API call
    def list_order_custom_attribute_definitions(visibility_filter: nil,
                                                cursor: nil,
                                                limit: nil)
      # Prepare query url.
      _query_builder = config.get_base_uri
      _query_builder << '/v2/orders/custom-attribute-definitions'
      _query_builder = APIHelper.append_url_with_query_parameters(
        _query_builder,
        'visibility_filter' => visibility_filter,
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

    # Creates an order-related custom attribute definition.  Use this endpoint
    # to
    # define a custom attribute that can be associated with orders.
    # After creating a custom attribute definition, you can set the custom
    # attribute for orders
    # in the Square seller account.
    # @param [CreateOrderCustomAttributeDefinitionRequest] body Required
    # parameter: An object containing the fields to POST for the request.  See
    # the corresponding object definition for field details.
    # @return [CreateOrderCustomAttributeDefinitionResponse Hash] response from the API call
    def create_order_custom_attribute_definition(body:)
      # Prepare query url.
      _query_builder = config.get_base_uri
      _query_builder << '/v2/orders/custom-attribute-definitions'
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

    # Deletes an order-related [custom attribute
    # definition]($m/CustomAttributeDefinition) from a Square seller account.
    # Only the definition owner can delete a custom attribute definition.
    # @param [String] key Required parameter: The key of the custom attribute
    # definition to delete.
    # @return [DeleteOrderCustomAttributeDefinitionResponse Hash] response from the API call
    def delete_order_custom_attribute_definition(key:)
      # Prepare query url.
      _query_builder = config.get_base_uri
      _query_builder << '/v2/orders/custom-attribute-definitions/{key}'
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

    # Retrieves an order-related [custom attribute
    # definition]($m/CustomAttributeDefinition) from a Square seller account.
    # To retrieve a custom attribute definition created by another application,
    # the `visibility`
    # setting must be `VISIBILITY_READ_ONLY` or `VISIBILITY_READ_WRITE_VALUES`.
    # Note that seller-defined custom attributes
    # (also known as custom fields) are always set to
    # `VISIBILITY_READ_WRITE_VALUES`.
    # @param [String] key Required parameter: The key of the custom attribute
    # definition to retrieve.
    # @param [Integer] version Optional parameter: To enable [optimistic
    # concurrency](https://developer.squareup.com/docs/build-basics/common-api-p
    # atterns/optimistic-concurrency) control, include this optional field and
    # specify the current version of the custom attribute.
    # @return [RetrieveOrderCustomAttributeDefinitionResponse Hash] response from the API call
    def retrieve_order_custom_attribute_definition(key:,
                                                   version: nil)
      # Prepare query url.
      _query_builder = config.get_base_uri
      _query_builder << '/v2/orders/custom-attribute-definitions/{key}'
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

    # Updates an order-related custom attribute definition for a Square seller
    # account.
    # Only the definition owner can update a custom attribute definition. Note
    # that sellers can view all custom attributes in exported customer data,
    # including those set to `VISIBILITY_HIDDEN`.
    # @param [String] key Required parameter: The key of the custom attribute
    # definition to update.
    # @param [UpdateOrderCustomAttributeDefinitionRequest] body Required
    # parameter: An object containing the fields to POST for the request.  See
    # the corresponding object definition for field details.
    # @return [UpdateOrderCustomAttributeDefinitionResponse Hash] response from the API call
    def update_order_custom_attribute_definition(key:,
                                                 body:)
      # Prepare query url.
      _query_builder = config.get_base_uri
      _query_builder << '/v2/orders/custom-attribute-definitions/{key}'
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

    # Deletes order [custom attributes]($m/CustomAttribute) as a bulk operation.
    # Use this endpoint to delete one or more custom attributes from one or more
    # orders.
    # A custom attribute is based on a custom attribute definition in a Square
    # seller account.  (To create a
    # custom attribute definition, use the
    # [CreateOrderCustomAttributeDefinition]($e/OrderCustomAttributes/CreateOrde
    # rCustomAttributeDefinition) endpoint.)
    # This `BulkDeleteOrderCustomAttributes` endpoint accepts a map of 1 to 25
    # individual delete
    # requests and returns a map of individual delete responses. Each delete
    # request has a unique ID
    # and provides an order ID and custom attribute. Each delete response is
    # returned with the ID
    # of the corresponding request.
    # To delete a custom attribute owned by another application, the
    # `visibility` setting
    # must be `VISIBILITY_READ_WRITE_VALUES`. Note that seller-defined custom
    # attributes
    # (also known as custom fields) are always set to
    # `VISIBILITY_READ_WRITE_VALUES`.
    # @param [BulkDeleteOrderCustomAttributesRequest] body Required parameter:
    # An object containing the fields to POST for the request.  See the
    # corresponding object definition for field details.
    # @return [BulkDeleteOrderCustomAttributesResponse Hash] response from the API call
    def bulk_delete_order_custom_attributes(body:)
      # Prepare query url.
      _query_builder = config.get_base_uri
      _query_builder << '/v2/orders/custom-attributes/bulk-delete'
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

    # Creates or updates order [custom attributes]($m/CustomAttribute) as a bulk
    # operation.
    # Use this endpoint to delete one or more custom attributes from one or more
    # orders.
    # A custom attribute is based on a custom attribute definition in a Square
    # seller account.  (To create a
    # custom attribute definition, use the
    # [CreateOrderCustomAttributeDefinition]($e/OrderCustomAttributes/CreateOrde
    # rCustomAttributeDefinition) endpoint.)
    # This `BulkUpsertOrderCustomAttributes` endpoint accepts a map of 1 to 25
    # individual upsert
    # requests and returns a map of individual upsert responses. Each upsert
    # request has a unique ID
    # and provides an order ID and custom attribute. Each upsert response is
    # returned with the ID
    # of the corresponding request.
    # To create or update a custom attribute owned by another application, the
    # `visibility` setting
    # must be `VISIBILITY_READ_WRITE_VALUES`. Note that seller-defined custom
    # attributes
    # (also known as custom fields) are always set to
    # `VISIBILITY_READ_WRITE_VALUES`.
    # @param [BulkUpsertOrderCustomAttributesRequest] body Required parameter:
    # An object containing the fields to POST for the request.  See the
    # corresponding object definition for field details.
    # @return [BulkUpsertOrderCustomAttributesResponse Hash] response from the API call
    def bulk_upsert_order_custom_attributes(body:)
      # Prepare query url.
      _query_builder = config.get_base_uri
      _query_builder << '/v2/orders/custom-attributes/bulk-upsert'
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

    # Lists the [custom attributes]($m/CustomAttribute) associated with an
    # order.
    # You can use the `with_definitions` query parameter to also retrieve custom
    # attribute definitions
    # in the same call.
    # When all response pages are retrieved, the results include all custom
    # attributes that are
    # visible to the requesting application, including those that are owned by
    # other applications
    # and set to `VISIBILITY_READ_ONLY` or `VISIBILITY_READ_WRITE_VALUES`.
    # @param [String] order_id Required parameter: The ID of the target
    # [order]($m/Order).
    # @param [VisibilityFilter] visibility_filter Optional parameter: Requests
    # that all of the custom attributes be returned, or only those that are
    # read-only or read-write.
    # @param [String] cursor Optional parameter: The cursor returned in the
    # paged response from the previous call to this endpoint.  Provide this
    # cursor to retrieve the next page of results for your original request. 
    # For more information, see
    # [Pagination](https://developer.squareup.com/docs/working-with-apis/paginat
    # ion).
    # @param [Integer] limit Optional parameter: The maximum number of results
    # to return in a single paged response. This limit is advisory.  The
    # response might contain more or fewer results. The minimum value is 1 and
    # the maximum value is 100.  The default value is 20. For more information,
    # see
    # [Pagination](https://developer.squareup.com/docs/working-with-apis/paginat
    # ion).
    # @param [TrueClass|FalseClass] with_definitions Optional parameter:
    # Indicates whether to return the [custom attribute
    # definition]($m/CustomAttributeDefinition) in the `definition` field of
    # each custom attribute. Set this parameter to `true` to get the name and
    # description of each custom attribute,  information about the data type, or
    # other definition details. The default value is `false`.
    # @return [ListOrderCustomAttributesResponse Hash] response from the API call
    def list_order_custom_attributes(order_id:,
                                     visibility_filter: nil,
                                     cursor: nil,
                                     limit: nil,
                                     with_definitions: false)
      # Prepare query url.
      _query_builder = config.get_base_uri
      _query_builder << '/v2/orders/{order_id}/custom-attributes'
      _query_builder = APIHelper.append_url_with_template_parameters(
        _query_builder,
        'order_id' => { 'value' => order_id, 'encode' => true }
      )
      _query_builder = APIHelper.append_url_with_query_parameters(
        _query_builder,
        'visibility_filter' => visibility_filter,
        'cursor' => cursor,
        'limit' => limit,
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
    # customer profile.
    # To delete a custom attribute owned by another application, the
    # `visibility` setting must be
    # `VISIBILITY_READ_WRITE_VALUES`. Note that seller-defined custom attributes
    # (also known as custom fields) are always set to
    # `VISIBILITY_READ_WRITE_VALUES`.
    # @param [String] order_id Required parameter: The ID of the target
    # [order]($m/Order).
    # @param [String] custom_attribute_key Required parameter: The key of the
    # custom attribute to delete.  This key must match the key of an existing
    # custom attribute definition.
    # @return [DeleteOrderCustomAttributeResponse Hash] response from the API call
    def delete_order_custom_attribute(order_id:,
                                      custom_attribute_key:)
      # Prepare query url.
      _query_builder = config.get_base_uri
      _query_builder << '/v2/orders/{order_id}/custom-attributes/{custom_attribute_key}'
      _query_builder = APIHelper.append_url_with_template_parameters(
        _query_builder,
        'order_id' => { 'value' => order_id, 'encode' => true },
        'custom_attribute_key' => { 'value' => custom_attribute_key, 'encode' => true }
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

    # Retrieves a [custom attribute]($m/CustomAttribute) associated with an
    # order.
    # You can use the `with_definition` query parameter to also retrieve the
    # custom attribute definition
    # in the same call.
    # To retrieve a custom attribute owned by another application, the
    # `visibility` setting must be
    # `VISIBILITY_READ_ONLY` or `VISIBILITY_READ_WRITE_VALUES`. Note that
    # seller-defined custom attributes
    # also known as custom fields) are always set to
    # `VISIBILITY_READ_WRITE_VALUES`.
    # @param [String] order_id Required parameter: The ID of the target
    # [order]($m/Order).
    # @param [String] custom_attribute_key Required parameter: The key of the
    # custom attribute to retrieve.  This key must match the key of an existing
    # custom attribute definition.
    # @param [Integer] version Optional parameter: To enable [optimistic
    # concurrency](https://developer.squareup.com/docs/build-basics/common-api-p
    # atterns/optimistic-concurrency) control, include this optional field and
    # specify the current version of the custom attribute.
    # @param [TrueClass|FalseClass] with_definition Optional parameter:
    # Indicates whether to return the [custom attribute
    # definition]($m/CustomAttributeDefinition) in the `definition` field of
    # each  custom attribute. Set this parameter to `true` to get the name and
    # description of each custom attribute,  information about the data type, or
    # other definition details. The default value is `false`.
    # @return [RetrieveOrderCustomAttributeResponse Hash] response from the API call
    def retrieve_order_custom_attribute(order_id:,
                                        custom_attribute_key:,
                                        version: nil,
                                        with_definition: false)
      # Prepare query url.
      _query_builder = config.get_base_uri
      _query_builder << '/v2/orders/{order_id}/custom-attributes/{custom_attribute_key}'
      _query_builder = APIHelper.append_url_with_template_parameters(
        _query_builder,
        'order_id' => { 'value' => order_id, 'encode' => true },
        'custom_attribute_key' => { 'value' => custom_attribute_key, 'encode' => true }
      )
      _query_builder = APIHelper.append_url_with_query_parameters(
        _query_builder,
        'version' => version,
        'with_definition' => with_definition
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

    # Creates or updates a [custom attribute]($m/CustomAttribute) for an order.
    # Use this endpoint to set the value of a custom attribute for a specific
    # order.
    # A custom attribute is based on a custom attribute definition in a Square
    # seller account. (To create a
    # custom attribute definition, use the
    # [CreateOrderCustomAttributeDefinition]($e/OrderCustomAttributes/CreateOrde
    # rCustomAttributeDefinition) endpoint.)
    # To create or update a custom attribute owned by another application, the
    # `visibility` setting
    # must be `VISIBILITY_READ_WRITE_VALUES`. Note that seller-defined custom
    # attributes
    # (also known as custom fields) are always set to
    # `VISIBILITY_READ_WRITE_VALUES`.
    # @param [String] order_id Required parameter: The ID of the target
    # [order]($m/Order).
    # @param [String] custom_attribute_key Required parameter: The key of the
    # custom attribute to create or update.  This key must match the key  of an
    # existing custom attribute definition.
    # @param [UpsertOrderCustomAttributeRequest] body Required parameter: An
    # object containing the fields to POST for the request.  See the
    # corresponding object definition for field details.
    # @return [UpsertOrderCustomAttributeResponse Hash] response from the API call
    def upsert_order_custom_attribute(order_id:,
                                      custom_attribute_key:,
                                      body:)
      # Prepare query url.
      _query_builder = config.get_base_uri
      _query_builder << '/v2/orders/{order_id}/custom-attributes/{custom_attribute_key}'
      _query_builder = APIHelper.append_url_with_template_parameters(
        _query_builder,
        'order_id' => { 'value' => order_id, 'encode' => true },
        'custom_attribute_key' => { 'value' => custom_attribute_key, 'encode' => true }
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
