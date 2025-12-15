# frozen_string_literal: true

require_relative "wire_helper"
require "net/http"
require "json"
require "uri"
require "square"

class RefundsWireTest < Minitest::Test
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

  def test_refunds_list_with_wiremock
    test_id = "refunds.list.0"

    require "square"
    client = Square::Client.new(base_url: WIREMOCK_BASE_URL, token: "<token>")
    client.refunds.list(
      begin_time: "begin_time",
      end_time: "end_time",
      sort_order: "sort_order",
      cursor: "cursor",
      location_id: "location_id",
      status: "status",
      source_type: "source_type",
      limit: 1,
      updated_at_begin_time: "updated_at_begin_time",
      updated_at_end_time: "updated_at_end_time",
      sort_field: "CREATED_AT",
      request_options: { base_url: WIREMOCK_BASE_URL,
                         additional_headers: {
                           "X-Test-Id" => "refunds.list.0"
                         } }
    )

    verify_request_count(
      test_id: test_id,
      method: "GET",
      url_path: "/v2/refunds",
      query_params: nil,
      expected: 1
    )
  end

  def test_refunds_refund_payment_with_wiremock
    test_id = "refunds.refund_payment.0"

    require "square"
    client = Square::Client.new(base_url: WIREMOCK_BASE_URL, token: "<token>")
    client.refunds.refund_payment(
      idempotency_key: "9b7f2dcf-49da-4411-b23e-a2d6af21333a",
      amount_money: {
        amount: 1000,
        currency: "USD"
      },
      app_fee_money: {
        amount: 10,
        currency: "USD"
      },
      payment_id: "R2B3Z8WMVt3EAmzYWLZvz7Y69EbZY",
      reason: "Example",
      request_options: { base_url: WIREMOCK_BASE_URL,
                         additional_headers: {
                           "X-Test-Id" => "refunds.refund_payment.0"
                         } }
    )

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/v2/refunds",
      query_params: nil,
      expected: 1
    )
  end

  def test_refunds_get_with_wiremock
    test_id = "refunds.get.0"

    require "square"
    client = Square::Client.new(base_url: WIREMOCK_BASE_URL, token: "<token>")
    client.refunds.get(
      refund_id: "refund_id",
      request_options: { base_url: WIREMOCK_BASE_URL,
                         additional_headers: {
                           "X-Test-Id" => "refunds.get.0"
                         } }
    )

    verify_request_count(
      test_id: test_id,
      method: "GET",
      url_path: "/v2/refunds/refund_id",
      query_params: nil,
      expected: 1
    )
  end
end
