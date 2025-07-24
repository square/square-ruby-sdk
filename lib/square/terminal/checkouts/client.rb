# frozen_string_literal: true
require_relative "../../../requests"
require_relative "../../types/terminal_checkout"
require_relative "../../types/create_terminal_checkout_response"
require_relative "../../types/terminal_checkout_query"
require_relative "../../types/search_terminal_checkouts_response"
require_relative "../../types/get_terminal_checkout_response"
require_relative "../../types/cancel_terminal_checkout_response"
require "async"
require "async"
require "async"
require "async"
require_relative "../../../requests"

module square.rb
  module Terminal
    class CheckoutsClient
    # @return [square.rb::RequestClient] 
      attr_reader :request_client


      # @param request_client [square.rb::RequestClient] 
      # @return [square.rb::Terminal::CheckoutsClient]
      def initialize(request_client:)
        @request_client = request_client
      end
# Creates a Terminal checkout request and sends it to the specified device to take
#  a payment
#  for the requested amount.
      #
      # @param idempotency_key [String] A unique string that identifies this `CreateCheckout` request. Keys can be any
#  valid string but
#  must be unique for every `CreateCheckout` request.
#  See [Idempotency
#  ttps://developer.squareup.com/docs/build-basics/common-api-patterns/idempotency)
#  for more information.
      # @param checkout [Hash] The checkout to create.Request of type square.rb::TerminalCheckout, as a Hash
      #   * :id (String) 
      #   * :amount_money (Hash)
      #     * :amount (Long) 
      #     * :currency (square.rb::Currency) 
      #   * :reference_id (String) 
      #   * :note (String) 
      #   * :order_id (String) 
      #   * :payment_options (Hash)
      #     * :autocomplete (Boolean) 
      #     * :delay_duration (String) 
      #     * :accept_partial_authorization (Boolean) 
      #     * :delay_action (square.rb::PaymentOptionsDelayAction) 
      #   * :device_options (Hash)
      #     * :device_id (String) 
      #     * :skip_receipt_screen (Boolean) 
      #     * :collect_signature (Boolean) 
      #     * :tip_settings (Hash)
      #       * :allow_tipping (Boolean) 
      #       * :separate_tip_screen (Boolean) 
      #       * :custom_tip_field (Boolean) 
      #       * :tip_percentages (Array<Integer>) 
      #       * :smart_tipping (Boolean) 
      #     * :show_itemized_cart (Boolean) 
      #   * :deadline_duration (String) 
      #   * :status (String) 
      #   * :cancel_reason (square.rb::ActionCancelReason) 
      #   * :payment_ids (Array<String>) 
      #   * :created_at (String) 
      #   * :updated_at (String) 
      #   * :app_id (String) 
      #   * :location_id (String) 
      #   * :payment_type (square.rb::CheckoutOptionsPaymentType) 
      #   * :team_member_id (String) 
      #   * :customer_id (String) 
      #   * :app_fee_money (Hash)
      #     * :amount (Long) 
      #     * :currency (square.rb::Currency) 
      #   * :statement_description_identifier (String) 
      #   * :tip_money (Hash)
      #     * :amount (Long) 
      #     * :currency (square.rb::Currency) 
      # @param request_options [square.rb::RequestOptions] 
      # @return [square.rb::CreateTerminalCheckoutResponse]
      # @example
#  api = square.rb::Client.new(
#    base_url: "https://api.example.com",
#    environment: square.rb::Environment::PRODUCTION,
#    token: "YOUR_AUTH_TOKEN",
#    version: "Version"
#  )
#  api.terminal.checkouts.create(idempotency_key: "28a0c3bc-7839-11ea-bc55-0242ac130003", checkout: { amount_money: { amount: 2610, currency: USD }, reference_id: "id11572", note: "A brief note", device_options: { device_id: "dbb5d83a-7838-11ea-bc55-0242ac130003" } })
      def create(idempotency_key:, checkout:, request_options: nil)
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
  req.body = { **(request_options&.additional_body_parameters || {}), idempotency_key: idempotency_key, checkout: checkout }.compact
  req.url "#{@request_client.get_url(request_options: request_options)}/v2/terminals/checkouts"
end
        square.rb::CreateTerminalCheckoutResponse.from_json(json_object: response.body)
      end
# Returns a filtered list of Terminal checkout requests created by the application
#  making the request. Only Terminal checkout requests created for the merchant
#  scoped to the OAuth token are returned. Terminal checkout requests are available
#  for 30 days.
      #
      # @param query [Hash] Queries Terminal checkouts based on given conditions and the sort order.
#  Leaving these unset returns all checkouts with the default sort order.Request of type square.rb::TerminalCheckoutQuery, as a Hash
      #   * :filter (Hash)
      #     * :device_id (String) 
      #     * :created_at (Hash)
      #       * :start_at (String) 
      #       * :end_at (String) 
      #     * :status (String) 
      #   * :sort (Hash)
      #     * :sort_order (square.rb::SortOrder) 
      # @param cursor [String] A pagination cursor returned by a previous call to this endpoint.
#  Provide this cursor to retrieve the next set of results for the original query.
#  See
#  https://developer.squareup.com/docs/build-basics/common-api-patterns/pagination)
#  for more information.
      # @param limit [Integer] Limits the number of results returned for a single request.
      # @param request_options [square.rb::RequestOptions] 
      # @return [square.rb::SearchTerminalCheckoutsResponse]
      # @example
#  api = square.rb::Client.new(
#    base_url: "https://api.example.com",
#    environment: square.rb::Environment::PRODUCTION,
#    token: "YOUR_AUTH_TOKEN",
#    version: "Version"
#  )
#  api.terminal.checkouts.search(query: { filter: { status: "COMPLETED" } }, limit: 2)
      def search(query: nil, cursor: nil, limit: nil, request_options: nil)
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
  req.body = { **(request_options&.additional_body_parameters || {}), query: query, cursor: cursor, limit: limit }.compact
  req.url "#{@request_client.get_url(request_options: request_options)}/v2/terminals/checkouts/search"
end
        square.rb::SearchTerminalCheckoutsResponse.from_json(json_object: response.body)
      end
# Retrieves a Terminal checkout request by `checkout_id`. Terminal checkout
#  requests are available for 30 days.
      #
      # @param checkout_id [String] The unique ID for the desired `TerminalCheckout`.
      # @param request_options [square.rb::RequestOptions] 
      # @return [square.rb::GetTerminalCheckoutResponse]
      # @example
#  api = square.rb::Client.new(
#    base_url: "https://api.example.com",
#    environment: square.rb::Environment::PRODUCTION,
#    token: "YOUR_AUTH_TOKEN",
#    version: "Version"
#  )
#  api.terminal.checkouts.get(checkout_id: "checkout_id")
      def get(checkout_id:, request_options: nil)
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
  req.url "#{@request_client.get_url(request_options: request_options)}/v2/terminals/checkouts/#{checkout_id}"
end
        square.rb::GetTerminalCheckoutResponse.from_json(json_object: response.body)
      end
# Cancels a Terminal checkout request if the status of the request permits it.
      #
      # @param checkout_id [String] The unique ID for the desired `TerminalCheckout`.
      # @param request_options [square.rb::RequestOptions] 
      # @return [square.rb::CancelTerminalCheckoutResponse]
      # @example
#  api = square.rb::Client.new(
#    base_url: "https://api.example.com",
#    environment: square.rb::Environment::PRODUCTION,
#    token: "YOUR_AUTH_TOKEN",
#    version: "Version"
#  )
#  api.terminal.checkouts.cancel(checkout_id: "checkout_id")
      def cancel(checkout_id:, request_options: nil)
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
  req.url "#{@request_client.get_url(request_options: request_options)}/v2/terminals/checkouts/#{checkout_id}/cancel"
end
        square.rb::CancelTerminalCheckoutResponse.from_json(json_object: response.body)
      end
    end
    class AsyncCheckoutsClient
    # @return [square.rb::AsyncRequestClient] 
      attr_reader :request_client


      # @param request_client [square.rb::RequestClient] 
      # @return [square.rb::Terminal::AsyncCheckoutsClient]
      def initialize(request_client:)
        @request_client = request_client
      end
# Creates a Terminal checkout request and sends it to the specified device to take
#  a payment
#  for the requested amount.
      #
      # @param idempotency_key [String] A unique string that identifies this `CreateCheckout` request. Keys can be any
#  valid string but
#  must be unique for every `CreateCheckout` request.
#  See [Idempotency
#  ttps://developer.squareup.com/docs/build-basics/common-api-patterns/idempotency)
#  for more information.
      # @param checkout [Hash] The checkout to create.Request of type square.rb::TerminalCheckout, as a Hash
      #   * :id (String) 
      #   * :amount_money (Hash)
      #     * :amount (Long) 
      #     * :currency (square.rb::Currency) 
      #   * :reference_id (String) 
      #   * :note (String) 
      #   * :order_id (String) 
      #   * :payment_options (Hash)
      #     * :autocomplete (Boolean) 
      #     * :delay_duration (String) 
      #     * :accept_partial_authorization (Boolean) 
      #     * :delay_action (square.rb::PaymentOptionsDelayAction) 
      #   * :device_options (Hash)
      #     * :device_id (String) 
      #     * :skip_receipt_screen (Boolean) 
      #     * :collect_signature (Boolean) 
      #     * :tip_settings (Hash)
      #       * :allow_tipping (Boolean) 
      #       * :separate_tip_screen (Boolean) 
      #       * :custom_tip_field (Boolean) 
      #       * :tip_percentages (Array<Integer>) 
      #       * :smart_tipping (Boolean) 
      #     * :show_itemized_cart (Boolean) 
      #   * :deadline_duration (String) 
      #   * :status (String) 
      #   * :cancel_reason (square.rb::ActionCancelReason) 
      #   * :payment_ids (Array<String>) 
      #   * :created_at (String) 
      #   * :updated_at (String) 
      #   * :app_id (String) 
      #   * :location_id (String) 
      #   * :payment_type (square.rb::CheckoutOptionsPaymentType) 
      #   * :team_member_id (String) 
      #   * :customer_id (String) 
      #   * :app_fee_money (Hash)
      #     * :amount (Long) 
      #     * :currency (square.rb::Currency) 
      #   * :statement_description_identifier (String) 
      #   * :tip_money (Hash)
      #     * :amount (Long) 
      #     * :currency (square.rb::Currency) 
      # @param request_options [square.rb::RequestOptions] 
      # @return [square.rb::CreateTerminalCheckoutResponse]
      # @example
#  api = square.rb::Client.new(
#    base_url: "https://api.example.com",
#    environment: square.rb::Environment::PRODUCTION,
#    token: "YOUR_AUTH_TOKEN",
#    version: "Version"
#  )
#  api.terminal.checkouts.create(idempotency_key: "28a0c3bc-7839-11ea-bc55-0242ac130003", checkout: { amount_money: { amount: 2610, currency: USD }, reference_id: "id11572", note: "A brief note", device_options: { device_id: "dbb5d83a-7838-11ea-bc55-0242ac130003" } })
      def create(idempotency_key:, checkout:, request_options: nil)
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
  req.body = { **(request_options&.additional_body_parameters || {}), idempotency_key: idempotency_key, checkout: checkout }.compact
  req.url "#{@request_client.get_url(request_options: request_options)}/v2/terminals/checkouts"
end
          square.rb::CreateTerminalCheckoutResponse.from_json(json_object: response.body)
        end
      end
# Returns a filtered list of Terminal checkout requests created by the application
#  making the request. Only Terminal checkout requests created for the merchant
#  scoped to the OAuth token are returned. Terminal checkout requests are available
#  for 30 days.
      #
      # @param query [Hash] Queries Terminal checkouts based on given conditions and the sort order.
#  Leaving these unset returns all checkouts with the default sort order.Request of type square.rb::TerminalCheckoutQuery, as a Hash
      #   * :filter (Hash)
      #     * :device_id (String) 
      #     * :created_at (Hash)
      #       * :start_at (String) 
      #       * :end_at (String) 
      #     * :status (String) 
      #   * :sort (Hash)
      #     * :sort_order (square.rb::SortOrder) 
      # @param cursor [String] A pagination cursor returned by a previous call to this endpoint.
#  Provide this cursor to retrieve the next set of results for the original query.
#  See
#  https://developer.squareup.com/docs/build-basics/common-api-patterns/pagination)
#  for more information.
      # @param limit [Integer] Limits the number of results returned for a single request.
      # @param request_options [square.rb::RequestOptions] 
      # @return [square.rb::SearchTerminalCheckoutsResponse]
      # @example
#  api = square.rb::Client.new(
#    base_url: "https://api.example.com",
#    environment: square.rb::Environment::PRODUCTION,
#    token: "YOUR_AUTH_TOKEN",
#    version: "Version"
#  )
#  api.terminal.checkouts.search(query: { filter: { status: "COMPLETED" } }, limit: 2)
      def search(query: nil, cursor: nil, limit: nil, request_options: nil)
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
  req.body = { **(request_options&.additional_body_parameters || {}), query: query, cursor: cursor, limit: limit }.compact
  req.url "#{@request_client.get_url(request_options: request_options)}/v2/terminals/checkouts/search"
end
          square.rb::SearchTerminalCheckoutsResponse.from_json(json_object: response.body)
        end
      end
# Retrieves a Terminal checkout request by `checkout_id`. Terminal checkout
#  requests are available for 30 days.
      #
      # @param checkout_id [String] The unique ID for the desired `TerminalCheckout`.
      # @param request_options [square.rb::RequestOptions] 
      # @return [square.rb::GetTerminalCheckoutResponse]
      # @example
#  api = square.rb::Client.new(
#    base_url: "https://api.example.com",
#    environment: square.rb::Environment::PRODUCTION,
#    token: "YOUR_AUTH_TOKEN",
#    version: "Version"
#  )
#  api.terminal.checkouts.get(checkout_id: "checkout_id")
      def get(checkout_id:, request_options: nil)
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
  req.url "#{@request_client.get_url(request_options: request_options)}/v2/terminals/checkouts/#{checkout_id}"
end
          square.rb::GetTerminalCheckoutResponse.from_json(json_object: response.body)
        end
      end
# Cancels a Terminal checkout request if the status of the request permits it.
      #
      # @param checkout_id [String] The unique ID for the desired `TerminalCheckout`.
      # @param request_options [square.rb::RequestOptions] 
      # @return [square.rb::CancelTerminalCheckoutResponse]
      # @example
#  api = square.rb::Client.new(
#    base_url: "https://api.example.com",
#    environment: square.rb::Environment::PRODUCTION,
#    token: "YOUR_AUTH_TOKEN",
#    version: "Version"
#  )
#  api.terminal.checkouts.cancel(checkout_id: "checkout_id")
      def cancel(checkout_id:, request_options: nil)
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
  req.url "#{@request_client.get_url(request_options: request_options)}/v2/terminals/checkouts/#{checkout_id}/cancel"
end
          square.rb::CancelTerminalCheckoutResponse.from_json(json_object: response.body)
        end
      end
    end
  end
end