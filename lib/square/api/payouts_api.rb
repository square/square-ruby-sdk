module Square
  # PayoutsApi
  class PayoutsApi < BaseApi
    # Retrieves a list of all payouts for the default location.
    # You can filter payouts by location ID, status, time range, and order them
    # in ascending or descending order.
    # To call this endpoint, set `PAYOUTS_READ` for the OAuth scope.
    # @param [String] location_id Optional parameter: The ID of the location for
    # which to list the payouts. By default, payouts are returned for the
    # default (main) location associated with the seller.
    # @param [PayoutStatus] status Optional parameter: If provided, only payouts
    # with the given status are returned.
    # @param [String] begin_time Optional parameter: The timestamp for the
    # beginning of the payout creation time, in RFC 3339 format. Inclusive.
    # Default: The current time minus one year.
    # @param [String] end_time Optional parameter: The timestamp for the end of
    # the payout creation time, in RFC 3339 format. Default: The current time.
    # @param [SortOrder] sort_order Optional parameter: The order in which
    # payouts are listed.
    # @param [String] cursor Optional parameter: A pagination cursor returned by
    # a previous call to this endpoint. Provide this cursor to retrieve the next
    # set of results for the original query. For more information, see
    # [Pagination](https://developer.squareup.com/docs/build-basics/common-api-p
    # atterns/pagination). If request parameters change between requests,
    # subsequent results may contain duplicates or missing records.
    # @param [Integer] limit Optional parameter: The maximum number of results
    # to be returned in a single page. It is possible to receive fewer results
    # than the specified limit on a given page. The default value of 100 is also
    # the maximum allowed value. If the provided value is greater than 100, it
    # is ignored and the default value is used instead. Default: `100`
    # @return [ApiResponse]  the complete http response with raw body and status code.
    def list_payouts(location_id: nil,
                     status: nil,
                     begin_time: nil,
                     end_time: nil,
                     sort_order: nil,
                     cursor: nil,
                     limit: nil)
      new_api_call_builder
        .request(new_request_builder(HttpMethodEnum::GET,
                                     '/v2/payouts',
                                     'default')
                   .query_param(new_parameter(location_id, key: 'location_id'))
                   .query_param(new_parameter(status, key: 'status'))
                   .query_param(new_parameter(begin_time, key: 'begin_time'))
                   .query_param(new_parameter(end_time, key: 'end_time'))
                   .query_param(new_parameter(sort_order, key: 'sort_order'))
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

    # Retrieves details of a specific payout identified by a payout ID.
    # To call this endpoint, set `PAYOUTS_READ` for the OAuth scope.
    # @param [String] payout_id Required parameter: The ID of the payout to
    # retrieve the information for.
    # @return [ApiResponse]  the complete http response with raw body and status code.
    def get_payout(payout_id:)
      new_api_call_builder
        .request(new_request_builder(HttpMethodEnum::GET,
                                     '/v2/payouts/{payout_id}',
                                     'default')
                   .template_param(new_parameter(payout_id, key: 'payout_id')
                                    .should_encode(true))
                   .header_param(new_parameter('application/json', key: 'accept'))
                   .auth(Single.new('global')))
        .response(new_response_handler
                    .deserializer(APIHelper.method(:json_deserialize))
                    .is_api_response(true)
                    .convertor(ApiResponse.method(:create)))
        .execute
    end

    # Retrieves a list of all payout entries for a specific payout.
    # To call this endpoint, set `PAYOUTS_READ` for the OAuth scope.
    # @param [String] payout_id Required parameter: The ID of the payout to
    # retrieve the information for.
    # @param [SortOrder] sort_order Optional parameter: The order in which
    # payout entries are listed.
    # @param [String] cursor Optional parameter: A pagination cursor returned by
    # a previous call to this endpoint. Provide this cursor to retrieve the next
    # set of results for the original query. For more information, see
    # [Pagination](https://developer.squareup.com/docs/build-basics/common-api-p
    # atterns/pagination). If request parameters change between requests,
    # subsequent results may contain duplicates or missing records.
    # @param [Integer] limit Optional parameter: The maximum number of results
    # to be returned in a single page. It is possible to receive fewer results
    # than the specified limit on a given page. The default value of 100 is also
    # the maximum allowed value. If the provided value is greater than 100, it
    # is ignored and the default value is used instead. Default: `100`
    # @return [ApiResponse]  the complete http response with raw body and status code.
    def list_payout_entries(payout_id:,
                            sort_order: nil,
                            cursor: nil,
                            limit: nil)
      new_api_call_builder
        .request(new_request_builder(HttpMethodEnum::GET,
                                     '/v2/payouts/{payout_id}/payout-entries',
                                     'default')
                   .template_param(new_parameter(payout_id, key: 'payout_id')
                                    .should_encode(true))
                   .query_param(new_parameter(sort_order, key: 'sort_order'))
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
  end
end
