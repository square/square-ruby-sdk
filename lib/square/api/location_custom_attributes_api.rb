module Square
  # LocationCustomAttributesApi
  class LocationCustomAttributesApi < BaseApi
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
    # @return [ApiResponse]  the complete http response with raw body and status code.
    def list_location_custom_attribute_definitions(visibility_filter: nil,
                                                   limit: nil,
                                                   cursor: nil)
      new_api_call_builder
        .request(new_request_builder(HttpMethodEnum::GET,
                                     '/v2/locations/custom-attribute-definitions',
                                     'default')
                   .query_param(new_parameter(visibility_filter, key: 'visibility_filter'))
                   .query_param(new_parameter(limit, key: 'limit'))
                   .query_param(new_parameter(cursor, key: 'cursor'))
                   .header_param(new_parameter('application/json', key: 'accept'))
                   .auth(Single.new('global')))
        .response(new_response_handler
                    .deserializer(APIHelper.method(:json_deserialize))
                    .is_api_response(true)
                    .convertor(ApiResponse.method(:create)))
        .execute
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
    # @return [ApiResponse]  the complete http response with raw body and status code.
    def create_location_custom_attribute_definition(body:)
      new_api_call_builder
        .request(new_request_builder(HttpMethodEnum::POST,
                                     '/v2/locations/custom-attribute-definitions',
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

    # Deletes a location-related [custom attribute
    # definition]($m/CustomAttributeDefinition) from a Square seller account.
    # Deleting a custom attribute definition also deletes the corresponding
    # custom attribute from
    # all locations.
    # Only the definition owner can delete a custom attribute definition.
    # @param [String] key Required parameter: The key of the custom attribute
    # definition to delete.
    # @return [ApiResponse]  the complete http response with raw body and status code.
    def delete_location_custom_attribute_definition(key:)
      new_api_call_builder
        .request(new_request_builder(HttpMethodEnum::DELETE,
                                     '/v2/locations/custom-attribute-definitions/{key}',
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
    # @return [ApiResponse]  the complete http response with raw body and status code.
    def retrieve_location_custom_attribute_definition(key:,
                                                      version: nil)
      new_api_call_builder
        .request(new_request_builder(HttpMethodEnum::GET,
                                     '/v2/locations/custom-attribute-definitions/{key}',
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
    # @return [ApiResponse]  the complete http response with raw body and status code.
    def update_location_custom_attribute_definition(key:,
                                                    body:)
      new_api_call_builder
        .request(new_request_builder(HttpMethodEnum::PUT,
                                     '/v2/locations/custom-attribute-definitions/{key}',
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

    # Deletes [custom attributes]($m/CustomAttribute) for locations as a bulk
    # operation.
    # To delete a custom attribute owned by another application, the
    # `visibility` setting must be
    # `VISIBILITY_READ_WRITE_VALUES`.
    # @param [BulkDeleteLocationCustomAttributesRequest] body Required
    # parameter: An object containing the fields to POST for the request.  See
    # the corresponding object definition for field details.
    # @return [ApiResponse]  the complete http response with raw body and status code.
    def bulk_delete_location_custom_attributes(body:)
      new_api_call_builder
        .request(new_request_builder(HttpMethodEnum::POST,
                                     '/v2/locations/custom-attributes/bulk-delete',
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
    # @return [ApiResponse]  the complete http response with raw body and status code.
    def bulk_upsert_location_custom_attributes(body:)
      new_api_call_builder
        .request(new_request_builder(HttpMethodEnum::POST,
                                     '/v2/locations/custom-attributes/bulk-upsert',
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
    # [location](entity:Location).
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
    # @param [TrueClass | FalseClass] with_definitions Optional parameter:
    # Indicates whether to return the [custom attribute
    # definition](entity:CustomAttributeDefinition) in the `definition` field of
    # each custom attribute. Set this parameter to `true` to get the name and
    # description of each custom attribute, information about the data type, or
    # other definition details. The default value is `false`.
    # @return [ApiResponse]  the complete http response with raw body and status code.
    def list_location_custom_attributes(location_id:,
                                        visibility_filter: nil,
                                        limit: nil,
                                        cursor: nil,
                                        with_definitions: false)
      new_api_call_builder
        .request(new_request_builder(HttpMethodEnum::GET,
                                     '/v2/locations/{location_id}/custom-attributes',
                                     'default')
                   .template_param(new_parameter(location_id, key: 'location_id')
                                    .should_encode(true))
                   .query_param(new_parameter(visibility_filter, key: 'visibility_filter'))
                   .query_param(new_parameter(limit, key: 'limit'))
                   .query_param(new_parameter(cursor, key: 'cursor'))
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
    # location.
    # To delete a custom attribute owned by another application, the
    # `visibility` setting must be
    # `VISIBILITY_READ_WRITE_VALUES`.
    # @param [String] location_id Required parameter: The ID of the target
    # [location](entity:Location).
    # @param [String] key Required parameter: The key of the custom attribute to
    # delete. This key must match the `key` of a custom attribute definition in
    # the Square seller account. If the requesting application is not the
    # definition owner, you must use the qualified key.
    # @return [ApiResponse]  the complete http response with raw body and status code.
    def delete_location_custom_attribute(location_id:,
                                         key:)
      new_api_call_builder
        .request(new_request_builder(HttpMethodEnum::DELETE,
                                     '/v2/locations/{location_id}/custom-attributes/{key}',
                                     'default')
                   .template_param(new_parameter(location_id, key: 'location_id')
                                    .should_encode(true))
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

    # Retrieves a [custom attribute]($m/CustomAttribute) associated with a
    # location.
    # You can use the `with_definition` query parameter to also retrieve the
    # custom attribute definition
    # in the same call.
    # To retrieve a custom attribute owned by another application, the
    # `visibility` setting must be
    # `VISIBILITY_READ_ONLY` or `VISIBILITY_READ_WRITE_VALUES`.
    # @param [String] location_id Required parameter: The ID of the target
    # [location](entity:Location).
    # @param [String] key Required parameter: The key of the custom attribute to
    # retrieve. This key must match the `key` of a custom attribute definition
    # in the Square seller account. If the requesting application is not the
    # definition owner, you must use the qualified key.
    # @param [TrueClass | FalseClass] with_definition Optional parameter:
    # Indicates whether to return the [custom attribute
    # definition](entity:CustomAttributeDefinition) in the `definition` field of
    # the custom attribute. Set this parameter to `true` to get the name and
    # description of the custom attribute, information about the data type, or
    # other definition details. The default value is `false`.
    # @param [Integer] version Optional parameter: The current version of the
    # custom attribute, which is used for strongly consistent reads to guarantee
    # that you receive the most up-to-date data. When included in the request,
    # Square returns the specified version or a higher version if one exists. If
    # the specified version is higher than the current version, Square returns a
    # `BAD_REQUEST` error.
    # @return [ApiResponse]  the complete http response with raw body and status code.
    def retrieve_location_custom_attribute(location_id:,
                                           key:,
                                           with_definition: false,
                                           version: nil)
      new_api_call_builder
        .request(new_request_builder(HttpMethodEnum::GET,
                                     '/v2/locations/{location_id}/custom-attributes/{key}',
                                     'default')
                   .template_param(new_parameter(location_id, key: 'location_id')
                                    .should_encode(true))
                   .template_param(new_parameter(key, key: 'key')
                                    .should_encode(true))
                   .query_param(new_parameter(with_definition, key: 'with_definition'))
                   .query_param(new_parameter(version, key: 'version'))
                   .header_param(new_parameter('application/json', key: 'accept'))
                   .auth(Single.new('global')))
        .response(new_response_handler
                    .deserializer(APIHelper.method(:json_deserialize))
                    .is_api_response(true)
                    .convertor(ApiResponse.method(:create)))
        .execute
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
    # [location](entity:Location).
    # @param [String] key Required parameter: The key of the custom attribute to
    # create or update. This key must match the `key` of a custom attribute
    # definition in the Square seller account. If the requesting application is
    # not the definition owner, you must use the qualified key.
    # @param [UpsertLocationCustomAttributeRequest] body Required parameter: An
    # object containing the fields to POST for the request.  See the
    # corresponding object definition for field details.
    # @return [ApiResponse]  the complete http response with raw body and status code.
    def upsert_location_custom_attribute(location_id:,
                                         key:,
                                         body:)
      new_api_call_builder
        .request(new_request_builder(HttpMethodEnum::POST,
                                     '/v2/locations/{location_id}/custom-attributes/{key}',
                                     'default')
                   .template_param(new_parameter(location_id, key: 'location_id')
                                    .should_encode(true))
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
  end
end
