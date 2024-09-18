module Square
  # DevicesApi
  class DevicesApi < BaseApi
    # List devices associated with the merchant. Currently, only Terminal API
    # devices are supported.
    # @param [String] cursor Optional parameter: A pagination cursor returned by
    # a previous call to this endpoint. Provide this cursor to retrieve the next
    # set of results for the original query. See
    # [Pagination](https://developer.squareup.com/docs/build-basics/common-api-p
    # atterns/pagination) for more information.
    # @param [SortOrder] sort_order Optional parameter: The order in which
    # results are listed. - `ASC` - Oldest to newest. - `DESC` - Newest to
    # oldest (default).
    # @param [Integer] limit Optional parameter: The number of results to return
    # in a single page.
    # @param [String] location_id Optional parameter: If present, only returns
    # devices at the target location.
    # @return [ApiResponse]  the complete http response with raw body and status code.
    def list_devices(cursor: nil,
                     sort_order: nil,
                     limit: nil,
                     location_id: nil)
      new_api_call_builder
        .request(new_request_builder(HttpMethodEnum::GET,
                                     '/v2/devices',
                                     'default')
                   .query_param(new_parameter(cursor, key: 'cursor'))
                   .query_param(new_parameter(sort_order, key: 'sort_order'))
                   .query_param(new_parameter(limit, key: 'limit'))
                   .query_param(new_parameter(location_id, key: 'location_id'))
                   .header_param(new_parameter('application/json', key: 'accept'))
                   .auth(Single.new('global')))
        .response(new_response_handler
                    .deserializer(APIHelper.method(:json_deserialize))
                    .is_api_response(true)
                    .convertor(ApiResponse.method(:create)))
        .execute
    end

    # Lists all DeviceCodes associated with the merchant.
    # @param [String] cursor Optional parameter: A pagination cursor returned by
    # a previous call to this endpoint. Provide this to retrieve the next set of
    # results for your original query.  See [Paginating
    # results](https://developer.squareup.com/docs/working-with-apis/pagination)
    # for more information.
    # @param [String] location_id Optional parameter: If specified, only returns
    # DeviceCodes of the specified location. Returns DeviceCodes of all
    # locations if empty.
    # @param [ProductType] product_type Optional parameter: If specified, only
    # returns DeviceCodes targeting the specified product type. Returns
    # DeviceCodes of all product types if empty.
    # @param [DeviceCodeStatus] status Optional parameter: If specified, returns
    # DeviceCodes with the specified statuses. Returns DeviceCodes of status
    # `PAIRED` and `UNPAIRED` if empty.
    # @return [ApiResponse]  the complete http response with raw body and status code.
    def list_device_codes(cursor: nil,
                          location_id: nil,
                          product_type: nil,
                          status: nil)
      new_api_call_builder
        .request(new_request_builder(HttpMethodEnum::GET,
                                     '/v2/devices/codes',
                                     'default')
                   .query_param(new_parameter(cursor, key: 'cursor'))
                   .query_param(new_parameter(location_id, key: 'location_id'))
                   .query_param(new_parameter(product_type, key: 'product_type'))
                   .query_param(new_parameter(status, key: 'status'))
                   .header_param(new_parameter('application/json', key: 'accept'))
                   .auth(Single.new('global')))
        .response(new_response_handler
                    .deserializer(APIHelper.method(:json_deserialize))
                    .is_api_response(true)
                    .convertor(ApiResponse.method(:create)))
        .execute
    end

    # Creates a DeviceCode that can be used to login to a Square Terminal device
    # to enter the connected
    # terminal mode.
    # @param [CreateDeviceCodeRequest] body Required parameter: An object
    # containing the fields to POST for the request.  See the corresponding
    # object definition for field details.
    # @return [ApiResponse]  the complete http response with raw body and status code.
    def create_device_code(body:)
      new_api_call_builder
        .request(new_request_builder(HttpMethodEnum::POST,
                                     '/v2/devices/codes',
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

    # Retrieves DeviceCode with the associated ID.
    # @param [String] id Required parameter: The unique identifier for the
    # device code.
    # @return [ApiResponse]  the complete http response with raw body and status code.
    def get_device_code(id:)
      new_api_call_builder
        .request(new_request_builder(HttpMethodEnum::GET,
                                     '/v2/devices/codes/{id}',
                                     'default')
                   .template_param(new_parameter(id, key: 'id')
                                    .should_encode(true))
                   .header_param(new_parameter('application/json', key: 'accept'))
                   .auth(Single.new('global')))
        .response(new_response_handler
                    .deserializer(APIHelper.method(:json_deserialize))
                    .is_api_response(true)
                    .convertor(ApiResponse.method(:create)))
        .execute
    end

    # Retrieves Device with the associated `device_id`.
    # @param [String] device_id Required parameter: The unique ID for the
    # desired `Device`.
    # @return [ApiResponse]  the complete http response with raw body and status code.
    def get_device(device_id:)
      new_api_call_builder
        .request(new_request_builder(HttpMethodEnum::GET,
                                     '/v2/devices/{device_id}',
                                     'default')
                   .template_param(new_parameter(device_id, key: 'device_id')
                                    .should_encode(true))
                   .header_param(new_parameter('application/json', key: 'accept'))
                   .auth(Single.new('global')))
        .response(new_response_handler
                    .deserializer(APIHelper.method(:json_deserialize))
                    .is_api_response(true)
                    .convertor(ApiResponse.method(:create)))
        .execute
    end
  end
end
