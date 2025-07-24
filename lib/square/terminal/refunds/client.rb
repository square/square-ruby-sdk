# frozen_string_literal: true
require_relative "../../../requests"
require_relative "../../types/terminal_refund"
require_relative "../../types/create_terminal_refund_response"
require_relative "../../types/terminal_refund_query"
require_relative "../../types/search_terminal_refunds_response"
require_relative "../../types/get_terminal_refund_response"
require_relative "../../types/cancel_terminal_refund_response"
require "async"
require "async"
require "async"
require "async"
require_relative "../../../requests"

module square.rb
  module Terminal
    class RefundsClient
    # @return [square.rb::RequestClient] 
      attr_reader :request_client


      # @param request_client [square.rb::RequestClient] 
      # @return [square.rb::Terminal::RefundsClient]
      def initialize(request_client:)
        @request_client = request_client
      end
# Creates a request to refund an Interac payment completed on a Square Terminal.
#  Refunds for Interac payments on a Square Terminal are supported only for Interac
#  debit cards in Canada. Other refunds for Terminal payments should use the
#  Refunds API. For more information, see [Refunds API](api:Refunds).
      #
      # @param idempotency_key [String] A unique string that identifies this `CreateRefund` request. Keys can be any
#  valid string but
#  must be unique for every `CreateRefund` request.
#  See [Idempotency
#  ttps://developer.squareup.com/docs/build-basics/common-api-patterns/idempotency)
#  for more information.
      # @param refund [Hash] The refund to create.Request of type square.rb::TerminalRefund, as a Hash
      #   * :id (String) 
      #   * :refund_id (String) 
      #   * :payment_id (String) 
      #   * :order_id (String) 
      #   * :amount_money (Hash)
      #     * :amount (Long) 
      #     * :currency (square.rb::Currency) 
      #   * :reason (String) 
      #   * :device_id (String) 
      #   * :deadline_duration (String) 
      #   * :status (String) 
      #   * :cancel_reason (square.rb::ActionCancelReason) 
      #   * :created_at (String) 
      #   * :updated_at (String) 
      #   * :app_id (String) 
      #   * :location_id (String) 
      # @param request_options [square.rb::RequestOptions] 
      # @return [square.rb::CreateTerminalRefundResponse]
      # @example
#  api = square.rb::Client.new(
#    base_url: "https://api.example.com",
#    environment: square.rb::Environment::PRODUCTION,
#    token: "YOUR_AUTH_TOKEN",
#    version: "Version"
#  )
#  api.terminal.refunds.create(idempotency_key: "402a640b-b26f-401f-b406-46f839590c04", refund: { payment_id: "5O5OvgkcNUhl7JBuINflcjKqUzXZY", amount_money: { amount: 111, currency: CAD }, reason: "Returning items", device_id: "f72dfb8e-4d65-4e56-aade-ec3fb8d33291" })
      def create(idempotency_key:, refund: nil, request_options: nil)
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
  req.body = { **(request_options&.additional_body_parameters || {}), idempotency_key: idempotency_key, refund: refund }.compact
  req.url "#{@request_client.get_url(request_options: request_options)}/v2/terminals/refunds"
end
        square.rb::CreateTerminalRefundResponse.from_json(json_object: response.body)
      end
# Retrieves a filtered list of Interac Terminal refund requests created by the
#  seller making the request. Terminal refund requests are available for 30 days.
      #
      # @param query [Hash] Queries the Terminal refunds based on given conditions and the sort order.
#  Calling
#  `SearchTerminalRefunds` without an explicit query parameter returns all
#  available
#  refunds with the default sort order.Request of type square.rb::TerminalRefundQuery, as a Hash
      #   * :filter (Hash)
      #     * :device_id (String) 
      #     * :created_at (Hash)
      #       * :start_at (String) 
      #       * :end_at (String) 
      #     * :status (String) 
      #   * :sort (Hash)
      #     * :sort_order (String) 
      # @param cursor [String] A pagination cursor returned by a previous call to this endpoint.
#  Provide this cursor to retrieve the next set of results for the original query.
      # @param limit [Integer] Limits the number of results returned for a single request.
      # @param request_options [square.rb::RequestOptions] 
      # @return [square.rb::SearchTerminalRefundsResponse]
      # @example
#  api = square.rb::Client.new(
#    base_url: "https://api.example.com",
#    environment: square.rb::Environment::PRODUCTION,
#    token: "YOUR_AUTH_TOKEN",
#    version: "Version"
#  )
#  api.terminal.refunds.search(query: { filter: { status: "COMPLETED" } }, limit: 1)
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
  req.url "#{@request_client.get_url(request_options: request_options)}/v2/terminals/refunds/search"
end
        square.rb::SearchTerminalRefundsResponse.from_json(json_object: response.body)
      end
# Retrieves an Interac Terminal refund object by ID. Terminal refund objects are
#  available for 30 days.
      #
      # @param terminal_refund_id [String] The unique ID for the desired `TerminalRefund`.
      # @param request_options [square.rb::RequestOptions] 
      # @return [square.rb::GetTerminalRefundResponse]
      # @example
#  api = square.rb::Client.new(
#    base_url: "https://api.example.com",
#    environment: square.rb::Environment::PRODUCTION,
#    token: "YOUR_AUTH_TOKEN",
#    version: "Version"
#  )
#  api.terminal.refunds.get(terminal_refund_id: "terminal_refund_id")
      def get(terminal_refund_id:, request_options: nil)
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
  req.url "#{@request_client.get_url(request_options: request_options)}/v2/terminals/refunds/#{terminal_refund_id}"
end
        square.rb::GetTerminalRefundResponse.from_json(json_object: response.body)
      end
# Cancels an Interac Terminal refund request by refund request ID if the status of
#  the request permits it.
      #
      # @param terminal_refund_id [String] The unique ID for the desired `TerminalRefund`.
      # @param request_options [square.rb::RequestOptions] 
      # @return [square.rb::CancelTerminalRefundResponse]
      # @example
#  api = square.rb::Client.new(
#    base_url: "https://api.example.com",
#    environment: square.rb::Environment::PRODUCTION,
#    token: "YOUR_AUTH_TOKEN",
#    version: "Version"
#  )
#  api.terminal.refunds.cancel(terminal_refund_id: "terminal_refund_id")
      def cancel(terminal_refund_id:, request_options: nil)
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
  req.url "#{@request_client.get_url(request_options: request_options)}/v2/terminals/refunds/#{terminal_refund_id}/cancel"
end
        square.rb::CancelTerminalRefundResponse.from_json(json_object: response.body)
      end
    end
    class AsyncRefundsClient
    # @return [square.rb::AsyncRequestClient] 
      attr_reader :request_client


      # @param request_client [square.rb::RequestClient] 
      # @return [square.rb::Terminal::AsyncRefundsClient]
      def initialize(request_client:)
        @request_client = request_client
      end
# Creates a request to refund an Interac payment completed on a Square Terminal.
#  Refunds for Interac payments on a Square Terminal are supported only for Interac
#  debit cards in Canada. Other refunds for Terminal payments should use the
#  Refunds API. For more information, see [Refunds API](api:Refunds).
      #
      # @param idempotency_key [String] A unique string that identifies this `CreateRefund` request. Keys can be any
#  valid string but
#  must be unique for every `CreateRefund` request.
#  See [Idempotency
#  ttps://developer.squareup.com/docs/build-basics/common-api-patterns/idempotency)
#  for more information.
      # @param refund [Hash] The refund to create.Request of type square.rb::TerminalRefund, as a Hash
      #   * :id (String) 
      #   * :refund_id (String) 
      #   * :payment_id (String) 
      #   * :order_id (String) 
      #   * :amount_money (Hash)
      #     * :amount (Long) 
      #     * :currency (square.rb::Currency) 
      #   * :reason (String) 
      #   * :device_id (String) 
      #   * :deadline_duration (String) 
      #   * :status (String) 
      #   * :cancel_reason (square.rb::ActionCancelReason) 
      #   * :created_at (String) 
      #   * :updated_at (String) 
      #   * :app_id (String) 
      #   * :location_id (String) 
      # @param request_options [square.rb::RequestOptions] 
      # @return [square.rb::CreateTerminalRefundResponse]
      # @example
#  api = square.rb::Client.new(
#    base_url: "https://api.example.com",
#    environment: square.rb::Environment::PRODUCTION,
#    token: "YOUR_AUTH_TOKEN",
#    version: "Version"
#  )
#  api.terminal.refunds.create(idempotency_key: "402a640b-b26f-401f-b406-46f839590c04", refund: { payment_id: "5O5OvgkcNUhl7JBuINflcjKqUzXZY", amount_money: { amount: 111, currency: CAD }, reason: "Returning items", device_id: "f72dfb8e-4d65-4e56-aade-ec3fb8d33291" })
      def create(idempotency_key:, refund: nil, request_options: nil)
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
  req.body = { **(request_options&.additional_body_parameters || {}), idempotency_key: idempotency_key, refund: refund }.compact
  req.url "#{@request_client.get_url(request_options: request_options)}/v2/terminals/refunds"
end
          square.rb::CreateTerminalRefundResponse.from_json(json_object: response.body)
        end
      end
# Retrieves a filtered list of Interac Terminal refund requests created by the
#  seller making the request. Terminal refund requests are available for 30 days.
      #
      # @param query [Hash] Queries the Terminal refunds based on given conditions and the sort order.
#  Calling
#  `SearchTerminalRefunds` without an explicit query parameter returns all
#  available
#  refunds with the default sort order.Request of type square.rb::TerminalRefundQuery, as a Hash
      #   * :filter (Hash)
      #     * :device_id (String) 
      #     * :created_at (Hash)
      #       * :start_at (String) 
      #       * :end_at (String) 
      #     * :status (String) 
      #   * :sort (Hash)
      #     * :sort_order (String) 
      # @param cursor [String] A pagination cursor returned by a previous call to this endpoint.
#  Provide this cursor to retrieve the next set of results for the original query.
      # @param limit [Integer] Limits the number of results returned for a single request.
      # @param request_options [square.rb::RequestOptions] 
      # @return [square.rb::SearchTerminalRefundsResponse]
      # @example
#  api = square.rb::Client.new(
#    base_url: "https://api.example.com",
#    environment: square.rb::Environment::PRODUCTION,
#    token: "YOUR_AUTH_TOKEN",
#    version: "Version"
#  )
#  api.terminal.refunds.search(query: { filter: { status: "COMPLETED" } }, limit: 1)
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
  req.url "#{@request_client.get_url(request_options: request_options)}/v2/terminals/refunds/search"
end
          square.rb::SearchTerminalRefundsResponse.from_json(json_object: response.body)
        end
      end
# Retrieves an Interac Terminal refund object by ID. Terminal refund objects are
#  available for 30 days.
      #
      # @param terminal_refund_id [String] The unique ID for the desired `TerminalRefund`.
      # @param request_options [square.rb::RequestOptions] 
      # @return [square.rb::GetTerminalRefundResponse]
      # @example
#  api = square.rb::Client.new(
#    base_url: "https://api.example.com",
#    environment: square.rb::Environment::PRODUCTION,
#    token: "YOUR_AUTH_TOKEN",
#    version: "Version"
#  )
#  api.terminal.refunds.get(terminal_refund_id: "terminal_refund_id")
      def get(terminal_refund_id:, request_options: nil)
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
  req.url "#{@request_client.get_url(request_options: request_options)}/v2/terminals/refunds/#{terminal_refund_id}"
end
          square.rb::GetTerminalRefundResponse.from_json(json_object: response.body)
        end
      end
# Cancels an Interac Terminal refund request by refund request ID if the status of
#  the request permits it.
      #
      # @param terminal_refund_id [String] The unique ID for the desired `TerminalRefund`.
      # @param request_options [square.rb::RequestOptions] 
      # @return [square.rb::CancelTerminalRefundResponse]
      # @example
#  api = square.rb::Client.new(
#    base_url: "https://api.example.com",
#    environment: square.rb::Environment::PRODUCTION,
#    token: "YOUR_AUTH_TOKEN",
#    version: "Version"
#  )
#  api.terminal.refunds.cancel(terminal_refund_id: "terminal_refund_id")
      def cancel(terminal_refund_id:, request_options: nil)
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
  req.url "#{@request_client.get_url(request_options: request_options)}/v2/terminals/refunds/#{terminal_refund_id}/cancel"
end
          square.rb::CancelTerminalRefundResponse.from_json(json_object: response.body)
        end
      end
    end
  end
end