module Square
  # TransactionsApi
  class TransactionsApi < BaseApi
    def initialize(config, http_call_back: nil)
      super(config, http_call_back: http_call_back)
    end

    # Lists transactions for a particular location.
    # Transactions include payment information from sales and exchanges and
    # refund
    # information from returns and exchanges.
    # Max results per
    # [page](https://developer.squareup.com/docs/working-with-apis/pagination):
    # 50
    # @param [String] location_id Required parameter: The ID of the location to
    # list transactions for.
    # @param [String] begin_time Optional parameter: The beginning of the
    # requested reporting period, in RFC 3339 format.  See [Date
    # ranges](https://developer.squareup.com/docs/build-basics/working-with-date
    # s) for details on date inclusivity/exclusivity.  Default value: The
    # current time minus one year.
    # @param [String] end_time Optional parameter: The end of the requested
    # reporting period, in RFC 3339 format.  See [Date
    # ranges](https://developer.squareup.com/docs/build-basics/working-with-date
    # s) for details on date inclusivity/exclusivity.  Default value: The
    # current time.
    # @param [SortOrder] sort_order Optional parameter: The order in which
    # results are listed in the response (`ASC` for oldest first, `DESC` for
    # newest first).  Default value: `DESC`
    # @param [String] cursor Optional parameter: A pagination cursor returned by
    # a previous call to this endpoint. Provide this to retrieve the next set of
    # results for your original query.  See [Paginating
    # results](https://developer.squareup.com/docs/working-with-apis/pagination)
    # for more information.
    # @return [ListTransactionsResponse Hash] response from the API call
    def list_transactions(location_id:,
                          begin_time: nil,
                          end_time: nil,
                          sort_order: nil,
                          cursor: nil)
      warn 'Endpoint list_transactions in TransactionsApi is deprecated'
      # Prepare query url.
      _query_builder = config.get_base_uri
      _query_builder << '/v2/locations/{location_id}/transactions'
      _query_builder = APIHelper.append_url_with_template_parameters(
        _query_builder,
        'location_id' => { 'value' => location_id, 'encode' => true }
      )
      _query_builder = APIHelper.append_url_with_query_parameters(
        _query_builder,
        'begin_time' => begin_time,
        'end_time' => end_time,
        'sort_order' => sort_order,
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

    # Retrieves details for a single transaction.
    # @param [String] location_id Required parameter: The ID of the
    # transaction's associated location.
    # @param [String] transaction_id Required parameter: The ID of the
    # transaction to retrieve.
    # @return [RetrieveTransactionResponse Hash] response from the API call
    def retrieve_transaction(location_id:,
                             transaction_id:)
      warn 'Endpoint retrieve_transaction in TransactionsApi is deprecated'
      # Prepare query url.
      _query_builder = config.get_base_uri
      _query_builder << '/v2/locations/{location_id}/transactions/{transaction_id}'
      _query_builder = APIHelper.append_url_with_template_parameters(
        _query_builder,
        'location_id' => { 'value' => location_id, 'encode' => true },
        'transaction_id' => { 'value' => transaction_id, 'encode' => true }
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

    # Captures a transaction that was created with the
    # [Charge]($e/Transactions/Charge)
    # endpoint with a `delay_capture` value of `true`.
    # See [Delayed capture
    # transactions](https://developer.squareup.com/docs/payments/transactions/ov
    # erview#delayed-capture)
    # for more information.
    # @param [String] location_id Required parameter: Example:
    # @param [String] transaction_id Required parameter: Example:
    # @return [CaptureTransactionResponse Hash] response from the API call
    def capture_transaction(location_id:,
                            transaction_id:)
      warn 'Endpoint capture_transaction in TransactionsApi is deprecated'
      # Prepare query url.
      _query_builder = config.get_base_uri
      _query_builder << '/v2/locations/{location_id}/transactions/{transaction_id}/capture'
      _query_builder = APIHelper.append_url_with_template_parameters(
        _query_builder,
        'location_id' => { 'value' => location_id, 'encode' => true },
        'transaction_id' => { 'value' => transaction_id, 'encode' => true }
      )
      _query_url = APIHelper.clean_url _query_builder

      # Prepare headers.
      _headers = {
        'accept' => 'application/json'
      }

      # Prepare and execute HttpRequest.
      _request = config.http_client.post(
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

    # Cancels a transaction that was created with the
    # [Charge]($e/Transactions/Charge)
    # endpoint with a `delay_capture` value of `true`.
    # See [Delayed capture
    # transactions](https://developer.squareup.com/docs/payments/transactions/ov
    # erview#delayed-capture)
    # for more information.
    # @param [String] location_id Required parameter: Example:
    # @param [String] transaction_id Required parameter: Example:
    # @return [VoidTransactionResponse Hash] response from the API call
    def void_transaction(location_id:,
                         transaction_id:)
      warn 'Endpoint void_transaction in TransactionsApi is deprecated'
      # Prepare query url.
      _query_builder = config.get_base_uri
      _query_builder << '/v2/locations/{location_id}/transactions/{transaction_id}/void'
      _query_builder = APIHelper.append_url_with_template_parameters(
        _query_builder,
        'location_id' => { 'value' => location_id, 'encode' => true },
        'transaction_id' => { 'value' => transaction_id, 'encode' => true }
      )
      _query_url = APIHelper.clean_url _query_builder

      # Prepare headers.
      _headers = {
        'accept' => 'application/json'
      }

      # Prepare and execute HttpRequest.
      _request = config.http_client.post(
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
