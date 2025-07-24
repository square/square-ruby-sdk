# frozen_string_literal: true
require_relative "../../../requests"
require_relative "../../types/list_payment_links_response"
require_relative "../../types/quick_pay"
require_relative "../../types/order"
require_relative "../../types/checkout_options"
require_relative "../../types/pre_populated_data"
require_relative "../../types/create_payment_link_response"
require_relative "../../types/get_payment_link_response"
require_relative "../../types/payment_link"
require_relative "../../types/update_payment_link_response"
require_relative "../../types/delete_payment_link_response"
require "async"
require "async"
require "async"
require "async"
require "async"
require_relative "../../../requests"

module SquareApiClient
  module Checkout
    class PaymentLinksClient
    # @return [SquareApiClient::RequestClient] 
      attr_reader :request_client


      # @param request_client [SquareApiClient::RequestClient] 
      # @return [SquareApiClient::Checkout::PaymentLinksClient]
      def initialize(request_client:)
        @request_client = request_client
      end
# Lists all payment links.
      #
      # @param cursor [String] A pagination cursor returned by a previous call to this endpoint.
#  Provide this cursor to retrieve the next set of results for the original query.
#  If a cursor is not provided, the endpoint returns the first page of the results.
#  For more  information, see
#  ttps://developer.squareup.com/docs/build-basics/common-api-patterns/pagination).
      # @param limit [Integer] A limit on the number of results to return per page. The limit is advisory and
#  the implementation might return more or less results. If the supplied limit is
#  negative, zero, or
#  greater than the maximum limit of 1000, it is ignored.
#  Default value: `100`
      # @param request_options [SquareApiClient::RequestOptions] 
      # @return [SquareApiClient::ListPaymentLinksResponse]
      # @example
#  api = SquareApiClient::Client.new(
#    base_url: "https://api.example.com",
#    environment: SquareApiClient::Environment::PRODUCTION,
#    token: "YOUR_AUTH_TOKEN",
#    version: "Version"
#  )
#  api.checkout.payment_links.list
      def list(cursor: nil, limit: nil, request_options: nil)
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
  req.params = { **(request_options&.additional_query_parameters || {}), "cursor": cursor, "limit": limit }.compact
  unless request_options.nil? || request_options&.additional_body_parameters.nil?
    req.body = { **(request_options&.additional_body_parameters || {}) }.compact
  end
  req.url "#{@request_client.get_url(request_options: request_options)}/v2/online-checkout/payment-links"
end
        SquareApiClient::ListPaymentLinksResponse.from_json(json_object: response.body)
      end
# Creates a Square-hosted checkout page. Applications can share the resulting
#  payment link with their buyer to pay for goods and services.
      #
      # @param idempotency_key [String] A unique string that identifies this `CreatePaymentLinkRequest` request.
#  If you do not provide a unique string (or provide an empty string as the value),
#  the endpoint treats each request as independent.
#  For more information, see
#  Idempotency](https://developer.squareup.com/docs/working-with-apis/idempotency).
      # @param description [String] A description of the payment link. You provide this optional description that is
#  useful in your
#  application context. It is not used anywhere.
      # @param quick_pay [Hash] Describes an ad hoc item and price for which to generate a quick pay checkout
#  link.
#  For more information,
#  see [Quick Pay
#  Checkout](https://developer.squareup.com/docs/checkout-api/quick-pay-checkout).Request of type SquareApiClient::QuickPay, as a Hash
      #   * :name (String) 
      #   * :price_money (Hash)
      #     * :amount (Long) 
      #     * :currency (SquareApiClient::Currency) 
      #   * :location_id (String) 
      # @param order [Hash] Describes the `Order` for which to create a checkout link.
#  For more information,
#  see [Square Order
#  eckout](https://developer.squareup.com/docs/checkout-api/square-order-checkout).Request of type SquareApiClient::Order, as a Hash
      #   * :id (String) 
      #   * :location_id (String) 
      #   * :reference_id (String) 
      #   * :source (Hash)
      #     * :name (String) 
      #   * :customer_id (String) 
      #   * :line_items (Array<SquareApiClient::OrderLineItem>) 
      #   * :taxes (Array<SquareApiClient::OrderLineItemTax>) 
      #   * :discounts (Array<SquareApiClient::OrderLineItemDiscount>) 
      #   * :service_charges (Array<SquareApiClient::OrderServiceCharge>) 
      #   * :fulfillments (Array<SquareApiClient::Fulfillment>) 
      #   * :returns (Array<SquareApiClient::OrderReturn>) 
      #   * :return_amounts (Hash)
      #     * :total_money (Hash)
      #       * :amount (Long) 
      #       * :currency (SquareApiClient::Currency) 
      #     * :tax_money (Hash)
      #       * :amount (Long) 
      #       * :currency (SquareApiClient::Currency) 
      #     * :discount_money (Hash)
      #       * :amount (Long) 
      #       * :currency (SquareApiClient::Currency) 
      #     * :tip_money (Hash)
      #       * :amount (Long) 
      #       * :currency (SquareApiClient::Currency) 
      #     * :service_charge_money (Hash)
      #       * :amount (Long) 
      #       * :currency (SquareApiClient::Currency) 
      #   * :net_amounts (Hash)
      #     * :total_money (Hash)
      #       * :amount (Long) 
      #       * :currency (SquareApiClient::Currency) 
      #     * :tax_money (Hash)
      #       * :amount (Long) 
      #       * :currency (SquareApiClient::Currency) 
      #     * :discount_money (Hash)
      #       * :amount (Long) 
      #       * :currency (SquareApiClient::Currency) 
      #     * :tip_money (Hash)
      #       * :amount (Long) 
      #       * :currency (SquareApiClient::Currency) 
      #     * :service_charge_money (Hash)
      #       * :amount (Long) 
      #       * :currency (SquareApiClient::Currency) 
      #   * :rounding_adjustment (Hash)
      #     * :uid (String) 
      #     * :name (String) 
      #     * :amount_money (Hash)
      #       * :amount (Long) 
      #       * :currency (SquareApiClient::Currency) 
      #   * :tenders (Array<SquareApiClient::Tender>) 
      #   * :refunds (Array<SquareApiClient::Refund>) 
      #   * :metadata (Hash{String => String}) 
      #   * :created_at (String) 
      #   * :updated_at (String) 
      #   * :closed_at (String) 
      #   * :state (SquareApiClient::OrderState) 
      #   * :version (Integer) 
      #   * :total_money (Hash)
      #     * :amount (Long) 
      #     * :currency (SquareApiClient::Currency) 
      #   * :total_tax_money (Hash)
      #     * :amount (Long) 
      #     * :currency (SquareApiClient::Currency) 
      #   * :total_discount_money (Hash)
      #     * :amount (Long) 
      #     * :currency (SquareApiClient::Currency) 
      #   * :total_tip_money (Hash)
      #     * :amount (Long) 
      #     * :currency (SquareApiClient::Currency) 
      #   * :total_service_charge_money (Hash)
      #     * :amount (Long) 
      #     * :currency (SquareApiClient::Currency) 
      #   * :ticket_name (String) 
      #   * :pricing_options (Hash)
      #     * :auto_apply_discounts (Boolean) 
      #     * :auto_apply_taxes (Boolean) 
      #   * :rewards (Array<SquareApiClient::OrderReward>) 
      #   * :net_amount_due_money (Hash)
      #     * :amount (Long) 
      #     * :currency (SquareApiClient::Currency) 
      # @param checkout_options [Hash] Describes optional fields to add to the resulting checkout page.
#  For more information,
#  see [Optional Checkout
#  ps://developer.squareup.com/docs/checkout-api/optional-checkout-configurations).Request of type SquareApiClient::CheckoutOptions, as a Hash
      #   * :allow_tipping (Boolean) 
      #   * :custom_fields (Array<SquareApiClient::CustomField>) 
      #   * :subscription_plan_id (String) 
      #   * :redirect_url (String) 
      #   * :merchant_support_email (String) 
      #   * :ask_for_shipping_address (Boolean) 
      #   * :accepted_payment_methods (Hash)
      #     * :apple_pay (Boolean) 
      #     * :google_pay (Boolean) 
      #     * :cash_app_pay (Boolean) 
      #     * :afterpay_clearpay (Boolean) 
      #   * :app_fee_money (Hash)
      #     * :amount (Long) 
      #     * :currency (SquareApiClient::Currency) 
      #   * :shipping_fee (Hash)
      #     * :name (String) 
      #     * :charge (Hash)
      #       * :amount (Long) 
      #       * :currency (SquareApiClient::Currency) 
      #   * :enable_coupon (Boolean) 
      #   * :enable_loyalty (Boolean) 
      # @param pre_populated_data [Hash] Describes fields to prepopulate in the resulting checkout page.
#  For more information, see [Prepopulate the shipping
#  checkout-api/optional-checkout-configurations#prepopulate-the-shipping-address).Request of type SquareApiClient::PrePopulatedData, as a Hash
      #   * :buyer_email (String) 
      #   * :buyer_phone_number (String) 
      #   * :buyer_address (Hash)
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
      #     * :country (SquareApiClient::Country) 
      #     * :first_name (String) 
      #     * :last_name (String) 
      # @param payment_note [String] A note for the payment. After processing the payment, Square adds this note to
#  the resulting `Payment`.
      # @param request_options [SquareApiClient::RequestOptions] 
      # @return [SquareApiClient::CreatePaymentLinkResponse]
      # @example
#  api = SquareApiClient::Client.new(
#    base_url: "https://api.example.com",
#    environment: SquareApiClient::Environment::PRODUCTION,
#    token: "YOUR_AUTH_TOKEN",
#    version: "Version"
#  )
#  api.checkout.payment_links.create(idempotency_key: "cd9e25dc-d9f2-4430-aedb-61605070e95f", quick_pay: { name: "Auto Detailing", price_money: { amount: 10000, currency: USD }, location_id: "A9Y43N9ABXZBP" })
      def create(idempotency_key: nil, description: nil, quick_pay: nil, order: nil, checkout_options: nil, pre_populated_data: nil, payment_note: nil, request_options: nil)
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
  req.body = { **(request_options&.additional_body_parameters || {}), idempotency_key: idempotency_key, description: description, quick_pay: quick_pay, order: order, checkout_options: checkout_options, pre_populated_data: pre_populated_data, payment_note: payment_note }.compact
  req.url "#{@request_client.get_url(request_options: request_options)}/v2/online-checkout/payment-links"
end
        SquareApiClient::CreatePaymentLinkResponse.from_json(json_object: response.body)
      end
# Retrieves a payment link.
      #
      # @param id [String] The ID of link to retrieve.
      # @param request_options [SquareApiClient::RequestOptions] 
      # @return [SquareApiClient::GetPaymentLinkResponse]
      # @example
#  api = SquareApiClient::Client.new(
#    base_url: "https://api.example.com",
#    environment: SquareApiClient::Environment::PRODUCTION,
#    token: "YOUR_AUTH_TOKEN",
#    version: "Version"
#  )
#  api.checkout.payment_links.get(id: "id")
      def get(id:, request_options: nil)
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
  req.url "#{@request_client.get_url(request_options: request_options)}/v2/online-checkout/payment-links/#{id}"
end
        SquareApiClient::GetPaymentLinkResponse.from_json(json_object: response.body)
      end
# Updates a payment link. You can update the `payment_link` fields such as
#  `description`, `checkout_options`, and  `pre_populated_data`.
#  You cannot update other fields such as the `order_id`, `version`, `URL`, or
#  `timestamp` field.
      #
      # @param id [String] The ID of the payment link to update.
      # @param payment_link [Hash] The `payment_link` object describing the updates to apply.
#  For more information, see [Update a payment
#  developer.squareup.com/docs/checkout-api/manage-checkout#update-a-payment-link).Request of type SquareApiClient::PaymentLink, as a Hash
      #   * :id (String) 
      #   * :version (Integer) 
      #   * :description (String) 
      #   * :order_id (String) 
      #   * :checkout_options (Hash)
      #     * :allow_tipping (Boolean) 
      #     * :custom_fields (Array<SquareApiClient::CustomField>) 
      #     * :subscription_plan_id (String) 
      #     * :redirect_url (String) 
      #     * :merchant_support_email (String) 
      #     * :ask_for_shipping_address (Boolean) 
      #     * :accepted_payment_methods (Hash)
      #       * :apple_pay (Boolean) 
      #       * :google_pay (Boolean) 
      #       * :cash_app_pay (Boolean) 
      #       * :afterpay_clearpay (Boolean) 
      #     * :app_fee_money (Hash)
      #       * :amount (Long) 
      #       * :currency (SquareApiClient::Currency) 
      #     * :shipping_fee (Hash)
      #       * :name (String) 
      #       * :charge (Hash)
      #         * :amount (Long) 
      #         * :currency (SquareApiClient::Currency) 
      #     * :enable_coupon (Boolean) 
      #     * :enable_loyalty (Boolean) 
      #   * :pre_populated_data (Hash)
      #     * :buyer_email (String) 
      #     * :buyer_phone_number (String) 
      #     * :buyer_address (Hash)
      #       * :address_line_1 (String) 
      #       * :address_line_2 (String) 
      #       * :address_line_3 (String) 
      #       * :locality (String) 
      #       * :sublocality (String) 
      #       * :sublocality_2 (String) 
      #       * :sublocality_3 (String) 
      #       * :administrative_district_level_1 (String) 
      #       * :administrative_district_level_2 (String) 
      #       * :administrative_district_level_3 (String) 
      #       * :postal_code (String) 
      #       * :country (SquareApiClient::Country) 
      #       * :first_name (String) 
      #       * :last_name (String) 
      #   * :url (String) 
      #   * :long_url (String) 
      #   * :created_at (String) 
      #   * :updated_at (String) 
      #   * :payment_note (String) 
      # @param request_options [SquareApiClient::RequestOptions] 
      # @return [SquareApiClient::UpdatePaymentLinkResponse]
      # @example
#  api = SquareApiClient::Client.new(
#    base_url: "https://api.example.com",
#    environment: SquareApiClient::Environment::PRODUCTION,
#    token: "YOUR_AUTH_TOKEN",
#    version: "Version"
#  )
#  api.checkout.payment_links.update(id: "id", payment_link: { version: 1, checkout_options: { ask_for_shipping_address: true } })
      def update(id:, payment_link:, request_options: nil)
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
  req.body = { **(request_options&.additional_body_parameters || {}), payment_link: payment_link }.compact
  req.url "#{@request_client.get_url(request_options: request_options)}/v2/online-checkout/payment-links/#{id}"
end
        SquareApiClient::UpdatePaymentLinkResponse.from_json(json_object: response.body)
      end
# Deletes a payment link.
      #
      # @param id [String] The ID of the payment link to delete.
      # @param request_options [SquareApiClient::RequestOptions] 
      # @return [SquareApiClient::DeletePaymentLinkResponse]
      # @example
#  api = SquareApiClient::Client.new(
#    base_url: "https://api.example.com",
#    environment: SquareApiClient::Environment::PRODUCTION,
#    token: "YOUR_AUTH_TOKEN",
#    version: "Version"
#  )
#  api.checkout.payment_links.delete(id: "id")
      def delete(id:, request_options: nil)
        response = @request_client.conn.delete do | req |
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
  req.url "#{@request_client.get_url(request_options: request_options)}/v2/online-checkout/payment-links/#{id}"
end
        SquareApiClient::DeletePaymentLinkResponse.from_json(json_object: response.body)
      end
    end
    class AsyncPaymentLinksClient
    # @return [SquareApiClient::AsyncRequestClient] 
      attr_reader :request_client


      # @param request_client [SquareApiClient::RequestClient] 
      # @return [SquareApiClient::Checkout::AsyncPaymentLinksClient]
      def initialize(request_client:)
        @request_client = request_client
      end
# Lists all payment links.
      #
      # @param cursor [String] A pagination cursor returned by a previous call to this endpoint.
#  Provide this cursor to retrieve the next set of results for the original query.
#  If a cursor is not provided, the endpoint returns the first page of the results.
#  For more  information, see
#  ttps://developer.squareup.com/docs/build-basics/common-api-patterns/pagination).
      # @param limit [Integer] A limit on the number of results to return per page. The limit is advisory and
#  the implementation might return more or less results. If the supplied limit is
#  negative, zero, or
#  greater than the maximum limit of 1000, it is ignored.
#  Default value: `100`
      # @param request_options [SquareApiClient::RequestOptions] 
      # @return [SquareApiClient::ListPaymentLinksResponse]
      # @example
#  api = SquareApiClient::Client.new(
#    base_url: "https://api.example.com",
#    environment: SquareApiClient::Environment::PRODUCTION,
#    token: "YOUR_AUTH_TOKEN",
#    version: "Version"
#  )
#  api.checkout.payment_links.list
      def list(cursor: nil, limit: nil, request_options: nil)
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
  req.params = { **(request_options&.additional_query_parameters || {}), "cursor": cursor, "limit": limit }.compact
  unless request_options.nil? || request_options&.additional_body_parameters.nil?
    req.body = { **(request_options&.additional_body_parameters || {}) }.compact
  end
  req.url "#{@request_client.get_url(request_options: request_options)}/v2/online-checkout/payment-links"
end
          SquareApiClient::ListPaymentLinksResponse.from_json(json_object: response.body)
        end
      end
# Creates a Square-hosted checkout page. Applications can share the resulting
#  payment link with their buyer to pay for goods and services.
      #
      # @param idempotency_key [String] A unique string that identifies this `CreatePaymentLinkRequest` request.
#  If you do not provide a unique string (or provide an empty string as the value),
#  the endpoint treats each request as independent.
#  For more information, see
#  Idempotency](https://developer.squareup.com/docs/working-with-apis/idempotency).
      # @param description [String] A description of the payment link. You provide this optional description that is
#  useful in your
#  application context. It is not used anywhere.
      # @param quick_pay [Hash] Describes an ad hoc item and price for which to generate a quick pay checkout
#  link.
#  For more information,
#  see [Quick Pay
#  Checkout](https://developer.squareup.com/docs/checkout-api/quick-pay-checkout).Request of type SquareApiClient::QuickPay, as a Hash
      #   * :name (String) 
      #   * :price_money (Hash)
      #     * :amount (Long) 
      #     * :currency (SquareApiClient::Currency) 
      #   * :location_id (String) 
      # @param order [Hash] Describes the `Order` for which to create a checkout link.
#  For more information,
#  see [Square Order
#  eckout](https://developer.squareup.com/docs/checkout-api/square-order-checkout).Request of type SquareApiClient::Order, as a Hash
      #   * :id (String) 
      #   * :location_id (String) 
      #   * :reference_id (String) 
      #   * :source (Hash)
      #     * :name (String) 
      #   * :customer_id (String) 
      #   * :line_items (Array<SquareApiClient::OrderLineItem>) 
      #   * :taxes (Array<SquareApiClient::OrderLineItemTax>) 
      #   * :discounts (Array<SquareApiClient::OrderLineItemDiscount>) 
      #   * :service_charges (Array<SquareApiClient::OrderServiceCharge>) 
      #   * :fulfillments (Array<SquareApiClient::Fulfillment>) 
      #   * :returns (Array<SquareApiClient::OrderReturn>) 
      #   * :return_amounts (Hash)
      #     * :total_money (Hash)
      #       * :amount (Long) 
      #       * :currency (SquareApiClient::Currency) 
      #     * :tax_money (Hash)
      #       * :amount (Long) 
      #       * :currency (SquareApiClient::Currency) 
      #     * :discount_money (Hash)
      #       * :amount (Long) 
      #       * :currency (SquareApiClient::Currency) 
      #     * :tip_money (Hash)
      #       * :amount (Long) 
      #       * :currency (SquareApiClient::Currency) 
      #     * :service_charge_money (Hash)
      #       * :amount (Long) 
      #       * :currency (SquareApiClient::Currency) 
      #   * :net_amounts (Hash)
      #     * :total_money (Hash)
      #       * :amount (Long) 
      #       * :currency (SquareApiClient::Currency) 
      #     * :tax_money (Hash)
      #       * :amount (Long) 
      #       * :currency (SquareApiClient::Currency) 
      #     * :discount_money (Hash)
      #       * :amount (Long) 
      #       * :currency (SquareApiClient::Currency) 
      #     * :tip_money (Hash)
      #       * :amount (Long) 
      #       * :currency (SquareApiClient::Currency) 
      #     * :service_charge_money (Hash)
      #       * :amount (Long) 
      #       * :currency (SquareApiClient::Currency) 
      #   * :rounding_adjustment (Hash)
      #     * :uid (String) 
      #     * :name (String) 
      #     * :amount_money (Hash)
      #       * :amount (Long) 
      #       * :currency (SquareApiClient::Currency) 
      #   * :tenders (Array<SquareApiClient::Tender>) 
      #   * :refunds (Array<SquareApiClient::Refund>) 
      #   * :metadata (Hash{String => String}) 
      #   * :created_at (String) 
      #   * :updated_at (String) 
      #   * :closed_at (String) 
      #   * :state (SquareApiClient::OrderState) 
      #   * :version (Integer) 
      #   * :total_money (Hash)
      #     * :amount (Long) 
      #     * :currency (SquareApiClient::Currency) 
      #   * :total_tax_money (Hash)
      #     * :amount (Long) 
      #     * :currency (SquareApiClient::Currency) 
      #   * :total_discount_money (Hash)
      #     * :amount (Long) 
      #     * :currency (SquareApiClient::Currency) 
      #   * :total_tip_money (Hash)
      #     * :amount (Long) 
      #     * :currency (SquareApiClient::Currency) 
      #   * :total_service_charge_money (Hash)
      #     * :amount (Long) 
      #     * :currency (SquareApiClient::Currency) 
      #   * :ticket_name (String) 
      #   * :pricing_options (Hash)
      #     * :auto_apply_discounts (Boolean) 
      #     * :auto_apply_taxes (Boolean) 
      #   * :rewards (Array<SquareApiClient::OrderReward>) 
      #   * :net_amount_due_money (Hash)
      #     * :amount (Long) 
      #     * :currency (SquareApiClient::Currency) 
      # @param checkout_options [Hash] Describes optional fields to add to the resulting checkout page.
#  For more information,
#  see [Optional Checkout
#  ps://developer.squareup.com/docs/checkout-api/optional-checkout-configurations).Request of type SquareApiClient::CheckoutOptions, as a Hash
      #   * :allow_tipping (Boolean) 
      #   * :custom_fields (Array<SquareApiClient::CustomField>) 
      #   * :subscription_plan_id (String) 
      #   * :redirect_url (String) 
      #   * :merchant_support_email (String) 
      #   * :ask_for_shipping_address (Boolean) 
      #   * :accepted_payment_methods (Hash)
      #     * :apple_pay (Boolean) 
      #     * :google_pay (Boolean) 
      #     * :cash_app_pay (Boolean) 
      #     * :afterpay_clearpay (Boolean) 
      #   * :app_fee_money (Hash)
      #     * :amount (Long) 
      #     * :currency (SquareApiClient::Currency) 
      #   * :shipping_fee (Hash)
      #     * :name (String) 
      #     * :charge (Hash)
      #       * :amount (Long) 
      #       * :currency (SquareApiClient::Currency) 
      #   * :enable_coupon (Boolean) 
      #   * :enable_loyalty (Boolean) 
      # @param pre_populated_data [Hash] Describes fields to prepopulate in the resulting checkout page.
#  For more information, see [Prepopulate the shipping
#  checkout-api/optional-checkout-configurations#prepopulate-the-shipping-address).Request of type SquareApiClient::PrePopulatedData, as a Hash
      #   * :buyer_email (String) 
      #   * :buyer_phone_number (String) 
      #   * :buyer_address (Hash)
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
      #     * :country (SquareApiClient::Country) 
      #     * :first_name (String) 
      #     * :last_name (String) 
      # @param payment_note [String] A note for the payment. After processing the payment, Square adds this note to
#  the resulting `Payment`.
      # @param request_options [SquareApiClient::RequestOptions] 
      # @return [SquareApiClient::CreatePaymentLinkResponse]
      # @example
#  api = SquareApiClient::Client.new(
#    base_url: "https://api.example.com",
#    environment: SquareApiClient::Environment::PRODUCTION,
#    token: "YOUR_AUTH_TOKEN",
#    version: "Version"
#  )
#  api.checkout.payment_links.create(idempotency_key: "cd9e25dc-d9f2-4430-aedb-61605070e95f", quick_pay: { name: "Auto Detailing", price_money: { amount: 10000, currency: USD }, location_id: "A9Y43N9ABXZBP" })
      def create(idempotency_key: nil, description: nil, quick_pay: nil, order: nil, checkout_options: nil, pre_populated_data: nil, payment_note: nil, request_options: nil)
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
  req.body = { **(request_options&.additional_body_parameters || {}), idempotency_key: idempotency_key, description: description, quick_pay: quick_pay, order: order, checkout_options: checkout_options, pre_populated_data: pre_populated_data, payment_note: payment_note }.compact
  req.url "#{@request_client.get_url(request_options: request_options)}/v2/online-checkout/payment-links"
end
          SquareApiClient::CreatePaymentLinkResponse.from_json(json_object: response.body)
        end
      end
# Retrieves a payment link.
      #
      # @param id [String] The ID of link to retrieve.
      # @param request_options [SquareApiClient::RequestOptions] 
      # @return [SquareApiClient::GetPaymentLinkResponse]
      # @example
#  api = SquareApiClient::Client.new(
#    base_url: "https://api.example.com",
#    environment: SquareApiClient::Environment::PRODUCTION,
#    token: "YOUR_AUTH_TOKEN",
#    version: "Version"
#  )
#  api.checkout.payment_links.get(id: "id")
      def get(id:, request_options: nil)
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
  req.url "#{@request_client.get_url(request_options: request_options)}/v2/online-checkout/payment-links/#{id}"
end
          SquareApiClient::GetPaymentLinkResponse.from_json(json_object: response.body)
        end
      end
# Updates a payment link. You can update the `payment_link` fields such as
#  `description`, `checkout_options`, and  `pre_populated_data`.
#  You cannot update other fields such as the `order_id`, `version`, `URL`, or
#  `timestamp` field.
      #
      # @param id [String] The ID of the payment link to update.
      # @param payment_link [Hash] The `payment_link` object describing the updates to apply.
#  For more information, see [Update a payment
#  developer.squareup.com/docs/checkout-api/manage-checkout#update-a-payment-link).Request of type SquareApiClient::PaymentLink, as a Hash
      #   * :id (String) 
      #   * :version (Integer) 
      #   * :description (String) 
      #   * :order_id (String) 
      #   * :checkout_options (Hash)
      #     * :allow_tipping (Boolean) 
      #     * :custom_fields (Array<SquareApiClient::CustomField>) 
      #     * :subscription_plan_id (String) 
      #     * :redirect_url (String) 
      #     * :merchant_support_email (String) 
      #     * :ask_for_shipping_address (Boolean) 
      #     * :accepted_payment_methods (Hash)
      #       * :apple_pay (Boolean) 
      #       * :google_pay (Boolean) 
      #       * :cash_app_pay (Boolean) 
      #       * :afterpay_clearpay (Boolean) 
      #     * :app_fee_money (Hash)
      #       * :amount (Long) 
      #       * :currency (SquareApiClient::Currency) 
      #     * :shipping_fee (Hash)
      #       * :name (String) 
      #       * :charge (Hash)
      #         * :amount (Long) 
      #         * :currency (SquareApiClient::Currency) 
      #     * :enable_coupon (Boolean) 
      #     * :enable_loyalty (Boolean) 
      #   * :pre_populated_data (Hash)
      #     * :buyer_email (String) 
      #     * :buyer_phone_number (String) 
      #     * :buyer_address (Hash)
      #       * :address_line_1 (String) 
      #       * :address_line_2 (String) 
      #       * :address_line_3 (String) 
      #       * :locality (String) 
      #       * :sublocality (String) 
      #       * :sublocality_2 (String) 
      #       * :sublocality_3 (String) 
      #       * :administrative_district_level_1 (String) 
      #       * :administrative_district_level_2 (String) 
      #       * :administrative_district_level_3 (String) 
      #       * :postal_code (String) 
      #       * :country (SquareApiClient::Country) 
      #       * :first_name (String) 
      #       * :last_name (String) 
      #   * :url (String) 
      #   * :long_url (String) 
      #   * :created_at (String) 
      #   * :updated_at (String) 
      #   * :payment_note (String) 
      # @param request_options [SquareApiClient::RequestOptions] 
      # @return [SquareApiClient::UpdatePaymentLinkResponse]
      # @example
#  api = SquareApiClient::Client.new(
#    base_url: "https://api.example.com",
#    environment: SquareApiClient::Environment::PRODUCTION,
#    token: "YOUR_AUTH_TOKEN",
#    version: "Version"
#  )
#  api.checkout.payment_links.update(id: "id", payment_link: { version: 1, checkout_options: { ask_for_shipping_address: true } })
      def update(id:, payment_link:, request_options: nil)
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
  req.body = { **(request_options&.additional_body_parameters || {}), payment_link: payment_link }.compact
  req.url "#{@request_client.get_url(request_options: request_options)}/v2/online-checkout/payment-links/#{id}"
end
          SquareApiClient::UpdatePaymentLinkResponse.from_json(json_object: response.body)
        end
      end
# Deletes a payment link.
      #
      # @param id [String] The ID of the payment link to delete.
      # @param request_options [SquareApiClient::RequestOptions] 
      # @return [SquareApiClient::DeletePaymentLinkResponse]
      # @example
#  api = SquareApiClient::Client.new(
#    base_url: "https://api.example.com",
#    environment: SquareApiClient::Environment::PRODUCTION,
#    token: "YOUR_AUTH_TOKEN",
#    version: "Version"
#  )
#  api.checkout.payment_links.delete(id: "id")
      def delete(id:, request_options: nil)
        Async do
          response = @request_client.conn.delete do | req |
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
  req.url "#{@request_client.get_url(request_options: request_options)}/v2/online-checkout/payment-links/#{id}"
end
          SquareApiClient::DeletePaymentLinkResponse.from_json(json_object: response.body)
        end
      end
    end
  end
end