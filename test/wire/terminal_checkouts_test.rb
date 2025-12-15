# frozen_string_literal: true

require_relative "wire_helper"
require "net/http"
require "json"
require "uri"
require "square"

class TerminalCheckoutsWireTest < Minitest::Test
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

  def test_terminal_checkouts_create_with_wiremock
    test_id = "terminal.checkouts.create.0"

    require "square"
    client = Square::Client.new(base_url: WIREMOCK_BASE_URL, token: "<token>")
    client.terminal.checkouts.create(
      idempotency_key: "28a0c3bc-7839-11ea-bc55-0242ac130003",
      checkout: {
        amount_money: {
          amount: 2610,
          currency: "USD"
        },
        reference_id: "id11572",
        note: "A brief note",
        device_options: {
          device_id: "dbb5d83a-7838-11ea-bc55-0242ac130003"
        }
      },
      request_options: { base_url: WIREMOCK_BASE_URL,
                         additional_headers: {
                           "X-Test-Id" => "terminal.checkouts.create.0"
                         } }
    )

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/v2/terminals/checkouts",
      query_params: nil,
      expected: 1
    )
  end

  def test_terminal_checkouts_search_with_wiremock
    test_id = "terminal.checkouts.search.0"

    require "square"
    client = Square::Client.new(base_url: WIREMOCK_BASE_URL, token: "<token>")
    client.terminal.checkouts.search(
      query: {
        filter: {
          status: "COMPLETED"
        }
      },
      limit: 2,
      request_options: { base_url: WIREMOCK_BASE_URL,
                         additional_headers: {
                           "X-Test-Id" => "terminal.checkouts.search.0"
                         } }
    )

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/v2/terminals/checkouts/search",
      query_params: nil,
      expected: 1
    )
  end

  def test_terminal_checkouts_get_with_wiremock
    test_id = "terminal.checkouts.get.0"

    require "square"
    client = Square::Client.new(base_url: WIREMOCK_BASE_URL, token: "<token>")
    client.terminal.checkouts.get(
      checkout_id: "checkout_id",
      request_options: { base_url: WIREMOCK_BASE_URL,
                         additional_headers: {
                           "X-Test-Id" => "terminal.checkouts.get.0"
                         } }
    )

    verify_request_count(
      test_id: test_id,
      method: "GET",
      url_path: "/v2/terminals/checkouts/checkout_id",
      query_params: nil,
      expected: 1
    )
  end

  def test_terminal_checkouts_cancel_with_wiremock
    test_id = "terminal.checkouts.cancel.0"

    require "square"
    client = Square::Client.new(base_url: WIREMOCK_BASE_URL, token: "<token>")
    client.terminal.checkouts.cancel(
      checkout_id: "checkout_id",
      request_options: { base_url: WIREMOCK_BASE_URL,
                         additional_headers: {
                           "X-Test-Id" => "terminal.checkouts.cancel.0"
                         } }
    )

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/v2/terminals/checkouts/checkout_id/cancel",
      query_params: nil,
      expected: 1
    )
  end
end
