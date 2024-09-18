module Square
  # CustomerSegmentsApi
  class CustomerSegmentsApi < BaseApi
    # Retrieves the list of customer segments of a business.
    # @param [String] cursor Optional parameter: A pagination cursor returned by
    # previous calls to `ListCustomerSegments`. This cursor is used to retrieve
    # the next set of query results.  For more information, see
    # [Pagination](https://developer.squareup.com/docs/build-basics/common-api-p
    # atterns/pagination).
    # @param [Integer] limit Optional parameter: The maximum number of results
    # to return in a single page. This limit is advisory. The response might
    # contain more or fewer results. If the specified limit is less than 1 or
    # greater than 50, Square returns a `400 VALUE_TOO_LOW` or `400
    # VALUE_TOO_HIGH` error. The default value is 50.  For more information, see
    # [Pagination](https://developer.squareup.com/docs/build-basics/common-api-p
    # atterns/pagination).
    # @return [ApiResponse]  the complete http response with raw body and status code.
    def list_customer_segments(cursor: nil,
                               limit: nil)
      new_api_call_builder
        .request(new_request_builder(HttpMethodEnum::GET,
                                     '/v2/customers/segments',
                                     'default')
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

    # Retrieves a specific customer segment as identified by the `segment_id`
    # value.
    # @param [String] segment_id Required parameter: The Square-issued ID of the
    # customer segment.
    # @return [ApiResponse]  the complete http response with raw body and status code.
    def retrieve_customer_segment(segment_id:)
      new_api_call_builder
        .request(new_request_builder(HttpMethodEnum::GET,
                                     '/v2/customers/segments/{segment_id}',
                                     'default')
                   .template_param(new_parameter(segment_id, key: 'segment_id')
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
