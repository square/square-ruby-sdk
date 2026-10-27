# frozen_string_literal: true

require_relative "wiremock_test_case"

class LoyaltyAccountsWireTest < WireMockTestCase
  def setup
    super

    @client = Square::Client.new(
      token: "<token>",
      base_url: WIREMOCK_BASE_URL,
      max_retries: 0
    )
  end

  def test_loyalty_accounts_create_with_wiremock
    test_id = "loyalty.accounts.create.0"

    result = @client.loyalty.accounts.create(
      loyalty_account: {
        program_id: "d619f755-2d17-41f3-990d-c04ecedd64dd",
        mapping: {
          phone_number: "+14155551234"
        }
      },
      idempotency_key: "ec78c477-b1c3-4899-a209-a4e71337c996",
      request_options: {
        additional_headers: {
          "X-Test-Id" => "loyalty.accounts.create.0"
        }
      }
    )

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/v2/loyalty/accounts",
      query_params: nil,
      expected: 1
    )

    verify_response_numbers(
      actual: result,
      expected: {
        "/loyalty_account/balance" => 0,
        "/loyalty_account/lifetime_points" => 0,
        "/loyalty_account/expiring_point_deadlines/0/points" => 1
      }
    )
  end

  def test_loyalty_accounts_search_with_wiremock
    test_id = "loyalty.accounts.search.0"

    result = @client.loyalty.accounts.search(
      query: {
        mappings: [{
          phone_number: "+14155551234"
        }]
      },
      limit: 10,
      request_options: {
        additional_headers: {
          "X-Test-Id" => "loyalty.accounts.search.0"
        }
      }
    )

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/v2/loyalty/accounts/search",
      query_params: nil,
      expected: 1
    )

    verify_request_body_numbers(
      test_id: test_id,
      method: "POST",
      url_path: "/v2/loyalty/accounts/search",
      expected: {
        "/limit" => 10
      }
    )

    verify_response_numbers(
      actual: result,
      expected: {
        "/loyalty_accounts/0/balance" => 10,
        "/loyalty_accounts/0/lifetime_points" => 20,
        "/loyalty_accounts/0/expiring_point_deadlines/0/points" => 1
      }
    )
  end

  def test_loyalty_accounts_get_with_wiremock
    test_id = "loyalty.accounts.get.0"

    result = @client.loyalty.accounts.get(
      account_id: "account_id",
      request_options: {
        additional_headers: {
          "X-Test-Id" => "loyalty.accounts.get.0"
        }
      }
    )

    verify_request_count(
      test_id: test_id,
      method: "GET",
      url_path: "/v2/loyalty/accounts/account_id",
      query_params: nil,
      expected: 1
    )

    verify_response_numbers(
      actual: result,
      expected: {
        "/loyalty_account/balance" => 10,
        "/loyalty_account/lifetime_points" => 20,
        "/loyalty_account/expiring_point_deadlines/0/points" => 1
      }
    )
  end

  def test_loyalty_accounts_accumulate_points_with_wiremock
    test_id = "loyalty.accounts.accumulate_points.0"

    result = @client.loyalty.accounts.accumulate_points(
      account_id: "account_id",
      accumulate_points: {
        order_id: "RFZfrdtm3mhO1oGzf5Cx7fEMsmGZY"
      },
      idempotency_key: "58b90739-c3e8-4b11-85f7-e636d48d72cb",
      location_id: "P034NEENMD09F",
      request_options: {
        additional_headers: {
          "X-Test-Id" => "loyalty.accounts.accumulate_points.0"
        }
      }
    )

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/v2/loyalty/accounts/account_id/accumulate",
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
        "/event/accumulate_promotion_points/points" => 1,
        "/events/0/accumulate_points/points" => 6,
        "/events/0/adjust_points/points" => 1,
        "/events/0/expire_points/points" => 1,
        "/events/0/other_event/points" => 1
      }
    )
  end

  def test_loyalty_accounts_adjust_with_wiremock
    test_id = "loyalty.accounts.adjust.0"

    result = @client.loyalty.accounts.adjust(
      account_id: "account_id",
      idempotency_key: "bc29a517-3dc9-450e-aa76-fae39ee849d1",
      adjust_points: {
        points: 10,
        reason: "Complimentary points"
      },
      request_options: {
        additional_headers: {
          "X-Test-Id" => "loyalty.accounts.adjust.0"
        }
      }
    )

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/v2/loyalty/accounts/account_id/adjust",
      query_params: nil,
      expected: 1
    )

    verify_request_body_numbers(
      test_id: test_id,
      method: "POST",
      url_path: "/v2/loyalty/accounts/account_id/adjust",
      expected: {
        "/adjust_points/points" => 10
      }
    )

    verify_response_numbers(
      actual: result,
      expected: {
        "/event/accumulate_points/points" => 1,
        "/event/create_reward/points" => 1,
        "/event/delete_reward/points" => 1,
        "/event/adjust_points/points" => 10,
        "/event/expire_points/points" => 1,
        "/event/other_event/points" => 1,
        "/event/accumulate_promotion_points/points" => 1
      }
    )
  end
end
