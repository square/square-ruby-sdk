# frozen_string_literal: true

require_relative "wire_helper"
require "net/http"
require "json"
require "uri"
require "square"

class LoyaltyProgramsPromotionsWireTest < Minitest::Test
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

  def test_loyalty_programs_promotions_list_with_wiremock
    test_id = "loyalty.programs.promotions.list.0"

    require "square"
    client = Square::Client.new(base_url: WIREMOCK_BASE_URL, token: "<token>")
    client.loyalty.programs.promotions.list(
      program_id: "program_id",
      status: "ACTIVE",
      cursor: "cursor",
      limit: 1,
      request_options: { base_url: WIREMOCK_BASE_URL,
                         additional_headers: {
                           "X-Test-Id" => "loyalty.programs.promotions.list.0"
                         } }
    )

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

    require "square"
    client = Square::Client.new(base_url: WIREMOCK_BASE_URL, token: "<token>")
    client.loyalty.programs.promotions.create(
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
          time_periods: ['BEGIN:VEVENT
          DTSTART:20220816T160000
          DURATION:PT2H
          RRULE:FREQ=WEEKLY;BYDAY=TU
          END:VEVENT']
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
      request_options: { base_url: WIREMOCK_BASE_URL,
                         additional_headers: {
                           "X-Test-Id" => "loyalty.programs.promotions.create.0"
                         } }
    )

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/v2/loyalty/programs/program_id/promotions",
      query_params: nil,
      expected: 1
    )
  end

  def test_loyalty_programs_promotions_get_with_wiremock
    test_id = "loyalty.programs.promotions.get.0"

    require "square"
    client = Square::Client.new(base_url: WIREMOCK_BASE_URL, token: "<token>")
    client.loyalty.programs.promotions.get(
      program_id: "program_id",
      promotion_id: "promotion_id",
      request_options: { base_url: WIREMOCK_BASE_URL,
                         additional_headers: {
                           "X-Test-Id" => "loyalty.programs.promotions.get.0"
                         } }
    )

    verify_request_count(
      test_id: test_id,
      method: "GET",
      url_path: "/v2/loyalty/programs/program_id/promotions/promotion_id",
      query_params: nil,
      expected: 1
    )
  end

  def test_loyalty_programs_promotions_cancel_with_wiremock
    test_id = "loyalty.programs.promotions.cancel.0"

    require "square"
    client = Square::Client.new(base_url: WIREMOCK_BASE_URL, token: "<token>")
    client.loyalty.programs.promotions.cancel(
      program_id: "program_id",
      promotion_id: "promotion_id",
      request_options: { base_url: WIREMOCK_BASE_URL,
                         additional_headers: {
                           "X-Test-Id" => "loyalty.programs.promotions.cancel.0"
                         } }
    )

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/v2/loyalty/programs/program_id/promotions/promotion_id/cancel",
      query_params: nil,
      expected: 1
    )
  end
end
