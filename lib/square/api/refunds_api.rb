module Square
  # RefundsApi
  class RefundsApi < BaseApi
    def initialize(config, http_call_back: nil)
      super(config, http_call_back: http_call_back)
    end

    # Retrieves a list of refunds for the account making the request.
    # Max results per page: 100
    # @param [String] begin_time Optional parameter: Timestamp for the beginning
    # of the requested reporting period, in RFC 3339 format.  Default: The
    # current time minus one year.
    # @param [String] end_time Optional parameter: Timestamp for the end of the
    # requested reporting period, in RFC 3339 format.  Default: The current
    # time.
    # @param [String] sort_order Optional parameter: The order in which results
    # are listed. - `ASC` - oldest to newest - `DESC` - newest to oldest
    # (default).
    # @param [String] cursor Optional parameter: A pagination cursor returned by
    # a previous call to this endpoint. Provide this to retrieve the next set of
    # results for the original query.  See
    # [Pagination](https://developer.squareup.com/docs/basics/api101/pagination)
    # for more information.
    # @param [String] location_id Optional parameter: Limit results to the
    # location supplied. By default, results are returned for all locations
    # associated with the merchant.
    # @param [String] status Optional parameter: If provided, only refunds with
    # the given status are returned. For a list of refund status values, see
    # [PaymentRefund](#type-paymentrefund).  Default: If omitted refunds are
    # returned regardless of status.
    # @param [String] source_type Optional parameter: If provided, only refunds
    # with the given source type are returned. - `CARD` - List refunds only for
    # payments where card was specified as payment source.  Default: If omitted
    # refunds are returned regardless of source type.
    # @return [ListPaymentRefundsResponse Hash] response from the API call
    def list_payment_refunds(begin_time: nil,
                             end_time: nil,
                             sort_order: nil,
                             cursor: nil,
                             location_id: nil,
                             status: nil,
                             source_type: nil)
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
        'source_type' => source_type
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

    # Refunds a payment. You can refund the entire payment amount or a
    # portion of it. For more information, see
    # [Payments and Refunds
    # Overview](https://developer.squareup.com/docs/payments-api/overview).
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
      ApiResponse.new(_response, data: decoded, errors: _errors)
    end

    # Retrieves a specific `Refund` using the `refund_id`.
    # @param [String] refund_id Required parameter: Unique ID for the desired
    # `PaymentRefund`.
    # @return [GetPaymentRefundResponse Hash] response from the API call
    def get_payment_refund(refund_id:)
      # Prepare query url.
      _query_builder = config.get_base_uri
      _query_builder << '/v2/refunds/{refund_id}'
      _query_builder = APIHelper.append_url_with_template_parameters(
        _query_builder,
        'refund_id' => refund_id
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
