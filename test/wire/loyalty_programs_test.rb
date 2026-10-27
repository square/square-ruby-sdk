# frozen_string_literal: true

require_relative "wiremock_test_case"

class LoyaltyProgramsWireTest < WireMockTestCase
  def setup
    super

    @client = Square::Client.new(
      token: "<token>",
      base_url: WIREMOCK_BASE_URL,
      max_retries: 0
    )
  end

  def test_loyalty_programs_list_with_wiremock
    test_id = "loyalty.programs.list.0"

    result = @client.loyalty.programs.list(request_options: {
      additional_headers: {
        "X-Test-Id" => "loyalty.programs.list.0"
      }
    })

    verify_request_count(
      test_id: test_id,
      method: "GET",
      url_path: "/v2/loyalty/programs",
      query_params: nil,
      expected: 1
    )

    verify_response_numbers(
      actual: result,
      expected: {
        "/programs/0/reward_tiers/0/points" => 10,
        "/programs/0/reward_tiers/0/pricing_rule_reference/catalog_version" => 1000000,
        "/programs/0/accrual_rules/0/points" => 1,
        "/programs/0/accrual_rules/0/spend_data/amount_money/amount" => 100
      }
    )
  end

  def test_loyalty_programs_get_with_wiremock
    test_id = "loyalty.programs.get.0"

    result = @client.loyalty.programs.get(
      program_id: "program_id",
      request_options: {
        additional_headers: {
          "X-Test-Id" => "loyalty.programs.get.0"
        }
      }
    )

    verify_request_count(
      test_id: test_id,
      method: "GET",
      url_path: "/v2/loyalty/programs/program_id",
      query_params: nil,
      expected: 1
    )

    verify_response_numbers(
      actual: result,
      expected: {
        "/program/reward_tiers/0/points" => 10,
        "/program/reward_tiers/0/pricing_rule_reference/catalog_version" => 1000000,
        "/program/accrual_rules/0/points" => 1,
        "/program/accrual_rules/0/spend_data/amount_money/amount" => 100
      }
    )
  end

  def test_loyalty_programs_calculate_with_wiremock
    test_id = "loyalty.programs.calculate.0"

    result = @client.loyalty.programs.calculate(
      program_id: "program_id",
      order_id: "RFZfrdtm3mhO1oGzf5Cx7fEMsmGZY",
      loyalty_account_id: "79b807d2-d786-46a9-933b-918028d7a8c5",
      request_options: {
        additional_headers: {
          "X-Test-Id" => "loyalty.programs.calculate.0"
        }
      }
    )

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/v2/loyalty/programs/program_id/calculate",
      query_params: nil,
      expected: 1
    )

    verify_response_numbers(
      actual: result,
      expected: {
        "/points" => 6,
        "/promotion_points" => 12
      }
    )
  end
end
