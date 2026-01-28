# frozen_string_literal: true

require_relative "wiremock_test_case"

class LoyaltyWireTest < WireMockTestCase
  def setup
    super

    @client = Square::Client.new(
      token: "<token>",
      base_url: WIREMOCK_BASE_URL
    )
  end

  def test_loyalty_search_events_with_wiremock
    test_id = "loyalty.search_events.0"

    @client.loyalty.search_events(
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
  end
end
