# frozen_string_literal: true
require_relative "../../requests"
require_relative "../types/list_payment_refunds_request_sort_field"
require_relative "../types/list_payment_refunds_response"
require_relative "../types/money"
require_relative "../types/destination_details_cash_refund_details"
require_relative "../types/destination_details_external_refund_details"
require_relative "../types/refund_payment_response"
require_relative "../types/get_payment_refund_response"
require "async"
require "async"
require "async"
require_relative "../../requests"

module SquareApiClient
  class RefundsClient
  # @return [SquareApiClient::RequestClient] 
    attr_reader :request_client


    # @param request_client [SquareApiClient::RequestClient] 
    # @return [SquareApiClient::RefundsClient]
    def initialize(request_client:)
      @request_client = request_client
    end
# Retrieves a list of refunds for the account making the request.
#  Results are eventually consistent, and new refunds or changes to refunds might
#  take several
#  seconds to appear.
#  The maximum results per page is 100.
    #
    # @param begin_time [String] Indicates the start of the time range to retrieve each `PaymentRefund` for, in
#  RFC 3339
#  format.  The range is determined using the `created_at` field for each
#  `PaymentRefund`.
#  Default: The current time minus one year.
    # @param end_time [String] Indicates the end of the time range to retrieve each `PaymentRefund` for, in RFC
#  3339
#  format.  The range is determined using the `created_at` field for each
#  `PaymentRefund`.
#  Default: The current time.
    # @param sort_order [String] The order in which results are listed by `PaymentRefund.created_at`:
#  - `ASC` - Oldest to newest.
#  - `DESC` - Newest to oldest (default).
    # @param cursor [String] A pagination cursor returned by a previous call to this endpoint.
#  Provide this cursor to retrieve the next set of results for the original query.
#  For more information, see
#  ttps://developer.squareup.com/docs/build-basics/common-api-patterns/pagination).
    # @param location_id [String] Limit results to the location supplied. By default, results are returned
#  for all locations associated with the seller.
    # @param status [String] If provided, only refunds with the given status are returned.
#  For a list of refund status values, see [PaymentRefund](entity:PaymentRefund).
#  Default: If omitted, refunds are returned regardless of their status.
    # @param source_type [String] If provided, only returns refunds whose payments have the indicated source type.
#  Current values include `CARD`, `BANK_ACCOUNT`, `WALLET`, `CASH`, and `EXTERNAL`.
#  For information about these payment source types, see
#  [Take Payments](https://developer.squareup.com/docs/payments-api/take-payments).
#  Default: If omitted, refunds are returned regardless of the source type.
    # @param limit [Integer] The maximum number of results to be returned in a single page.
#  It is possible to receive fewer results than the specified limit on a given
#  page.
#  If the supplied value is greater than 100, no more than 100 results are
#  returned.
#  Default: 100
    # @param updated_at_begin_time [String] Indicates the start of the time range to retrieve each `PaymentRefund` for, in
#  RFC 3339
#  format.  The range is determined using the `updated_at` field for each
#  `PaymentRefund`.
#  Default: If omitted, the time range starts at `begin_time`.
    # @param updated_at_end_time [String] Indicates the end of the time range to retrieve each `PaymentRefund` for, in RFC
#  3339
#  format.  The range is determined using the `updated_at` field for each
#  `PaymentRefund`.
#  Default: The current time.
    # @param sort_field [SquareApiClient::ListPaymentRefundsRequestSortField] The field used to sort results by. The default is `CREATED_AT`.
    # @param request_options [SquareApiClient::RequestOptions] 
    # @return [SquareApiClient::ListPaymentRefundsResponse]
    # @example
#  api = SquareApiClient::Client.new(
#    base_url: "https://api.example.com",
#    environment: SquareApiClient::Environment::PRODUCTION,
#    token: "YOUR_AUTH_TOKEN",
#    version: "Version"
#  )
#  api.refunds.list
    def list(begin_time: nil, end_time: nil, sort_order: nil, cursor: nil, location_id: nil, status: nil, source_type: nil, limit: nil, updated_at_begin_time: nil, updated_at_end_time: nil, sort_field: nil, request_options: nil)
      response = @request_client.conn.get do | req |
  unless request_options&.timeout_in_seconds.nil?
    req.options.timeout = request_options.timeout_in_seconds
  end
  unless request_options&.token.nil?
    req.headers["Authorization"] = request_options.token
  end
  unless request_options&.version.nil?
    req.headers["Square-Version"] = request_options.version
  end
  req.headers = { **(req.headers || {}), **@request_client.get_headers, **(request_options&.additional_headers || {}) }.compact
  req.params = { **(request_options&.additional_query_parameters || {}), "begin_time": begin_time, "end_time": end_time, "sort_order": sort_order, "cursor": cursor, "location_id": location_id, "status": status, "source_type": source_type, "limit": limit, "updated_at_begin_time": updated_at_begin_time, "updated_at_end_time": updated_at_end_time, "sort_field": sort_field }.compact
  unless request_options.nil? || request_options&.additional_body_parameters.nil?
    req.body = { **(request_options&.additional_body_parameters || {}) }.compact
  end
  req.url "#{@request_client.get_url(request_options: request_options)}/v2/refunds"
end
      SquareApiClient::ListPaymentRefundsResponse.from_json(json_object: response.body)
    end
# Refunds a payment. You can refund the entire payment amount or a
#  portion of it. You can use this endpoint to refund a card payment or record a
#  refund of a cash or external payment. For more information, see
#  [Refund
#  Payment](https://developer.squareup.com/docs/payments-api/refund-payments).
    #
    # @param idempotency_key [String] A unique string that identifies this `RefundPayment` request. The key can be
#  any valid string
#  but must be unique for every `RefundPayment` request.
#  Keys are limited to a max of 45 characters - however, the number of allowed
#  characters might be
#  less than 45, if multi-byte characters are used.
#  For more information, see
#  Idempotency](https://developer.squareup.com/docs/working-with-apis/idempotency).
    # @param amount_money [Hash] The amount of money to refund.
#  This amount cannot be more than the `total_money` value of the payment minus the
#  total
#  amount of all previously completed refunds for this payment.
#  This amount must be specified in the smallest denomination of the applicable
#  currency
#  (for example, US dollar amounts are specified in cents). For more information,
#  see
#  [Working with Monetary
#  https://developer.squareup.com/docs/build-basics/working-with-monetary-amounts).
#  The currency code must match the currency associated with the business
#  that is charging the card.Request of type SquareApiClient::Money, as a Hash
    #   * :amount (Long) 
    #   * :currency (SquareApiClient::Currency) 
    # @param app_fee_money [Hash] The amount of money the developer contributes to help cover the refunded amount.
#  This amount is specified in the smallest denomination of the applicable currency
#  (for example,
#  US dollar amounts are specified in cents).
#  The value cannot be more than the `amount_money`.
#  You can specify this parameter in a refund request only if the same parameter
#  was also included
#  when taking the payment. This is part of the application fee scenario the API
#  supports. For more
#  information, see [Take Payments and Collect
#  ttps://developer.squareup.com/docs/payments-api/take-payments-and-collect-fees).
#  To set this field, `PAYMENTS_WRITE_ADDITIONAL_RECIPIENTS` OAuth permission is
#  required.
#  For more information, see
#  oper.squareup.com/docs/payments-api/take-payments-and-collect-fees#permissions).Request of type SquareApiClient::Money, as a Hash
    #   * :amount (Long) 
    #   * :currency (SquareApiClient::Currency) 
    # @param payment_id [String] The unique ID of the payment being refunded.
#  Required when unlinked=false, otherwise must not be set.
    # @param destination_id [String] The ID indicating where funds will be refunded to. Required for unlinked
#  refunds. For more
#  information, see [Process an Unlinked
#  Refund](https://developer.squareup.com/docs/refunds-api/unlinked-refunds).
#  For refunds linked to Square payments, `destination_id` is usually omitted; in
#  this case, funds
#  will be returned to the original payment source. The field may be specified in
#  order to request
#  a cross-method refund to a gift card. For more information,
#  see [Cross-method refunds to gift
#  areup.com/docs/payments-api/refund-payments#cross-method-refunds-to-gift-cards).
    # @param unlinked [Boolean] Indicates that the refund is not linked to a Square payment.
#  If set to true, `destination_id` and `location_id` must be supplied while
#  `payment_id` must not
#  be provided.
    # @param location_id [String] The location ID associated with the unlinked refund.
#  Required for requests specifying `unlinked=true`.
#  Otherwise, if included when `unlinked=false`, will throw an error.
    # @param customer_id [String] The [Customer](entity:Customer) ID of the customer associated with the refund.
#  This is required if the `destination_id` refers to a card on file created using
#  the Cards
#  API. Only allowed when `unlinked=true`.
    # @param reason [String] A description of the reason for the refund.
    # @param payment_version_token [String] Used for optimistic concurrency. This opaque token identifies the current
#  `Payment`
#  version that the caller expects. If the server has a different version of the
#  Payment,
#  the update fails and a response with a VERSION_MISMATCH error is returned.
#  If the versions match, or the field is not provided, the refund proceeds as
#  normal.
    # @param team_member_id [String] An optional [TeamMember](entity:TeamMember) ID to associate with this refund.
    # @param cash_details [Hash] Additional details required when recording an unlinked cash refund
#  (`destination_id` is CASH).Request of type SquareApiClient::DestinationDetailsCashRefundDetails, as a Hash
    #   * :seller_supplied_money (Hash)
    #     * :amount (Long) 
    #     * :currency (SquareApiClient::Currency) 
    #   * :change_back_money (Hash)
    #     * :amount (Long) 
    #     * :currency (SquareApiClient::Currency) 
    # @param external_details [Hash] Additional details required when recording an unlinked external refund
#  (`destination_id` is EXTERNAL).Request of type SquareApiClient::DestinationDetailsExternalRefundDetails, as a Hash
    #   * :type (String) 
    #   * :source (String) 
    #   * :source_id (String) 
    # @param request_options [SquareApiClient::RequestOptions] 
    # @return [SquareApiClient::RefundPaymentResponse]
    # @example
#  api = SquareApiClient::Client.new(
#    base_url: "https://api.example.com",
#    environment: SquareApiClient::Environment::PRODUCTION,
#    token: "YOUR_AUTH_TOKEN",
#    version: "Version"
#  )
#  api.refunds.refund_payment(
#    idempotency_key: "9b7f2dcf-49da-4411-b23e-a2d6af21333a",
#    amount_money: { amount: 1000, currency: USD },
#    app_fee_money: { amount: 10, currency: USD },
#    payment_id: "R2B3Z8WMVt3EAmzYWLZvz7Y69EbZY",
#    reason: "Example"
#  )
    def refund_payment(idempotency_key:, amount_money:, app_fee_money: nil, payment_id: nil, destination_id: nil, unlinked: nil, location_id: nil, customer_id: nil, reason: nil, payment_version_token: nil, team_member_id: nil, cash_details: nil, external_details: nil, request_options: nil)
      response = @request_client.conn.post do | req |
  unless request_options&.timeout_in_seconds.nil?
    req.options.timeout = request_options.timeout_in_seconds
  end
  unless request_options&.token.nil?
    req.headers["Authorization"] = request_options.token
  end
  unless request_options&.version.nil?
    req.headers["Square-Version"] = request_options.version
  end
  req.headers = { **(req.headers || {}), **@request_client.get_headers, **(request_options&.additional_headers || {}) }.compact
  unless request_options.nil? || request_options&.additional_query_parameters.nil?
    req.params = { **(request_options&.additional_query_parameters || {}) }.compact
  end
  req.body = { **(request_options&.additional_body_parameters || {}), idempotency_key: idempotency_key, amount_money: amount_money, app_fee_money: app_fee_money, payment_id: payment_id, destination_id: destination_id, unlinked: unlinked, location_id: location_id, customer_id: customer_id, reason: reason, payment_version_token: payment_version_token, team_member_id: team_member_id, cash_details: cash_details, external_details: external_details }.compact
  req.url "#{@request_client.get_url(request_options: request_options)}/v2/refunds"
end
      SquareApiClient::RefundPaymentResponse.from_json(json_object: response.body)
    end
# Retrieves a specific refund using the `refund_id`.
    #
    # @param refund_id [String] The unique ID for the desired `PaymentRefund`.
    # @param request_options [SquareApiClient::RequestOptions] 
    # @return [SquareApiClient::GetPaymentRefundResponse]
    # @example
#  api = SquareApiClient::Client.new(
#    base_url: "https://api.example.com",
#    environment: SquareApiClient::Environment::PRODUCTION,
#    token: "YOUR_AUTH_TOKEN",
#    version: "Version"
#  )
#  api.refunds.get(refund_id: "refund_id")
    def get(refund_id:, request_options: nil)
      response = @request_client.conn.get do | req |
  unless request_options&.timeout_in_seconds.nil?
    req.options.timeout = request_options.timeout_in_seconds
  end
  unless request_options&.token.nil?
    req.headers["Authorization"] = request_options.token
  end
  unless request_options&.version.nil?
    req.headers["Square-Version"] = request_options.version
  end
  req.headers = { **(req.headers || {}), **@request_client.get_headers, **(request_options&.additional_headers || {}) }.compact
  unless request_options.nil? || request_options&.additional_query_parameters.nil?
    req.params = { **(request_options&.additional_query_parameters || {}) }.compact
  end
  unless request_options.nil? || request_options&.additional_body_parameters.nil?
    req.body = { **(request_options&.additional_body_parameters || {}) }.compact
  end
  req.url "#{@request_client.get_url(request_options: request_options)}/v2/refunds/#{refund_id}"
end
      SquareApiClient::GetPaymentRefundResponse.from_json(json_object: response.body)
    end
  end
  class AsyncRefundsClient
  # @return [SquareApiClient::AsyncRequestClient] 
    attr_reader :request_client


    # @param request_client [SquareApiClient::RequestClient] 
    # @return [SquareApiClient::AsyncRefundsClient]
    def initialize(request_client:)
      @request_client = request_client
    end
# Retrieves a list of refunds for the account making the request.
#  Results are eventually consistent, and new refunds or changes to refunds might
#  take several
#  seconds to appear.
#  The maximum results per page is 100.
    #
    # @param begin_time [String] Indicates the start of the time range to retrieve each `PaymentRefund` for, in
#  RFC 3339
#  format.  The range is determined using the `created_at` field for each
#  `PaymentRefund`.
#  Default: The current time minus one year.
    # @param end_time [String] Indicates the end of the time range to retrieve each `PaymentRefund` for, in RFC
#  3339
#  format.  The range is determined using the `created_at` field for each
#  `PaymentRefund`.
#  Default: The current time.
    # @param sort_order [String] The order in which results are listed by `PaymentRefund.created_at`:
#  - `ASC` - Oldest to newest.
#  - `DESC` - Newest to oldest (default).
    # @param cursor [String] A pagination cursor returned by a previous call to this endpoint.
#  Provide this cursor to retrieve the next set of results for the original query.
#  For more information, see
#  ttps://developer.squareup.com/docs/build-basics/common-api-patterns/pagination).
    # @param location_id [String] Limit results to the location supplied. By default, results are returned
#  for all locations associated with the seller.
    # @param status [String] If provided, only refunds with the given status are returned.
#  For a list of refund status values, see [PaymentRefund](entity:PaymentRefund).
#  Default: If omitted, refunds are returned regardless of their status.
    # @param source_type [String] If provided, only returns refunds whose payments have the indicated source type.
#  Current values include `CARD`, `BANK_ACCOUNT`, `WALLET`, `CASH`, and `EXTERNAL`.
#  For information about these payment source types, see
#  [Take Payments](https://developer.squareup.com/docs/payments-api/take-payments).
#  Default: If omitted, refunds are returned regardless of the source type.
    # @param limit [Integer] The maximum number of results to be returned in a single page.
#  It is possible to receive fewer results than the specified limit on a given
#  page.
#  If the supplied value is greater than 100, no more than 100 results are
#  returned.
#  Default: 100
    # @param updated_at_begin_time [String] Indicates the start of the time range to retrieve each `PaymentRefund` for, in
#  RFC 3339
#  format.  The range is determined using the `updated_at` field for each
#  `PaymentRefund`.
#  Default: If omitted, the time range starts at `begin_time`.
    # @param updated_at_end_time [String] Indicates the end of the time range to retrieve each `PaymentRefund` for, in RFC
#  3339
#  format.  The range is determined using the `updated_at` field for each
#  `PaymentRefund`.
#  Default: The current time.
    # @param sort_field [SquareApiClient::ListPaymentRefundsRequestSortField] The field used to sort results by. The default is `CREATED_AT`.
    # @param request_options [SquareApiClient::RequestOptions] 
    # @return [SquareApiClient::ListPaymentRefundsResponse]
    # @example
#  api = SquareApiClient::Client.new(
#    base_url: "https://api.example.com",
#    environment: SquareApiClient::Environment::PRODUCTION,
#    token: "YOUR_AUTH_TOKEN",
#    version: "Version"
#  )
#  api.refunds.list
    def list(begin_time: nil, end_time: nil, sort_order: nil, cursor: nil, location_id: nil, status: nil, source_type: nil, limit: nil, updated_at_begin_time: nil, updated_at_end_time: nil, sort_field: nil, request_options: nil)
      Async do
        response = @request_client.conn.get do | req |
  unless request_options&.timeout_in_seconds.nil?
    req.options.timeout = request_options.timeout_in_seconds
  end
  unless request_options&.token.nil?
    req.headers["Authorization"] = request_options.token
  end
  unless request_options&.version.nil?
    req.headers["Square-Version"] = request_options.version
  end
  req.headers = { **(req.headers || {}), **@request_client.get_headers, **(request_options&.additional_headers || {}) }.compact
  req.params = { **(request_options&.additional_query_parameters || {}), "begin_time": begin_time, "end_time": end_time, "sort_order": sort_order, "cursor": cursor, "location_id": location_id, "status": status, "source_type": source_type, "limit": limit, "updated_at_begin_time": updated_at_begin_time, "updated_at_end_time": updated_at_end_time, "sort_field": sort_field }.compact
  unless request_options.nil? || request_options&.additional_body_parameters.nil?
    req.body = { **(request_options&.additional_body_parameters || {}) }.compact
  end
  req.url "#{@request_client.get_url(request_options: request_options)}/v2/refunds"
end
        SquareApiClient::ListPaymentRefundsResponse.from_json(json_object: response.body)
      end
    end
# Refunds a payment. You can refund the entire payment amount or a
#  portion of it. You can use this endpoint to refund a card payment or record a
#  refund of a cash or external payment. For more information, see
#  [Refund
#  Payment](https://developer.squareup.com/docs/payments-api/refund-payments).
    #
    # @param idempotency_key [String] A unique string that identifies this `RefundPayment` request. The key can be
#  any valid string
#  but must be unique for every `RefundPayment` request.
#  Keys are limited to a max of 45 characters - however, the number of allowed
#  characters might be
#  less than 45, if multi-byte characters are used.
#  For more information, see
#  Idempotency](https://developer.squareup.com/docs/working-with-apis/idempotency).
    # @param amount_money [Hash] The amount of money to refund.
#  This amount cannot be more than the `total_money` value of the payment minus the
#  total
#  amount of all previously completed refunds for this payment.
#  This amount must be specified in the smallest denomination of the applicable
#  currency
#  (for example, US dollar amounts are specified in cents). For more information,
#  see
#  [Working with Monetary
#  https://developer.squareup.com/docs/build-basics/working-with-monetary-amounts).
#  The currency code must match the currency associated with the business
#  that is charging the card.Request of type SquareApiClient::Money, as a Hash
    #   * :amount (Long) 
    #   * :currency (SquareApiClient::Currency) 
    # @param app_fee_money [Hash] The amount of money the developer contributes to help cover the refunded amount.
#  This amount is specified in the smallest denomination of the applicable currency
#  (for example,
#  US dollar amounts are specified in cents).
#  The value cannot be more than the `amount_money`.
#  You can specify this parameter in a refund request only if the same parameter
#  was also included
#  when taking the payment. This is part of the application fee scenario the API
#  supports. For more
#  information, see [Take Payments and Collect
#  ttps://developer.squareup.com/docs/payments-api/take-payments-and-collect-fees).
#  To set this field, `PAYMENTS_WRITE_ADDITIONAL_RECIPIENTS` OAuth permission is
#  required.
#  For more information, see
#  oper.squareup.com/docs/payments-api/take-payments-and-collect-fees#permissions).Request of type SquareApiClient::Money, as a Hash
    #   * :amount (Long) 
    #   * :currency (SquareApiClient::Currency) 
    # @param payment_id [String] The unique ID of the payment being refunded.
#  Required when unlinked=false, otherwise must not be set.
    # @param destination_id [String] The ID indicating where funds will be refunded to. Required for unlinked
#  refunds. For more
#  information, see [Process an Unlinked
#  Refund](https://developer.squareup.com/docs/refunds-api/unlinked-refunds).
#  For refunds linked to Square payments, `destination_id` is usually omitted; in
#  this case, funds
#  will be returned to the original payment source. The field may be specified in
#  order to request
#  a cross-method refund to a gift card. For more information,
#  see [Cross-method refunds to gift
#  areup.com/docs/payments-api/refund-payments#cross-method-refunds-to-gift-cards).
    # @param unlinked [Boolean] Indicates that the refund is not linked to a Square payment.
#  If set to true, `destination_id` and `location_id` must be supplied while
#  `payment_id` must not
#  be provided.
    # @param location_id [String] The location ID associated with the unlinked refund.
#  Required for requests specifying `unlinked=true`.
#  Otherwise, if included when `unlinked=false`, will throw an error.
    # @param customer_id [String] The [Customer](entity:Customer) ID of the customer associated with the refund.
#  This is required if the `destination_id` refers to a card on file created using
#  the Cards
#  API. Only allowed when `unlinked=true`.
    # @param reason [String] A description of the reason for the refund.
    # @param payment_version_token [String] Used for optimistic concurrency. This opaque token identifies the current
#  `Payment`
#  version that the caller expects. If the server has a different version of the
#  Payment,
#  the update fails and a response with a VERSION_MISMATCH error is returned.
#  If the versions match, or the field is not provided, the refund proceeds as
#  normal.
    # @param team_member_id [String] An optional [TeamMember](entity:TeamMember) ID to associate with this refund.
    # @param cash_details [Hash] Additional details required when recording an unlinked cash refund
#  (`destination_id` is CASH).Request of type SquareApiClient::DestinationDetailsCashRefundDetails, as a Hash
    #   * :seller_supplied_money (Hash)
    #     * :amount (Long) 
    #     * :currency (SquareApiClient::Currency) 
    #   * :change_back_money (Hash)
    #     * :amount (Long) 
    #     * :currency (SquareApiClient::Currency) 
    # @param external_details [Hash] Additional details required when recording an unlinked external refund
#  (`destination_id` is EXTERNAL).Request of type SquareApiClient::DestinationDetailsExternalRefundDetails, as a Hash
    #   * :type (String) 
    #   * :source (String) 
    #   * :source_id (String) 
    # @param request_options [SquareApiClient::RequestOptions] 
    # @return [SquareApiClient::RefundPaymentResponse]
    # @example
#  api = SquareApiClient::Client.new(
#    base_url: "https://api.example.com",
#    environment: SquareApiClient::Environment::PRODUCTION,
#    token: "YOUR_AUTH_TOKEN",
#    version: "Version"
#  )
#  api.refunds.refund_payment(
#    idempotency_key: "9b7f2dcf-49da-4411-b23e-a2d6af21333a",
#    amount_money: { amount: 1000, currency: USD },
#    app_fee_money: { amount: 10, currency: USD },
#    payment_id: "R2B3Z8WMVt3EAmzYWLZvz7Y69EbZY",
#    reason: "Example"
#  )
    def refund_payment(idempotency_key:, amount_money:, app_fee_money: nil, payment_id: nil, destination_id: nil, unlinked: nil, location_id: nil, customer_id: nil, reason: nil, payment_version_token: nil, team_member_id: nil, cash_details: nil, external_details: nil, request_options: nil)
      Async do
        response = @request_client.conn.post do | req |
  unless request_options&.timeout_in_seconds.nil?
    req.options.timeout = request_options.timeout_in_seconds
  end
  unless request_options&.token.nil?
    req.headers["Authorization"] = request_options.token
  end
  unless request_options&.version.nil?
    req.headers["Square-Version"] = request_options.version
  end
  req.headers = { **(req.headers || {}), **@request_client.get_headers, **(request_options&.additional_headers || {}) }.compact
  unless request_options.nil? || request_options&.additional_query_parameters.nil?
    req.params = { **(request_options&.additional_query_parameters || {}) }.compact
  end
  req.body = { **(request_options&.additional_body_parameters || {}), idempotency_key: idempotency_key, amount_money: amount_money, app_fee_money: app_fee_money, payment_id: payment_id, destination_id: destination_id, unlinked: unlinked, location_id: location_id, customer_id: customer_id, reason: reason, payment_version_token: payment_version_token, team_member_id: team_member_id, cash_details: cash_details, external_details: external_details }.compact
  req.url "#{@request_client.get_url(request_options: request_options)}/v2/refunds"
end
        SquareApiClient::RefundPaymentResponse.from_json(json_object: response.body)
      end
    end
# Retrieves a specific refund using the `refund_id`.
    #
    # @param refund_id [String] The unique ID for the desired `PaymentRefund`.
    # @param request_options [SquareApiClient::RequestOptions] 
    # @return [SquareApiClient::GetPaymentRefundResponse]
    # @example
#  api = SquareApiClient::Client.new(
#    base_url: "https://api.example.com",
#    environment: SquareApiClient::Environment::PRODUCTION,
#    token: "YOUR_AUTH_TOKEN",
#    version: "Version"
#  )
#  api.refunds.get(refund_id: "refund_id")
    def get(refund_id:, request_options: nil)
      Async do
        response = @request_client.conn.get do | req |
  unless request_options&.timeout_in_seconds.nil?
    req.options.timeout = request_options.timeout_in_seconds
  end
  unless request_options&.token.nil?
    req.headers["Authorization"] = request_options.token
  end
  unless request_options&.version.nil?
    req.headers["Square-Version"] = request_options.version
  end
  req.headers = { **(req.headers || {}), **@request_client.get_headers, **(request_options&.additional_headers || {}) }.compact
  unless request_options.nil? || request_options&.additional_query_parameters.nil?
    req.params = { **(request_options&.additional_query_parameters || {}) }.compact
  end
  unless request_options.nil? || request_options&.additional_body_parameters.nil?
    req.body = { **(request_options&.additional_body_parameters || {}) }.compact
  end
  req.url "#{@request_client.get_url(request_options: request_options)}/v2/refunds/#{refund_id}"
end
        SquareApiClient::GetPaymentRefundResponse.from_json(json_object: response.body)
      end
    end
  end
end