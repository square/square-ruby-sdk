module Square
  # PaymentsApi
  class PaymentsApi < BaseApi
    # Retrieves a list of payments taken by the account making the request.
    # Results are eventually consistent, and new payments or changes to payments
    # might take several
    # seconds to appear.
    # The maximum results per page is 100.
    # @param [String] begin_time Optional parameter: Indicates the start of the
    # time range to retrieve payments for, in RFC 3339 format.   The range is
    # determined using the `created_at` field for each Payment. Inclusive.
    # Default: The current time minus one year.
    # @param [String] end_time Optional parameter: Indicates the end of the time
    # range to retrieve payments for, in RFC 3339 format.  The  range is
    # determined using the `created_at` field for each Payment.  Default: The
    # current time.
    # @param [String] sort_order Optional parameter: The order in which results
    # are listed by `ListPaymentsRequest.sort_field`: - `ASC` - Oldest to
    # newest. - `DESC` - Newest to oldest (default).
    # @param [String] cursor Optional parameter: A pagination cursor returned by
    # a previous call to this endpoint. Provide this cursor to retrieve the next
    # set of results for the original query.  For more information, see
    # [Pagination](https://developer.squareup.com/docs/build-basics/common-api-p
    # atterns/pagination).
    # @param [String] location_id Optional parameter: Limit results to the
    # location supplied. By default, results are returned for the default (main)
    # location associated with the seller.
    # @param [Integer] total Optional parameter: The exact amount in the
    # `total_money` for a payment.
    # @param [String] last_4 Optional parameter: The last four digits of a
    # payment card.
    # @param [String] card_brand Optional parameter: The brand of the payment
    # card (for example, VISA).
    # @param [Integer] limit Optional parameter: The maximum number of results
    # to be returned in a single page. It is possible to receive fewer results
    # than the specified limit on a given page.  The default value of 100 is
    # also the maximum allowed value. If the provided value is  greater than
    # 100, it is ignored and the default value is used instead.  Default:
    # `100`
    # @param [TrueClass | FalseClass] is_offline_payment Optional parameter:
    # Whether the payment was taken offline or not.
    # @param [String] offline_begin_time Optional parameter: Indicates the start
    # of the time range for which to retrieve offline payments, in RFC 3339
    # format for timestamps. The range is determined using the
    # `offline_payment_details.client_created_at` field for each Payment. If
    # set, payments without a value set in
    # `offline_payment_details.client_created_at` will not be returned.
    # Default: The current time.
    # @param [String] offline_end_time Optional parameter: Indicates the end of
    # the time range for which to retrieve offline payments, in RFC 3339 format
    # for timestamps. The range is determined using the
    # `offline_payment_details.client_created_at` field for each Payment. If
    # set, payments without a value set in
    # `offline_payment_details.client_created_at` will not be returned.
    # Default: The current time.
    # @param [String] updated_at_begin_time Optional parameter: Indicates the
    # start of the time range to retrieve payments for, in RFC 3339 format.  The
    # range is determined using the `updated_at` field for each Payment.
    # @param [String] updated_at_end_time Optional parameter: Indicates the end
    # of the time range to retrieve payments for, in RFC 3339 format.  The range
    # is determined using the `updated_at` field for each Payment.
    # @param [PaymentSortField] sort_field Optional parameter: The field used to
    # sort results by. The default is `CREATED_AT`.
    # @return [ApiResponse]  the complete http response with raw body and status code.
    def list_payments(begin_time: nil,
                      end_time: nil,
                      sort_order: nil,
                      cursor: nil,
                      location_id: nil,
                      total: nil,
                      last_4: nil,
                      card_brand: nil,
                      limit: nil,
                      is_offline_payment: false,
                      offline_begin_time: nil,
                      offline_end_time: nil,
                      updated_at_begin_time: nil,
                      updated_at_end_time: nil,
                      sort_field: nil)
      new_api_call_builder
        .request(new_request_builder(HttpMethodEnum::GET,
                                     '/v2/payments',
                                     'default')
                   .query_param(new_parameter(begin_time, key: 'begin_time'))
                   .query_param(new_parameter(end_time, key: 'end_time'))
                   .query_param(new_parameter(sort_order, key: 'sort_order'))
                   .query_param(new_parameter(cursor, key: 'cursor'))
                   .query_param(new_parameter(location_id, key: 'location_id'))
                   .query_param(new_parameter(total, key: 'total'))
                   .query_param(new_parameter(last_4, key: 'last_4'))
                   .query_param(new_parameter(card_brand, key: 'card_brand'))
                   .query_param(new_parameter(limit, key: 'limit'))
                   .query_param(new_parameter(is_offline_payment, key: 'is_offline_payment'))
                   .query_param(new_parameter(offline_begin_time, key: 'offline_begin_time'))
                   .query_param(new_parameter(offline_end_time, key: 'offline_end_time'))
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

    # Creates a payment using the provided source. You can use this endpoint
    # to charge a card (credit/debit card or
    # Square gift card) or record a payment that the seller received outside of
    # Square
    # (cash payment from a buyer or a payment that an external entity
    # processed on behalf of the seller).
    # The endpoint creates a
    # `Payment` object and returns it in the response.
    # @param [CreatePaymentRequest] body Required parameter: An object
    # containing the fields to POST for the request.  See the corresponding
    # object definition for field details.
    # @return [ApiResponse]  the complete http response with raw body and status code.
    def create_payment(body:)
      new_api_call_builder
        .request(new_request_builder(HttpMethodEnum::POST,
                                     '/v2/payments',
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

    # Cancels (voids) a payment identified by the idempotency key that is
    # specified in the
    # request.
    # Use this method when the status of a `CreatePayment` request is unknown
    # (for example, after you send a
    # `CreatePayment` request, a network error occurs and you do not get a
    # response). In this case, you can
    # direct Square to cancel the payment using this endpoint. In the request,
    # you provide the same
    # idempotency key that you provided in your `CreatePayment` request that you
    # want to cancel. After
    # canceling the payment, you can submit your `CreatePayment` request again.
    # Note that if no payment with the specified idempotency key is found, no
    # action is taken and the endpoint
    # returns successfully.
    # @param [CancelPaymentByIdempotencyKeyRequest] body Required parameter: An
    # object containing the fields to POST for the request.  See the
    # corresponding object definition for field details.
    # @return [ApiResponse]  the complete http response with raw body and status code.
    def cancel_payment_by_idempotency_key(body:)
      new_api_call_builder
        .request(new_request_builder(HttpMethodEnum::POST,
                                     '/v2/payments/cancel',
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

    # Retrieves details for a specific payment.
    # @param [String] payment_id Required parameter: A unique ID for the desired
    # payment.
    # @return [ApiResponse]  the complete http response with raw body and status code.
    def get_payment(payment_id:)
      new_api_call_builder
        .request(new_request_builder(HttpMethodEnum::GET,
                                     '/v2/payments/{payment_id}',
                                     'default')
                   .template_param(new_parameter(payment_id, key: 'payment_id')
                                    .should_encode(true))
                   .header_param(new_parameter('application/json', key: 'accept'))
                   .auth(Single.new('global')))
        .response(new_response_handler
                    .deserializer(APIHelper.method(:json_deserialize))
                    .is_api_response(true)
                    .convertor(ApiResponse.method(:create)))
        .execute
    end

    # Updates a payment with the APPROVED status.
    # You can update the `amount_money` and `tip_money` using this endpoint.
    # @param [String] payment_id Required parameter: The ID of the payment to
    # update.
    # @param [UpdatePaymentRequest] body Required parameter: An object
    # containing the fields to POST for the request.  See the corresponding
    # object definition for field details.
    # @return [ApiResponse]  the complete http response with raw body and status code.
    def update_payment(payment_id:,
                       body:)
      new_api_call_builder
        .request(new_request_builder(HttpMethodEnum::PUT,
                                     '/v2/payments/{payment_id}',
                                     'default')
                   .template_param(new_parameter(payment_id, key: 'payment_id')
                                    .should_encode(true))
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

    # Cancels (voids) a payment. You can use this endpoint to cancel a payment
    # with
    # the APPROVED `status`.
    # @param [String] payment_id Required parameter: The ID of the payment to
    # cancel.
    # @return [ApiResponse]  the complete http response with raw body and status code.
    def cancel_payment(payment_id:)
      new_api_call_builder
        .request(new_request_builder(HttpMethodEnum::POST,
                                     '/v2/payments/{payment_id}/cancel',
                                     'default')
                   .template_param(new_parameter(payment_id, key: 'payment_id')
                                    .should_encode(true))
                   .header_param(new_parameter('application/json', key: 'accept'))
                   .auth(Single.new('global')))
        .response(new_response_handler
                    .deserializer(APIHelper.method(:json_deserialize))
                    .is_api_response(true)
                    .convertor(ApiResponse.method(:create)))
        .execute
    end

    # Completes (captures) a payment.
    # By default, payments are set to complete immediately after they are
    # created.
    # You can use this endpoint to complete a payment with the APPROVED
    # `status`.
    # @param [String] payment_id Required parameter: The unique ID identifying
    # the payment to be completed.
    # @param [CompletePaymentRequest] body Required parameter: An object
    # containing the fields to POST for the request.  See the corresponding
    # object definition for field details.
    # @return [ApiResponse]  the complete http response with raw body and status code.
    def complete_payment(payment_id:,
                         body:)
      new_api_call_builder
        .request(new_request_builder(HttpMethodEnum::POST,
                                     '/v2/payments/{payment_id}/complete',
                                     'default')
                   .template_param(new_parameter(payment_id, key: 'payment_id')
                                    .should_encode(true))
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
  end
end
