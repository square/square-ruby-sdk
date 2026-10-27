# frozen_string_literal: true

require_relative "wiremock_test_case"

class LoyaltyProgramsPromotionsWireTest < WireMockTestCase
  def setup
    super

    @client = Square::Client.new(
      token: "<token>",
      base_url: WIREMOCK_BASE_URL,
      max_retries: 0
    )
  end

  def test_loyalty_programs_promotions_list_with_wiremock
    test_id = "loyalty.programs.promotions.list.0"

    result = @client.loyalty.programs.promotions.list(
      program_id: "program_id",
      status: "ACTIVE",
      cursor: "cursor",
      limit: 1,
      request_options: {
        additional_headers: {
          "X-Test-Id" => "loyalty.programs.promotions.list.0"
        }
      }
    )
    result.pages.next_page

    verify_request_count(
      test_id: test_id,
      method: "GET",
      url_path: "/v2/loyalty/programs/program_id/promotions",
      query_params: nil,
      expected: 1
    )
  end

  def test_loyalty_programs_promotions_create_with_wiremock
    test_id = "loyalty.programs.promotions.create.0"

    result = @client.loyalty.programs.promotions.create(
      program_id: "program_id",
      loyalty_promotion: {
        name: "Tuesday Happy Hour Promo",
        incentive: {
          type: "POINTS_MULTIPLIER",
          points_multiplier_data: {
            multiplier: "3.0"
          }
        },
        available_time: {
          time_periods: ["BEGIN:VEVENT
          DTSTART:20220816T160000
          DURATION:PT2H
          RRULE:FREQ=WEEKLY;BYDAY=TU
          END:VEVENT"]
        },
        trigger_limit: {
          times: 1,
          interval: "DAY"
        },
        minimum_spend_amount_money: {
          amount: 2000,
          currency: "USD"
        },
        qualifying_category_ids: ["XTQPYLR3IIU9C44VRCB3XD12"]
      },
      idempotency_key: "ec78c477-b1c3-4899-a209-a4e71337c996",
      request_options: {
        additional_headers: {
          "X-Test-Id" => "loyalty.programs.promotions.create.0"
        }
      }
    )

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/v2/loyalty/programs/program_id/promotions",
      query_params: nil,
      expected: 1
    )

    verify_request_body_numbers(
      test_id: test_id,
      method: "POST",
      url_path: "/v2/loyalty/programs/program_id/promotions",
      expected: {
        "/loyalty_promotion/trigger_limit/times" => 1,
        "/loyalty_promotion/minimum_spend_amount_money/amount" => 2000
      }
    )

    verify_response_numbers(
      actual: result,
      expected: {
        "/loyalty_promotion/incentive/points_multiplier_data/points_multiplier" => 3,
        "/loyalty_promotion/incentive/points_addition_data/points_addition" => 1,
        "/loyalty_promotion/trigger_limit/times" => 1,
        "/loyalty_promotion/minimum_spend_amount_money/amount" => 2000
      }
    )
  end

  def test_loyalty_programs_promotions_get_with_wiremock
    test_id = "loyalty.programs.promotions.get.0"

    result = @client.loyalty.programs.promotions.get(
      program_id: "program_id",
      promotion_id: "promotion_id",
      request_options: {
        additional_headers: {
          "X-Test-Id" => "loyalty.programs.promotions.get.0"
        }
      }
    )

    verify_request_count(
      test_id: test_id,
      method: "GET",
      url_path: "/v2/loyalty/programs/program_id/promotions/promotion_id",
      query_params: nil,
      expected: 1
    )

    verify_response_numbers(
      actual: result,
      expected: {
        "/loyalty_promotion/incentive/points_multiplier_data/points_multiplier" => 3,
        "/loyalty_promotion/incentive/points_addition_data/points_addition" => 1,
        "/loyalty_promotion/trigger_limit/times" => 1,
        "/loyalty_promotion/minimum_spend_amount_money/amount" => 2000
      }
    )
  end

  def test_loyalty_programs_promotions_cancel_with_wiremock
    test_id = "loyalty.programs.promotions.cancel.0"

    result = @client.loyalty.programs.promotions.cancel(
      program_id: "program_id",
      promotion_id: "promotion_id",
      request_options: {
        additional_headers: {
          "X-Test-Id" => "loyalty.programs.promotions.cancel.0"
        }
      }
    )

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/v2/loyalty/programs/program_id/promotions/promotion_id/cancel",
      query_params: nil,
      expected: 1
    )

    verify_response_numbers(
      actual: result,
      expected: {
        "/loyalty_promotion/incentive/points_multiplier_data/points_multiplier" => 3,
        "/loyalty_promotion/incentive/points_addition_data/points_addition" => 1,
        "/loyalty_promotion/trigger_limit/times" => 1,
        "/loyalty_promotion/minimum_spend_amount_money/amount" => 2000
      }
    )
  end
end
