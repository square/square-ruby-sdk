module Square
  # BookingCustomAttributesApi
  class BookingCustomAttributesApi < BaseApi
    def initialize(config, http_call_back: nil)
      super(config, http_call_back: http_call_back)
    end

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
    # @return [ListBookingCustomAttributeDefinitionsResponse Hash] response from the API call
    def list_booking_custom_attribute_definitions(limit: nil,
                                                  cursor: nil)
      # Prepare query url.
      _query_builder = config.get_base_uri
      _query_builder << '/v2/bookings/custom-attribute-definitions'
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
    # @return [CreateBookingCustomAttributeDefinitionResponse Hash] response from the API call
    def create_booking_custom_attribute_definition(body:)
      # Prepare query url.
      _query_builder = config.get_base_uri
      _query_builder << '/v2/bookings/custom-attribute-definitions'
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
    # @return [DeleteBookingCustomAttributeDefinitionResponse Hash] response from the API call
    def delete_booking_custom_attribute_definition(key:)
      # Prepare query url.
      _query_builder = config.get_base_uri
      _query_builder << '/v2/bookings/custom-attribute-definitions/{key}'
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
    # @return [RetrieveBookingCustomAttributeDefinitionResponse Hash] response from the API call
    def retrieve_booking_custom_attribute_definition(key:,
                                                     version: nil)
      # Prepare query url.
      _query_builder = config.get_base_uri
      _query_builder << '/v2/bookings/custom-attribute-definitions/{key}'
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
    # @return [UpdateBookingCustomAttributeDefinitionResponse Hash] response from the API call
    def update_booking_custom_attribute_definition(key:,
                                                   body:)
      # Prepare query url.
      _query_builder = config.get_base_uri
      _query_builder << '/v2/bookings/custom-attribute-definitions/{key}'
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
    # @return [BulkDeleteBookingCustomAttributesResponse Hash] response from the API call
    def bulk_delete_booking_custom_attributes(body:)
      # Prepare query url.
      _query_builder = config.get_base_uri
      _query_builder << '/v2/bookings/custom-attributes/bulk-delete'
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
    # @return [BulkUpsertBookingCustomAttributesResponse Hash] response from the API call
    def bulk_upsert_booking_custom_attributes(body:)
      # Prepare query url.
      _query_builder = config.get_base_uri
      _query_builder << '/v2/bookings/custom-attributes/bulk-upsert'
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

    # Lists a booking's custom attributes.
    # To call this endpoint with buyer-level permissions, set
    # `APPOINTMENTS_READ` for the OAuth scope.
    # To call this endpoint with seller-level permissions, set
    # `APPOINTMENTS_ALL_READ` and `APPOINTMENTS_READ` for the OAuth scope.
    # @param [String] booking_id Required parameter: The ID of the target
    # [booking]($m/Booking).
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
    # @return [ListBookingCustomAttributesResponse Hash] response from the API call
    def list_booking_custom_attributes(booking_id:,
                                       limit: nil,
                                       cursor: nil,
                                       with_definitions: false)
      # Prepare query url.
      _query_builder = config.get_base_uri
      _query_builder << '/v2/bookings/{booking_id}/custom-attributes'
      _query_builder = APIHelper.append_url_with_template_parameters(
        _query_builder,
        'booking_id' => { 'value' => booking_id, 'encode' => true }
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

    # Deletes a bookings custom attribute.
    # To call this endpoint with buyer-level permissions, set
    # `APPOINTMENTS_WRITE` for the OAuth scope.
    # To call this endpoint with seller-level permissions, set
    # `APPOINTMENTS_ALL_WRITE` and `APPOINTMENTS_WRITE` for the OAuth scope.
    # For calls to this endpoint with seller-level permissions to succeed, the
    # seller must have subscribed to *Appointments Plus*
    # or *Appointments Premium*.
    # @param [String] booking_id Required parameter: The ID of the target
    # [booking]($m/Booking).
    # @param [String] key Required parameter: The key of the custom attribute to
    # delete. This key must match the `key` of a custom attribute definition in
    # the Square seller account. If the requesting application is not the
    # definition owner, you must use the qualified key.
    # @return [DeleteBookingCustomAttributeResponse Hash] response from the API call
    def delete_booking_custom_attribute(booking_id:,
                                        key:)
      # Prepare query url.
      _query_builder = config.get_base_uri
      _query_builder << '/v2/bookings/{booking_id}/custom-attributes/{key}'
      _query_builder = APIHelper.append_url_with_template_parameters(
        _query_builder,
        'booking_id' => { 'value' => booking_id, 'encode' => true },
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

    # Retrieves a bookings custom attribute.
    # To call this endpoint with buyer-level permissions, set
    # `APPOINTMENTS_READ` for the OAuth scope.
    # To call this endpoint with seller-level permissions, set
    # `APPOINTMENTS_ALL_READ` and `APPOINTMENTS_READ` for the OAuth scope.
    # @param [String] booking_id Required parameter: The ID of the target
    # [booking]($m/Booking).
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
    # @return [RetrieveBookingCustomAttributeResponse Hash] response from the API call
    def retrieve_booking_custom_attribute(booking_id:,
                                          key:,
                                          with_definition: false,
                                          version: nil)
      # Prepare query url.
      _query_builder = config.get_base_uri
      _query_builder << '/v2/bookings/{booking_id}/custom-attributes/{key}'
      _query_builder = APIHelper.append_url_with_template_parameters(
        _query_builder,
        'booking_id' => { 'value' => booking_id, 'encode' => true },
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

    # Upserts a bookings custom attribute.
    # To call this endpoint with buyer-level permissions, set
    # `APPOINTMENTS_WRITE` for the OAuth scope.
    # To call this endpoint with seller-level permissions, set
    # `APPOINTMENTS_ALL_WRITE` and `APPOINTMENTS_WRITE` for the OAuth scope.
    # For calls to this endpoint with seller-level permissions to succeed, the
    # seller must have subscribed to *Appointments Plus*
    # or *Appointments Premium*.
    # @param [String] booking_id Required parameter: The ID of the target
    # [booking]($m/Booking).
    # @param [String] key Required parameter: The key of the custom attribute to
    # create or update. This key must match the `key` of a custom attribute
    # definition in the Square seller account. If the requesting application is
    # not the definition owner, you must use the qualified key.
    # @param [UpsertBookingCustomAttributeRequest] body Required parameter: An
    # object containing the fields to POST for the request.  See the
    # corresponding object definition for field details.
    # @return [UpsertBookingCustomAttributeResponse Hash] response from the API call
    def upsert_booking_custom_attribute(booking_id:,
                                        key:,
                                        body:)
      # Prepare query url.
      _query_builder = config.get_base_uri
      _query_builder << '/v2/bookings/{booking_id}/custom-attributes/{key}'
      _query_builder = APIHelper.append_url_with_template_parameters(
        _query_builder,
        'booking_id' => { 'value' => booking_id, 'encode' => true },
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
  end
end
