# frozen_string_literal: true
require_relative "../../../requests"
require_relative "../../types/sort_order"
require_relative "../../types/list_transactions_response"
require_relative "../../types/get_transaction_response"
require_relative "../../types/capture_transaction_response"
require_relative "../../types/void_transaction_response"
require "async"
require "async"
require "async"
require "async"
require_relative "../../../requests"

module SquareApiClient
  module Locations
    class TransactionsClient
    # @return [SquareApiClient::RequestClient] 
      attr_reader :request_client


      # @param request_client [SquareApiClient::RequestClient] 
      # @return [SquareApiClient::Locations::TransactionsClient]
      def initialize(request_client:)
        @request_client = request_client
      end
# Lists transactions for a particular location.
#  Transactions include payment information from sales and exchanges and refund
#  information from returns and exchanges.
#  Max results per
#  [page](https://developer.squareup.com/docs/working-with-apis/pagination): 50
      #
      # @param location_id [String] The ID of the location to list transactions for.
      # @param begin_time [String] The beginning of the requested reporting period, in RFC 3339 format.
#  See [Date
#  ranges](https://developer.squareup.com/docs/build-basics/working-with-dates) for
#  details on date inclusivity/exclusivity.
#  Default value: The current time minus one year.
      # @param end_time [String] The end of the requested reporting period, in RFC 3339 format.
#  See [Date
#  ranges](https://developer.squareup.com/docs/build-basics/working-with-dates) for
#  details on date inclusivity/exclusivity.
#  Default value: The current time.
      # @param sort_order [SquareApiClient::SortOrder] The order in which results are listed in the response (`ASC` for
#  oldest first, `DESC` for newest first).
#  Default value: `DESC`
      # @param cursor [String] A pagination cursor returned by a previous call to this endpoint.
#  Provide this to retrieve the next set of results for your original query.
#  See [Paginating
#  results](https://developer.squareup.com/docs/working-with-apis/pagination) for
#  more information.
      # @param request_options [SquareApiClient::RequestOptions] 
      # @return [SquareApiClient::ListTransactionsResponse]
      # @example
#  api = SquareApiClient::Client.new(
#    base_url: "https://api.example.com",
#    environment: SquareApiClient::Environment::PRODUCTION,
#    token: "YOUR_AUTH_TOKEN",
#    version: "Version"
#  )
#  api.locations.transactions.list(location_id: "location_id")
      def list(location_id:, begin_time: nil, end_time: nil, sort_order: nil, cursor: nil, request_options: nil)
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
  req.params = { **(request_options&.additional_query_parameters || {}), "begin_time": begin_time, "end_time": end_time, "sort_order": sort_order, "cursor": cursor }.compact
  unless request_options.nil? || request_options&.additional_body_parameters.nil?
    req.body = { **(request_options&.additional_body_parameters || {}) }.compact
  end
  req.url "#{@request_client.get_url(request_options: request_options)}/v2/locations/#{location_id}/transactions"
end
        SquareApiClient::ListTransactionsResponse.from_json(json_object: response.body)
      end
# Retrieves details for a single transaction.
      #
      # @param location_id [String] The ID of the transaction's associated location.
      # @param transaction_id [String] The ID of the transaction to retrieve.
      # @param request_options [SquareApiClient::RequestOptions] 
      # @return [SquareApiClient::GetTransactionResponse]
      # @example
#  api = SquareApiClient::Client.new(
#    base_url: "https://api.example.com",
#    environment: SquareApiClient::Environment::PRODUCTION,
#    token: "YOUR_AUTH_TOKEN",
#    version: "Version"
#  )
#  api.locations.transactions.get(location_id: "location_id", transaction_id: "transaction_id")
      def get(location_id:, transaction_id:, request_options: nil)
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
  req.url "#{@request_client.get_url(request_options: request_options)}/v2/locations/#{location_id}/transactions/#{transaction_id}"
end
        SquareApiClient::GetTransactionResponse.from_json(json_object: response.body)
      end
# Captures a transaction that was created with the
#  [Charge](api-endpoint:Transactions-Charge)
#  endpoint with a `delay_capture` value of `true`.
#  See [Delayed capture
#  ps://developer.squareup.com/docs/payments/transactions/overview#delayed-capture)
#  for more information.
      #
      # @param location_id [String] 
      # @param transaction_id [String] 
      # @param request_options [SquareApiClient::RequestOptions] 
      # @return [SquareApiClient::CaptureTransactionResponse]
      # @example
#  api = SquareApiClient::Client.new(
#    base_url: "https://api.example.com",
#    environment: SquareApiClient::Environment::PRODUCTION,
#    token: "YOUR_AUTH_TOKEN",
#    version: "Version"
#  )
#  api.locations.transactions.capture(location_id: "location_id", transaction_id: "transaction_id")
      def capture(location_id:, transaction_id:, request_options: nil)
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
  req.url "#{@request_client.get_url(request_options: request_options)}/v2/locations/#{location_id}/transactions/#{transaction_id}/capture"
end
        SquareApiClient::CaptureTransactionResponse.from_json(json_object: response.body)
      end
# Cancels a transaction that was created with the
#  [Charge](api-endpoint:Transactions-Charge)
#  endpoint with a `delay_capture` value of `true`.
#  See [Delayed capture
#  ps://developer.squareup.com/docs/payments/transactions/overview#delayed-capture)
#  for more information.
      #
      # @param location_id [String] 
      # @param transaction_id [String] 
      # @param request_options [SquareApiClient::RequestOptions] 
      # @return [SquareApiClient::VoidTransactionResponse]
      # @example
#  api = SquareApiClient::Client.new(
#    base_url: "https://api.example.com",
#    environment: SquareApiClient::Environment::PRODUCTION,
#    token: "YOUR_AUTH_TOKEN",
#    version: "Version"
#  )
#  api.locations.transactions.void(location_id: "location_id", transaction_id: "transaction_id")
      def void(location_id:, transaction_id:, request_options: nil)
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
  req.url "#{@request_client.get_url(request_options: request_options)}/v2/locations/#{location_id}/transactions/#{transaction_id}/void"
end
        SquareApiClient::VoidTransactionResponse.from_json(json_object: response.body)
      end
    end
    class AsyncTransactionsClient
    # @return [SquareApiClient::AsyncRequestClient] 
      attr_reader :request_client


      # @param request_client [SquareApiClient::RequestClient] 
      # @return [SquareApiClient::Locations::AsyncTransactionsClient]
      def initialize(request_client:)
        @request_client = request_client
      end
# Lists transactions for a particular location.
#  Transactions include payment information from sales and exchanges and refund
#  information from returns and exchanges.
#  Max results per
#  [page](https://developer.squareup.com/docs/working-with-apis/pagination): 50
      #
      # @param location_id [String] The ID of the location to list transactions for.
      # @param begin_time [String] The beginning of the requested reporting period, in RFC 3339 format.
#  See [Date
#  ranges](https://developer.squareup.com/docs/build-basics/working-with-dates) for
#  details on date inclusivity/exclusivity.
#  Default value: The current time minus one year.
      # @param end_time [String] The end of the requested reporting period, in RFC 3339 format.
#  See [Date
#  ranges](https://developer.squareup.com/docs/build-basics/working-with-dates) for
#  details on date inclusivity/exclusivity.
#  Default value: The current time.
      # @param sort_order [SquareApiClient::SortOrder] The order in which results are listed in the response (`ASC` for
#  oldest first, `DESC` for newest first).
#  Default value: `DESC`
      # @param cursor [String] A pagination cursor returned by a previous call to this endpoint.
#  Provide this to retrieve the next set of results for your original query.
#  See [Paginating
#  results](https://developer.squareup.com/docs/working-with-apis/pagination) for
#  more information.
      # @param request_options [SquareApiClient::RequestOptions] 
      # @return [SquareApiClient::ListTransactionsResponse]
      # @example
#  api = SquareApiClient::Client.new(
#    base_url: "https://api.example.com",
#    environment: SquareApiClient::Environment::PRODUCTION,
#    token: "YOUR_AUTH_TOKEN",
#    version: "Version"
#  )
#  api.locations.transactions.list(location_id: "location_id")
      def list(location_id:, begin_time: nil, end_time: nil, sort_order: nil, cursor: nil, request_options: nil)
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
  req.params = { **(request_options&.additional_query_parameters || {}), "begin_time": begin_time, "end_time": end_time, "sort_order": sort_order, "cursor": cursor }.compact
  unless request_options.nil? || request_options&.additional_body_parameters.nil?
    req.body = { **(request_options&.additional_body_parameters || {}) }.compact
  end
  req.url "#{@request_client.get_url(request_options: request_options)}/v2/locations/#{location_id}/transactions"
end
          SquareApiClient::ListTransactionsResponse.from_json(json_object: response.body)
        end
      end
# Retrieves details for a single transaction.
      #
      # @param location_id [String] The ID of the transaction's associated location.
      # @param transaction_id [String] The ID of the transaction to retrieve.
      # @param request_options [SquareApiClient::RequestOptions] 
      # @return [SquareApiClient::GetTransactionResponse]
      # @example
#  api = SquareApiClient::Client.new(
#    base_url: "https://api.example.com",
#    environment: SquareApiClient::Environment::PRODUCTION,
#    token: "YOUR_AUTH_TOKEN",
#    version: "Version"
#  )
#  api.locations.transactions.get(location_id: "location_id", transaction_id: "transaction_id")
      def get(location_id:, transaction_id:, request_options: nil)
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
  req.url "#{@request_client.get_url(request_options: request_options)}/v2/locations/#{location_id}/transactions/#{transaction_id}"
end
          SquareApiClient::GetTransactionResponse.from_json(json_object: response.body)
        end
      end
# Captures a transaction that was created with the
#  [Charge](api-endpoint:Transactions-Charge)
#  endpoint with a `delay_capture` value of `true`.
#  See [Delayed capture
#  ps://developer.squareup.com/docs/payments/transactions/overview#delayed-capture)
#  for more information.
      #
      # @param location_id [String] 
      # @param transaction_id [String] 
      # @param request_options [SquareApiClient::RequestOptions] 
      # @return [SquareApiClient::CaptureTransactionResponse]
      # @example
#  api = SquareApiClient::Client.new(
#    base_url: "https://api.example.com",
#    environment: SquareApiClient::Environment::PRODUCTION,
#    token: "YOUR_AUTH_TOKEN",
#    version: "Version"
#  )
#  api.locations.transactions.capture(location_id: "location_id", transaction_id: "transaction_id")
      def capture(location_id:, transaction_id:, request_options: nil)
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
  req.url "#{@request_client.get_url(request_options: request_options)}/v2/locations/#{location_id}/transactions/#{transaction_id}/capture"
end
          SquareApiClient::CaptureTransactionResponse.from_json(json_object: response.body)
        end
      end
# Cancels a transaction that was created with the
#  [Charge](api-endpoint:Transactions-Charge)
#  endpoint with a `delay_capture` value of `true`.
#  See [Delayed capture
#  ps://developer.squareup.com/docs/payments/transactions/overview#delayed-capture)
#  for more information.
      #
      # @param location_id [String] 
      # @param transaction_id [String] 
      # @param request_options [SquareApiClient::RequestOptions] 
      # @return [SquareApiClient::VoidTransactionResponse]
      # @example
#  api = SquareApiClient::Client.new(
#    base_url: "https://api.example.com",
#    environment: SquareApiClient::Environment::PRODUCTION,
#    token: "YOUR_AUTH_TOKEN",
#    version: "Version"
#  )
#  api.locations.transactions.void(location_id: "location_id", transaction_id: "transaction_id")
      def void(location_id:, transaction_id:, request_options: nil)
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
  req.url "#{@request_client.get_url(request_options: request_options)}/v2/locations/#{location_id}/transactions/#{transaction_id}/void"
end
          SquareApiClient::VoidTransactionResponse.from_json(json_object: response.body)
        end
      end
    end
  end
end