# frozen_string_literal: true

require_relative "wiremock_test_case"

class LoyaltyWireTest < WireMockTestCase
  def setup
    super

    @client = Square::Client.new(
      token: "<token>",
      base_url: WIREMOCK_BASE_URL,
      max_retries: 0
    )
  end

  def test_loyalty_search_events_with_wiremock
    test_id = "loyalty.search_events.0"

    result = @client.loyalty.search_events(
      query: {
        filter: {
          order_filter: {
            order_id: "PyATxhYLfsMqpVkcKJITPydgEYfZY"
          }
        }
      },
      limit: 30,
      request_options: {
        additional_headers: {
          "X-Test-Id" => "loyalty.search_events.0"
        }
      }
    )

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/v2/loyalty/events/search",
      query_params: nil,
      expected: 1
    )

    verify_request_body_numbers(
      test_id: test_id,
      method: "POST",
      url_path: "/v2/loyalty/events/search",
      expected: {
        "/limit" => 30
      }
    )

    verify_response_numbers(
      actual: result,
      expected: {
        "/events/0/accumulate_points/points" => 5,
        "/events/0/adjust_points/points" => 1,
        "/events/0/expire_points/points" => 1,
        "/events/0/other_event/points" => 1,
        "/events/1/adjust_points/points" => 1,
        "/events/1/expire_points/points" => 1,
        "/events/1/other_event/points" => 1,
        "/events/2/create_reward/points" => -10,
        "/events/2/adjust_points/points" => 1,
        "/events/2/expire_points/points" => 1,
        "/events/2/other_event/points" => 1
      }
    )
  end
end
