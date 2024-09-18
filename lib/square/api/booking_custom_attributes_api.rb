module Square
  # BookingCustomAttributesApi
  class BookingCustomAttributesApi < BaseApi
    # Get all bookings custom attribute definitions.
    # To call this endpoint with buyer-level permissions, set
    # `APPOINTMENTS_READ` for the OAuth scope.
    # To call this endpoint with seller-level permissions, set
    # `APPOINTMENTS_ALL_READ` and `APPOINTMENTS_READ` for the OAuth scope.
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
    def list_booking_custom_attribute_definitions(limit: nil,
                                                  cursor: nil)
      new_api_call_builder
        .request(new_request_builder(HttpMethodEnum::GET,
                                     '/v2/bookings/custom-attribute-definitions',
                                     'default')
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

    # Creates a bookings custom attribute definition.
    # To call this endpoint with buyer-level permissions, set
    # `APPOINTMENTS_WRITE` for the OAuth scope.
    # To call this endpoint with seller-level permissions, set
    # `APPOINTMENTS_ALL_WRITE` and `APPOINTMENTS_WRITE` for the OAuth scope.
    # For calls to this endpoint with seller-level permissions to succeed, the
    # seller must have subscribed to *Appointments Plus*
    # or *Appointments Premium*.
    # @param [CreateBookingCustomAttributeDefinitionRequest] body Required
    # parameter: An object containing the fields to POST for the request.  See
    # the corresponding object definition for field details.
    # @return [ApiResponse]  the complete http response with raw body and status code.
    def create_booking_custom_attribute_definition(body:)
      new_api_call_builder
        .request(new_request_builder(HttpMethodEnum::POST,
                                     '/v2/bookings/custom-attribute-definitions',
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

    # Deletes a bookings custom attribute definition.
    # To call this endpoint with buyer-level permissions, set
    # `APPOINTMENTS_WRITE` for the OAuth scope.
    # To call this endpoint with seller-level permissions, set
    # `APPOINTMENTS_ALL_WRITE` and `APPOINTMENTS_WRITE` for the OAuth scope.
    # For calls to this endpoint with seller-level permissions to succeed, the
    # seller must have subscribed to *Appointments Plus*
    # or *Appointments Premium*.
    # @param [String] key Required parameter: The key of the custom attribute
    # definition to delete.
    # @return [ApiResponse]  the complete http response with raw body and status code.
    def delete_booking_custom_attribute_definition(key:)
      new_api_call_builder
        .request(new_request_builder(HttpMethodEnum::DELETE,
                                     '/v2/bookings/custom-attribute-definitions/{key}',
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

    # Retrieves a bookings custom attribute definition.
    # To call this endpoint with buyer-level permissions, set
    # `APPOINTMENTS_READ` for the OAuth scope.
    # To call this endpoint with seller-level permissions, set
    # `APPOINTMENTS_ALL_READ` and `APPOINTMENTS_READ` for the OAuth scope.
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
    def retrieve_booking_custom_attribute_definition(key:,
                                                     version: nil)
      new_api_call_builder
        .request(new_request_builder(HttpMethodEnum::GET,
                                     '/v2/bookings/custom-attribute-definitions/{key}',
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

    # Updates a bookings custom attribute definition.
    # To call this endpoint with buyer-level permissions, set
    # `APPOINTMENTS_WRITE` for the OAuth scope.
    # To call this endpoint with seller-level permissions, set
    # `APPOINTMENTS_ALL_WRITE` and `APPOINTMENTS_WRITE` for the OAuth scope.
    # For calls to this endpoint with seller-level permissions to succeed, the
    # seller must have subscribed to *Appointments Plus*
    # or *Appointments Premium*.
    # @param [String] key Required parameter: The key of the custom attribute
    # definition to update.
    # @param [UpdateBookingCustomAttributeDefinitionRequest] body Required
    # parameter: An object containing the fields to POST for the request.  See
    # the corresponding object definition for field details.
    # @return [ApiResponse]  the complete http response with raw body and status code.
    def update_booking_custom_attribute_definition(key:,
                                                   body:)
      new_api_call_builder
        .request(new_request_builder(HttpMethodEnum::PUT,
                                     '/v2/bookings/custom-attribute-definitions/{key}',
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

    # Bulk deletes bookings custom attributes.
    # To call this endpoint with buyer-level permissions, set
    # `APPOINTMENTS_WRITE` for the OAuth scope.
    # To call this endpoint with seller-level permissions, set
    # `APPOINTMENTS_ALL_WRITE` and `APPOINTMENTS_WRITE` for the OAuth scope.
    # For calls to this endpoint with seller-level permissions to succeed, the
    # seller must have subscribed to *Appointments Plus*
    # or *Appointments Premium*.
    # @param [BulkDeleteBookingCustomAttributesRequest] body Required parameter:
    # An object containing the fields to POST for the request.  See the
    # corresponding object definition for field details.
    # @return [ApiResponse]  the complete http response with raw body and status code.
    def bulk_delete_booking_custom_attributes(body:)
      new_api_call_builder
        .request(new_request_builder(HttpMethodEnum::POST,
                                     '/v2/bookings/custom-attributes/bulk-delete',
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

    # Bulk upserts bookings custom attributes.
    # To call this endpoint with buyer-level permissions, set
    # `APPOINTMENTS_WRITE` for the OAuth scope.
    # To call this endpoint with seller-level permissions, set
    # `APPOINTMENTS_ALL_WRITE` and `APPOINTMENTS_WRITE` for the OAuth scope.
    # For calls to this endpoint with seller-level permissions to succeed, the
    # seller must have subscribed to *Appointments Plus*
    # or *Appointments Premium*.
    # @param [BulkUpsertBookingCustomAttributesRequest] body Required parameter:
    # An object containing the fields to POST for the request.  See the
    # corresponding object definition for field details.
    # @return [ApiResponse]  the complete http response with raw body and status code.
    def bulk_upsert_booking_custom_attributes(body:)
      new_api_call_builder
        .request(new_request_builder(HttpMethodEnum::POST,
                                     '/v2/bookings/custom-attributes/bulk-upsert',
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

    # Lists a booking's custom attributes.
    # To call this endpoint with buyer-level permissions, set
    # `APPOINTMENTS_READ` for the OAuth scope.
    # To call this endpoint with seller-level permissions, set
    # `APPOINTMENTS_ALL_READ` and `APPOINTMENTS_READ` for the OAuth scope.
    # @param [String] booking_id Required parameter: The ID of the target
    # [booking](entity:Booking).
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
    def list_booking_custom_attributes(booking_id:,
                                       limit: nil,
                                       cursor: nil,
                                       with_definitions: false)
      new_api_call_builder
        .request(new_request_builder(HttpMethodEnum::GET,
                                     '/v2/bookings/{booking_id}/custom-attributes',
                                     'default')
                   .template_param(new_parameter(booking_id, key: 'booking_id')
                                    .should_encode(true))
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

    # Deletes a bookings custom attribute.
    # To call this endpoint with buyer-level permissions, set
    # `APPOINTMENTS_WRITE` for the OAuth scope.
    # To call this endpoint with seller-level permissions, set
    # `APPOINTMENTS_ALL_WRITE` and `APPOINTMENTS_WRITE` for the OAuth scope.
    # For calls to this endpoint with seller-level permissions to succeed, the
    # seller must have subscribed to *Appointments Plus*
    # or *Appointments Premium*.
    # @param [String] booking_id Required parameter: The ID of the target
    # [booking](entity:Booking).
    # @param [String] key Required parameter: The key of the custom attribute to
    # delete. This key must match the `key` of a custom attribute definition in
    # the Square seller account. If the requesting application is not the
    # definition owner, you must use the qualified key.
    # @return [ApiResponse]  the complete http response with raw body and status code.
    def delete_booking_custom_attribute(booking_id:,
                                        key:)
      new_api_call_builder
        .request(new_request_builder(HttpMethodEnum::DELETE,
                                     '/v2/bookings/{booking_id}/custom-attributes/{key}',
                                     'default')
                   .template_param(new_parameter(booking_id, key: 'booking_id')
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

    # Retrieves a bookings custom attribute.
    # To call this endpoint with buyer-level permissions, set
    # `APPOINTMENTS_READ` for the OAuth scope.
    # To call this endpoint with seller-level permissions, set
    # `APPOINTMENTS_ALL_READ` and `APPOINTMENTS_READ` for the OAuth scope.
    # @param [String] booking_id Required parameter: The ID of the target
    # [booking](entity:Booking).
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
    def retrieve_booking_custom_attribute(booking_id:,
                                          key:,
                                          with_definition: false,
                                          version: nil)
      new_api_call_builder
        .request(new_request_builder(HttpMethodEnum::GET,
                                     '/v2/bookings/{booking_id}/custom-attributes/{key}',
                                     'default')
                   .template_param(new_parameter(booking_id, key: 'booking_id')
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

    # Upserts a bookings custom attribute.
    # To call this endpoint with buyer-level permissions, set
    # `APPOINTMENTS_WRITE` for the OAuth scope.
    # To call this endpoint with seller-level permissions, set
    # `APPOINTMENTS_ALL_WRITE` and `APPOINTMENTS_WRITE` for the OAuth scope.
    # For calls to this endpoint with seller-level permissions to succeed, the
    # seller must have subscribed to *Appointments Plus*
    # or *Appointments Premium*.
    # @param [String] booking_id Required parameter: The ID of the target
    # [booking](entity:Booking).
    # @param [String] key Required parameter: The key of the custom attribute to
    # create or update. This key must match the `key` of a custom attribute
    # definition in the Square seller account. If the requesting application is
    # not the definition owner, you must use the qualified key.
    # @param [UpsertBookingCustomAttributeRequest] body Required parameter: An
    # object containing the fields to POST for the request.  See the
    # corresponding object definition for field details.
    # @return [ApiResponse]  the complete http response with raw body and status code.
    def upsert_booking_custom_attribute(booking_id:,
                                        key:,
                                        body:)
      new_api_call_builder
        .request(new_request_builder(HttpMethodEnum::PUT,
                                     '/v2/bookings/{booking_id}/custom-attributes/{key}',
                                     'default')
                   .template_param(new_parameter(booking_id, key: 'booking_id')
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
