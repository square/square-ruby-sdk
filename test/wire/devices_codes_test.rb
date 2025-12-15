# frozen_string_literal: true

require_relative "wire_helper"
require "net/http"
require "json"
require "uri"
require "square"

class DevicesCodesWireTest < Minitest::Test
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

  def test_devices_codes_list_with_wiremock
    test_id = "devices.codes.list.0"

    require "square"
    client = Square::Client.new(base_url: WIREMOCK_BASE_URL, token: "<token>")
    client.devices.codes.list(
      cursor: "cursor",
      location_id: "location_id",
      product_type: "TERMINAL_API",
      status: "UNKNOWN",
      request_options: { base_url: WIREMOCK_BASE_URL,
                         additional_headers: {
                           "X-Test-Id" => "devices.codes.list.0"
                         } }
    )

    verify_request_count(
      test_id: test_id,
      method: "GET",
      url_path: "/v2/devices/codes",
      query_params: nil,
      expected: 1
    )
  end

  def test_devices_codes_create_with_wiremock
    test_id = "devices.codes.create.0"

    require "square"
    client = Square::Client.new(base_url: WIREMOCK_BASE_URL, token: "<token>")
    client.devices.codes.create(
      idempotency_key: "01bb00a6-0c86-4770-94ed-f5fca973cd56",
      device_code: {
        name: "Counter 1",
        product_type: "TERMINAL_API",
        location_id: "B5E4484SHHNYH"
      },
      request_options: { base_url: WIREMOCK_BASE_URL,
                         additional_headers: {
                           "X-Test-Id" => "devices.codes.create.0"
                         } }
    )

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/v2/devices/codes",
      query_params: nil,
      expected: 1
    )
  end

  def test_devices_codes_get_with_wiremock
    test_id = "devices.codes.get.0"

    require "square"
    client = Square::Client.new(base_url: WIREMOCK_BASE_URL, token: "<token>")
    client.devices.codes.get(
      id: "id",
      request_options: { base_url: WIREMOCK_BASE_URL,
                         additional_headers: {
                           "X-Test-Id" => "devices.codes.get.0"
                         } }
    )

    verify_request_count(
      test_id: test_id,
      method: "GET",
      url_path: "/v2/devices/codes/id",
      query_params: nil,
      expected: 1
    )
  end
end
