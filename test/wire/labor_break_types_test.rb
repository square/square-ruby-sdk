# frozen_string_literal: true

require_relative "wire_helper"
require "net/http"
require "json"
require "uri"
require "square"

class LaborBreakTypesWireTest < Minitest::Test
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

  def test_labor_break_types_list_with_wiremock
    test_id = "labor.break_types.list.0"

    require "square"
    client = Square::Client.new(base_url: WIREMOCK_BASE_URL, token: "<token>")
    client.labor.break_types.list(
      location_id: "location_id",
      limit: 1,
      cursor: "cursor",
      request_options: { base_url: WIREMOCK_BASE_URL,
                         additional_headers: {
                           "X-Test-Id" => "labor.break_types.list.0"
                         } }
    )

    verify_request_count(
      test_id: test_id,
      method: "GET",
      url_path: "/v2/labor/break-types",
      query_params: nil,
      expected: 1
    )
  end

  def test_labor_break_types_create_with_wiremock
    test_id = "labor.break_types.create.0"

    require "square"
    client = Square::Client.new(base_url: WIREMOCK_BASE_URL, token: "<token>")
    client.labor.break_types.create(
      idempotency_key: "PAD3NG5KSN2GL",
      break_type: {
        location_id: "CGJN03P1D08GF",
        break_name: "Lunch Break",
        expected_duration: "PT30M",
        is_paid: true
      },
      request_options: { base_url: WIREMOCK_BASE_URL,
                         additional_headers: {
                           "X-Test-Id" => "labor.break_types.create.0"
                         } }
    )

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/v2/labor/break-types",
      query_params: nil,
      expected: 1
    )
  end

  def test_labor_break_types_get_with_wiremock
    test_id = "labor.break_types.get.0"

    require "square"
    client = Square::Client.new(base_url: WIREMOCK_BASE_URL, token: "<token>")
    client.labor.break_types.get(
      id: "id",
      request_options: { base_url: WIREMOCK_BASE_URL,
                         additional_headers: {
                           "X-Test-Id" => "labor.break_types.get.0"
                         } }
    )

    verify_request_count(
      test_id: test_id,
      method: "GET",
      url_path: "/v2/labor/break-types/id",
      query_params: nil,
      expected: 1
    )
  end

  def test_labor_break_types_update_with_wiremock
    test_id = "labor.break_types.update.0"

    require "square"
    client = Square::Client.new(base_url: WIREMOCK_BASE_URL, token: "<token>")
    client.labor.break_types.update(
      id: "id",
      break_type: {
        location_id: "26M7H24AZ9N6R",
        break_name: "Lunch",
        expected_duration: "PT50M",
        is_paid: true,
        version: 1
      },
      request_options: { base_url: WIREMOCK_BASE_URL,
                         additional_headers: {
                           "X-Test-Id" => "labor.break_types.update.0"
                         } }
    )

    verify_request_count(
      test_id: test_id,
      method: "PUT",
      url_path: "/v2/labor/break-types/id",
      query_params: nil,
      expected: 1
    )
  end

  def test_labor_break_types_delete_with_wiremock
    test_id = "labor.break_types.delete.0"

    require "square"
    client = Square::Client.new(base_url: WIREMOCK_BASE_URL, token: "<token>")
    client.labor.break_types.delete(
      id: "id",
      request_options: { base_url: WIREMOCK_BASE_URL,
                         additional_headers: {
                           "X-Test-Id" => "labor.break_types.delete.0"
                         } }
    )

    verify_request_count(
      test_id: test_id,
      method: "DELETE",
      url_path: "/v2/labor/break-types/id",
      query_params: nil,
      expected: 1
    )
  end
end
