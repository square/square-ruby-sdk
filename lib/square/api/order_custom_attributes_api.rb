module Square
  # OrderCustomAttributesApi
  class OrderCustomAttributesApi < BaseApi
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
    # @return [ApiResponse]  the complete http response with raw body and status code.
    def list_order_custom_attribute_definitions(visibility_filter: nil,
                                                cursor: nil,
                                                limit: nil)
      new_api_call_builder
        .request(new_request_builder(HttpMethodEnum::GET,
                                     '/v2/orders/custom-attribute-definitions',
                                     'default')
                   .query_param(new_parameter(visibility_filter, key: 'visibility_filter'))
                   .query_param(new_parameter(cursor, key: 'cursor'))
                   .query_param(new_parameter(limit, key: 'limit'))
                   .header_param(new_parameter('application/json', key: 'accept'))
                   .auth(Single.new('global')))
        .response(new_response_handler
                    .deserializer(APIHelper.method(:json_deserialize))
                    .is_api_response(true)
                    .convertor(ApiResponse.method(:create)))
        .execute
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
    # @return [ApiResponse]  the complete http response with raw body and status code.
    def create_order_custom_attribute_definition(body:)
      new_api_call_builder
        .request(new_request_builder(HttpMethodEnum::POST,
                                     '/v2/orders/custom-attribute-definitions',
                                     'default')
                   .header_param(new_parameter('application/json', key: 'Content-Type'))
                   .body_param(new_parameter(body))
                   .header_param(new_parameter('application/json', key: 'accept'))
                   .body_serializer(proc do |param| param.to_json unless param.nil? end)
                   .auth(Single.new('global')))
        .response(new_response_handler
                    .deserializer(APIHelper.method(:json_deserialize))
                    .is_api_response(true)
                    .convertor(ApiResponse.method(:create)))
        .execute
    end

    # Deletes an order-related [custom attribute
    # definition]($m/CustomAttributeDefinition) from a Square seller account.
    # Only the definition owner can delete a custom attribute definition.
    # @param [String] key Required parameter: The key of the custom attribute
    # definition to delete.
    # @return [ApiResponse]  the complete http response with raw body and status code.
    def delete_order_custom_attribute_definition(key:)
      new_api_call_builder
        .request(new_request_builder(HttpMethodEnum::DELETE,
                                     '/v2/orders/custom-attribute-definitions/{key}',
                                     'default')
                   .template_param(new_parameter(key, key: 'key')
                                    .should_encode(true))
                   .header_param(new_parameter('application/json', key: 'accept'))
                   .auth(Single.new('global')))
        .response(new_response_handler
                    .deserializer(APIHelper.method(:json_deserialize))
                    .is_api_response(true)
                    .convertor(ApiResponse.method(:create)))
        .execute
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
    # @return [ApiResponse]  the complete http response with raw body and status code.
    def retrieve_order_custom_attribute_definition(key:,
                                                   version: nil)
      new_api_call_builder
        .request(new_request_builder(HttpMethodEnum::GET,
                                     '/v2/orders/custom-attribute-definitions/{key}',
                                     'default')
                   .template_param(new_parameter(key, key: 'key')
                                    .should_encode(true))
                   .query_param(new_parameter(version, key: 'version'))
                   .header_param(new_parameter('application/json', key: 'accept'))
                   .auth(Single.new('global')))
        .response(new_response_handler
                    .deserializer(APIHelper.method(:json_deserialize))
                    .is_api_response(true)
                    .convertor(ApiResponse.method(:create)))
        .execute
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
    # @return [ApiResponse]  the complete http response with raw body and status code.
    def update_order_custom_attribute_definition(key:,
                                                 body:)
      new_api_call_builder
        .request(new_request_builder(HttpMethodEnum::PUT,
                                     '/v2/orders/custom-attribute-definitions/{key}',
                                     'default')
                   .template_param(new_parameter(key, key: 'key')
                                    .should_encode(true))
                   .header_param(new_parameter('application/json', key: 'Content-Type'))
                   .body_param(new_parameter(body))
                   .header_param(new_parameter('application/json', key: 'accept'))
                   .body_serializer(proc do |param| param.to_json unless param.nil? end)
                   .auth(Single.new('global')))
        .response(new_response_handler
                    .deserializer(APIHelper.method(:json_deserialize))
                    .is_api_response(true)
                    .convertor(ApiResponse.method(:create)))
        .execute
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
    # @return [ApiResponse]  the complete http response with raw body and status code.
    def bulk_delete_order_custom_attributes(body:)
      new_api_call_builder
        .request(new_request_builder(HttpMethodEnum::POST,
                                     '/v2/orders/custom-attributes/bulk-delete',
                                     'default')
                   .header_param(new_parameter('application/json', key: 'Content-Type'))
                   .body_param(new_parameter(body))
                   .header_param(new_parameter('application/json', key: 'accept'))
                   .body_serializer(proc do |param| param.to_json unless param.nil? end)
                   .auth(Single.new('global')))
        .response(new_response_handler
                    .deserializer(APIHelper.method(:json_deserialize))
                    .is_api_response(true)
                    .convertor(ApiResponse.method(:create)))
        .execute
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
    # @return [ApiResponse]  the complete http response with raw body and status code.
    def bulk_upsert_order_custom_attributes(body:)
      new_api_call_builder
        .request(new_request_builder(HttpMethodEnum::POST,
                                     '/v2/orders/custom-attributes/bulk-upsert',
                                     'default')
                   .header_param(new_parameter('application/json', key: 'Content-Type'))
                   .body_param(new_parameter(body))
                   .header_param(new_parameter('application/json', key: 'accept'))
                   .body_serializer(proc do |param| param.to_json unless param.nil? end)
                   .auth(Single.new('global')))
        .response(new_response_handler
                    .deserializer(APIHelper.method(:json_deserialize))
                    .is_api_response(true)
                    .convertor(ApiResponse.method(:create)))
        .execute
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
    # [order](entity:Order).
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
    # @param [TrueClass | FalseClass] with_definitions Optional parameter:
    # Indicates whether to return the [custom attribute
    # definition](entity:CustomAttributeDefinition) in the `definition` field of
    # each custom attribute. Set this parameter to `true` to get the name and
    # description of each custom attribute,  information about the data type, or
    # other definition details. The default value is `false`.
    # @return [ApiResponse]  the complete http response with raw body and status code.
    def list_order_custom_attributes(order_id:,
                                     visibility_filter: nil,
                                     cursor: nil,
                                     limit: nil,
                                     with_definitions: false)
      new_api_call_builder
        .request(new_request_builder(HttpMethodEnum::GET,
                                     '/v2/orders/{order_id}/custom-attributes',
                                     'default')
                   .template_param(new_parameter(order_id, key: 'order_id')
                                    .should_encode(true))
                   .query_param(new_parameter(visibility_filter, key: 'visibility_filter'))
                   .query_param(new_parameter(cursor, key: 'cursor'))
                   .query_param(new_parameter(limit, key: 'limit'))
                   .query_param(new_parameter(with_definitions, key: 'with_definitions'))
                   .header_param(new_parameter('application/json', key: 'accept'))
                   .auth(Single.new('global')))
        .response(new_response_handler
                    .deserializer(APIHelper.method(:json_deserialize))
                    .is_api_response(true)
                    .convertor(ApiResponse.method(:create)))
        .execute
    end

    # Deletes a [custom attribute]($m/CustomAttribute) associated with a
    # customer profile.
    # To delete a custom attribute owned by another application, the
    # `visibility` setting must be
    # `VISIBILITY_READ_WRITE_VALUES`. Note that seller-defined custom attributes
    # (also known as custom fields) are always set to
    # `VISIBILITY_READ_WRITE_VALUES`.
    # @param [String] order_id Required parameter: The ID of the target
    # [order](entity:Order).
    # @param [String] custom_attribute_key Required parameter: The key of the
    # custom attribute to delete.  This key must match the key of an existing
    # custom attribute definition.
    # @return [ApiResponse]  the complete http response with raw body and status code.
    def delete_order_custom_attribute(order_id:,
                                      custom_attribute_key:)
      new_api_call_builder
        .request(new_request_builder(HttpMethodEnum::DELETE,
                                     '/v2/orders/{order_id}/custom-attributes/{custom_attribute_key}',
                                     'default')
                   .template_param(new_parameter(order_id, key: 'order_id')
                                    .should_encode(true))
                   .template_param(new_parameter(custom_attribute_key, key: 'custom_attribute_key')
                                    .should_encode(true))
                   .header_param(new_parameter('application/json', key: 'accept'))
                   .auth(Single.new('global')))
        .response(new_response_handler
                    .deserializer(APIHelper.method(:json_deserialize))
                    .is_api_response(true)
                    .convertor(ApiResponse.method(:create)))
        .execute
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
    # [order](entity:Order).
    # @param [String] custom_attribute_key Required parameter: The key of the
    # custom attribute to retrieve.  This key must match the key of an existing
    # custom attribute definition.
    # @param [Integer] version Optional parameter: To enable [optimistic
    # concurrency](https://developer.squareup.com/docs/build-basics/common-api-p
    # atterns/optimistic-concurrency) control, include this optional field and
    # specify the current version of the custom attribute.
    # @param [TrueClass | FalseClass] with_definition Optional parameter:
    # Indicates whether to return the [custom attribute
    # definition](entity:CustomAttributeDefinition) in the `definition` field of
    # each  custom attribute. Set this parameter to `true` to get the name and
    # description of each custom attribute,  information about the data type, or
    # other definition details. The default value is `false`.
    # @return [ApiResponse]  the complete http response with raw body and status code.
    def retrieve_order_custom_attribute(order_id:,
                                        custom_attribute_key:,
                                        version: nil,
                                        with_definition: false)
      new_api_call_builder
        .request(new_request_builder(HttpMethodEnum::GET,
                                     '/v2/orders/{order_id}/custom-attributes/{custom_attribute_key}',
                                     'default')
                   .template_param(new_parameter(order_id, key: 'order_id')
                                    .should_encode(true))
                   .template_param(new_parameter(custom_attribute_key, key: 'custom_attribute_key')
                                    .should_encode(true))
                   .query_param(new_parameter(version, key: 'version'))
                   .query_param(new_parameter(with_definition, key: 'with_definition'))
                   .header_param(new_parameter('application/json', key: 'accept'))
                   .auth(Single.new('global')))
        .response(new_response_handler
                    .deserializer(APIHelper.method(:json_deserialize))
                    .is_api_response(true)
                    .convertor(ApiResponse.method(:create)))
        .execute
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
    # [order](entity:Order).
    # @param [String] custom_attribute_key Required parameter: The key of the
    # custom attribute to create or update.  This key must match the key  of an
    # existing custom attribute definition.
    # @param [UpsertOrderCustomAttributeRequest] body Required parameter: An
    # object containing the fields to POST for the request.  See the
    # corresponding object definition for field details.
    # @return [ApiResponse]  the complete http response with raw body and status code.
    def upsert_order_custom_attribute(order_id:,
                                      custom_attribute_key:,
                                      body:)
      new_api_call_builder
        .request(new_request_builder(HttpMethodEnum::POST,
                                     '/v2/orders/{order_id}/custom-attributes/{custom_attribute_key}',
                                     'default')
                   .template_param(new_parameter(order_id, key: 'order_id')
                                    .should_encode(true))
                   .template_param(new_parameter(custom_attribute_key, key: 'custom_attribute_key')
                                    .should_encode(true))
                   .header_param(new_parameter('application/json', key: 'Content-Type'))
                   .body_param(new_parameter(body))
                   .header_param(new_parameter('application/json', key: 'accept'))
                   .body_serializer(proc do |param| param.to_json unless param.nil? end)
                   .auth(Single.new('global')))
        .response(new_response_handler
                    .deserializer(APIHelper.method(:json_deserialize))
                    .is_api_response(true)
                    .convertor(ApiResponse.method(:create)))
        .execute
    end
  end
end
