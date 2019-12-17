module Square
  # CashDrawersApi
  class CashDrawersApi < BaseApi
    def initialize(config, http_call_back: nil)
      super(config, http_call_back: http_call_back)
    end

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
    # @return [ListCashDrawerShiftsResponse Hash] response from the API call
    def list_cash_drawer_shifts(location_id:,
                                sort_order: nil,
                                begin_time: nil,
                                end_time: nil,
                                limit: nil,
                                cursor: nil)
      # Prepare query url.
      _query_builder = config.get_base_uri
      _query_builder << '/v2/cash-drawers/shifts'
      _query_builder = APIHelper.append_url_with_query_parameters(
        _query_builder,
        'location_id' => location_id,
        'sort_order' => sort_order,
        'begin_time' => begin_time,
        'end_time' => end_time,
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
      ApiResponse.new(_response, data: decoded, errors: _errors)
    end

    # Provides the summary details for a single cash drawer shift. See
    # RetrieveCashDrawerShiftEvents for a list of cash drawer shift events.
    # @param [String] location_id Required parameter: The ID of the location to
    # retrieve cash drawer shifts from.
    # @param [String] shift_id Required parameter: The shift ID.
    # @return [RetrieveCashDrawerShiftResponse Hash] response from the API call
    def retrieve_cash_drawer_shift(location_id:,
                                   shift_id:)
      # Prepare query url.
      _query_builder = config.get_base_uri
      _query_builder << '/v2/cash-drawers/shifts/{shift_id}'
      _query_builder = APIHelper.append_url_with_template_parameters(
        _query_builder,
        'shift_id' => shift_id
      )
      _query_builder = APIHelper.append_url_with_query_parameters(
        _query_builder,
        'location_id' => location_id
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
      ApiResponse.new(_response, data: decoded, errors: _errors)
    end

    # Provides a paginated list of events for a single cash drawer shift.
    # @param [String] location_id Required parameter: The ID of the location to
    # list cash drawer shifts for.
    # @param [String] shift_id Required parameter: The shift ID.
    # @param [Integer] limit Optional parameter: Number of resources to be
    # returned in a page of results (200 by default, 1000 max).
    # @param [String] cursor Optional parameter: Opaque cursor for fetching the
    # next page of results.
    # @return [ListCashDrawerShiftEventsResponse Hash] response from the API call
    def list_cash_drawer_shift_events(location_id:,
                                      shift_id:,
                                      limit: nil,
                                      cursor: nil)
      # Prepare query url.
      _query_builder = config.get_base_uri
      _query_builder << '/v2/cash-drawers/shifts/{shift_id}/events'
      _query_builder = APIHelper.append_url_with_template_parameters(
        _query_builder,
        'shift_id' => shift_id
      )
      _query_builder = APIHelper.append_url_with_query_parameters(
        _query_builder,
        'location_id' => location_id,
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
      ApiResponse.new(_response, data: decoded, errors: _errors)
    end
  end
end
