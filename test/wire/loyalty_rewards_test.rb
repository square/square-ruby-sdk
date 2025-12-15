# frozen_string_literal: true

require_relative "wire_helper"
require "net/http"
require "json"
require "uri"
require "square"

class LoyaltyRewardsWireTest < Minitest::Test
  WIREMOCK_BASE_URL = "http://localhost:8080"
  WIREMOCK_ADMIN_URL = "http://localhost:8080/__admin"

  def setup
    super
    return if ENV["RUN_WIRE_TESTS"] == "true"

    skip "Wire tests are disabled by default. Set RUN_WIRE_TESTS=true to enable them."
  end

  def verify_request_count(test_id:, method:, url_path:, expected:, query_params: nil)
    uri = URI("#{WIREMOCK_ADMIN_URL}/requests/find")
    http = Net::HTTP.new(uri.host, uri.port)
    post_request = Net::HTTP::Post.new(uri.path, { "Content-Type" => "application/json" })

    request_body = { "method" => method, "urlPath" => url_path }
    request_body["headers"] = { "X-Test-Id" => { "equalTo" => test_id } }
    request_body["queryParameters"] = query_params.transform_values { |v| { "equalTo" => v } } if query_params

    post_request.body = request_body.to_json
    response = http.request(post_request)
    result = JSON.parse(response.body)
    requests = result["requests"] || []

    assert_equal expected, requests.length, "Expected #{expected} requests, found #{requests.length}"
  end

  def test_loyalty_rewards_create_with_wiremock
    test_id = "loyalty.rewards.create.0"

    require "square"
    client = Square::Client.new(base_url: WIREMOCK_BASE_URL, token: "<token>")
    client.loyalty.rewards.create(
      reward: {
        loyalty_account_id: "5adcb100-07f1-4ee7-b8c6-6bb9ebc474bd",
        reward_tier_id: "e1b39225-9da5-43d1-a5db-782cdd8ad94f",
        order_id: "RFZfrdtm3mhO1oGzf5Cx7fEMsmGZY"
      },
      idempotency_key: "18c2e5ea-a620-4b1f-ad60-7b167285e451",
      request_options: { base_url: WIREMOCK_BASE_URL,
                         additional_headers: {
                           "X-Test-Id" => "loyalty.rewards.create.0"
                         } }
    )

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/v2/loyalty/rewards",
      query_params: nil,
      expected: 1
    )
  end

  def test_loyalty_rewards_search_with_wiremock
    test_id = "loyalty.rewards.search.0"

    require "square"
    client = Square::Client.new(base_url: WIREMOCK_BASE_URL, token: "<token>")
    client.loyalty.rewards.search(
      query: {
        loyalty_account_id: "5adcb100-07f1-4ee7-b8c6-6bb9ebc474bd"
      },
      limit: 10,
      request_options: { base_url: WIREMOCK_BASE_URL,
                         additional_headers: {
                           "X-Test-Id" => "loyalty.rewards.search.0"
                         } }
    )

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/v2/loyalty/rewards/search",
      query_params: nil,
      expected: 1
    )
  end

  def test_loyalty_rewards_get_with_wiremock
    test_id = "loyalty.rewards.get.0"

    require "square"
    client = Square::Client.new(base_url: WIREMOCK_BASE_URL, token: "<token>")
    client.loyalty.rewards.get(
      reward_id: "reward_id",
      request_options: { base_url: WIREMOCK_BASE_URL,
                         additional_headers: {
                           "X-Test-Id" => "loyalty.rewards.get.0"
                         } }
    )

    verify_request_count(
      test_id: test_id,
      method: "GET",
      url_path: "/v2/loyalty/rewards/reward_id",
      query_params: nil,
      expected: 1
    )
  end

  def test_loyalty_rewards_delete_with_wiremock
    test_id = "loyalty.rewards.delete.0"

    require "square"
    client = Square::Client.new(base_url: WIREMOCK_BASE_URL, token: "<token>")
    client.loyalty.rewards.delete(
      reward_id: "reward_id",
      request_options: { base_url: WIREMOCK_BASE_URL,
                         additional_headers: {
                           "X-Test-Id" => "loyalty.rewards.delete.0"
                         } }
    )

    verify_request_count(
      test_id: test_id,
      method: "DELETE",
      url_path: "/v2/loyalty/rewards/reward_id",
      query_params: nil,
      expected: 1
    )
  end

  def test_loyalty_rewards_redeem_with_wiremock
    test_id = "loyalty.rewards.redeem.0"

    require "square"
    client = Square::Client.new(base_url: WIREMOCK_BASE_URL, token: "<token>")
    client.loyalty.rewards.redeem(
      reward_id: "reward_id",
      idempotency_key: "98adc7f7-6963-473b-b29c-f3c9cdd7d994",
      location_id: "P034NEENMD09F",
      request_options: { base_url: WIREMOCK_BASE_URL,
                         additional_headers: {
                           "X-Test-Id" => "loyalty.rewards.redeem.0"
                         } }
    )

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/v2/loyalty/rewards/reward_id/redeem",
      query_params: nil,
      expected: 1
    )
  end
end
