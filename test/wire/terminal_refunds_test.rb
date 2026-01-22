# frozen_string_literal: true

require_relative "wire_helper"
require "net/http"
require "json"
require "uri"
require "square"

class TerminalRefundsWireTest < Minitest::Test
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

  def test_terminal_refunds_create_with_wiremock
    test_id = "terminal.refunds.create.0"

    require "square"
    client = Square::Client.new(base_url: WIREMOCK_BASE_URL, token: "<token>")
    client.terminal.refunds.create(
      idempotency_key: "402a640b-b26f-401f-b406-46f839590c04",
      refund: {
        payment_id: "5O5OvgkcNUhl7JBuINflcjKqUzXZY",
        amount_money: {
          amount: 111,
          currency: "CAD"
        },
        reason: "Returning items",
        device_id: "f72dfb8e-4d65-4e56-aade-ec3fb8d33291"
      },
      request_options: { base_url: WIREMOCK_BASE_URL,
                         additional_headers: {
                           "X-Test-Id" => "terminal.refunds.create.0"
                         } }
    )

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/v2/terminals/refunds",
      query_params: nil,
      expected: 1
    )
  end

  def test_terminal_refunds_search_with_wiremock
    test_id = "terminal.refunds.search.0"

    require "square"
    client = Square::Client.new(base_url: WIREMOCK_BASE_URL, token: "<token>")
    client.terminal.refunds.search(
      query: {
        filter: {
          status: "COMPLETED"
        }
      },
      limit: 1,
      request_options: { base_url: WIREMOCK_BASE_URL,
                         additional_headers: {
                           "X-Test-Id" => "terminal.refunds.search.0"
                         } }
    )

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/v2/terminals/refunds/search",
      query_params: nil,
      expected: 1
    )
  end

  def test_terminal_refunds_get_with_wiremock
    test_id = "terminal.refunds.get.0"

    require "square"
    client = Square::Client.new(base_url: WIREMOCK_BASE_URL, token: "<token>")
    client.terminal.refunds.get(
      terminal_refund_id: "terminal_refund_id",
      request_options: { base_url: WIREMOCK_BASE_URL,
                         additional_headers: {
                           "X-Test-Id" => "terminal.refunds.get.0"
                         } }
    )

    verify_request_count(
      test_id: test_id,
      method: "GET",
      url_path: "/v2/terminals/refunds/terminal_refund_id",
      query_params: nil,
      expected: 1
    )
  end

  def test_terminal_refunds_cancel_with_wiremock
    test_id = "terminal.refunds.cancel.0"

    require "square"
    client = Square::Client.new(base_url: WIREMOCK_BASE_URL, token: "<token>")
    client.terminal.refunds.cancel(
      terminal_refund_id: "terminal_refund_id",
      request_options: { base_url: WIREMOCK_BASE_URL,
                         additional_headers: {
                           "X-Test-Id" => "terminal.refunds.cancel.0"
                         } }
    )

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/v2/terminals/refunds/terminal_refund_id/cancel",
      query_params: nil,
      expected: 1
    )
  end
end
