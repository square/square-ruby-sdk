# frozen_string_literal: true

require_relative "wiremock_test_case"

class EventsWireTest < WireMockTestCase
  def setup
    super

    @client = Square::Client.new(
      token: "<token>",
      base_url: WIREMOCK_BASE_URL
    )
  end

  def test_events_search_events_with_wiremock
    test_id = "events.search_events.0"

    @client.events.search_events(request_options: {
                                   additional_headers: {
                                     "X-Test-Id" => "events.search_events.0"
                                   }
                                 })

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/v2/events",
      query_params: nil,
      expected: 1
    )
  end

  def test_events_disable_events_with_wiremock
    test_id = "events.disable_events.0"

    @client.events.disable_events(request_options: {
                                    additional_headers: {
                                      "X-Test-Id" => "events.disable_events.0"
                                    }
                                  })

    verify_request_count(
      test_id: test_id,
      method: "PUT",
      url_path: "/v2/events/disable",
      query_params: nil,
      expected: 1
    )
  end

  def test_events_enable_events_with_wiremock
    test_id = "events.enable_events.0"

    @client.events.enable_events(request_options: {
                                   additional_headers: {
                                     "X-Test-Id" => "events.enable_events.0"
                                   }
                                 })

    verify_request_count(
      test_id: test_id,
      method: "PUT",
      url_path: "/v2/events/enable",
      query_params: nil,
      expected: 1
    )
  end

  def test_events_list_event_types_with_wiremock
    test_id = "events.list_event_types.0"

    @client.events.list_event_types(
      api_version: "api_version",
      request_options: {
        additional_headers: {
          "X-Test-Id" => "events.list_event_types.0"
        }
      }
    )

    verify_request_count(
      test_id: test_id,
      method: "GET",
      url_path: "/v2/events/types",
      query_params: nil,
      expected: 1
    )
  end
end
