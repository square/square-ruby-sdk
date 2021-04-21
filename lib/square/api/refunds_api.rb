module Square
  # RefundsApi
  class RefundsApi < BaseApi
    def initialize(config, http_call_back: nil)
      super(config, http_call_back: http_call_back)
    end

    # Retrieves a list of refunds for the account making the request.
    # Results are eventually consistent, and new refunds or changes to refunds
    # might take several
    # seconds to appear.
    # The maximum results per page is 100.
    # @param [String] begin_time Optional parameter: The timestamp for the
    # beginning of the requested reporting period, in RFC 3339 format.  Default:
    # The current time minus one year.
    # @param [String] end_time Optional parameter: The timestamp for the end of
    # the requested reporting period, in RFC 3339 format.  Default: The current
    # time.
    # @param [String] sort_order Optional parameter: The order in which results
    # are listed: - `ASC` - Oldest to newest. - `DESC` - Newest to oldest
    # (default).
    # @param [String] cursor Optional parameter: A pagination cursor returned by
    # a previous call to this endpoint. Provide this cursor to retrieve the next
    # set of results for the original query.  For more information, see
    # [Pagination](https://developer.squareup.com/docs/basics/api101/pagination)
    # .
    # @param [String] location_id Optional parameter: Limit results to the
    # location supplied. By default, results are returned for all locations
    # associated with the seller.
    # @param [String] status Optional parameter: If provided, only refunds with
    # the given status are returned. For a list of refund status values, see
    # [PaymentRefund]($m/PaymentRefund).  Default: If omitted, refunds are
    # returned regardless of their status.
    # @param [String] source_type Optional parameter: If provided, only refunds
    # with the given source type are returned. - `CARD` - List refunds only for
    # payments where `CARD` was specified as the payment source.  Default: If
    # omitted, refunds are returned regardless of the source type.
    # @param [Integer] limit Optional parameter: The maximum number of results
    # to be returned in a single page.  It is possible to receive fewer results
    # than the specified limit on a given page.  If the supplied value is
    # greater than 100, no more than 100 results are returned.  Default: 100
    # @return [ListPaymentRefundsResponse Hash] response from the API call
    def list_payment_refunds(begin_time: nil,
                             end_time: nil,
                             sort_order: nil,
                             cursor: nil,
                             location_id: nil,
                             status: nil,
                             source_type: nil,
                             limit: nil)
      # Prepare query url.
      _query_builder = config.get_base_uri
      _query_builder << '/v2/refunds'
      _query_builder = APIHelper.append_url_with_query_parameters(
        _query_builder,
        'begin_time' => begin_time,
        'end_time' => end_time,
        'sort_order' => sort_order,
        'cursor' => cursor,
        'location_id' => location_id,
        'status' => status,
        'source_type' => source_type,
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

    # Refunds a payment. You can refund the entire payment amount or a
    # portion of it. You can use this endpoint to refund a card payment or
    # record a
    # refund of a cash or external payment. For more information, see
    # [Refund
    # Payment](https://developer.squareup.com/docs/payments-api/refund-payments)
    # .
    # @param [RefundPaymentRequest] body Required parameter: An object
    # containing the fields to POST for the request.  See the corresponding
    # object definition for field details.
    # @return [RefundPaymentResponse Hash] response from the API call
    def refund_payment(body:)
      # Prepare query url.
      _query_builder = config.get_base_uri
      _query_builder << '/v2/refunds'
      _query_url = APIHelper.clean_url _query_builder

      # Prepare headers.
      _headers = {
        'accept' => 'application/json',
        'content-type' => 'application/json; charset=utf-8'
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

    # Retrieves a specific refund using the `refund_id`.
    # @param [String] refund_id Required parameter: The unique ID for the
    # desired `PaymentRefund`.
    # @return [GetPaymentRefundResponse Hash] response from the API call
    def get_payment_refund(refund_id:)
      # Prepare query url.
      _query_builder = config.get_base_uri
      _query_builder << '/v2/refunds/{refund_id}'
      _query_builder = APIHelper.append_url_with_template_parameters(
        _query_builder,
        'refund_id' => { 'value' => refund_id, 'encode' => true }
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
