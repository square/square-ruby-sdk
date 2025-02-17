module Square
  # RefundsApi
  class RefundsApi < BaseApi
    # Retrieves a list of refunds for the account making the request.
    # Results are eventually consistent, and new refunds or changes to refunds
    # might take several
    # seconds to appear.
    # The maximum results per page is 100.
    # @param [String] begin_time Optional parameter: Indicates the start of the
    # time range to retrieve each `PaymentRefund` for, in RFC 3339  format.  The
    # range is determined using the `created_at` field for each `PaymentRefund`.
    #   Default: The current time minus one year.
    # @param [String] end_time Optional parameter: Indicates the end of the time
    # range to retrieve each `PaymentRefund` for, in RFC 3339  format.  The
    # range is determined using the `created_at` field for each `PaymentRefund`.
    #  Default: The current time.
    # @param [String] sort_order Optional parameter: The order in which results
    # are listed by `PaymentRefund.created_at`: - `ASC` - Oldest to newest. -
    # `DESC` - Newest to oldest (default).
    # @param [String] cursor Optional parameter: A pagination cursor returned by
    # a previous call to this endpoint. Provide this cursor to retrieve the next
    # set of results for the original query.  For more information, see
    # [Pagination](https://developer.squareup.com/docs/build-basics/common-api-p
    # atterns/pagination).
    # @param [String] location_id Optional parameter: Limit results to the
    # location supplied. By default, results are returned for all locations
    # associated with the seller.
    # @param [String] status Optional parameter: If provided, only refunds with
    # the given status are returned. For a list of refund status values, see
    # [PaymentRefund](entity:PaymentRefund).  Default: If omitted, refunds are
    # returned regardless of their status.
    # @param [String] source_type Optional parameter: If provided, only returns
    # refunds whose payments have the indicated source type. Current values
    # include `CARD`, `BANK_ACCOUNT`, `WALLET`, `CASH`, and `EXTERNAL`. For
    # information about these payment source types, see [Take
    # Payments](https://developer.squareup.com/docs/payments-api/take-payments).
    #  Default: If omitted, refunds are returned regardless of the source
    # type.
    # @param [Integer] limit Optional parameter: The maximum number of results
    # to be returned in a single page.  It is possible to receive fewer results
    # than the specified limit on a given page.  If the supplied value is
    # greater than 100, no more than 100 results are returned.  Default: 100
    # @param [String] updated_at_begin_time Optional parameter: Indicates the
    # start of the time range to retrieve each `PaymentRefund` for, in RFC 3339
    # format.  The range is determined using the `updated_at` field for each
    # `PaymentRefund`.  Default: if omitted, the time range starts at
    # `begin_time`.
    # @param [String] updated_at_end_time Optional parameter: Indicates the end
    # of the time range to retrieve each `PaymentRefund` for, in RFC 3339
    # format.  The range is determined using the `updated_at` field for each
    # `PaymentRefund`.  Default: The current time.
    # @param [String] sort_field Optional parameter: The field used to sort
    # results by. The default is `CREATED_AT`. Current values include
    # `CREATED_AT` and `UPDATED_AT`.
    # @return [ApiResponse]  the complete http response with raw body and status code.
    def list_payment_refunds(begin_time: nil,
                             end_time: nil,
                             sort_order: nil,
                             cursor: nil,
                             location_id: nil,
                             status: nil,
                             source_type: nil,
                             limit: nil,
                             updated_at_begin_time: nil,
                             updated_at_end_time: nil,
                             sort_field: nil)
      new_api_call_builder
        .request(new_request_builder(HttpMethodEnum::GET,
                                     '/v2/refunds',
                                     'default')
                   .query_param(new_parameter(begin_time, key: 'begin_time'))
                   .query_param(new_parameter(end_time, key: 'end_time'))
                   .query_param(new_parameter(sort_order, key: 'sort_order'))
                   .query_param(new_parameter(cursor, key: 'cursor'))
                   .query_param(new_parameter(location_id, key: 'location_id'))
                   .query_param(new_parameter(status, key: 'status'))
                   .query_param(new_parameter(source_type, key: 'source_type'))
                   .query_param(new_parameter(limit, key: 'limit'))
                   .query_param(new_parameter(updated_at_begin_time, key: 'updated_at_begin_time'))
                   .query_param(new_parameter(updated_at_end_time, key: 'updated_at_end_time'))
                   .query_param(new_parameter(sort_field, key: 'sort_field'))
                   .header_param(new_parameter('application/json', key: 'accept'))
                   .auth(Single.new('global')))
        .response(new_response_handler
                    .deserializer(APIHelper.method(:json_deserialize))
                    .is_api_response(true)
                    .convertor(ApiResponse.method(:create)))
        .execute
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
    # @return [ApiResponse]  the complete http response with raw body and status code.
    def refund_payment(body:)
      new_api_call_builder
        .request(new_request_builder(HttpMethodEnum::POST,
                                     '/v2/refunds',
                                     'default')
                   .header_param(new_parameter('application/json', key: 'Content-Type'))
                   .body_param(new_parameter(body))
                   .header_param(new_parameter('application/json', key: 'accept'))
                   .body_serializer(proc do |param| param.to_json unless param.nil? end)
                   .auth(Single.new('global')))
        .response(new_response_handler
                    .deserializer(APIHelper.method(:json_deserialize))
                    .is_api_response(true)
                    .convertor(ApiResponse.method(:create)))
        .execute
    end

    # Retrieves a specific refund using the `refund_id`.
    # @param [String] refund_id Required parameter: The unique ID for the
    # desired `PaymentRefund`.
    # @return [ApiResponse]  the complete http response with raw body and status code.
    def get_payment_refund(refund_id:)
      new_api_call_builder
        .request(new_request_builder(HttpMethodEnum::GET,
                                     '/v2/refunds/{refund_id}',
                                     'default')
                   .template_param(new_parameter(refund_id, key: 'refund_id')
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
