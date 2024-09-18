module Square
  # CashDrawersApi
  class CashDrawersApi < BaseApi
    # Provides the details for all of the cash drawer shifts for a location
    # in a date range.
    # @param [String] location_id Required parameter: The ID of the location to
    # query for a list of cash drawer shifts.
    # @param [SortOrder] sort_order Optional parameter: The order in which cash
    # drawer shifts are listed in the response, based on their opened_at field.
    # Default value: ASC
    # @param [String] begin_time Optional parameter: The inclusive start time of
    # the query on opened_at, in ISO 8601 format.
    # @param [String] end_time Optional parameter: The exclusive end date of the
    # query on opened_at, in ISO 8601 format.
    # @param [Integer] limit Optional parameter: Number of cash drawer shift
    # events in a page of results (200 by default, 1000 max).
    # @param [String] cursor Optional parameter: Opaque cursor for fetching the
    # next page of results.
    # @return [ApiResponse]  the complete http response with raw body and status code.
    def list_cash_drawer_shifts(location_id:,
                                sort_order: nil,
                                begin_time: nil,
                                end_time: nil,
                                limit: nil,
                                cursor: nil)
      new_api_call_builder
        .request(new_request_builder(HttpMethodEnum::GET,
                                     '/v2/cash-drawers/shifts',
                                     'default')
                   .query_param(new_parameter(location_id, key: 'location_id'))
                   .query_param(new_parameter(sort_order, key: 'sort_order'))
                   .query_param(new_parameter(begin_time, key: 'begin_time'))
                   .query_param(new_parameter(end_time, key: 'end_time'))
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

    # Provides the summary details for a single cash drawer shift. See
    # [ListCashDrawerShiftEvents]($e/CashDrawers/ListCashDrawerShiftEvents) for
    # a list of cash drawer shift events.
    # @param [String] location_id Required parameter: The ID of the location to
    # retrieve cash drawer shifts from.
    # @param [String] shift_id Required parameter: The shift ID.
    # @return [ApiResponse]  the complete http response with raw body and status code.
    def retrieve_cash_drawer_shift(location_id:,
                                   shift_id:)
      new_api_call_builder
        .request(new_request_builder(HttpMethodEnum::GET,
                                     '/v2/cash-drawers/shifts/{shift_id}',
                                     'default')
                   .query_param(new_parameter(location_id, key: 'location_id'))
                   .template_param(new_parameter(shift_id, key: 'shift_id')
                                    .should_encode(true))
                   .header_param(new_parameter('application/json', key: 'accept'))
                   .auth(Single.new('global')))
        .response(new_response_handler
                    .deserializer(APIHelper.method(:json_deserialize))
                    .is_api_response(true)
                    .convertor(ApiResponse.method(:create)))
        .execute
    end

    # Provides a paginated list of events for a single cash drawer shift.
    # @param [String] location_id Required parameter: The ID of the location to
    # list cash drawer shifts for.
    # @param [String] shift_id Required parameter: The shift ID.
    # @param [Integer] limit Optional parameter: Number of resources to be
    # returned in a page of results (200 by default, 1000 max).
    # @param [String] cursor Optional parameter: Opaque cursor for fetching the
    # next page of results.
    # @return [ApiResponse]  the complete http response with raw body and status code.
    def list_cash_drawer_shift_events(location_id:,
                                      shift_id:,
                                      limit: nil,
                                      cursor: nil)
      new_api_call_builder
        .request(new_request_builder(HttpMethodEnum::GET,
                                     '/v2/cash-drawers/shifts/{shift_id}/events',
                                     'default')
                   .query_param(new_parameter(location_id, key: 'location_id'))
                   .template_param(new_parameter(shift_id, key: 'shift_id')
                                    .should_encode(true))
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
  end
end
