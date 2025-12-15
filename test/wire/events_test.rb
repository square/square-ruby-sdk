# frozen_string_literal: true

require_relative "wire_helper"
require "net/http"
require "json"
require "uri"
require "square"

class EventsWireTest < Minitest::Test
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

  def test_events_search_events_with_wiremock
    test_id = "events.search_events.0"

    require "square"
    client = Square::Client.new(base_url: WIREMOCK_BASE_URL, token: "<token>")
    client.events.search_events(request_options: { base_url: WIREMOCK_BASE_URL,
                                                   additional_headers: {
                                                     "X-Test-Id" => "events.search_events.0"
                                                   } })

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

    require "square"
    client = Square::Client.new(base_url: WIREMOCK_BASE_URL, token: "<token>")
    client.events.disable_events(request_options: { base_url: WIREMOCK_BASE_URL,
                                                    additional_headers: {
                                                      "X-Test-Id" => "events.disable_events.0"
                                                    } })

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

    require "square"
    client = Square::Client.new(base_url: WIREMOCK_BASE_URL, token: "<token>")
    client.events.enable_events(request_options: { base_url: WIREMOCK_BASE_URL,
                                                   additional_headers: {
                                                     "X-Test-Id" => "events.enable_events.0"
                                                   } })

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

    require "square"
    client = Square::Client.new(base_url: WIREMOCK_BASE_URL, token: "<token>")
    client.events.list_event_types(
      api_version: "api_version",
      request_options: { base_url: WIREMOCK_BASE_URL,
                         additional_headers: {
                           "X-Test-Id" => "events.list_event_types.0"
                         } }
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
