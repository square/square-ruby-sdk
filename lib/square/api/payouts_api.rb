module Square
  # PayoutsApi
  class PayoutsApi < BaseApi
    def initialize(config, http_call_back: nil)
      super(config, http_call_back: http_call_back)
    end

    # Retrieves a list of all payouts for the default location.
    # You can filter payouts by location ID, status, time range, and order them
    # in ascending or descending order.
    # To call this endpoint, set `PAYOUTS_READ` for the OAuth scope.
    # @param [String] location_id Optional parameter: The ID of the location for
    # which to list the payouts.  By default, payouts are returned for the
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
    # [Pagination](https://developer.squareup.com/docs/basics/api101/pagination)
    # . If request parameters change between requests, subsequent results may
    # contain duplicates or missing records.
    # @param [Integer] limit Optional parameter: The maximum number of results
    # to be returned in a single page. It is possible to receive fewer results
    # than the specified limit on a given page. The default value of 100 is also
    # the maximum allowed value. If the provided value is greater than 100, it
    # is ignored and the default value is used instead. Default: `100`
    # @return [ListPayoutsResponse Hash] response from the API call
    def list_payouts(location_id: nil,
                     status: nil,
                     begin_time: nil,
                     end_time: nil,
                     sort_order: nil,
                     cursor: nil,
                     limit: nil)
      # Prepare query url.
      _query_builder = config.get_base_uri
      _query_builder << '/v2/payouts'
      _query_builder = APIHelper.append_url_with_query_parameters(
        _query_builder,
        'location_id' => location_id,
        'status' => status,
        'begin_time' => begin_time,
        'end_time' => end_time,
        'sort_order' => sort_order,
        'cursor' => cursor,
        'limit' => limit
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

    # Retrieves details of a specific payout identified by a payout ID.
    # To call this endpoint, set `PAYOUTS_READ` for the OAuth scope.
    # @param [String] payout_id Required parameter: The ID of the payout to
    # retrieve the information for.
    # @return [GetPayoutResponse Hash] response from the API call
    def get_payout(payout_id:)
      # Prepare query url.
      _query_builder = config.get_base_uri
      _query_builder << '/v2/payouts/{payout_id}'
      _query_builder = APIHelper.append_url_with_template_parameters(
        _query_builder,
        'payout_id' => { 'value' => payout_id, 'encode' => true }
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

    # Retrieves a list of all payout entries for a specific payout.
    # To call this endpoint, set `PAYOUTS_READ` for the OAuth scope.
    # @param [String] payout_id Required parameter: The ID of the payout to
    # retrieve the information for.
    # @param [SortOrder] sort_order Optional parameter: The order in which
    # payout entries are listed.
    # @param [String] cursor Optional parameter: A pagination cursor returned by
    # a previous call to this endpoint. Provide this cursor to retrieve the next
    # set of results for the original query. For more information, see
    # [Pagination](https://developer.squareup.com/docs/basics/api101/pagination)
    # . If request parameters change between requests, subsequent results may
    # contain duplicates or missing records.
    # @param [Integer] limit Optional parameter: The maximum number of results
    # to be returned in a single page. It is possible to receive fewer results
    # than the specified limit on a given page. The default value of 100 is also
    # the maximum allowed value. If the provided value is greater than 100, it
    # is ignored and the default value is used instead. Default: `100`
    # @return [ListPayoutEntriesResponse Hash] response from the API call
    def list_payout_entries(payout_id:,
                            sort_order: nil,
                            cursor: nil,
                            limit: nil)
      # Prepare query url.
      _query_builder = config.get_base_uri
      _query_builder << '/v2/payouts/{payout_id}/payout-entries'
      _query_builder = APIHelper.append_url_with_template_parameters(
        _query_builder,
        'payout_id' => { 'value' => payout_id, 'encode' => true }
      )
      _query_builder = APIHelper.append_url_with_query_parameters(
        _query_builder,
        'sort_order' => sort_order,
        'cursor' => cursor,
        'limit' => limit
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
  end
end
