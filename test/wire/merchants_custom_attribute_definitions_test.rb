# frozen_string_literal: true

require_relative "wire_helper"
require "net/http"
require "json"
require "uri"
require "square"

class MerchantsCustomAttributeDefinitionsWireTest < Minitest::Test
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

  def test_merchants_custom_attribute_definitions_list_with_wiremock
    test_id = "merchants.custom_attribute_definitions.list.0"

    require "square"
    client = Square::Client.new(base_url: WIREMOCK_BASE_URL, token: "<token>")
    client.merchants.custom_attribute_definitions.list(
      visibility_filter: "ALL",
      limit: 1,
      cursor: "cursor",
      request_options: { base_url: WIREMOCK_BASE_URL,
                         additional_headers: {
                           "X-Test-Id" => "merchants.custom_attribute_definitions.list.0"
                         } }
    )

    verify_request_count(
      test_id: test_id,
      method: "GET",
      url_path: "/v2/merchants/custom-attribute-definitions",
      query_params: nil,
      expected: 1
    )
  end

  def test_merchants_custom_attribute_definitions_create_with_wiremock
    test_id = "merchants.custom_attribute_definitions.create.0"

    require "square"
    client = Square::Client.new(base_url: WIREMOCK_BASE_URL, token: "<token>")
    client.merchants.custom_attribute_definitions.create(
      custom_attribute_definition: {
        key: "alternative_seller_name",
        schema: {},
        name: "Alternative Merchant Name",
        description: "This is the other name this merchant goes by.",
        visibility: "VISIBILITY_READ_ONLY"
      },
      request_options: { base_url: WIREMOCK_BASE_URL,
                         additional_headers: {
                           "X-Test-Id" => "merchants.custom_attribute_definitions.create.0"
                         } }
    )

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/v2/merchants/custom-attribute-definitions",
      query_params: nil,
      expected: 1
    )
  end

  def test_merchants_custom_attribute_definitions_get_with_wiremock
    test_id = "merchants.custom_attribute_definitions.get.0"

    require "square"
    client = Square::Client.new(base_url: WIREMOCK_BASE_URL, token: "<token>")
    client.merchants.custom_attribute_definitions.get(
      key: "key",
      version: 1,
      request_options: { base_url: WIREMOCK_BASE_URL,
                         additional_headers: {
                           "X-Test-Id" => "merchants.custom_attribute_definitions.get.0"
                         } }
    )

    verify_request_count(
      test_id: test_id,
      method: "GET",
      url_path: "/v2/merchants/custom-attribute-definitions/key",
      query_params: nil,
      expected: 1
    )
  end

  def test_merchants_custom_attribute_definitions_update_with_wiremock
    test_id = "merchants.custom_attribute_definitions.update.0"

    require "square"
    client = Square::Client.new(base_url: WIREMOCK_BASE_URL, token: "<token>")
    client.merchants.custom_attribute_definitions.update(
      key: "key",
      custom_attribute_definition: {
        description: "Update the description as desired.",
        visibility: "VISIBILITY_READ_ONLY"
      },
      request_options: { base_url: WIREMOCK_BASE_URL,
                         additional_headers: {
                           "X-Test-Id" => "merchants.custom_attribute_definitions.update.0"
                         } }
    )

    verify_request_count(
      test_id: test_id,
      method: "PUT",
      url_path: "/v2/merchants/custom-attribute-definitions/key",
      query_params: nil,
      expected: 1
    )
  end

  def test_merchants_custom_attribute_definitions_delete_with_wiremock
    test_id = "merchants.custom_attribute_definitions.delete.0"

    require "square"
    client = Square::Client.new(base_url: WIREMOCK_BASE_URL, token: "<token>")
    client.merchants.custom_attribute_definitions.delete(
      key: "key",
      request_options: { base_url: WIREMOCK_BASE_URL,
                         additional_headers: {
                           "X-Test-Id" => "merchants.custom_attribute_definitions.delete.0"
                         } }
    )

    verify_request_count(
      test_id: test_id,
      method: "DELETE",
      url_path: "/v2/merchants/custom-attribute-definitions/key",
      query_params: nil,
      expected: 1
    )
  end
end
