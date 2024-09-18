module Square
  # TransactionsApi
  class TransactionsApi < BaseApi
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
    # @return [ApiResponse]  the complete http response with raw body and status code.
    def list_transactions(location_id:,
                          begin_time: nil,
                          end_time: nil,
                          sort_order: nil,
                          cursor: nil)
      warn 'Endpoint list_transactions in TransactionsApi is deprecated'
      new_api_call_builder
        .request(new_request_builder(HttpMethodEnum::GET,
                                     '/v2/locations/{location_id}/transactions',
                                     'default')
                   .template_param(new_parameter(location_id, key: 'location_id')
                                    .should_encode(true))
                   .query_param(new_parameter(begin_time, key: 'begin_time'))
                   .query_param(new_parameter(end_time, key: 'end_time'))
                   .query_param(new_parameter(sort_order, key: 'sort_order'))
                   .query_param(new_parameter(cursor, key: 'cursor'))
                   .header_param(new_parameter('application/json', key: 'accept'))
                   .auth(Single.new('global')))
        .response(new_response_handler
                    .deserializer(APIHelper.method(:json_deserialize))
                    .is_api_response(true)
                    .convertor(ApiResponse.method(:create)))
        .execute
    end

    # Retrieves details for a single transaction.
    # @param [String] location_id Required parameter: The ID of the
    # transaction's associated location.
    # @param [String] transaction_id Required parameter: The ID of the
    # transaction to retrieve.
    # @return [ApiResponse]  the complete http response with raw body and status code.
    def retrieve_transaction(location_id:,
                             transaction_id:)
      warn 'Endpoint retrieve_transaction in TransactionsApi is deprecated'
      new_api_call_builder
        .request(new_request_builder(HttpMethodEnum::GET,
                                     '/v2/locations/{location_id}/transactions/{transaction_id}',
                                     'default')
                   .template_param(new_parameter(location_id, key: 'location_id')
                                    .should_encode(true))
                   .template_param(new_parameter(transaction_id, key: 'transaction_id')
                                    .should_encode(true))
                   .header_param(new_parameter('application/json', key: 'accept'))
                   .auth(Single.new('global')))
        .response(new_response_handler
                    .deserializer(APIHelper.method(:json_deserialize))
                    .is_api_response(true)
                    .convertor(ApiResponse.method(:create)))
        .execute
    end

    # Captures a transaction that was created with the
    # [Charge](api-endpoint:Transactions-Charge)
    # endpoint with a `delay_capture` value of `true`.
    # See [Delayed capture
    # transactions](https://developer.squareup.com/docs/payments/transactions/ov
    # erview#delayed-capture)
    # for more information.
    # @param [String] location_id Required parameter: Example:
    # @param [String] transaction_id Required parameter: Example:
    # @return [ApiResponse]  the complete http response with raw body and status code.
    def capture_transaction(location_id:,
                            transaction_id:)
      warn 'Endpoint capture_transaction in TransactionsApi is deprecated'
      new_api_call_builder
        .request(new_request_builder(HttpMethodEnum::POST,
                                     '/v2/locations/{location_id}/transactions/{transaction_id}/capture',
                                     'default')
                   .template_param(new_parameter(location_id, key: 'location_id')
                                    .should_encode(true))
                   .template_param(new_parameter(transaction_id, key: 'transaction_id')
                                    .should_encode(true))
                   .header_param(new_parameter('application/json', key: 'accept'))
                   .auth(Single.new('global')))
        .response(new_response_handler
                    .deserializer(APIHelper.method(:json_deserialize))
                    .is_api_response(true)
                    .convertor(ApiResponse.method(:create)))
        .execute
    end

    # Cancels a transaction that was created with the
    # [Charge](api-endpoint:Transactions-Charge)
    # endpoint with a `delay_capture` value of `true`.
    # See [Delayed capture
    # transactions](https://developer.squareup.com/docs/payments/transactions/ov
    # erview#delayed-capture)
    # for more information.
    # @param [String] location_id Required parameter: Example:
    # @param [String] transaction_id Required parameter: Example:
    # @return [ApiResponse]  the complete http response with raw body and status code.
    def void_transaction(location_id:,
                         transaction_id:)
      warn 'Endpoint void_transaction in TransactionsApi is deprecated'
      new_api_call_builder
        .request(new_request_builder(HttpMethodEnum::POST,
                                     '/v2/locations/{location_id}/transactions/{transaction_id}/void',
                                     'default')
                   .template_param(new_parameter(location_id, key: 'location_id')
                                    .should_encode(true))
                   .template_param(new_parameter(transaction_id, key: 'transaction_id')
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
