# frozen_string_literal: true
require_relative "../../../requests"
require_relative "../../types/loyalty_reward"
require_relative "../../types/create_loyalty_reward_response"
require_relative "../../types/search_loyalty_rewards_request_loyalty_reward_query"
require_relative "../../types/search_loyalty_rewards_response"
require_relative "../../types/get_loyalty_reward_response"
require_relative "../../types/delete_loyalty_reward_response"
require_relative "../../types/redeem_loyalty_reward_response"
require "async"
require "async"
require "async"
require "async"
require "async"
require_relative "../../../requests"

module SquareApiClient
  module Loyalty
    class RewardsClient
    # @return [SquareApiClient::RequestClient] 
      attr_reader :request_client


      # @param request_client [SquareApiClient::RequestClient] 
      # @return [SquareApiClient::Loyalty::RewardsClient]
      def initialize(request_client:)
        @request_client = request_client
      end
# Creates a loyalty reward. In the process, the endpoint does following:
#  - Uses the `reward_tier_id` in the request to determine the number of points
#  to lock for this reward.
#  - If the request includes `order_id`, it adds the reward and related discount to
#  the order.
#  After a reward is created, the points are locked and
#  not available for the buyer to redeem another reward.
      #
      # @param reward [Hash] The reward to create.Request of type SquareApiClient::LoyaltyReward, as a Hash
      #   * :id (String) 
      #   * :status (SquareApiClient::LoyaltyRewardStatus) 
      #   * :loyalty_account_id (String) 
      #   * :reward_tier_id (String) 
      #   * :points (Integer) 
      #   * :order_id (String) 
      #   * :created_at (String) 
      #   * :updated_at (String) 
      #   * :redeemed_at (String) 
      # @param idempotency_key [String] A unique string that identifies this `CreateLoyaltyReward` request.
#  Keys can be any valid string, but must be unique for every request.
      # @param request_options [SquareApiClient::RequestOptions] 
      # @return [SquareApiClient::CreateLoyaltyRewardResponse]
      # @example
#  api = SquareApiClient::Client.new(
#    base_url: "https://api.example.com",
#    environment: SquareApiClient::Environment::PRODUCTION,
#    token: "YOUR_AUTH_TOKEN",
#    version: "Version"
#  )
#  api.loyalty.rewards.create(reward: { loyalty_account_id: "5adcb100-07f1-4ee7-b8c6-6bb9ebc474bd", reward_tier_id: "e1b39225-9da5-43d1-a5db-782cdd8ad94f", order_id: "RFZfrdtm3mhO1oGzf5Cx7fEMsmGZY" }, idempotency_key: "18c2e5ea-a620-4b1f-ad60-7b167285e451")
      def create(reward:, idempotency_key:, request_options: nil)
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
  req.body = { **(request_options&.additional_body_parameters || {}), reward: reward, idempotency_key: idempotency_key }.compact
  req.url "#{@request_client.get_url(request_options: request_options)}/v2/loyalty/rewards"
end
        SquareApiClient::CreateLoyaltyRewardResponse.from_json(json_object: response.body)
      end
# Searches for loyalty rewards. This endpoint accepts a request with no query
#  filters and returns results for all loyalty accounts.
#  If you include a `query` object, `loyalty_account_id` is required and `status`
#  is  optional.
#  If you know a reward ID, use the
#  [RetrieveLoyaltyReward](api-endpoint:Loyalty-RetrieveLoyaltyReward) endpoint.
#  Search results are sorted by `updated_at` in descending order.
      #
      # @param query [Hash] The search criteria for the request.
#  If empty, the endpoint retrieves all loyalty rewards in the loyalty program.Request of type SquareApiClient::SearchLoyaltyRewardsRequestLoyaltyRewardQuery, as a Hash
      #   * :loyalty_account_id (String) 
      #   * :status (SquareApiClient::LoyaltyRewardStatus) 
      # @param limit [Integer] The maximum number of results to return in the response. The default value is
#  30.
      # @param cursor [String] A pagination cursor returned by a previous call to
#  this endpoint. Provide this to retrieve the next set of
#  results for the original query.
#  For more information,
#  see
#  ttps://developer.squareup.com/docs/build-basics/common-api-patterns/pagination).
      # @param request_options [SquareApiClient::RequestOptions] 
      # @return [SquareApiClient::SearchLoyaltyRewardsResponse]
      # @example
#  api = SquareApiClient::Client.new(
#    base_url: "https://api.example.com",
#    environment: SquareApiClient::Environment::PRODUCTION,
#    token: "YOUR_AUTH_TOKEN",
#    version: "Version"
#  )
#  api.loyalty.rewards.search(query: { loyalty_account_id: "5adcb100-07f1-4ee7-b8c6-6bb9ebc474bd" }, limit: 10)
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
  req.url "#{@request_client.get_url(request_options: request_options)}/v2/loyalty/rewards/search"
end
        SquareApiClient::SearchLoyaltyRewardsResponse.from_json(json_object: response.body)
      end
# Retrieves a loyalty reward.
      #
      # @param reward_id [String] The ID of the [loyalty reward](entity:LoyaltyReward) to retrieve.
      # @param request_options [SquareApiClient::RequestOptions] 
      # @return [SquareApiClient::GetLoyaltyRewardResponse]
      # @example
#  api = SquareApiClient::Client.new(
#    base_url: "https://api.example.com",
#    environment: SquareApiClient::Environment::PRODUCTION,
#    token: "YOUR_AUTH_TOKEN",
#    version: "Version"
#  )
#  api.loyalty.rewards.get(reward_id: "reward_id")
      def get(reward_id:, request_options: nil)
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
  req.url "#{@request_client.get_url(request_options: request_options)}/v2/loyalty/rewards/#{reward_id}"
end
        SquareApiClient::GetLoyaltyRewardResponse.from_json(json_object: response.body)
      end
# Deletes a loyalty reward by doing the following:
#  - Returns the loyalty points back to the loyalty account.
#  - If an order ID was specified when the reward was created
#  (see [CreateLoyaltyReward](api-endpoint:Loyalty-CreateLoyaltyReward)),
#  it updates the order by removing the reward and related
#  discounts.
#  You cannot delete a reward that has reached the terminal state (REDEEMED).
      #
      # @param reward_id [String] The ID of the [loyalty reward](entity:LoyaltyReward) to delete.
      # @param request_options [SquareApiClient::RequestOptions] 
      # @return [SquareApiClient::DeleteLoyaltyRewardResponse]
      # @example
#  api = SquareApiClient::Client.new(
#    base_url: "https://api.example.com",
#    environment: SquareApiClient::Environment::PRODUCTION,
#    token: "YOUR_AUTH_TOKEN",
#    version: "Version"
#  )
#  api.loyalty.rewards.delete(reward_id: "reward_id")
      def delete(reward_id:, request_options: nil)
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
  req.url "#{@request_client.get_url(request_options: request_options)}/v2/loyalty/rewards/#{reward_id}"
end
        SquareApiClient::DeleteLoyaltyRewardResponse.from_json(json_object: response.body)
      end
# Redeems a loyalty reward.
#  The endpoint sets the reward to the `REDEEMED` terminal state.
#  If you are using your own order processing system (not using the
#  Orders API), you call this endpoint after the buyer paid for the
#  purchase.
#  After the reward reaches the terminal state, it cannot be deleted.
#  In other words, points used for the reward cannot be returned
#  to the account.
      #
      # @param reward_id [String] The ID of the [loyalty reward](entity:LoyaltyReward) to redeem.
      # @param idempotency_key [String] A unique string that identifies this `RedeemLoyaltyReward` request.
#  Keys can be any valid string, but must be unique for every request.
      # @param location_id [String] The ID of the [location](entity:Location) where the reward is redeemed.
      # @param request_options [SquareApiClient::RequestOptions] 
      # @return [SquareApiClient::RedeemLoyaltyRewardResponse]
      # @example
#  api = SquareApiClient::Client.new(
#    base_url: "https://api.example.com",
#    environment: SquareApiClient::Environment::PRODUCTION,
#    token: "YOUR_AUTH_TOKEN",
#    version: "Version"
#  )
#  api.loyalty.rewards.redeem(
#    reward_id: "reward_id",
#    idempotency_key: "98adc7f7-6963-473b-b29c-f3c9cdd7d994",
#    location_id: "P034NEENMD09F"
#  )
      def redeem(reward_id:, idempotency_key:, location_id:, request_options: nil)
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
  req.body = { **(request_options&.additional_body_parameters || {}), idempotency_key: idempotency_key, location_id: location_id }.compact
  req.url "#{@request_client.get_url(request_options: request_options)}/v2/loyalty/rewards/#{reward_id}/redeem"
end
        SquareApiClient::RedeemLoyaltyRewardResponse.from_json(json_object: response.body)
      end
    end
    class AsyncRewardsClient
    # @return [SquareApiClient::AsyncRequestClient] 
      attr_reader :request_client


      # @param request_client [SquareApiClient::RequestClient] 
      # @return [SquareApiClient::Loyalty::AsyncRewardsClient]
      def initialize(request_client:)
        @request_client = request_client
      end
# Creates a loyalty reward. In the process, the endpoint does following:
#  - Uses the `reward_tier_id` in the request to determine the number of points
#  to lock for this reward.
#  - If the request includes `order_id`, it adds the reward and related discount to
#  the order.
#  After a reward is created, the points are locked and
#  not available for the buyer to redeem another reward.
      #
      # @param reward [Hash] The reward to create.Request of type SquareApiClient::LoyaltyReward, as a Hash
      #   * :id (String) 
      #   * :status (SquareApiClient::LoyaltyRewardStatus) 
      #   * :loyalty_account_id (String) 
      #   * :reward_tier_id (String) 
      #   * :points (Integer) 
      #   * :order_id (String) 
      #   * :created_at (String) 
      #   * :updated_at (String) 
      #   * :redeemed_at (String) 
      # @param idempotency_key [String] A unique string that identifies this `CreateLoyaltyReward` request.
#  Keys can be any valid string, but must be unique for every request.
      # @param request_options [SquareApiClient::RequestOptions] 
      # @return [SquareApiClient::CreateLoyaltyRewardResponse]
      # @example
#  api = SquareApiClient::Client.new(
#    base_url: "https://api.example.com",
#    environment: SquareApiClient::Environment::PRODUCTION,
#    token: "YOUR_AUTH_TOKEN",
#    version: "Version"
#  )
#  api.loyalty.rewards.create(reward: { loyalty_account_id: "5adcb100-07f1-4ee7-b8c6-6bb9ebc474bd", reward_tier_id: "e1b39225-9da5-43d1-a5db-782cdd8ad94f", order_id: "RFZfrdtm3mhO1oGzf5Cx7fEMsmGZY" }, idempotency_key: "18c2e5ea-a620-4b1f-ad60-7b167285e451")
      def create(reward:, idempotency_key:, request_options: nil)
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
  req.body = { **(request_options&.additional_body_parameters || {}), reward: reward, idempotency_key: idempotency_key }.compact
  req.url "#{@request_client.get_url(request_options: request_options)}/v2/loyalty/rewards"
end
          SquareApiClient::CreateLoyaltyRewardResponse.from_json(json_object: response.body)
        end
      end
# Searches for loyalty rewards. This endpoint accepts a request with no query
#  filters and returns results for all loyalty accounts.
#  If you include a `query` object, `loyalty_account_id` is required and `status`
#  is  optional.
#  If you know a reward ID, use the
#  [RetrieveLoyaltyReward](api-endpoint:Loyalty-RetrieveLoyaltyReward) endpoint.
#  Search results are sorted by `updated_at` in descending order.
      #
      # @param query [Hash] The search criteria for the request.
#  If empty, the endpoint retrieves all loyalty rewards in the loyalty program.Request of type SquareApiClient::SearchLoyaltyRewardsRequestLoyaltyRewardQuery, as a Hash
      #   * :loyalty_account_id (String) 
      #   * :status (SquareApiClient::LoyaltyRewardStatus) 
      # @param limit [Integer] The maximum number of results to return in the response. The default value is
#  30.
      # @param cursor [String] A pagination cursor returned by a previous call to
#  this endpoint. Provide this to retrieve the next set of
#  results for the original query.
#  For more information,
#  see
#  ttps://developer.squareup.com/docs/build-basics/common-api-patterns/pagination).
      # @param request_options [SquareApiClient::RequestOptions] 
      # @return [SquareApiClient::SearchLoyaltyRewardsResponse]
      # @example
#  api = SquareApiClient::Client.new(
#    base_url: "https://api.example.com",
#    environment: SquareApiClient::Environment::PRODUCTION,
#    token: "YOUR_AUTH_TOKEN",
#    version: "Version"
#  )
#  api.loyalty.rewards.search(query: { loyalty_account_id: "5adcb100-07f1-4ee7-b8c6-6bb9ebc474bd" }, limit: 10)
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
  req.url "#{@request_client.get_url(request_options: request_options)}/v2/loyalty/rewards/search"
end
          SquareApiClient::SearchLoyaltyRewardsResponse.from_json(json_object: response.body)
        end
      end
# Retrieves a loyalty reward.
      #
      # @param reward_id [String] The ID of the [loyalty reward](entity:LoyaltyReward) to retrieve.
      # @param request_options [SquareApiClient::RequestOptions] 
      # @return [SquareApiClient::GetLoyaltyRewardResponse]
      # @example
#  api = SquareApiClient::Client.new(
#    base_url: "https://api.example.com",
#    environment: SquareApiClient::Environment::PRODUCTION,
#    token: "YOUR_AUTH_TOKEN",
#    version: "Version"
#  )
#  api.loyalty.rewards.get(reward_id: "reward_id")
      def get(reward_id:, request_options: nil)
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
  req.url "#{@request_client.get_url(request_options: request_options)}/v2/loyalty/rewards/#{reward_id}"
end
          SquareApiClient::GetLoyaltyRewardResponse.from_json(json_object: response.body)
        end
      end
# Deletes a loyalty reward by doing the following:
#  - Returns the loyalty points back to the loyalty account.
#  - If an order ID was specified when the reward was created
#  (see [CreateLoyaltyReward](api-endpoint:Loyalty-CreateLoyaltyReward)),
#  it updates the order by removing the reward and related
#  discounts.
#  You cannot delete a reward that has reached the terminal state (REDEEMED).
      #
      # @param reward_id [String] The ID of the [loyalty reward](entity:LoyaltyReward) to delete.
      # @param request_options [SquareApiClient::RequestOptions] 
      # @return [SquareApiClient::DeleteLoyaltyRewardResponse]
      # @example
#  api = SquareApiClient::Client.new(
#    base_url: "https://api.example.com",
#    environment: SquareApiClient::Environment::PRODUCTION,
#    token: "YOUR_AUTH_TOKEN",
#    version: "Version"
#  )
#  api.loyalty.rewards.delete(reward_id: "reward_id")
      def delete(reward_id:, request_options: nil)
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
  req.url "#{@request_client.get_url(request_options: request_options)}/v2/loyalty/rewards/#{reward_id}"
end
          SquareApiClient::DeleteLoyaltyRewardResponse.from_json(json_object: response.body)
        end
      end
# Redeems a loyalty reward.
#  The endpoint sets the reward to the `REDEEMED` terminal state.
#  If you are using your own order processing system (not using the
#  Orders API), you call this endpoint after the buyer paid for the
#  purchase.
#  After the reward reaches the terminal state, it cannot be deleted.
#  In other words, points used for the reward cannot be returned
#  to the account.
      #
      # @param reward_id [String] The ID of the [loyalty reward](entity:LoyaltyReward) to redeem.
      # @param idempotency_key [String] A unique string that identifies this `RedeemLoyaltyReward` request.
#  Keys can be any valid string, but must be unique for every request.
      # @param location_id [String] The ID of the [location](entity:Location) where the reward is redeemed.
      # @param request_options [SquareApiClient::RequestOptions] 
      # @return [SquareApiClient::RedeemLoyaltyRewardResponse]
      # @example
#  api = SquareApiClient::Client.new(
#    base_url: "https://api.example.com",
#    environment: SquareApiClient::Environment::PRODUCTION,
#    token: "YOUR_AUTH_TOKEN",
#    version: "Version"
#  )
#  api.loyalty.rewards.redeem(
#    reward_id: "reward_id",
#    idempotency_key: "98adc7f7-6963-473b-b29c-f3c9cdd7d994",
#    location_id: "P034NEENMD09F"
#  )
      def redeem(reward_id:, idempotency_key:, location_id:, request_options: nil)
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
  req.body = { **(request_options&.additional_body_parameters || {}), idempotency_key: idempotency_key, location_id: location_id }.compact
  req.url "#{@request_client.get_url(request_options: request_options)}/v2/loyalty/rewards/#{reward_id}/redeem"
end
          SquareApiClient::RedeemLoyaltyRewardResponse.from_json(json_object: response.body)
        end
      end
    end
  end
end