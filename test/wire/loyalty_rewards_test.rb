# frozen_string_literal: true

require_relative "wiremock_test_case"

class LoyaltyRewardsWireTest < WireMockTestCase
  def setup
    super

    @client = Square::Client.new(
      token: "<token>",
      base_url: WIREMOCK_BASE_URL,
      max_retries: 0
    )
  end

  def test_loyalty_rewards_create_with_wiremock
    test_id = "loyalty.rewards.create.0"

    result = @client.loyalty.rewards.create(
      reward: {
        loyalty_account_id: "5adcb100-07f1-4ee7-b8c6-6bb9ebc474bd",
        reward_tier_id: "e1b39225-9da5-43d1-a5db-782cdd8ad94f",
        order_id: "RFZfrdtm3mhO1oGzf5Cx7fEMsmGZY"
      },
      idempotency_key: "18c2e5ea-a620-4b1f-ad60-7b167285e451",
      request_options: {
        additional_headers: {
          "X-Test-Id" => "loyalty.rewards.create.0"
        }
      }
    )

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/v2/loyalty/rewards",
      query_params: nil,
      expected: 1
    )

    verify_response_numbers(
      actual: result,
      expected: {
        "/reward/points" => 10
      }
    )
  end

  def test_loyalty_rewards_search_with_wiremock
    test_id = "loyalty.rewards.search.0"

    result = @client.loyalty.rewards.search(
      query: {
        loyalty_account_id: "5adcb100-07f1-4ee7-b8c6-6bb9ebc474bd"
      },
      limit: 10,
      request_options: {
        additional_headers: {
          "X-Test-Id" => "loyalty.rewards.search.0"
        }
      }
    )

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/v2/loyalty/rewards/search",
      query_params: nil,
      expected: 1
    )

    verify_request_body_numbers(
      test_id: test_id,
      method: "POST",
      url_path: "/v2/loyalty/rewards/search",
      expected: {
        "/limit" => 10
      }
    )

    verify_response_numbers(
      actual: result,
      expected: {
        "/rewards/0/points" => 10,
        "/rewards/1/points" => 10,
        "/rewards/2/points" => 10,
        "/rewards/3/points" => 10
      }
    )
  end

  def test_loyalty_rewards_get_with_wiremock
    test_id = "loyalty.rewards.get.0"

    result = @client.loyalty.rewards.get(
      reward_id: "reward_id",
      request_options: {
        additional_headers: {
          "X-Test-Id" => "loyalty.rewards.get.0"
        }
      }
    )

    verify_request_count(
      test_id: test_id,
      method: "GET",
      url_path: "/v2/loyalty/rewards/reward_id",
      query_params: nil,
      expected: 1
    )

    verify_response_numbers(
      actual: result,
      expected: {
        "/reward/points" => 10
      }
    )
  end

  def test_loyalty_rewards_delete_with_wiremock
    test_id = "loyalty.rewards.delete.0"

    @client.loyalty.rewards.delete(
      reward_id: "reward_id",
      request_options: {
        additional_headers: {
          "X-Test-Id" => "loyalty.rewards.delete.0"
        }
      }
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

    result = @client.loyalty.rewards.redeem(
      reward_id: "reward_id",
      idempotency_key: "98adc7f7-6963-473b-b29c-f3c9cdd7d994",
      location_id: "P034NEENMD09F",
      request_options: {
        additional_headers: {
          "X-Test-Id" => "loyalty.rewards.redeem.0"
        }
      }
    )

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/v2/loyalty/rewards/reward_id/redeem",
      query_params: nil,
      expected: 1
    )

    verify_response_numbers(
      actual: result,
      expected: {
        "/event/accumulate_points/points" => 1,
        "/event/create_reward/points" => 1,
        "/event/delete_reward/points" => 1,
        "/event/adjust_points/points" => 1,
        "/event/expire_points/points" => 1,
        "/event/other_event/points" => 1,
        "/event/accumulate_promotion_points/points" => 1
      }
    )
  end
end
