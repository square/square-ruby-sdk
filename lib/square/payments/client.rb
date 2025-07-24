# frozen_string_literal: true
require_relative "../../requests"
require_relative "../types/list_payments_request_sort_field"
require_relative "../types/list_payments_response"
require_relative "../types/money"
require_relative "../types/address"
require_relative "../types/cash_payment_details"
require_relative "../types/external_payment_details"
require_relative "../types/customer_details"
require_relative "../types/offline_payment_details"
require_relative "../types/create_payment_response"
require_relative "../types/cancel_payment_by_idempotency_key_response"
require_relative "../types/get_payment_response"
require_relative "../types/payment"
require_relative "../types/update_payment_response"
require_relative "../types/cancel_payment_response"
require_relative "../types/complete_payment_response"
require "async"
require "async"
require "async"
require "async"
require "async"
require "async"
require "async"
require_relative "../../requests"

module square.rb
  class PaymentsClient
  # @return [square.rb::RequestClient] 
    attr_reader :request_client


    # @param request_client [square.rb::RequestClient] 
    # @return [square.rb::PaymentsClient]
    def initialize(request_client:)
      @request_client = request_client
    end
# Retrieves a list of payments taken by the account making the request.
#  Results are eventually consistent, and new payments or changes to payments might
#  take several
#  seconds to appear.
#  The maximum results per page is 100.
    #
    # @param begin_time [String] Indicates the start of the time range to retrieve payments for, in RFC 3339
#  format.
#  The range is determined using the `created_at` field for each Payment.
#  Inclusive. Default: The current time minus one year.
    # @param end_time [String] Indicates the end of the time range to retrieve payments for, in RFC 3339
#  format.  The
#  range is determined using the `created_at` field for each Payment.
#  Default: The current time.
    # @param sort_order [String] The order in which results are listed by `ListPaymentsRequest.sort_field`:
#  - `ASC` - Oldest to newest.
#  - `DESC` - Newest to oldest (default).
    # @param cursor [String] A pagination cursor returned by a previous call to this endpoint.
#  Provide this cursor to retrieve the next set of results for the original query.
#  For more information, see
#  ttps://developer.squareup.com/docs/build-basics/common-api-patterns/pagination).
    # @param location_id [String] Limit results to the location supplied. By default, results are returned
#  for the default (main) location associated with the seller.
    # @param total [Long] The exact amount in the `total_money` for a payment.
    # @param last_4 [String] The last four digits of a payment card.
    # @param card_brand [String] The brand of the payment card (for example, VISA).
    # @param limit [Integer] The maximum number of results to be returned in a single page.
#  It is possible to receive fewer results than the specified limit on a given
#  page.
#  The default value of 100 is also the maximum allowed value. If the provided
#  value is
#  greater than 100, it is ignored and the default value is used instead.
#  Default: `100`
    # @param is_offline_payment [Boolean] Whether the payment was taken offline or not.
    # @param offline_begin_time [String] Indicates the start of the time range for which to retrieve offline payments, in
#  RFC 3339
#  format for timestamps. The range is determined using the
#  `offline_payment_details.client_created_at` field for each Payment. If set,
#  payments without a
#  value set in `offline_payment_details.client_created_at` will not be returned.
#  Default: The current time.
    # @param offline_end_time [String] Indicates the end of the time range for which to retrieve offline payments, in
#  RFC 3339
#  format for timestamps. The range is determined using the
#  `offline_payment_details.client_created_at` field for each Payment. If set,
#  payments without a
#  value set in `offline_payment_details.client_created_at` will not be returned.
#  Default: The current time.
    # @param updated_at_begin_time [String] Indicates the start of the time range to retrieve payments for, in RFC 3339
#  format.  The
#  range is determined using the `updated_at` field for each Payment.
    # @param updated_at_end_time [String] Indicates the end of the time range to retrieve payments for, in RFC 3339
#  format.  The
#  range is determined using the `updated_at` field for each Payment.
    # @param sort_field [square.rb::ListPaymentsRequestSortField] The field used to sort results by. The default is `CREATED_AT`.
    # @param request_options [square.rb::RequestOptions] 
    # @return [square.rb::ListPaymentsResponse]
    # @example
#  api = square.rb::Client.new(
#    base_url: "https://api.example.com",
#    environment: square.rb::Environment::PRODUCTION,
#    token: "YOUR_AUTH_TOKEN",
#    version: "Version"
#  )
#  api.payments.list
    def list(begin_time: nil, end_time: nil, sort_order: nil, cursor: nil, location_id: nil, total: nil, last_4: nil, card_brand: nil, limit: nil, is_offline_payment: nil, offline_begin_time: nil, offline_end_time: nil, updated_at_begin_time: nil, updated_at_end_time: nil, sort_field: nil, request_options: nil)
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
  req.params = { **(request_options&.additional_query_parameters || {}), "begin_time": begin_time, "end_time": end_time, "sort_order": sort_order, "cursor": cursor, "location_id": location_id, "total": total, "last_4": last_4, "card_brand": card_brand, "limit": limit, "is_offline_payment": is_offline_payment, "offline_begin_time": offline_begin_time, "offline_end_time": offline_end_time, "updated_at_begin_time": updated_at_begin_time, "updated_at_end_time": updated_at_end_time, "sort_field": sort_field }.compact
  unless request_options.nil? || request_options&.additional_body_parameters.nil?
    req.body = { **(request_options&.additional_body_parameters || {}) }.compact
  end
  req.url "#{@request_client.get_url(request_options: request_options)}/v2/payments"
end
      square.rb::ListPaymentsResponse.from_json(json_object: response.body)
    end
# Creates a payment using the provided source. You can use this endpoint
#  to charge a card (credit/debit card or
#  Square gift card) or record a payment that the seller received outside of Square
#  (cash payment from a buyer or a payment that an external entity
#  processed on behalf of the seller).
#  The endpoint creates a
#  `Payment` object and returns it in the response.
    #
    # @param source_id [String] The ID for the source of funds for this payment.
#  This could be a payment token generated by the Web Payments SDK for any of its
#  [supported
#  ps://developer.squareup.com/docs/web-payments/overview#explore-payment-methods),
#  including cards, bank transfers, Afterpay or Cash App Pay. If recording a
#  payment
#  that the seller received outside of Square, specify either "CASH" or "EXTERNAL".
#  For more information, see
#  [Take Payments](https://developer.squareup.com/docs/payments-api/take-payments).
    # @param idempotency_key [String] A unique string that identifies this `CreatePayment` request. Keys can be any
#  valid string
#  but must be unique for every `CreatePayment` request.
#  Note: The number of allowed characters might be less than the stated maximum, if
#  multi-byte
#  characters are used.
#  For more information, see
#  Idempotency](https://developer.squareup.com/docs/working-with-apis/idempotency).
    # @param amount_money [Hash] The amount of money to accept for this payment, not including `tip_money`.
#  The amount must be specified in the smallest denomination of the applicable
#  currency
#  (for example, US dollar amounts are specified in cents). For more information,
#  see
#  [Working with Monetary
#  https://developer.squareup.com/docs/build-basics/working-with-monetary-amounts).
#  The currency code must match the currency associated with the business
#  that is accepting the payment.Request of type square.rb::Money, as a Hash
    #   * :amount (Long) 
    #   * :currency (square.rb::Currency) 
    # @param tip_money [Hash] The amount designated as a tip, in addition to `amount_money`.
#  The amount must be specified in the smallest denomination of the applicable
#  currency
#  (for example, US dollar amounts are specified in cents). For more information,
#  see
#  [Working with Monetary
#  https://developer.squareup.com/docs/build-basics/working-with-monetary-amounts).
#  The currency code must match the currency associated with the business
#  that is accepting the payment.Request of type square.rb::Money, as a Hash
    #   * :amount (Long) 
    #   * :currency (square.rb::Currency) 
    # @param app_fee_money [Hash] The amount of money that the developer is taking as a fee
#  for facilitating the payment on behalf of the seller.
#  The amount cannot be more than 90% of the total amount of the payment.
#  The amount must be specified in the smallest denomination of the applicable
#  currency
#  (for example, US dollar amounts are specified in cents). For more information,
#  see
#  [Working with Monetary
#  https://developer.squareup.com/docs/build-basics/working-with-monetary-amounts).
#  The fee currency code must match the currency associated with the seller
#  that is accepting the payment. The application must be from a developer
#  account in the same country and using the same currency code as the seller.
#  For more information about the application fee scenario, see
#  [Take Payments and Collect
#  ttps://developer.squareup.com/docs/payments-api/take-payments-and-collect-fees).
#  To set this field, `PAYMENTS_WRITE_ADDITIONAL_RECIPIENTS` OAuth permission is
#  required.
#  For more information, see
#  oper.squareup.com/docs/payments-api/take-payments-and-collect-fees#permissions).Request of type square.rb::Money, as a Hash
    #   * :amount (Long) 
    #   * :currency (square.rb::Currency) 
    # @param delay_duration [String] The duration of time after the payment's creation when Square automatically
#  either completes or cancels the payment depending on the `delay_action` field
#  value.
#  For more information, see
#  [Time
#  m/docs/payments-api/take-payments/card-payments/delayed-capture#time-threshold).
#  This parameter should be specified as a time duration, in RFC 3339 format.
#  Note: This feature is only supported for card payments. This parameter can only
#  be set for a delayed
#  capture payment (`autocomplete=false`).
#  Default:
#  - Card-present payments: "PT36H" (36 hours) from the creation time.
#  - Card-not-present payments: "P7D" (7 days) from the creation time.
    # @param delay_action [String] The action to be applied to the payment when the `delay_duration` has elapsed.
#  The action must be
#  CANCEL or COMPLETE. For more information, see
#  [Time
#  m/docs/payments-api/take-payments/card-payments/delayed-capture#time-threshold).
#  Default: CANCEL
    # @param autocomplete [Boolean] If set to `true`, this payment will be completed when possible. If
#  set to `false`, this payment is held in an approved state until either
#  explicitly completed (captured) or canceled (voided). For more information, see
#  [Delayed
#  ocs/payments-api/take-payments/card-payments#delayed-capture-of-a-card-payment).
#  Default: true
    # @param order_id [String] Associates a previously created order with this payment.
    # @param customer_id [String] The [Customer](entity:Customer) ID of the customer associated with the payment.
#  This is required if the `source_id` refers to a card on file created using the
#  Cards API.
    # @param location_id [String] The location ID to associate with the payment. If not specified, the [main
#  tion](https://developer.squareup.com/docs/locations-api#about-the-main-location)
#  is
#  used.
    # @param team_member_id [String] An optional [TeamMember](entity:TeamMember) ID to associate with
#  this payment.
    # @param reference_id [String] A user-defined ID to associate with the payment.
#  You can use this field to associate the payment to an entity in an external
#  system
#  (for example, you might specify an order ID that is generated by a third-party
#  shopping cart).
    # @param verification_token [String] An identifying token generated by
#  squareup.com/reference/sdks/web/payments/objects/Payments#Payments.verifyBuyer).
#  Verification tokens encapsulate customer device information and 3-D Secure
#  challenge results to indicate that Square has verified the buyer identity.
#  For more information, see [SCA
#  Overview](https://developer.squareup.com/docs/sca-overview).
    # @param accept_partial_authorization [Boolean] If set to `true` and charging a Square Gift Card, a payment might be returned
#  with
#  `amount_money` equal to less than what was requested. For example, a request for
#  $20 when charging
#  a Square Gift Card with a balance of $5 results in an APPROVED payment of $5.
#  You might choose
#  to prompt the buyer for an additional payment to cover the remainder or cancel
#  the Gift Card
#  payment. This field cannot be `true` when `autocomplete = true`.
#  For more information, see
#  [Partial amount with Square Gift
#  veloper.squareup.com/docs/payments-api/take-payments#partial-payment-gift-card).
#  Default: false
    # @param buyer_email_address [String] The buyer's email address.
    # @param buyer_phone_number [String] The buyer's phone number.
#  Must follow the following format:
#  1. A leading + symbol (followed by a country code)
#  2. The phone number can contain spaces and the special characters `(` , `)` ,
#  `-` , and `.`.
#  Alphabetical characters aren't allowed.
#  3. The phone number must contain between 9 and 16 digits.
    # @param billing_address [Hash] The buyer's billing address.Request of type square.rb::Address, as a Hash
    #   * :address_line_1 (String) 
    #   * :address_line_2 (String) 
    #   * :address_line_3 (String) 
    #   * :locality (String) 
    #   * :sublocality (String) 
    #   * :sublocality_2 (String) 
    #   * :sublocality_3 (String) 
    #   * :administrative_district_level_1 (String) 
    #   * :administrative_district_level_2 (String) 
    #   * :administrative_district_level_3 (String) 
    #   * :postal_code (String) 
    #   * :country (square.rb::Country) 
    #   * :first_name (String) 
    #   * :last_name (String) 
    # @param shipping_address [Hash] The buyer's shipping address.Request of type square.rb::Address, as a Hash
    #   * :address_line_1 (String) 
    #   * :address_line_2 (String) 
    #   * :address_line_3 (String) 
    #   * :locality (String) 
    #   * :sublocality (String) 
    #   * :sublocality_2 (String) 
    #   * :sublocality_3 (String) 
    #   * :administrative_district_level_1 (String) 
    #   * :administrative_district_level_2 (String) 
    #   * :administrative_district_level_3 (String) 
    #   * :postal_code (String) 
    #   * :country (square.rb::Country) 
    #   * :first_name (String) 
    #   * :last_name (String) 
    # @param note [String] An optional note to be entered by the developer when creating a payment.
    # @param statement_description_identifier [String] Optional additional payment information to include on the customer's card
#  statement
#  as part of the statement description. This can be, for example, an invoice
#  number, ticket number,
#  or short description that uniquely identifies the purchase.
#  Note that the `statement_description_identifier` might get truncated on the
#  statement description
#  to fit the required information including the Square identifier (SQ *) and name
#  of the
#  seller taking the payment.
    # @param cash_details [Hash] Additional details required when recording a cash payment (`source_id` is CASH).Request of type square.rb::CashPaymentDetails, as a Hash
    #   * :buyer_supplied_money (Hash)
    #     * :amount (Long) 
    #     * :currency (square.rb::Currency) 
    #   * :change_back_money (Hash)
    #     * :amount (Long) 
    #     * :currency (square.rb::Currency) 
    # @param external_details [Hash] Additional details required when recording an external payment (`source_id` is
#  EXTERNAL).Request of type square.rb::ExternalPaymentDetails, as a Hash
    #   * :type (String) 
    #   * :source (String) 
    #   * :source_id (String) 
    #   * :source_fee_money (Hash)
    #     * :amount (Long) 
    #     * :currency (square.rb::Currency) 
    # @param customer_details [Hash] Details about the customer making the payment.Request of type square.rb::CustomerDetails, as a Hash
    #   * :customer_initiated (Boolean) 
    #   * :seller_keyed_in (Boolean) 
    # @param offline_payment_details [Hash] An optional field for specifying the offline payment details. This is intended
#  for
#  internal 1st-party callers only.Request of type square.rb::OfflinePaymentDetails, as a Hash
    #   * :client_created_at (String) 
    # @param request_options [square.rb::RequestOptions] 
    # @return [square.rb::CreatePaymentResponse]
    # @example
#  api = square.rb::Client.new(
#    base_url: "https://api.example.com",
#    environment: square.rb::Environment::PRODUCTION,
#    token: "YOUR_AUTH_TOKEN",
#    version: "Version"
#  )
#  api.payments.create(
#    source_id: "ccof:GaJGNaZa8x4OgDJn4GB",
#    idempotency_key: "7b0f3ec5-086a-4871-8f13-3c81b3875218",
#    amount_money: { amount: 1000, currency: USD },
#    app_fee_money: { amount: 10, currency: USD },
#    autocomplete: true,
#    customer_id: "W92WH6P11H4Z77CTET0RNTGFW8",
#    location_id: "L88917AVBK2S5",
#    reference_id: "123456",
#    note: "Brief description"
#  )
    def create(source_id:, idempotency_key:, amount_money: nil, tip_money: nil, app_fee_money: nil, delay_duration: nil, delay_action: nil, autocomplete: nil, order_id: nil, customer_id: nil, location_id: nil, team_member_id: nil, reference_id: nil, verification_token: nil, accept_partial_authorization: nil, buyer_email_address: nil, buyer_phone_number: nil, billing_address: nil, shipping_address: nil, note: nil, statement_description_identifier: nil, cash_details: nil, external_details: nil, customer_details: nil, offline_payment_details: nil, request_options: nil)
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
  req.body = { **(request_options&.additional_body_parameters || {}), source_id: source_id, idempotency_key: idempotency_key, amount_money: amount_money, tip_money: tip_money, app_fee_money: app_fee_money, delay_duration: delay_duration, delay_action: delay_action, autocomplete: autocomplete, order_id: order_id, customer_id: customer_id, location_id: location_id, team_member_id: team_member_id, reference_id: reference_id, verification_token: verification_token, accept_partial_authorization: accept_partial_authorization, buyer_email_address: buyer_email_address, buyer_phone_number: buyer_phone_number, billing_address: billing_address, shipping_address: shipping_address, note: note, statement_description_identifier: statement_description_identifier, cash_details: cash_details, external_details: external_details, customer_details: customer_details, offline_payment_details: offline_payment_details }.compact
  req.url "#{@request_client.get_url(request_options: request_options)}/v2/payments"
end
      square.rb::CreatePaymentResponse.from_json(json_object: response.body)
    end
# Cancels (voids) a payment identified by the idempotency key that is specified in
#  the
#  request.
#  Use this method when the status of a `CreatePayment` request is unknown (for
#  example, after you send a
#  `CreatePayment` request, a network error occurs and you do not get a response).
#  In this case, you can
#  direct Square to cancel the payment using this endpoint. In the request, you
#  provide the same
#  idempotency key that you provided in your `CreatePayment` request that you want
#  to cancel. After
#  canceling the payment, you can submit your `CreatePayment` request again.
#  Note that if no payment with the specified idempotency key is found, no action
#  is taken and the endpoint
#  returns successfully.
    #
    # @param idempotency_key [String] The `idempotency_key` identifying the payment to be canceled.
    # @param request_options [square.rb::RequestOptions] 
    # @return [square.rb::CancelPaymentByIdempotencyKeyResponse]
    # @example
#  api = square.rb::Client.new(
#    base_url: "https://api.example.com",
#    environment: square.rb::Environment::PRODUCTION,
#    token: "YOUR_AUTH_TOKEN",
#    version: "Version"
#  )
#  api.payments.cancel_by_idempotency_key(idempotency_key: "a7e36d40-d24b-11e8-b568-0800200c9a66")
    def cancel_by_idempotency_key(idempotency_key:, request_options: nil)
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
  req.body = { **(request_options&.additional_body_parameters || {}), idempotency_key: idempotency_key }.compact
  req.url "#{@request_client.get_url(request_options: request_options)}/v2/payments/cancel"
end
      square.rb::CancelPaymentByIdempotencyKeyResponse.from_json(json_object: response.body)
    end
# Retrieves details for a specific payment.
    #
    # @param payment_id [String] A unique ID for the desired payment.
    # @param request_options [square.rb::RequestOptions] 
    # @return [square.rb::GetPaymentResponse]
    # @example
#  api = square.rb::Client.new(
#    base_url: "https://api.example.com",
#    environment: square.rb::Environment::PRODUCTION,
#    token: "YOUR_AUTH_TOKEN",
#    version: "Version"
#  )
#  api.payments.get(payment_id: "payment_id")
    def get(payment_id:, request_options: nil)
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
  req.url "#{@request_client.get_url(request_options: request_options)}/v2/payments/#{payment_id}"
end
      square.rb::GetPaymentResponse.from_json(json_object: response.body)
    end
# Updates a payment with the APPROVED status.
#  You can update the `amount_money` and `tip_money` using this endpoint.
    #
    # @param payment_id [String] The ID of the payment to update.
    # @param payment [Hash] The updated `Payment` object.Request of type square.rb::Payment, as a Hash
    #   * :id (String) 
    #   * :created_at (String) 
    #   * :updated_at (String) 
    #   * :amount_money (Hash)
    #     * :amount (Long) 
    #     * :currency (square.rb::Currency) 
    #   * :tip_money (Hash)
    #     * :amount (Long) 
    #     * :currency (square.rb::Currency) 
    #   * :total_money (Hash)
    #     * :amount (Long) 
    #     * :currency (square.rb::Currency) 
    #   * :app_fee_money (Hash)
    #     * :amount (Long) 
    #     * :currency (square.rb::Currency) 
    #   * :approved_money (Hash)
    #     * :amount (Long) 
    #     * :currency (square.rb::Currency) 
    #   * :processing_fee (Array<square.rb::ProcessingFee>) 
    #   * :refunded_money (Hash)
    #     * :amount (Long) 
    #     * :currency (square.rb::Currency) 
    #   * :status (String) 
    #   * :delay_duration (String) 
    #   * :delay_action (String) 
    #   * :delayed_until (String) 
    #   * :source_type (String) 
    #   * :card_details (Hash)
    #     * :status (String) 
    #     * :card (Hash)
    #       * :id (String) 
    #       * :card_brand (square.rb::CardBrand) 
    #       * :last_4 (String) 
    #       * :exp_month (Long) 
    #       * :exp_year (Long) 
    #       * :cardholder_name (String) 
    #       * :billing_address (Hash)
    #         * :address_line_1 (String) 
    #         * :address_line_2 (String) 
    #         * :address_line_3 (String) 
    #         * :locality (String) 
    #         * :sublocality (String) 
    #         * :sublocality_2 (String) 
    #         * :sublocality_3 (String) 
    #         * :administrative_district_level_1 (String) 
    #         * :administrative_district_level_2 (String) 
    #         * :administrative_district_level_3 (String) 
    #         * :postal_code (String) 
    #         * :country (square.rb::Country) 
    #         * :first_name (String) 
    #         * :last_name (String) 
    #       * :fingerprint (String) 
    #       * :customer_id (String) 
    #       * :merchant_id (String) 
    #       * :reference_id (String) 
    #       * :enabled (Boolean) 
    #       * :card_type (square.rb::CardType) 
    #       * :prepaid_type (square.rb::CardPrepaidType) 
    #       * :bin (String) 
    #       * :version (Long) 
    #       * :card_co_brand (square.rb::CardCoBrand) 
    #       * :issuer_alert (square.rb::CARD_ISSUER_ALERT) 
    #       * :issuer_alert_at (String) 
    #       * :hsa_fsa (Boolean) 
    #     * :entry_method (String) 
    #     * :cvv_status (String) 
    #     * :avs_status (String) 
    #     * :auth_result_code (String) 
    #     * :application_identifier (String) 
    #     * :application_name (String) 
    #     * :application_cryptogram (String) 
    #     * :verification_method (String) 
    #     * :verification_results (String) 
    #     * :statement_description (String) 
    #     * :device_details (Hash)
    #       * :device_id (String) 
    #       * :device_installation_id (String) 
    #       * :device_name (String) 
    #     * :card_payment_timeline (Hash)
    #       * :authorized_at (String) 
    #       * :captured_at (String) 
    #       * :voided_at (String) 
    #     * :refund_requires_card_presence (Boolean) 
    #     * :errors (Array<square.rb::Error>) 
    #   * :cash_details (Hash)
    #     * :buyer_supplied_money (Hash)
    #       * :amount (Long) 
    #       * :currency (square.rb::Currency) 
    #     * :change_back_money (Hash)
    #       * :amount (Long) 
    #       * :currency (square.rb::Currency) 
    #   * :bank_account_details (Hash)
    #     * :bank_name (String) 
    #     * :transfer_type (String) 
    #     * :account_ownership_type (String) 
    #     * :fingerprint (String) 
    #     * :country (String) 
    #     * :statement_description (String) 
    #     * :ach_details (Hash)
    #       * :routing_number (String) 
    #       * :account_number_suffix (String) 
    #       * :account_type (String) 
    #     * :errors (Array<square.rb::Error>) 
    #   * :external_details (Hash)
    #     * :type (String) 
    #     * :source (String) 
    #     * :source_id (String) 
    #     * :source_fee_money (Hash)
    #       * :amount (Long) 
    #       * :currency (square.rb::Currency) 
    #   * :wallet_details (Hash)
    #     * :status (String) 
    #     * :brand (String) 
    #     * :cash_app_details (Hash)
    #       * :buyer_full_name (String) 
    #       * :buyer_country_code (String) 
    #       * :buyer_cashtag (String) 
    #   * :buy_now_pay_later_details (Hash)
    #     * :brand (String) 
    #     * :afterpay_details (Hash)
    #       * :email_address (String) 
    #     * :clearpay_details (Hash)
    #       * :email_address (String) 
    #   * :square_account_details (Hash)
    #     * :payment_source_token (String) 
    #     * :errors (Array<square.rb::Error>) 
    #   * :location_id (String) 
    #   * :order_id (String) 
    #   * :reference_id (String) 
    #   * :customer_id (String) 
    #   * :employee_id (String) 
    #   * :team_member_id (String) 
    #   * :refund_ids (Array<String>) 
    #   * :risk_evaluation (Hash)
    #     * :created_at (String) 
    #     * :risk_level (square.rb::RiskEvaluationRiskLevel) 
    #   * :terminal_checkout_id (String) 
    #   * :buyer_email_address (String) 
    #   * :billing_address (Hash)
    #     * :address_line_1 (String) 
    #     * :address_line_2 (String) 
    #     * :address_line_3 (String) 
    #     * :locality (String) 
    #     * :sublocality (String) 
    #     * :sublocality_2 (String) 
    #     * :sublocality_3 (String) 
    #     * :administrative_district_level_1 (String) 
    #     * :administrative_district_level_2 (String) 
    #     * :administrative_district_level_3 (String) 
    #     * :postal_code (String) 
    #     * :country (square.rb::Country) 
    #     * :first_name (String) 
    #     * :last_name (String) 
    #   * :shipping_address (Hash)
    #     * :address_line_1 (String) 
    #     * :address_line_2 (String) 
    #     * :address_line_3 (String) 
    #     * :locality (String) 
    #     * :sublocality (String) 
    #     * :sublocality_2 (String) 
    #     * :sublocality_3 (String) 
    #     * :administrative_district_level_1 (String) 
    #     * :administrative_district_level_2 (String) 
    #     * :administrative_district_level_3 (String) 
    #     * :postal_code (String) 
    #     * :country (square.rb::Country) 
    #     * :first_name (String) 
    #     * :last_name (String) 
    #   * :note (String) 
    #   * :statement_description_identifier (String) 
    #   * :capabilities (Array<String>) 
    #   * :receipt_number (String) 
    #   * :receipt_url (String) 
    #   * :device_details (Hash)
    #     * :device_id (String) 
    #     * :device_installation_id (String) 
    #     * :device_name (String) 
    #   * :application_details (Hash)
    #     * :square_product (square.rb::ApplicationDetailsExternalSquareProduct) 
    #     * :application_id (String) 
    #   * :is_offline_payment (Boolean) 
    #   * :offline_payment_details (Hash)
    #     * :client_created_at (String) 
    #   * :version_token (String) 
    # @param idempotency_key [String] A unique string that identifies this `UpdatePayment` request. Keys can be any
#  valid string
#  but must be unique for every `UpdatePayment` request.
#  For more information, see
#  tps://developer.squareup.com/docs/build-basics/common-api-patterns/idempotency).
    # @param request_options [square.rb::RequestOptions] 
    # @return [square.rb::UpdatePaymentResponse]
    # @example
#  api = square.rb::Client.new(
#    base_url: "https://api.example.com",
#    environment: square.rb::Environment::PRODUCTION,
#    token: "YOUR_AUTH_TOKEN",
#    version: "Version"
#  )
#  api.payments.update(
#    payment_id: "payment_id",
#    payment: { amount_money: { amount: 1000, currency: USD }, tip_money: { amount: 100, currency: USD }, version_token: "ODhwVQ35xwlzRuoZEwKXucfu7583sPTzK48c5zoGd0g6o" },
#    idempotency_key: "956f8b13-e4ec-45d6-85e8-d1d95ef0c5de"
#  )
    def update(payment_id:, payment: nil, idempotency_key:, request_options: nil)
      response = @request_client.conn.put do | req |
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
  req.body = { **(request_options&.additional_body_parameters || {}), payment: payment, idempotency_key: idempotency_key }.compact
  req.url "#{@request_client.get_url(request_options: request_options)}/v2/payments/#{payment_id}"
end
      square.rb::UpdatePaymentResponse.from_json(json_object: response.body)
    end
# Cancels (voids) a payment. You can use this endpoint to cancel a payment with
#  the APPROVED `status`.
    #
    # @param payment_id [String] The ID of the payment to cancel.
    # @param request_options [square.rb::RequestOptions] 
    # @return [square.rb::CancelPaymentResponse]
    # @example
#  api = square.rb::Client.new(
#    base_url: "https://api.example.com",
#    environment: square.rb::Environment::PRODUCTION,
#    token: "YOUR_AUTH_TOKEN",
#    version: "Version"
#  )
#  api.payments.cancel(payment_id: "payment_id")
    def cancel(payment_id:, request_options: nil)
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
  unless request_options.nil? || request_options&.additional_body_parameters.nil?
    req.body = { **(request_options&.additional_body_parameters || {}) }.compact
  end
  req.url "#{@request_client.get_url(request_options: request_options)}/v2/payments/#{payment_id}/cancel"
end
      square.rb::CancelPaymentResponse.from_json(json_object: response.body)
    end
# Completes (captures) a payment.
#  By default, payments are set to complete immediately after they are created.
#  You can use this endpoint to complete a payment with the APPROVED `status`.
    #
    # @param payment_id [String] The unique ID identifying the payment to be completed.
    # @param version_token [String] Used for optimistic concurrency. This opaque token identifies the current
#  `Payment`
#  version that the caller expects. If the server has a different version of the
#  Payment,
#  the update fails and a response with a VERSION_MISMATCH error is returned.
    # @param request_options [square.rb::RequestOptions] 
    # @return [square.rb::CompletePaymentResponse]
    # @example
#  api = square.rb::Client.new(
#    base_url: "https://api.example.com",
#    environment: square.rb::Environment::PRODUCTION,
#    token: "YOUR_AUTH_TOKEN",
#    version: "Version"
#  )
#  api.payments.complete(payment_id: "payment_id")
    def complete(payment_id:, version_token: nil, request_options: nil)
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
  req.body = { **(request_options&.additional_body_parameters || {}), version_token: version_token }.compact
  req.url "#{@request_client.get_url(request_options: request_options)}/v2/payments/#{payment_id}/complete"
end
      square.rb::CompletePaymentResponse.from_json(json_object: response.body)
    end
  end
  class AsyncPaymentsClient
  # @return [square.rb::AsyncRequestClient] 
    attr_reader :request_client


    # @param request_client [square.rb::RequestClient] 
    # @return [square.rb::AsyncPaymentsClient]
    def initialize(request_client:)
      @request_client = request_client
    end
# Retrieves a list of payments taken by the account making the request.
#  Results are eventually consistent, and new payments or changes to payments might
#  take several
#  seconds to appear.
#  The maximum results per page is 100.
    #
    # @param begin_time [String] Indicates the start of the time range to retrieve payments for, in RFC 3339
#  format.
#  The range is determined using the `created_at` field for each Payment.
#  Inclusive. Default: The current time minus one year.
    # @param end_time [String] Indicates the end of the time range to retrieve payments for, in RFC 3339
#  format.  The
#  range is determined using the `created_at` field for each Payment.
#  Default: The current time.
    # @param sort_order [String] The order in which results are listed by `ListPaymentsRequest.sort_field`:
#  - `ASC` - Oldest to newest.
#  - `DESC` - Newest to oldest (default).
    # @param cursor [String] A pagination cursor returned by a previous call to this endpoint.
#  Provide this cursor to retrieve the next set of results for the original query.
#  For more information, see
#  ttps://developer.squareup.com/docs/build-basics/common-api-patterns/pagination).
    # @param location_id [String] Limit results to the location supplied. By default, results are returned
#  for the default (main) location associated with the seller.
    # @param total [Long] The exact amount in the `total_money` for a payment.
    # @param last_4 [String] The last four digits of a payment card.
    # @param card_brand [String] The brand of the payment card (for example, VISA).
    # @param limit [Integer] The maximum number of results to be returned in a single page.
#  It is possible to receive fewer results than the specified limit on a given
#  page.
#  The default value of 100 is also the maximum allowed value. If the provided
#  value is
#  greater than 100, it is ignored and the default value is used instead.
#  Default: `100`
    # @param is_offline_payment [Boolean] Whether the payment was taken offline or not.
    # @param offline_begin_time [String] Indicates the start of the time range for which to retrieve offline payments, in
#  RFC 3339
#  format for timestamps. The range is determined using the
#  `offline_payment_details.client_created_at` field for each Payment. If set,
#  payments without a
#  value set in `offline_payment_details.client_created_at` will not be returned.
#  Default: The current time.
    # @param offline_end_time [String] Indicates the end of the time range for which to retrieve offline payments, in
#  RFC 3339
#  format for timestamps. The range is determined using the
#  `offline_payment_details.client_created_at` field for each Payment. If set,
#  payments without a
#  value set in `offline_payment_details.client_created_at` will not be returned.
#  Default: The current time.
    # @param updated_at_begin_time [String] Indicates the start of the time range to retrieve payments for, in RFC 3339
#  format.  The
#  range is determined using the `updated_at` field for each Payment.
    # @param updated_at_end_time [String] Indicates the end of the time range to retrieve payments for, in RFC 3339
#  format.  The
#  range is determined using the `updated_at` field for each Payment.
    # @param sort_field [square.rb::ListPaymentsRequestSortField] The field used to sort results by. The default is `CREATED_AT`.
    # @param request_options [square.rb::RequestOptions] 
    # @return [square.rb::ListPaymentsResponse]
    # @example
#  api = square.rb::Client.new(
#    base_url: "https://api.example.com",
#    environment: square.rb::Environment::PRODUCTION,
#    token: "YOUR_AUTH_TOKEN",
#    version: "Version"
#  )
#  api.payments.list
    def list(begin_time: nil, end_time: nil, sort_order: nil, cursor: nil, location_id: nil, total: nil, last_4: nil, card_brand: nil, limit: nil, is_offline_payment: nil, offline_begin_time: nil, offline_end_time: nil, updated_at_begin_time: nil, updated_at_end_time: nil, sort_field: nil, request_options: nil)
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
  req.params = { **(request_options&.additional_query_parameters || {}), "begin_time": begin_time, "end_time": end_time, "sort_order": sort_order, "cursor": cursor, "location_id": location_id, "total": total, "last_4": last_4, "card_brand": card_brand, "limit": limit, "is_offline_payment": is_offline_payment, "offline_begin_time": offline_begin_time, "offline_end_time": offline_end_time, "updated_at_begin_time": updated_at_begin_time, "updated_at_end_time": updated_at_end_time, "sort_field": sort_field }.compact
  unless request_options.nil? || request_options&.additional_body_parameters.nil?
    req.body = { **(request_options&.additional_body_parameters || {}) }.compact
  end
  req.url "#{@request_client.get_url(request_options: request_options)}/v2/payments"
end
        square.rb::ListPaymentsResponse.from_json(json_object: response.body)
      end
    end
# Creates a payment using the provided source. You can use this endpoint
#  to charge a card (credit/debit card or
#  Square gift card) or record a payment that the seller received outside of Square
#  (cash payment from a buyer or a payment that an external entity
#  processed on behalf of the seller).
#  The endpoint creates a
#  `Payment` object and returns it in the response.
    #
    # @param source_id [String] The ID for the source of funds for this payment.
#  This could be a payment token generated by the Web Payments SDK for any of its
#  [supported
#  ps://developer.squareup.com/docs/web-payments/overview#explore-payment-methods),
#  including cards, bank transfers, Afterpay or Cash App Pay. If recording a
#  payment
#  that the seller received outside of Square, specify either "CASH" or "EXTERNAL".
#  For more information, see
#  [Take Payments](https://developer.squareup.com/docs/payments-api/take-payments).
    # @param idempotency_key [String] A unique string that identifies this `CreatePayment` request. Keys can be any
#  valid string
#  but must be unique for every `CreatePayment` request.
#  Note: The number of allowed characters might be less than the stated maximum, if
#  multi-byte
#  characters are used.
#  For more information, see
#  Idempotency](https://developer.squareup.com/docs/working-with-apis/idempotency).
    # @param amount_money [Hash] The amount of money to accept for this payment, not including `tip_money`.
#  The amount must be specified in the smallest denomination of the applicable
#  currency
#  (for example, US dollar amounts are specified in cents). For more information,
#  see
#  [Working with Monetary
#  https://developer.squareup.com/docs/build-basics/working-with-monetary-amounts).
#  The currency code must match the currency associated with the business
#  that is accepting the payment.Request of type square.rb::Money, as a Hash
    #   * :amount (Long) 
    #   * :currency (square.rb::Currency) 
    # @param tip_money [Hash] The amount designated as a tip, in addition to `amount_money`.
#  The amount must be specified in the smallest denomination of the applicable
#  currency
#  (for example, US dollar amounts are specified in cents). For more information,
#  see
#  [Working with Monetary
#  https://developer.squareup.com/docs/build-basics/working-with-monetary-amounts).
#  The currency code must match the currency associated with the business
#  that is accepting the payment.Request of type square.rb::Money, as a Hash
    #   * :amount (Long) 
    #   * :currency (square.rb::Currency) 
    # @param app_fee_money [Hash] The amount of money that the developer is taking as a fee
#  for facilitating the payment on behalf of the seller.
#  The amount cannot be more than 90% of the total amount of the payment.
#  The amount must be specified in the smallest denomination of the applicable
#  currency
#  (for example, US dollar amounts are specified in cents). For more information,
#  see
#  [Working with Monetary
#  https://developer.squareup.com/docs/build-basics/working-with-monetary-amounts).
#  The fee currency code must match the currency associated with the seller
#  that is accepting the payment. The application must be from a developer
#  account in the same country and using the same currency code as the seller.
#  For more information about the application fee scenario, see
#  [Take Payments and Collect
#  ttps://developer.squareup.com/docs/payments-api/take-payments-and-collect-fees).
#  To set this field, `PAYMENTS_WRITE_ADDITIONAL_RECIPIENTS` OAuth permission is
#  required.
#  For more information, see
#  oper.squareup.com/docs/payments-api/take-payments-and-collect-fees#permissions).Request of type square.rb::Money, as a Hash
    #   * :amount (Long) 
    #   * :currency (square.rb::Currency) 
    # @param delay_duration [String] The duration of time after the payment's creation when Square automatically
#  either completes or cancels the payment depending on the `delay_action` field
#  value.
#  For more information, see
#  [Time
#  m/docs/payments-api/take-payments/card-payments/delayed-capture#time-threshold).
#  This parameter should be specified as a time duration, in RFC 3339 format.
#  Note: This feature is only supported for card payments. This parameter can only
#  be set for a delayed
#  capture payment (`autocomplete=false`).
#  Default:
#  - Card-present payments: "PT36H" (36 hours) from the creation time.
#  - Card-not-present payments: "P7D" (7 days) from the creation time.
    # @param delay_action [String] The action to be applied to the payment when the `delay_duration` has elapsed.
#  The action must be
#  CANCEL or COMPLETE. For more information, see
#  [Time
#  m/docs/payments-api/take-payments/card-payments/delayed-capture#time-threshold).
#  Default: CANCEL
    # @param autocomplete [Boolean] If set to `true`, this payment will be completed when possible. If
#  set to `false`, this payment is held in an approved state until either
#  explicitly completed (captured) or canceled (voided). For more information, see
#  [Delayed
#  ocs/payments-api/take-payments/card-payments#delayed-capture-of-a-card-payment).
#  Default: true
    # @param order_id [String] Associates a previously created order with this payment.
    # @param customer_id [String] The [Customer](entity:Customer) ID of the customer associated with the payment.
#  This is required if the `source_id` refers to a card on file created using the
#  Cards API.
    # @param location_id [String] The location ID to associate with the payment. If not specified, the [main
#  tion](https://developer.squareup.com/docs/locations-api#about-the-main-location)
#  is
#  used.
    # @param team_member_id [String] An optional [TeamMember](entity:TeamMember) ID to associate with
#  this payment.
    # @param reference_id [String] A user-defined ID to associate with the payment.
#  You can use this field to associate the payment to an entity in an external
#  system
#  (for example, you might specify an order ID that is generated by a third-party
#  shopping cart).
    # @param verification_token [String] An identifying token generated by
#  squareup.com/reference/sdks/web/payments/objects/Payments#Payments.verifyBuyer).
#  Verification tokens encapsulate customer device information and 3-D Secure
#  challenge results to indicate that Square has verified the buyer identity.
#  For more information, see [SCA
#  Overview](https://developer.squareup.com/docs/sca-overview).
    # @param accept_partial_authorization [Boolean] If set to `true` and charging a Square Gift Card, a payment might be returned
#  with
#  `amount_money` equal to less than what was requested. For example, a request for
#  $20 when charging
#  a Square Gift Card with a balance of $5 results in an APPROVED payment of $5.
#  You might choose
#  to prompt the buyer for an additional payment to cover the remainder or cancel
#  the Gift Card
#  payment. This field cannot be `true` when `autocomplete = true`.
#  For more information, see
#  [Partial amount with Square Gift
#  veloper.squareup.com/docs/payments-api/take-payments#partial-payment-gift-card).
#  Default: false
    # @param buyer_email_address [String] The buyer's email address.
    # @param buyer_phone_number [String] The buyer's phone number.
#  Must follow the following format:
#  1. A leading + symbol (followed by a country code)
#  2. The phone number can contain spaces and the special characters `(` , `)` ,
#  `-` , and `.`.
#  Alphabetical characters aren't allowed.
#  3. The phone number must contain between 9 and 16 digits.
    # @param billing_address [Hash] The buyer's billing address.Request of type square.rb::Address, as a Hash
    #   * :address_line_1 (String) 
    #   * :address_line_2 (String) 
    #   * :address_line_3 (String) 
    #   * :locality (String) 
    #   * :sublocality (String) 
    #   * :sublocality_2 (String) 
    #   * :sublocality_3 (String) 
    #   * :administrative_district_level_1 (String) 
    #   * :administrative_district_level_2 (String) 
    #   * :administrative_district_level_3 (String) 
    #   * :postal_code (String) 
    #   * :country (square.rb::Country) 
    #   * :first_name (String) 
    #   * :last_name (String) 
    # @param shipping_address [Hash] The buyer's shipping address.Request of type square.rb::Address, as a Hash
    #   * :address_line_1 (String) 
    #   * :address_line_2 (String) 
    #   * :address_line_3 (String) 
    #   * :locality (String) 
    #   * :sublocality (String) 
    #   * :sublocality_2 (String) 
    #   * :sublocality_3 (String) 
    #   * :administrative_district_level_1 (String) 
    #   * :administrative_district_level_2 (String) 
    #   * :administrative_district_level_3 (String) 
    #   * :postal_code (String) 
    #   * :country (square.rb::Country) 
    #   * :first_name (String) 
    #   * :last_name (String) 
    # @param note [String] An optional note to be entered by the developer when creating a payment.
    # @param statement_description_identifier [String] Optional additional payment information to include on the customer's card
#  statement
#  as part of the statement description. This can be, for example, an invoice
#  number, ticket number,
#  or short description that uniquely identifies the purchase.
#  Note that the `statement_description_identifier` might get truncated on the
#  statement description
#  to fit the required information including the Square identifier (SQ *) and name
#  of the
#  seller taking the payment.
    # @param cash_details [Hash] Additional details required when recording a cash payment (`source_id` is CASH).Request of type square.rb::CashPaymentDetails, as a Hash
    #   * :buyer_supplied_money (Hash)
    #     * :amount (Long) 
    #     * :currency (square.rb::Currency) 
    #   * :change_back_money (Hash)
    #     * :amount (Long) 
    #     * :currency (square.rb::Currency) 
    # @param external_details [Hash] Additional details required when recording an external payment (`source_id` is
#  EXTERNAL).Request of type square.rb::ExternalPaymentDetails, as a Hash
    #   * :type (String) 
    #   * :source (String) 
    #   * :source_id (String) 
    #   * :source_fee_money (Hash)
    #     * :amount (Long) 
    #     * :currency (square.rb::Currency) 
    # @param customer_details [Hash] Details about the customer making the payment.Request of type square.rb::CustomerDetails, as a Hash
    #   * :customer_initiated (Boolean) 
    #   * :seller_keyed_in (Boolean) 
    # @param offline_payment_details [Hash] An optional field for specifying the offline payment details. This is intended
#  for
#  internal 1st-party callers only.Request of type square.rb::OfflinePaymentDetails, as a Hash
    #   * :client_created_at (String) 
    # @param request_options [square.rb::RequestOptions] 
    # @return [square.rb::CreatePaymentResponse]
    # @example
#  api = square.rb::Client.new(
#    base_url: "https://api.example.com",
#    environment: square.rb::Environment::PRODUCTION,
#    token: "YOUR_AUTH_TOKEN",
#    version: "Version"
#  )
#  api.payments.create(
#    source_id: "ccof:GaJGNaZa8x4OgDJn4GB",
#    idempotency_key: "7b0f3ec5-086a-4871-8f13-3c81b3875218",
#    amount_money: { amount: 1000, currency: USD },
#    app_fee_money: { amount: 10, currency: USD },
#    autocomplete: true,
#    customer_id: "W92WH6P11H4Z77CTET0RNTGFW8",
#    location_id: "L88917AVBK2S5",
#    reference_id: "123456",
#    note: "Brief description"
#  )
    def create(source_id:, idempotency_key:, amount_money: nil, tip_money: nil, app_fee_money: nil, delay_duration: nil, delay_action: nil, autocomplete: nil, order_id: nil, customer_id: nil, location_id: nil, team_member_id: nil, reference_id: nil, verification_token: nil, accept_partial_authorization: nil, buyer_email_address: nil, buyer_phone_number: nil, billing_address: nil, shipping_address: nil, note: nil, statement_description_identifier: nil, cash_details: nil, external_details: nil, customer_details: nil, offline_payment_details: nil, request_options: nil)
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
  req.body = { **(request_options&.additional_body_parameters || {}), source_id: source_id, idempotency_key: idempotency_key, amount_money: amount_money, tip_money: tip_money, app_fee_money: app_fee_money, delay_duration: delay_duration, delay_action: delay_action, autocomplete: autocomplete, order_id: order_id, customer_id: customer_id, location_id: location_id, team_member_id: team_member_id, reference_id: reference_id, verification_token: verification_token, accept_partial_authorization: accept_partial_authorization, buyer_email_address: buyer_email_address, buyer_phone_number: buyer_phone_number, billing_address: billing_address, shipping_address: shipping_address, note: note, statement_description_identifier: statement_description_identifier, cash_details: cash_details, external_details: external_details, customer_details: customer_details, offline_payment_details: offline_payment_details }.compact
  req.url "#{@request_client.get_url(request_options: request_options)}/v2/payments"
end
        square.rb::CreatePaymentResponse.from_json(json_object: response.body)
      end
    end
# Cancels (voids) a payment identified by the idempotency key that is specified in
#  the
#  request.
#  Use this method when the status of a `CreatePayment` request is unknown (for
#  example, after you send a
#  `CreatePayment` request, a network error occurs and you do not get a response).
#  In this case, you can
#  direct Square to cancel the payment using this endpoint. In the request, you
#  provide the same
#  idempotency key that you provided in your `CreatePayment` request that you want
#  to cancel. After
#  canceling the payment, you can submit your `CreatePayment` request again.
#  Note that if no payment with the specified idempotency key is found, no action
#  is taken and the endpoint
#  returns successfully.
    #
    # @param idempotency_key [String] The `idempotency_key` identifying the payment to be canceled.
    # @param request_options [square.rb::RequestOptions] 
    # @return [square.rb::CancelPaymentByIdempotencyKeyResponse]
    # @example
#  api = square.rb::Client.new(
#    base_url: "https://api.example.com",
#    environment: square.rb::Environment::PRODUCTION,
#    token: "YOUR_AUTH_TOKEN",
#    version: "Version"
#  )
#  api.payments.cancel_by_idempotency_key(idempotency_key: "a7e36d40-d24b-11e8-b568-0800200c9a66")
    def cancel_by_idempotency_key(idempotency_key:, request_options: nil)
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
  req.body = { **(request_options&.additional_body_parameters || {}), idempotency_key: idempotency_key }.compact
  req.url "#{@request_client.get_url(request_options: request_options)}/v2/payments/cancel"
end
        square.rb::CancelPaymentByIdempotencyKeyResponse.from_json(json_object: response.body)
      end
    end
# Retrieves details for a specific payment.
    #
    # @param payment_id [String] A unique ID for the desired payment.
    # @param request_options [square.rb::RequestOptions] 
    # @return [square.rb::GetPaymentResponse]
    # @example
#  api = square.rb::Client.new(
#    base_url: "https://api.example.com",
#    environment: square.rb::Environment::PRODUCTION,
#    token: "YOUR_AUTH_TOKEN",
#    version: "Version"
#  )
#  api.payments.get(payment_id: "payment_id")
    def get(payment_id:, request_options: nil)
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
  req.url "#{@request_client.get_url(request_options: request_options)}/v2/payments/#{payment_id}"
end
        square.rb::GetPaymentResponse.from_json(json_object: response.body)
      end
    end
# Updates a payment with the APPROVED status.
#  You can update the `amount_money` and `tip_money` using this endpoint.
    #
    # @param payment_id [String] The ID of the payment to update.
    # @param payment [Hash] The updated `Payment` object.Request of type square.rb::Payment, as a Hash
    #   * :id (String) 
    #   * :created_at (String) 
    #   * :updated_at (String) 
    #   * :amount_money (Hash)
    #     * :amount (Long) 
    #     * :currency (square.rb::Currency) 
    #   * :tip_money (Hash)
    #     * :amount (Long) 
    #     * :currency (square.rb::Currency) 
    #   * :total_money (Hash)
    #     * :amount (Long) 
    #     * :currency (square.rb::Currency) 
    #   * :app_fee_money (Hash)
    #     * :amount (Long) 
    #     * :currency (square.rb::Currency) 
    #   * :approved_money (Hash)
    #     * :amount (Long) 
    #     * :currency (square.rb::Currency) 
    #   * :processing_fee (Array<square.rb::ProcessingFee>) 
    #   * :refunded_money (Hash)
    #     * :amount (Long) 
    #     * :currency (square.rb::Currency) 
    #   * :status (String) 
    #   * :delay_duration (String) 
    #   * :delay_action (String) 
    #   * :delayed_until (String) 
    #   * :source_type (String) 
    #   * :card_details (Hash)
    #     * :status (String) 
    #     * :card (Hash)
    #       * :id (String) 
    #       * :card_brand (square.rb::CardBrand) 
    #       * :last_4 (String) 
    #       * :exp_month (Long) 
    #       * :exp_year (Long) 
    #       * :cardholder_name (String) 
    #       * :billing_address (Hash)
    #         * :address_line_1 (String) 
    #         * :address_line_2 (String) 
    #         * :address_line_3 (String) 
    #         * :locality (String) 
    #         * :sublocality (String) 
    #         * :sublocality_2 (String) 
    #         * :sublocality_3 (String) 
    #         * :administrative_district_level_1 (String) 
    #         * :administrative_district_level_2 (String) 
    #         * :administrative_district_level_3 (String) 
    #         * :postal_code (String) 
    #         * :country (square.rb::Country) 
    #         * :first_name (String) 
    #         * :last_name (String) 
    #       * :fingerprint (String) 
    #       * :customer_id (String) 
    #       * :merchant_id (String) 
    #       * :reference_id (String) 
    #       * :enabled (Boolean) 
    #       * :card_type (square.rb::CardType) 
    #       * :prepaid_type (square.rb::CardPrepaidType) 
    #       * :bin (String) 
    #       * :version (Long) 
    #       * :card_co_brand (square.rb::CardCoBrand) 
    #       * :issuer_alert (square.rb::CARD_ISSUER_ALERT) 
    #       * :issuer_alert_at (String) 
    #       * :hsa_fsa (Boolean) 
    #     * :entry_method (String) 
    #     * :cvv_status (String) 
    #     * :avs_status (String) 
    #     * :auth_result_code (String) 
    #     * :application_identifier (String) 
    #     * :application_name (String) 
    #     * :application_cryptogram (String) 
    #     * :verification_method (String) 
    #     * :verification_results (String) 
    #     * :statement_description (String) 
    #     * :device_details (Hash)
    #       * :device_id (String) 
    #       * :device_installation_id (String) 
    #       * :device_name (String) 
    #     * :card_payment_timeline (Hash)
    #       * :authorized_at (String) 
    #       * :captured_at (String) 
    #       * :voided_at (String) 
    #     * :refund_requires_card_presence (Boolean) 
    #     * :errors (Array<square.rb::Error>) 
    #   * :cash_details (Hash)
    #     * :buyer_supplied_money (Hash)
    #       * :amount (Long) 
    #       * :currency (square.rb::Currency) 
    #     * :change_back_money (Hash)
    #       * :amount (Long) 
    #       * :currency (square.rb::Currency) 
    #   * :bank_account_details (Hash)
    #     * :bank_name (String) 
    #     * :transfer_type (String) 
    #     * :account_ownership_type (String) 
    #     * :fingerprint (String) 
    #     * :country (String) 
    #     * :statement_description (String) 
    #     * :ach_details (Hash)
    #       * :routing_number (String) 
    #       * :account_number_suffix (String) 
    #       * :account_type (String) 
    #     * :errors (Array<square.rb::Error>) 
    #   * :external_details (Hash)
    #     * :type (String) 
    #     * :source (String) 
    #     * :source_id (String) 
    #     * :source_fee_money (Hash)
    #       * :amount (Long) 
    #       * :currency (square.rb::Currency) 
    #   * :wallet_details (Hash)
    #     * :status (String) 
    #     * :brand (String) 
    #     * :cash_app_details (Hash)
    #       * :buyer_full_name (String) 
    #       * :buyer_country_code (String) 
    #       * :buyer_cashtag (String) 
    #   * :buy_now_pay_later_details (Hash)
    #     * :brand (String) 
    #     * :afterpay_details (Hash)
    #       * :email_address (String) 
    #     * :clearpay_details (Hash)
    #       * :email_address (String) 
    #   * :square_account_details (Hash)
    #     * :payment_source_token (String) 
    #     * :errors (Array<square.rb::Error>) 
    #   * :location_id (String) 
    #   * :order_id (String) 
    #   * :reference_id (String) 
    #   * :customer_id (String) 
    #   * :employee_id (String) 
    #   * :team_member_id (String) 
    #   * :refund_ids (Array<String>) 
    #   * :risk_evaluation (Hash)
    #     * :created_at (String) 
    #     * :risk_level (square.rb::RiskEvaluationRiskLevel) 
    #   * :terminal_checkout_id (String) 
    #   * :buyer_email_address (String) 
    #   * :billing_address (Hash)
    #     * :address_line_1 (String) 
    #     * :address_line_2 (String) 
    #     * :address_line_3 (String) 
    #     * :locality (String) 
    #     * :sublocality (String) 
    #     * :sublocality_2 (String) 
    #     * :sublocality_3 (String) 
    #     * :administrative_district_level_1 (String) 
    #     * :administrative_district_level_2 (String) 
    #     * :administrative_district_level_3 (String) 
    #     * :postal_code (String) 
    #     * :country (square.rb::Country) 
    #     * :first_name (String) 
    #     * :last_name (String) 
    #   * :shipping_address (Hash)
    #     * :address_line_1 (String) 
    #     * :address_line_2 (String) 
    #     * :address_line_3 (String) 
    #     * :locality (String) 
    #     * :sublocality (String) 
    #     * :sublocality_2 (String) 
    #     * :sublocality_3 (String) 
    #     * :administrative_district_level_1 (String) 
    #     * :administrative_district_level_2 (String) 
    #     * :administrative_district_level_3 (String) 
    #     * :postal_code (String) 
    #     * :country (square.rb::Country) 
    #     * :first_name (String) 
    #     * :last_name (String) 
    #   * :note (String) 
    #   * :statement_description_identifier (String) 
    #   * :capabilities (Array<String>) 
    #   * :receipt_number (String) 
    #   * :receipt_url (String) 
    #   * :device_details (Hash)
    #     * :device_id (String) 
    #     * :device_installation_id (String) 
    #     * :device_name (String) 
    #   * :application_details (Hash)
    #     * :square_product (square.rb::ApplicationDetailsExternalSquareProduct) 
    #     * :application_id (String) 
    #   * :is_offline_payment (Boolean) 
    #   * :offline_payment_details (Hash)
    #     * :client_created_at (String) 
    #   * :version_token (String) 
    # @param idempotency_key [String] A unique string that identifies this `UpdatePayment` request. Keys can be any
#  valid string
#  but must be unique for every `UpdatePayment` request.
#  For more information, see
#  tps://developer.squareup.com/docs/build-basics/common-api-patterns/idempotency).
    # @param request_options [square.rb::RequestOptions] 
    # @return [square.rb::UpdatePaymentResponse]
    # @example
#  api = square.rb::Client.new(
#    base_url: "https://api.example.com",
#    environment: square.rb::Environment::PRODUCTION,
#    token: "YOUR_AUTH_TOKEN",
#    version: "Version"
#  )
#  api.payments.update(
#    payment_id: "payment_id",
#    payment: { amount_money: { amount: 1000, currency: USD }, tip_money: { amount: 100, currency: USD }, version_token: "ODhwVQ35xwlzRuoZEwKXucfu7583sPTzK48c5zoGd0g6o" },
#    idempotency_key: "956f8b13-e4ec-45d6-85e8-d1d95ef0c5de"
#  )
    def update(payment_id:, payment: nil, idempotency_key:, request_options: nil)
      Async do
        response = @request_client.conn.put do | req |
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
  req.body = { **(request_options&.additional_body_parameters || {}), payment: payment, idempotency_key: idempotency_key }.compact
  req.url "#{@request_client.get_url(request_options: request_options)}/v2/payments/#{payment_id}"
end
        square.rb::UpdatePaymentResponse.from_json(json_object: response.body)
      end
    end
# Cancels (voids) a payment. You can use this endpoint to cancel a payment with
#  the APPROVED `status`.
    #
    # @param payment_id [String] The ID of the payment to cancel.
    # @param request_options [square.rb::RequestOptions] 
    # @return [square.rb::CancelPaymentResponse]
    # @example
#  api = square.rb::Client.new(
#    base_url: "https://api.example.com",
#    environment: square.rb::Environment::PRODUCTION,
#    token: "YOUR_AUTH_TOKEN",
#    version: "Version"
#  )
#  api.payments.cancel(payment_id: "payment_id")
    def cancel(payment_id:, request_options: nil)
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
  unless request_options.nil? || request_options&.additional_body_parameters.nil?
    req.body = { **(request_options&.additional_body_parameters || {}) }.compact
  end
  req.url "#{@request_client.get_url(request_options: request_options)}/v2/payments/#{payment_id}/cancel"
end
        square.rb::CancelPaymentResponse.from_json(json_object: response.body)
      end
    end
# Completes (captures) a payment.
#  By default, payments are set to complete immediately after they are created.
#  You can use this endpoint to complete a payment with the APPROVED `status`.
    #
    # @param payment_id [String] The unique ID identifying the payment to be completed.
    # @param version_token [String] Used for optimistic concurrency. This opaque token identifies the current
#  `Payment`
#  version that the caller expects. If the server has a different version of the
#  Payment,
#  the update fails and a response with a VERSION_MISMATCH error is returned.
    # @param request_options [square.rb::RequestOptions] 
    # @return [square.rb::CompletePaymentResponse]
    # @example
#  api = square.rb::Client.new(
#    base_url: "https://api.example.com",
#    environment: square.rb::Environment::PRODUCTION,
#    token: "YOUR_AUTH_TOKEN",
#    version: "Version"
#  )
#  api.payments.complete(payment_id: "payment_id")
    def complete(payment_id:, version_token: nil, request_options: nil)
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
  req.body = { **(request_options&.additional_body_parameters || {}), version_token: version_token }.compact
  req.url "#{@request_client.get_url(request_options: request_options)}/v2/payments/#{payment_id}/complete"
end
        square.rb::CompletePaymentResponse.from_json(json_object: response.body)
      end
    end
  end
end