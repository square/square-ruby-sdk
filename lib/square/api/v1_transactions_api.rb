module Square
  # V1TransactionsApi
  class V1TransactionsApi < BaseApi
    # Provides summary information for a merchant's online store orders.
    # @param [String] location_id Required parameter: The ID of the location to
    # list online store orders for.
    # @param [SortOrder] order Optional parameter: The order in which payments
    # are listed in the response.
    # @param [Integer] limit Optional parameter: The maximum number of payments
    # to return in a single response. This value cannot exceed 200.
    # @param [String] batch_token Optional parameter: A pagination cursor to
    # retrieve the next set of results for your original query to the
    # endpoint.
    # @return [List of V1Order Hash] response from the API call
    def v1_list_orders(location_id:,
                       order: nil,
                       limit: nil,
                       batch_token: nil)
      warn 'Endpoint v1_list_orders in V1TransactionsApi is deprecated'
      new_api_call_builder
        .request(new_request_builder(HttpMethodEnum::GET,
                                     '/v1/{location_id}/orders',
                                     'default')
                   .template_param(new_parameter(location_id, key: 'location_id')
                                    .should_encode(true))
                   .query_param(new_parameter(order, key: 'order'))
                   .query_param(new_parameter(limit, key: 'limit'))
                   .query_param(new_parameter(batch_token, key: 'batch_token'))
                   .header_param(new_parameter('application/json', key: 'accept'))
                   .auth(Single.new('global')))
        .response(new_response_handler
                   .deserializer(APIHelper.method(:json_deserialize))
                   .is_api_response(true)
                   .convertor(ApiResponse.method(:create))
                   .is_response_array(true))
        .execute
    end

    # Provides comprehensive information for a single online store order,
    # including the order's history.
    # @param [String] location_id Required parameter: The ID of the order's
    # associated location.
    # @param [String] order_id Required parameter: The order's Square-issued ID.
    # You obtain this value from Order objects returned by the List Orders
    # endpoint
    # @return [V1Order Hash] response from the API call
    def v1_retrieve_order(location_id:,
                          order_id:)
      warn 'Endpoint v1_retrieve_order in V1TransactionsApi is deprecated'
      new_api_call_builder
        .request(new_request_builder(HttpMethodEnum::GET,
                                     '/v1/{location_id}/orders/{order_id}',
                                     'default')
                   .template_param(new_parameter(location_id, key: 'location_id')
                                    .should_encode(true))
                   .template_param(new_parameter(order_id, key: 'order_id')
                                    .should_encode(true))
                   .header_param(new_parameter('application/json', key: 'accept'))
                   .auth(Single.new('global')))
        .response(new_response_handler
                   .deserializer(APIHelper.method(:json_deserialize))
                   .is_api_response(true)
                   .convertor(ApiResponse.method(:create)))
        .execute
    end

    # Updates the details of an online store order. Every update you perform on
    # an order corresponds to one of three actions:
    # @param [String] location_id Required parameter: The ID of the order's
    # associated location.
    # @param [String] order_id Required parameter: The order's Square-issued ID.
    # You obtain this value from Order objects returned by the List Orders
    # endpoint
    # @param [V1UpdateOrderRequest] body Required parameter: An object
    # containing the fields to POST for the request.  See the corresponding
    # object definition for field details.
    # @return [V1Order Hash] response from the API call
    def v1_update_order(location_id:,
                        order_id:,
                        body:)
      warn 'Endpoint v1_update_order in V1TransactionsApi is deprecated'
      new_api_call_builder
        .request(new_request_builder(HttpMethodEnum::PUT,
                                     '/v1/{location_id}/orders/{order_id}',
                                     'default')
                   .template_param(new_parameter(location_id, key: 'location_id')
                                    .should_encode(true))
                   .template_param(new_parameter(order_id, key: 'order_id')
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

    # Provides summary information for all payments taken for a given
    # Square account during a date range. Date ranges cannot exceed 1 year in
    # length. See Date ranges for details of inclusive and exclusive dates.
    # *Note**: Details for payments processed with Square Point of Sale while
    # in offline mode may not be transmitted to Square for up to 72 hours.
    # Offline payments have a `created_at` value that reflects the time the
    # payment was originally processed, not the time it was subsequently
    # transmitted to Square. Consequently, the ListPayments endpoint might
    # list an offline payment chronologically between online payments that
    # were seen in a previous request.
    # @param [String] location_id Required parameter: The ID of the location to
    # list payments for. If you specify me, this endpoint returns payments
    # aggregated from all of the business's locations.
    # @param [SortOrder] order Optional parameter: The order in which payments
    # are listed in the response.
    # @param [String] begin_time Optional parameter: The beginning of the
    # requested reporting period, in ISO 8601 format. If this value is before
    # January 1, 2013 (2013-01-01T00:00:00Z), this endpoint returns an error.
    # Default value: The current time minus one year.
    # @param [String] end_time Optional parameter: The end of the requested
    # reporting period, in ISO 8601 format. If this value is more than one year
    # greater than begin_time, this endpoint returns an error. Default value:
    # The current time.
    # @param [Integer] limit Optional parameter: The maximum number of payments
    # to return in a single response. This value cannot exceed 200.
    # @param [String] batch_token Optional parameter: A pagination cursor to
    # retrieve the next set of results for your original query to the
    # endpoint.
    # @param [TrueClass|FalseClass] include_partial Optional parameter:
    # Indicates whether or not to include partial payments in the response.
    # Partial payments will have the tenders collected so far, but the
    # itemizations will be empty until the payment is completed.
    # @return [List of V1Payment Hash] response from the API call
    def v1_list_payments(location_id:,
                         order: nil,
                         begin_time: nil,
                         end_time: nil,
                         limit: nil,
                         batch_token: nil,
                         include_partial: false)
      warn 'Endpoint v1_list_payments in V1TransactionsApi is deprecated'
      new_api_call_builder
        .request(new_request_builder(HttpMethodEnum::GET,
                                     '/v1/{location_id}/payments',
                                     'default')
                   .template_param(new_parameter(location_id, key: 'location_id')
                                    .should_encode(true))
                   .query_param(new_parameter(order, key: 'order'))
                   .query_param(new_parameter(begin_time, key: 'begin_time'))
                   .query_param(new_parameter(end_time, key: 'end_time'))
                   .query_param(new_parameter(limit, key: 'limit'))
                   .query_param(new_parameter(batch_token, key: 'batch_token'))
                   .query_param(new_parameter(include_partial, key: 'include_partial'))
                   .header_param(new_parameter('application/json', key: 'accept'))
                   .auth(Single.new('global')))
        .response(new_response_handler
                   .deserializer(APIHelper.method(:json_deserialize))
                   .is_api_response(true)
                   .convertor(ApiResponse.method(:create))
                   .is_response_array(true))
        .execute
    end

    # Provides comprehensive information for a single payment.
    # @param [String] location_id Required parameter: The ID of the payment's
    # associated location.
    # @param [String] payment_id Required parameter: The Square-issued payment
    # ID. payment_id comes from Payment objects returned by the List Payments
    # endpoint, Settlement objects returned by the List Settlements endpoint, or
    # Refund objects returned by the List Refunds endpoint.
    # @return [V1Payment Hash] response from the API call
    def v1_retrieve_payment(location_id:,
                            payment_id:)
      warn 'Endpoint v1_retrieve_payment in V1TransactionsApi is deprecated'
      new_api_call_builder
        .request(new_request_builder(HttpMethodEnum::GET,
                                     '/v1/{location_id}/payments/{payment_id}',
                                     'default')
                   .template_param(new_parameter(location_id, key: 'location_id')
                                    .should_encode(true))
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

    # Provides the details for all refunds initiated by a merchant or any of the
    # merchant's mobile staff during a date range. Date ranges cannot exceed one
    # year in length.
    # @param [String] location_id Required parameter: The ID of the location to
    # list refunds for.
    # @param [SortOrder] order Optional parameter: The order in which payments
    # are listed in the response.
    # @param [String] begin_time Optional parameter: The beginning of the
    # requested reporting period, in ISO 8601 format. If this value is before
    # January 1, 2013 (2013-01-01T00:00:00Z), this endpoint returns an error.
    # Default value: The current time minus one year.
    # @param [String] end_time Optional parameter: The end of the requested
    # reporting period, in ISO 8601 format. If this value is more than one year
    # greater than begin_time, this endpoint returns an error. Default value:
    # The current time.
    # @param [Integer] limit Optional parameter: The approximate number of
    # refunds to return in a single response. Default: 100. Max: 200. Response
    # may contain more results than the prescribed limit when refunds are made
    # simultaneously to multiple tenders in a payment or when refunds are
    # generated in an exchange to account for the value of returned goods.
    # @param [String] batch_token Optional parameter: A pagination cursor to
    # retrieve the next set of results for your original query to the
    # endpoint.
    # @return [List of V1Refund Hash] response from the API call
    def v1_list_refunds(location_id:,
                        order: nil,
                        begin_time: nil,
                        end_time: nil,
                        limit: nil,
                        batch_token: nil)
      warn 'Endpoint v1_list_refunds in V1TransactionsApi is deprecated'
      new_api_call_builder
        .request(new_request_builder(HttpMethodEnum::GET,
                                     '/v1/{location_id}/refunds',
                                     'default')
                   .template_param(new_parameter(location_id, key: 'location_id')
                                    .should_encode(true))
                   .query_param(new_parameter(order, key: 'order'))
                   .query_param(new_parameter(begin_time, key: 'begin_time'))
                   .query_param(new_parameter(end_time, key: 'end_time'))
                   .query_param(new_parameter(limit, key: 'limit'))
                   .query_param(new_parameter(batch_token, key: 'batch_token'))
                   .header_param(new_parameter('application/json', key: 'accept'))
                   .auth(Single.new('global')))
        .response(new_response_handler
                   .deserializer(APIHelper.method(:json_deserialize))
                   .is_api_response(true)
                   .convertor(ApiResponse.method(:create))
                   .is_response_array(true))
        .execute
    end

    # Issues a refund for a previously processed payment. You must issue
    # a refund within 60 days of the associated payment.
    # You cannot issue a partial refund for a split tender payment. You must
    # instead issue a full or partial refund for a particular tender, by
    # providing the applicable tender id to the V1CreateRefund endpoint.
    # Issuing a full refund for a split tender payment refunds all tenders
    # associated with the payment.
    # Issuing a refund for a card payment is not reversible. For development
    # purposes, you can create fake cash payments in Square Point of Sale and
    # refund them.
    # @param [String] location_id Required parameter: The ID of the original
    # payment's associated location.
    # @param [V1CreateRefundRequest] body Required parameter: An object
    # containing the fields to POST for the request.  See the corresponding
    # object definition for field details.
    # @return [V1Refund Hash] response from the API call
    def v1_create_refund(location_id:,
                         body:)
      warn 'Endpoint v1_create_refund in V1TransactionsApi is deprecated'
      new_api_call_builder
        .request(new_request_builder(HttpMethodEnum::POST,
                                     '/v1/{location_id}/refunds',
                                     'default')
                   .template_param(new_parameter(location_id, key: 'location_id')
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

    # Provides summary information for all deposits and withdrawals
    # initiated by Square to a linked bank account during a date range. Date
    # ranges cannot exceed one year in length.
    # *Note**: the ListSettlements endpoint does not provide entry
    # information.
    # @param [String] location_id Required parameter: The ID of the location to
    # list settlements for. If you specify me, this endpoint returns settlements
    # aggregated from all of the business's locations.
    # @param [SortOrder] order Optional parameter: The order in which
    # settlements are listed in the response.
    # @param [String] begin_time Optional parameter: The beginning of the
    # requested reporting period, in ISO 8601 format. If this value is before
    # January 1, 2013 (2013-01-01T00:00:00Z), this endpoint returns an error.
    # Default value: The current time minus one year.
    # @param [String] end_time Optional parameter: The end of the requested
    # reporting period, in ISO 8601 format. If this value is more than one year
    # greater than begin_time, this endpoint returns an error. Default value:
    # The current time.
    # @param [Integer] limit Optional parameter: The maximum number of
    # settlements to return in a single response. This value cannot exceed
    # 200.
    # @param [V1ListSettlementsRequestStatus] status Optional parameter: Provide
    # this parameter to retrieve only settlements with a particular status (SENT
    # or FAILED).
    # @param [String] batch_token Optional parameter: A pagination cursor to
    # retrieve the next set of results for your original query to the
    # endpoint.
    # @return [List of V1Settlement Hash] response from the API call
    def v1_list_settlements(location_id:,
                            order: nil,
                            begin_time: nil,
                            end_time: nil,
                            limit: nil,
                            status: nil,
                            batch_token: nil)
      warn 'Endpoint v1_list_settlements in V1TransactionsApi is deprecated'
      new_api_call_builder
        .request(new_request_builder(HttpMethodEnum::GET,
                                     '/v1/{location_id}/settlements',
                                     'default')
                   .template_param(new_parameter(location_id, key: 'location_id')
                                    .should_encode(true))
                   .query_param(new_parameter(order, key: 'order'))
                   .query_param(new_parameter(begin_time, key: 'begin_time'))
                   .query_param(new_parameter(end_time, key: 'end_time'))
                   .query_param(new_parameter(limit, key: 'limit'))
                   .query_param(new_parameter(status, key: 'status'))
                   .query_param(new_parameter(batch_token, key: 'batch_token'))
                   .header_param(new_parameter('application/json', key: 'accept'))
                   .auth(Single.new('global')))
        .response(new_response_handler
                   .deserializer(APIHelper.method(:json_deserialize))
                   .is_api_response(true)
                   .convertor(ApiResponse.method(:create))
                   .is_response_array(true))
        .execute
    end

    # Provides comprehensive information for a single settlement.
    # The returned `Settlement` objects include an `entries` field that lists
    # the transactions that contribute to the settlement total. Most
    # settlement entries correspond to a payment payout, but settlement
    # entries are also generated for less common events, like refunds, manual
    # adjustments, or chargeback holds.
    # Square initiates its regular deposits as indicated in the
    # [Deposit Options with
    # Square](https://squareup.com/help/us/en/article/3807)
    # help article. Details for a regular deposit are usually not available
    # from Connect API endpoints before 10 p.m. PST the same day.
    # Square does not know when an initiated settlement **completes**, only
    # whether it has failed. A completed settlement is typically reflected in
    # a bank account within 3 business days, but in exceptional cases it may
    # take longer.
    # @param [String] location_id Required parameter: The ID of the
    # settlements's associated location.
    # @param [String] settlement_id Required parameter: The settlement's
    # Square-issued ID. You obtain this value from Settlement objects returned
    # by the List Settlements endpoint.
    # @return [V1Settlement Hash] response from the API call
    def v1_retrieve_settlement(location_id:,
                               settlement_id:)
      warn 'Endpoint v1_retrieve_settlement in V1TransactionsApi is deprecated'
      new_api_call_builder
        .request(new_request_builder(HttpMethodEnum::GET,
                                     '/v1/{location_id}/settlements/{settlement_id}',
                                     'default')
                   .template_param(new_parameter(location_id, key: 'location_id')
                                    .should_encode(true))
                   .template_param(new_parameter(settlement_id, key: 'settlement_id')
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
