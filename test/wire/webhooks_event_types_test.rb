# frozen_string_literal: true

require_relative "wiremock_test_case"

class WebhooksEventTypesWireTest < WireMockTestCase
  def setup
    super

    @client = Square::Client.new(
      token: "<token>",
      base_url: WIREMOCK_BASE_URL
    )
  end

  def test_webhooks_event_types_list_with_wiremock
    test_id = "webhooks.event_types.list.0"

    @client.webhooks.event_types.list(
      api_version: "api_version",
      request_options: {
        additional_headers: {
          "X-Test-Id" => "webhooks.event_types.list.0"
        }
      }
    )

    verify_request_count(
      test_id: test_id,
      method: "GET",
      url_path: "/v2/webhooks/event-types",
      query_params: nil,
      expected: 1
    )
  end
end
