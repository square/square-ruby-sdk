# frozen_string_literal: true
require_relative "../../../requests"
require_relative "../../types/loyalty_account"
require_relative "../../types/create_loyalty_account_response"
require_relative "../../types/search_loyalty_accounts_request_loyalty_account_query"
require_relative "../../types/search_loyalty_accounts_response"
require_relative "../../types/get_loyalty_account_response"
require_relative "../../types/loyalty_event_accumulate_points"
require_relative "../../types/accumulate_loyalty_points_response"
require_relative "../../types/loyalty_event_adjust_points"
require_relative "../../types/adjust_loyalty_points_response"
require "async"
require "async"
require "async"
require "async"
require "async"
require_relative "../../../requests"

module SquareApiClient
  module Loyalty
    class AccountsClient
    # @return [SquareApiClient::RequestClient] 
      attr_reader :request_client


      # @param request_client [SquareApiClient::RequestClient] 
      # @return [SquareApiClient::Loyalty::AccountsClient]
      def initialize(request_client:)
        @request_client = request_client
      end
# Creates a loyalty account. To create a loyalty account, you must provide the
#  `program_id` and a `mapping` with the `phone_number` of the buyer.
      #
      # @param loyalty_account [Hash] The loyalty account to create.Request of type SquareApiClient::LoyaltyAccount, as a Hash
      #   * :id (String) 
      #   * :program_id (String) 
      #   * :balance (Integer) 
      #   * :lifetime_points (Integer) 
      #   * :customer_id (String) 
      #   * :enrolled_at (String) 
      #   * :created_at (String) 
      #   * :updated_at (String) 
      #   * :mapping (Hash)
      #     * :id (String) 
      #     * :created_at (String) 
      #     * :phone_number (String) 
      #   * :expiring_point_deadlines (Array<SquareApiClient::LoyaltyAccountExpiringPointDeadline>) 
      # @param idempotency_key [String] A unique string that identifies this `CreateLoyaltyAccount` request.
#  Keys can be any valid string, but must be unique for every request.
      # @param request_options [SquareApiClient::RequestOptions] 
      # @return [SquareApiClient::CreateLoyaltyAccountResponse]
      # @example
#  api = SquareApiClient::Client.new(
#    base_url: "https://api.example.com",
#    environment: SquareApiClient::Environment::PRODUCTION,
#    token: "YOUR_AUTH_TOKEN",
#    version: "Version"
#  )
#  api.loyalty.accounts.create(loyalty_account: { program_id: "d619f755-2d17-41f3-990d-c04ecedd64dd", mapping: { phone_number: "+14155551234" } }, idempotency_key: "ec78c477-b1c3-4899-a209-a4e71337c996")
      def create(loyalty_account:, idempotency_key:, request_options: nil)
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
  req.body = { **(request_options&.additional_body_parameters || {}), loyalty_account: loyalty_account, idempotency_key: idempotency_key }.compact
  req.url "#{@request_client.get_url(request_options: request_options)}/v2/loyalty/accounts"
end
        SquareApiClient::CreateLoyaltyAccountResponse.from_json(json_object: response.body)
      end
# Searches for loyalty accounts in a loyalty program.
#  You can search for a loyalty account using the phone number or customer ID
#  associated with the account. To return all loyalty accounts, specify an empty
#  `query` object or omit it entirely.
#  Search results are sorted by `created_at` in ascending order.
      #
      # @param query [Hash] The search criteria for the request.Request of type SquareApiClient::SearchLoyaltyAccountsRequestLoyaltyAccountQuery, as a Hash
      #   * :mappings (Array<SquareApiClient::LoyaltyAccountMapping>) 
      #   * :customer_ids (Array<String>) 
      # @param limit [Integer] The maximum number of results to include in the response. The default value is
#  30.
      # @param cursor [String] A pagination cursor returned by a previous call to
#  this endpoint. Provide this to retrieve the next set of
#  results for the original query.
#  For more information,
#  see
#  ttps://developer.squareup.com/docs/build-basics/common-api-patterns/pagination).
      # @param request_options [SquareApiClient::RequestOptions] 
      # @return [SquareApiClient::SearchLoyaltyAccountsResponse]
      # @example
#  api = SquareApiClient::Client.new(
#    base_url: "https://api.example.com",
#    environment: SquareApiClient::Environment::PRODUCTION,
#    token: "YOUR_AUTH_TOKEN",
#    version: "Version"
#  )
#  api.loyalty.accounts.search(query: { mappings: [{ phone_number: "+14155551234" }] }, limit: 10)
      def search(query: nil, limit: nil, cursor: nil, request_options: nil)
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
  req.body = { **(request_options&.additional_body_parameters || {}), query: query, limit: limit, cursor: cursor }.compact
  req.url "#{@request_client.get_url(request_options: request_options)}/v2/loyalty/accounts/search"
end
        SquareApiClient::SearchLoyaltyAccountsResponse.from_json(json_object: response.body)
      end
# Retrieves a loyalty account.
      #
      # @param account_id [String] The ID of the [loyalty account](entity:LoyaltyAccount) to retrieve.
      # @param request_options [SquareApiClient::RequestOptions] 
      # @return [SquareApiClient::GetLoyaltyAccountResponse]
      # @example
#  api = SquareApiClient::Client.new(
#    base_url: "https://api.example.com",
#    environment: SquareApiClient::Environment::PRODUCTION,
#    token: "YOUR_AUTH_TOKEN",
#    version: "Version"
#  )
#  api.loyalty.accounts.get(account_id: "account_id")
      def get(account_id:, request_options: nil)
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
  req.url "#{@request_client.get_url(request_options: request_options)}/v2/loyalty/accounts/#{account_id}"
end
        SquareApiClient::GetLoyaltyAccountResponse.from_json(json_object: response.body)
      end
# Adds points earned from a purchase to a [loyalty
#  account](entity:LoyaltyAccount).
#  - If you are using the Orders API to manage orders, provide the `order_id`.
#  Square reads the order
#  to compute the points earned from both the base loyalty program and an
#  associated
#  [loyalty promotion](entity:LoyaltyPromotion). For purchases that qualify for
#  multiple accrual
#  rules, Square computes points based on the accrual rule that grants the most
#  points.
#  For purchases that qualify for multiple promotions, Square computes points based
#  on the most
#  recently created promotion. A purchase must first qualify for program points to
#  be eligible for promotion points.
#  - If you are not using the Orders API to manage orders, provide `points` with
#  the number of points to add.
#  You must first perform a client-side computation of the points earned from the
#  loyalty program and
#  loyalty promotion. For spend-based and visit-based programs, you can call
#  [CalculateLoyaltyPoints](api-endpoint:Loyalty-CalculateLoyaltyPoints)
#  to compute the points earned from the base loyalty program. For information
#  about computing points earned from a loyalty promotion, see
#  [Calculating promotion
#  er.squareup.com/docs/loyalty-api/loyalty-promotions#calculate-promotion-points).
      #
      # @param account_id [String] The ID of the target [loyalty account](entity:LoyaltyAccount).
      # @param accumulate_points [Hash] The points to add to the account.
#  If you are using the Orders API to manage orders, specify the order ID.
#  Otherwise, specify the points to add.Request of type SquareApiClient::LoyaltyEventAccumulatePoints, as a Hash
      #   * :loyalty_program_id (String) 
      #   * :points (Integer) 
      #   * :order_id (String) 
      # @param idempotency_key [String] A unique string that identifies the `AccumulateLoyaltyPoints` request.
#  Keys can be any valid string but must be unique for every request.
      # @param location_id [String] The [location](entity:Location) where the purchase was made.
      # @param request_options [SquareApiClient::RequestOptions] 
      # @return [SquareApiClient::AccumulateLoyaltyPointsResponse]
      # @example
#  api = SquareApiClient::Client.new(
#    base_url: "https://api.example.com",
#    environment: SquareApiClient::Environment::PRODUCTION,
#    token: "YOUR_AUTH_TOKEN",
#    version: "Version"
#  )
#  api.loyalty.accounts.accumulate_points(
#    account_id: "account_id",
#    accumulate_points: { order_id: "RFZfrdtm3mhO1oGzf5Cx7fEMsmGZY" },
#    idempotency_key: "58b90739-c3e8-4b11-85f7-e636d48d72cb",
#    location_id: "P034NEENMD09F"
#  )
      def accumulate_points(account_id:, accumulate_points:, idempotency_key:, location_id:, request_options: nil)
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
  req.body = { **(request_options&.additional_body_parameters || {}), accumulate_points: accumulate_points, idempotency_key: idempotency_key, location_id: location_id }.compact
  req.url "#{@request_client.get_url(request_options: request_options)}/v2/loyalty/accounts/#{account_id}/accumulate"
end
        SquareApiClient::AccumulateLoyaltyPointsResponse.from_json(json_object: response.body)
      end
# Adds points to or subtracts points from a buyer's account.
#  Use this endpoint only when you need to manually adjust points. Otherwise, in
#  your application flow, you call
#  [AccumulateLoyaltyPoints](api-endpoint:Loyalty-AccumulateLoyaltyPoints)
#  to add points when a buyer pays for the purchase.
      #
      # @param account_id [String] The ID of the target [loyalty account](entity:LoyaltyAccount).
      # @param idempotency_key [String] A unique string that identifies this `AdjustLoyaltyPoints` request.
#  Keys can be any valid string, but must be unique for every request.
      # @param adjust_points [Hash] The points to add or subtract and the reason for the adjustment. To add points,
#  specify a positive integer.
#  To subtract points, specify a negative integer.Request of type SquareApiClient::LoyaltyEventAdjustPoints, as a Hash
      #   * :loyalty_program_id (String) 
      #   * :points (Integer) 
      #   * :reason (String) 
      # @param allow_negative_balance [Boolean] Indicates whether to allow a negative adjustment to result in a negative
#  balance. If `true`, a negative
#  balance is allowed when subtracting points. If `false`, Square returns a
#  `BAD_REQUEST` error when subtracting
#  the specified number of points would result in a negative balance. The default
#  value is `false`.
      # @param request_options [SquareApiClient::RequestOptions] 
      # @return [SquareApiClient::AdjustLoyaltyPointsResponse]
      # @example
#  api = SquareApiClient::Client.new(
#    base_url: "https://api.example.com",
#    environment: SquareApiClient::Environment::PRODUCTION,
#    token: "YOUR_AUTH_TOKEN",
#    version: "Version"
#  )
#  api.loyalty.accounts.adjust(
#    account_id: "account_id",
#    idempotency_key: "bc29a517-3dc9-450e-aa76-fae39ee849d1",
#    adjust_points: { points: 10, reason: "Complimentary points" }
#  )
      def adjust(account_id:, idempotency_key:, adjust_points:, allow_negative_balance: nil, request_options: nil)
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
  req.body = { **(request_options&.additional_body_parameters || {}), idempotency_key: idempotency_key, adjust_points: adjust_points, allow_negative_balance: allow_negative_balance }.compact
  req.url "#{@request_client.get_url(request_options: request_options)}/v2/loyalty/accounts/#{account_id}/adjust"
end
        SquareApiClient::AdjustLoyaltyPointsResponse.from_json(json_object: response.body)
      end
    end
    class AsyncAccountsClient
    # @return [SquareApiClient::AsyncRequestClient] 
      attr_reader :request_client


      # @param request_client [SquareApiClient::RequestClient] 
      # @return [SquareApiClient::Loyalty::AsyncAccountsClient]
      def initialize(request_client:)
        @request_client = request_client
      end
# Creates a loyalty account. To create a loyalty account, you must provide the
#  `program_id` and a `mapping` with the `phone_number` of the buyer.
      #
      # @param loyalty_account [Hash] The loyalty account to create.Request of type SquareApiClient::LoyaltyAccount, as a Hash
      #   * :id (String) 
      #   * :program_id (String) 
      #   * :balance (Integer) 
      #   * :lifetime_points (Integer) 
      #   * :customer_id (String) 
      #   * :enrolled_at (String) 
      #   * :created_at (String) 
      #   * :updated_at (String) 
      #   * :mapping (Hash)
      #     * :id (String) 
      #     * :created_at (String) 
      #     * :phone_number (String) 
      #   * :expiring_point_deadlines (Array<SquareApiClient::LoyaltyAccountExpiringPointDeadline>) 
      # @param idempotency_key [String] A unique string that identifies this `CreateLoyaltyAccount` request.
#  Keys can be any valid string, but must be unique for every request.
      # @param request_options [SquareApiClient::RequestOptions] 
      # @return [SquareApiClient::CreateLoyaltyAccountResponse]
      # @example
#  api = SquareApiClient::Client.new(
#    base_url: "https://api.example.com",
#    environment: SquareApiClient::Environment::PRODUCTION,
#    token: "YOUR_AUTH_TOKEN",
#    version: "Version"
#  )
#  api.loyalty.accounts.create(loyalty_account: { program_id: "d619f755-2d17-41f3-990d-c04ecedd64dd", mapping: { phone_number: "+14155551234" } }, idempotency_key: "ec78c477-b1c3-4899-a209-a4e71337c996")
      def create(loyalty_account:, idempotency_key:, request_options: nil)
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
  req.body = { **(request_options&.additional_body_parameters || {}), loyalty_account: loyalty_account, idempotency_key: idempotency_key }.compact
  req.url "#{@request_client.get_url(request_options: request_options)}/v2/loyalty/accounts"
end
          SquareApiClient::CreateLoyaltyAccountResponse.from_json(json_object: response.body)
        end
      end
# Searches for loyalty accounts in a loyalty program.
#  You can search for a loyalty account using the phone number or customer ID
#  associated with the account. To return all loyalty accounts, specify an empty
#  `query` object or omit it entirely.
#  Search results are sorted by `created_at` in ascending order.
      #
      # @param query [Hash] The search criteria for the request.Request of type SquareApiClient::SearchLoyaltyAccountsRequestLoyaltyAccountQuery, as a Hash
      #   * :mappings (Array<SquareApiClient::LoyaltyAccountMapping>) 
      #   * :customer_ids (Array<String>) 
      # @param limit [Integer] The maximum number of results to include in the response. The default value is
#  30.
      # @param cursor [String] A pagination cursor returned by a previous call to
#  this endpoint. Provide this to retrieve the next set of
#  results for the original query.
#  For more information,
#  see
#  ttps://developer.squareup.com/docs/build-basics/common-api-patterns/pagination).
      # @param request_options [SquareApiClient::RequestOptions] 
      # @return [SquareApiClient::SearchLoyaltyAccountsResponse]
      # @example
#  api = SquareApiClient::Client.new(
#    base_url: "https://api.example.com",
#    environment: SquareApiClient::Environment::PRODUCTION,
#    token: "YOUR_AUTH_TOKEN",
#    version: "Version"
#  )
#  api.loyalty.accounts.search(query: { mappings: [{ phone_number: "+14155551234" }] }, limit: 10)
      def search(query: nil, limit: nil, cursor: nil, request_options: nil)
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
  req.body = { **(request_options&.additional_body_parameters || {}), query: query, limit: limit, cursor: cursor }.compact
  req.url "#{@request_client.get_url(request_options: request_options)}/v2/loyalty/accounts/search"
end
          SquareApiClient::SearchLoyaltyAccountsResponse.from_json(json_object: response.body)
        end
      end
# Retrieves a loyalty account.
      #
      # @param account_id [String] The ID of the [loyalty account](entity:LoyaltyAccount) to retrieve.
      # @param request_options [SquareApiClient::RequestOptions] 
      # @return [SquareApiClient::GetLoyaltyAccountResponse]
      # @example
#  api = SquareApiClient::Client.new(
#    base_url: "https://api.example.com",
#    environment: SquareApiClient::Environment::PRODUCTION,
#    token: "YOUR_AUTH_TOKEN",
#    version: "Version"
#  )
#  api.loyalty.accounts.get(account_id: "account_id")
      def get(account_id:, request_options: nil)
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
  req.url "#{@request_client.get_url(request_options: request_options)}/v2/loyalty/accounts/#{account_id}"
end
          SquareApiClient::GetLoyaltyAccountResponse.from_json(json_object: response.body)
        end
      end
# Adds points earned from a purchase to a [loyalty
#  account](entity:LoyaltyAccount).
#  - If you are using the Orders API to manage orders, provide the `order_id`.
#  Square reads the order
#  to compute the points earned from both the base loyalty program and an
#  associated
#  [loyalty promotion](entity:LoyaltyPromotion). For purchases that qualify for
#  multiple accrual
#  rules, Square computes points based on the accrual rule that grants the most
#  points.
#  For purchases that qualify for multiple promotions, Square computes points based
#  on the most
#  recently created promotion. A purchase must first qualify for program points to
#  be eligible for promotion points.
#  - If you are not using the Orders API to manage orders, provide `points` with
#  the number of points to add.
#  You must first perform a client-side computation of the points earned from the
#  loyalty program and
#  loyalty promotion. For spend-based and visit-based programs, you can call
#  [CalculateLoyaltyPoints](api-endpoint:Loyalty-CalculateLoyaltyPoints)
#  to compute the points earned from the base loyalty program. For information
#  about computing points earned from a loyalty promotion, see
#  [Calculating promotion
#  er.squareup.com/docs/loyalty-api/loyalty-promotions#calculate-promotion-points).
      #
      # @param account_id [String] The ID of the target [loyalty account](entity:LoyaltyAccount).
      # @param accumulate_points [Hash] The points to add to the account.
#  If you are using the Orders API to manage orders, specify the order ID.
#  Otherwise, specify the points to add.Request of type SquareApiClient::LoyaltyEventAccumulatePoints, as a Hash
      #   * :loyalty_program_id (String) 
      #   * :points (Integer) 
      #   * :order_id (String) 
      # @param idempotency_key [String] A unique string that identifies the `AccumulateLoyaltyPoints` request.
#  Keys can be any valid string but must be unique for every request.
      # @param location_id [String] The [location](entity:Location) where the purchase was made.
      # @param request_options [SquareApiClient::RequestOptions] 
      # @return [SquareApiClient::AccumulateLoyaltyPointsResponse]
      # @example
#  api = SquareApiClient::Client.new(
#    base_url: "https://api.example.com",
#    environment: SquareApiClient::Environment::PRODUCTION,
#    token: "YOUR_AUTH_TOKEN",
#    version: "Version"
#  )
#  api.loyalty.accounts.accumulate_points(
#    account_id: "account_id",
#    accumulate_points: { order_id: "RFZfrdtm3mhO1oGzf5Cx7fEMsmGZY" },
#    idempotency_key: "58b90739-c3e8-4b11-85f7-e636d48d72cb",
#    location_id: "P034NEENMD09F"
#  )
      def accumulate_points(account_id:, accumulate_points:, idempotency_key:, location_id:, request_options: nil)
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
  req.body = { **(request_options&.additional_body_parameters || {}), accumulate_points: accumulate_points, idempotency_key: idempotency_key, location_id: location_id }.compact
  req.url "#{@request_client.get_url(request_options: request_options)}/v2/loyalty/accounts/#{account_id}/accumulate"
end
          SquareApiClient::AccumulateLoyaltyPointsResponse.from_json(json_object: response.body)
        end
      end
# Adds points to or subtracts points from a buyer's account.
#  Use this endpoint only when you need to manually adjust points. Otherwise, in
#  your application flow, you call
#  [AccumulateLoyaltyPoints](api-endpoint:Loyalty-AccumulateLoyaltyPoints)
#  to add points when a buyer pays for the purchase.
      #
      # @param account_id [String] The ID of the target [loyalty account](entity:LoyaltyAccount).
      # @param idempotency_key [String] A unique string that identifies this `AdjustLoyaltyPoints` request.
#  Keys can be any valid string, but must be unique for every request.
      # @param adjust_points [Hash] The points to add or subtract and the reason for the adjustment. To add points,
#  specify a positive integer.
#  To subtract points, specify a negative integer.Request of type SquareApiClient::LoyaltyEventAdjustPoints, as a Hash
      #   * :loyalty_program_id (String) 
      #   * :points (Integer) 
      #   * :reason (String) 
      # @param allow_negative_balance [Boolean] Indicates whether to allow a negative adjustment to result in a negative
#  balance. If `true`, a negative
#  balance is allowed when subtracting points. If `false`, Square returns a
#  `BAD_REQUEST` error when subtracting
#  the specified number of points would result in a negative balance. The default
#  value is `false`.
      # @param request_options [SquareApiClient::RequestOptions] 
      # @return [SquareApiClient::AdjustLoyaltyPointsResponse]
      # @example
#  api = SquareApiClient::Client.new(
#    base_url: "https://api.example.com",
#    environment: SquareApiClient::Environment::PRODUCTION,
#    token: "YOUR_AUTH_TOKEN",
#    version: "Version"
#  )
#  api.loyalty.accounts.adjust(
#    account_id: "account_id",
#    idempotency_key: "bc29a517-3dc9-450e-aa76-fae39ee849d1",
#    adjust_points: { points: 10, reason: "Complimentary points" }
#  )
      def adjust(account_id:, idempotency_key:, adjust_points:, allow_negative_balance: nil, request_options: nil)
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
  req.body = { **(request_options&.additional_body_parameters || {}), idempotency_key: idempotency_key, adjust_points: adjust_points, allow_negative_balance: allow_negative_balance }.compact
  req.url "#{@request_client.get_url(request_options: request_options)}/v2/loyalty/accounts/#{account_id}/adjust"
end
          SquareApiClient::AdjustLoyaltyPointsResponse.from_json(json_object: response.body)
        end
      end
    end
  end
end