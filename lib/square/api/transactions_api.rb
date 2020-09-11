module Square
  # TransactionsApi
  class TransactionsApi < BaseApi
    def initialize(config, http_call_back: nil)
      super(config, http_call_back: http_call_back)
    end

    # Lists refunds for one of a business's locations.
    # In addition to full or partial tender refunds processed through Square
    # APIs,
    # refunds may result from itemized returns or exchanges through Square's
    # Point of Sale applications.
    # Refunds with a `status` of `PENDING` are not currently included in this
    # endpoint's response.
    # Max results per [page](#paginatingresults): 50
    # @param [String] location_id Required parameter: The ID of the location to
    # list refunds for.
    # @param [String] begin_time Optional parameter: The beginning of the
    # requested reporting period, in RFC 3339 format.  See [Date
    # ranges](#dateranges) for details on date inclusivity/exclusivity.  Default
    # value: The current time minus one year.
    # @param [String] end_time Optional parameter: The end of the requested
    # reporting period, in RFC 3339 format.  See [Date ranges](#dateranges) for
    # details on date inclusivity/exclusivity.  Default value: The current
    # time.
    # @param [SortOrder] sort_order Optional parameter: The order in which
    # results are listed in the response (`ASC` for oldest first, `DESC` for
    # newest first).  Default value: `DESC`
    # @param [String] cursor Optional parameter: A pagination cursor returned by
    # a previous call to this endpoint. Provide this to retrieve the next set of
    # results for your original query.  See [Paginating
    # results](#paginatingresults) for more information.
    # @return [ListRefundsResponse Hash] response from the API call
    def list_refunds(location_id:,
                     begin_time: nil,
                     end_time: nil,
                     sort_order: nil,
                     cursor: nil)
      warn 'Endpoint list_refunds in TransactionsApi is deprecated'
      # Prepare query url.
      _query_builder = config.get_base_uri
      _query_builder << '/v2/locations/{location_id}/refunds'
      _query_builder = APIHelper.append_url_with_template_parameters(
        _query_builder,
        'location_id' => location_id
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
      ApiResponse.new(_response, data: decoded, errors: _errors)
    end

    # Lists transactions for a particular location.
    # Transactions include payment information from sales and exchanges and
    # refund
    # information from returns and exchanges.
    # Max results per [page](#paginatingresults): 50
    # @param [String] location_id Required parameter: The ID of the location to
    # list transactions for.
    # @param [String] begin_time Optional parameter: The beginning of the
    # requested reporting period, in RFC 3339 format.  See [Date
    # ranges](#dateranges) for details on date inclusivity/exclusivity.  Default
    # value: The current time minus one year.
    # @param [String] end_time Optional parameter: The end of the requested
    # reporting period, in RFC 3339 format.  See [Date ranges](#dateranges) for
    # details on date inclusivity/exclusivity.  Default value: The current
    # time.
    # @param [SortOrder] sort_order Optional parameter: The order in which
    # results are listed in the response (`ASC` for oldest first, `DESC` for
    # newest first).  Default value: `DESC`
    # @param [String] cursor Optional parameter: A pagination cursor returned by
    # a previous call to this endpoint. Provide this to retrieve the next set of
    # results for your original query.  See [Paginating
    # results](#paginatingresults) for more information.
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
        'location_id' => location_id
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
      ApiResponse.new(_response, data: decoded, errors: _errors)
    end

    # Charges a card represented by a card nonce or a customer's card on file.
    # Your request to this endpoint must include _either_:
    # - A value for the `card_nonce` parameter (to charge a card nonce generated
    # with the `SqPaymentForm`)
    # - Values for the `customer_card_id` and `customer_id` parameters (to
    # charge
    # a customer's card on file)
    # In order for an eCommerce payment to potentially qualify for
    # [Square chargeback protection](https://squareup.com/help/article/5394),
    # you
    # _must_ provide values for the following parameters in your request:
    # - `buyer_email_address`
    # - At least one of `billing_address` or `shipping_address`
    # When this response is returned, the amount of Square's processing fee
    # might not yet be
    # calculated. To obtain the processing fee, wait about ten seconds and call
    # [RetrieveTransaction](#endpoint-retrievetransaction). See the
    # `processing_fee_money`
    # field of each [Tender included](#type-tender) in the transaction.
    # @param [String] location_id Required parameter: The ID of the location to
    # associate the created transaction with.
    # @param [ChargeRequest] body Required parameter: An object containing the
    # fields to POST for the request.  See the corresponding object definition
    # for field details.
    # @return [ChargeResponse Hash] response from the API call
    def charge(location_id:,
               body:)
      warn 'Endpoint charge in TransactionsApi is deprecated'
      # Prepare query url.
      _query_builder = config.get_base_uri
      _query_builder << '/v2/locations/{location_id}/transactions'
      _query_builder = APIHelper.append_url_with_template_parameters(
        _query_builder,
        'location_id' => location_id
      )
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
        'location_id' => location_id,
        'transaction_id' => transaction_id
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

    # Captures a transaction that was created with the
    # [Charge](#endpoint-charge)
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
        'location_id' => location_id,
        'transaction_id' => transaction_id
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
      ApiResponse.new(_response, data: decoded, errors: _errors)
    end

    # Initiates a refund for a previously charged tender.
    # You must issue a refund within 120 days of the associated payment. See
    # [this article](https://squareup.com/help/us/en/article/5060) for more
    # information
    # on refund behavior.
    # NOTE: Card-present transactions with Interac credit cards **cannot be
    # refunded using the Connect API**. Interac transactions must refunded
    # in-person (e.g., dipping the card using POS app).
    # @param [String] location_id Required parameter: The ID of the original
    # transaction's associated location.
    # @param [String] transaction_id Required parameter: The ID of the original
    # transaction that includes the tender to refund.
    # @param [CreateRefundRequest] body Required parameter: An object containing
    # the fields to POST for the request.  See the corresponding object
    # definition for field details.
    # @return [CreateRefundResponse Hash] response from the API call
    def create_refund(location_id:,
                      transaction_id:,
                      body:)
      warn 'Endpoint create_refund in TransactionsApi is deprecated'
      # Prepare query url.
      _query_builder = config.get_base_uri
      _query_builder << '/v2/locations/{location_id}/transactions/{transaction_id}/refund'
      _query_builder = APIHelper.append_url_with_template_parameters(
        _query_builder,
        'location_id' => location_id,
        'transaction_id' => transaction_id
      )
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

    # Cancels a transaction that was created with the [Charge](#endpoint-charge)
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
        'location_id' => location_id,
        'transaction_id' => transaction_id
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
      ApiResponse.new(_response, data: decoded, errors: _errors)
    end
  end
end
