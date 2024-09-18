module Square
  # VendorsApi
  class VendorsApi < BaseApi
    # Creates one or more [Vendor]($m/Vendor) objects to represent suppliers to
    # a seller.
    # @param [BulkCreateVendorsRequest] body Required parameter: An object
    # containing the fields to POST for the request.  See the corresponding
    # object definition for field details.
    # @return [ApiResponse]  the complete http response with raw body and status code.
    def bulk_create_vendors(body:)
      new_api_call_builder
        .request(new_request_builder(HttpMethodEnum::POST,
                                     '/v2/vendors/bulk-create',
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

    # Retrieves one or more vendors of specified [Vendor]($m/Vendor) IDs.
    # @param [BulkRetrieveVendorsRequest] body Required parameter: An object
    # containing the fields to POST for the request.  See the corresponding
    # object definition for field details.
    # @return [ApiResponse]  the complete http response with raw body and status code.
    def bulk_retrieve_vendors(body:)
      new_api_call_builder
        .request(new_request_builder(HttpMethodEnum::POST,
                                     '/v2/vendors/bulk-retrieve',
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

    # Updates one or more of existing [Vendor]($m/Vendor) objects as suppliers
    # to a seller.
    # @param [BulkUpdateVendorsRequest] body Required parameter: An object
    # containing the fields to POST for the request.  See the corresponding
    # object definition for field details.
    # @return [ApiResponse]  the complete http response with raw body and status code.
    def bulk_update_vendors(body:)
      new_api_call_builder
        .request(new_request_builder(HttpMethodEnum::PUT,
                                     '/v2/vendors/bulk-update',
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

    # Creates a single [Vendor]($m/Vendor) object to represent a supplier to a
    # seller.
    # @param [CreateVendorRequest] body Required parameter: An object containing
    # the fields to POST for the request.  See the corresponding object
    # definition for field details.
    # @return [ApiResponse]  the complete http response with raw body and status code.
    def create_vendor(body:)
      new_api_call_builder
        .request(new_request_builder(HttpMethodEnum::POST,
                                     '/v2/vendors/create',
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

    # Searches for vendors using a filter against supported [Vendor]($m/Vendor)
    # properties and a supported sorter.
    # @param [SearchVendorsRequest] body Required parameter: An object
    # containing the fields to POST for the request.  See the corresponding
    # object definition for field details.
    # @return [ApiResponse]  the complete http response with raw body and status code.
    def search_vendors(body:)
      new_api_call_builder
        .request(new_request_builder(HttpMethodEnum::POST,
                                     '/v2/vendors/search',
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

    # Retrieves the vendor of a specified [Vendor]($m/Vendor) ID.
    # @param [String] vendor_id Required parameter: ID of the
    # [Vendor](entity:Vendor) to retrieve.
    # @return [ApiResponse]  the complete http response with raw body and status code.
    def retrieve_vendor(vendor_id:)
      new_api_call_builder
        .request(new_request_builder(HttpMethodEnum::GET,
                                     '/v2/vendors/{vendor_id}',
                                     'default')
                   .template_param(new_parameter(vendor_id, key: 'vendor_id')
                                    .should_encode(true))
                   .header_param(new_parameter('application/json', key: 'accept'))
                   .auth(Single.new('global')))
        .response(new_response_handler
                    .deserializer(APIHelper.method(:json_deserialize))
                    .is_api_response(true)
                    .convertor(ApiResponse.method(:create)))
        .execute
    end

    # Updates an existing [Vendor]($m/Vendor) object as a supplier to a seller.
    # @param [UpdateVendorRequest] body Required parameter: An object containing
    # the fields to POST for the request.  See the corresponding object
    # definition for field details.
    # @param [String] vendor_id Required parameter: Example:
    # @return [ApiResponse]  the complete http response with raw body and status code.
    def update_vendor(body:,
                      vendor_id:)
      new_api_call_builder
        .request(new_request_builder(HttpMethodEnum::PUT,
                                     '/v2/vendors/{vendor_id}',
                                     'default')
                   .header_param(new_parameter('application/json', key: 'Content-Type'))
                   .body_param(new_parameter(body))
                   .template_param(new_parameter(vendor_id, key: 'vendor_id')
                                    .should_encode(true))
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
