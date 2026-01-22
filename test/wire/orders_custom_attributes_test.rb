# frozen_string_literal: true

require_relative "wire_helper"
require "net/http"
require "json"
require "uri"
require "square"

class OrdersCustomAttributesWireTest < Minitest::Test
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

  def test_orders_custom_attributes_batch_delete_with_wiremock
    test_id = "orders.custom_attributes.batch_delete.0"

    require "square"
    client = Square::Client.new(base_url: WIREMOCK_BASE_URL, token: "<token>")
    client.orders.custom_attributes.batch_delete(
      values: {
        "cover-count" => {
          key: "cover-count",
          order_id: "7BbXGEIWNldxAzrtGf9GPVZTwZ4F"
        },
        "table-number" => {
          key: "table-number",
          order_id: "7BbXGEIWNldxAzrtGf9GPVZTwZ4F"
        }
      },
      request_options: { base_url: WIREMOCK_BASE_URL,
                         additional_headers: {
                           "X-Test-Id" => "orders.custom_attributes.batch_delete.0"
                         } }
    )

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/v2/orders/custom-attributes/bulk-delete",
      query_params: nil,
      expected: 1
    )
  end

  def test_orders_custom_attributes_batch_upsert_with_wiremock
    test_id = "orders.custom_attributes.batch_upsert.0"

    require "square"
    client = Square::Client.new(base_url: WIREMOCK_BASE_URL, token: "<token>")
    client.orders.custom_attributes.batch_upsert(
      values: {
        "cover-count" => {
          custom_attribute: {
            key: "cover-count",
            version: 2
          },
          order_id: "7BbXGEIWNldxAzrtGf9GPVZTwZ4F"
        },
        "table-number" => {
          custom_attribute: {
            key: "table-number",
            version: 4
          },
          order_id: "7BbXGEIWNldxAzrtGf9GPVZTwZ4F"
        }
      },
      request_options: { base_url: WIREMOCK_BASE_URL,
                         additional_headers: {
                           "X-Test-Id" => "orders.custom_attributes.batch_upsert.0"
                         } }
    )

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/v2/orders/custom-attributes/bulk-upsert",
      query_params: nil,
      expected: 1
    )
  end

  def test_orders_custom_attributes_list_with_wiremock
    test_id = "orders.custom_attributes.list.0"

    require "square"
    client = Square::Client.new(base_url: WIREMOCK_BASE_URL, token: "<token>")
    client.orders.custom_attributes.list(
      order_id: "order_id",
      visibility_filter: "ALL",
      cursor: "cursor",
      limit: 1,
      with_definitions: true,
      request_options: { base_url: WIREMOCK_BASE_URL,
                         additional_headers: {
                           "X-Test-Id" => "orders.custom_attributes.list.0"
                         } }
    )

    verify_request_count(
      test_id: test_id,
      method: "GET",
      url_path: "/v2/orders/order_id/custom-attributes",
      query_params: nil,
      expected: 1
    )
  end

  def test_orders_custom_attributes_get_with_wiremock
    test_id = "orders.custom_attributes.get.0"

    require "square"
    client = Square::Client.new(base_url: WIREMOCK_BASE_URL, token: "<token>")
    client.orders.custom_attributes.get(
      order_id: "order_id",
      custom_attribute_key: "custom_attribute_key",
      version: 1,
      with_definition: true,
      request_options: { base_url: WIREMOCK_BASE_URL,
                         additional_headers: {
                           "X-Test-Id" => "orders.custom_attributes.get.0"
                         } }
    )

    verify_request_count(
      test_id: test_id,
      method: "GET",
      url_path: "/v2/orders/order_id/custom-attributes/custom_attribute_key",
      query_params: nil,
      expected: 1
    )
  end

  def test_orders_custom_attributes_upsert_with_wiremock
    test_id = "orders.custom_attributes.upsert.0"

    require "square"
    client = Square::Client.new(base_url: WIREMOCK_BASE_URL, token: "<token>")
    client.orders.custom_attributes.upsert(
      order_id: "order_id",
      custom_attribute_key: "custom_attribute_key",
      custom_attribute: {
        key: "table-number",
        version: 1
      },
      request_options: { base_url: WIREMOCK_BASE_URL,
                         additional_headers: {
                           "X-Test-Id" => "orders.custom_attributes.upsert.0"
                         } }
    )

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/v2/orders/order_id/custom-attributes/custom_attribute_key",
      query_params: nil,
      expected: 1
    )
  end

  def test_orders_custom_attributes_delete_with_wiremock
    test_id = "orders.custom_attributes.delete.0"

    require "square"
    client = Square::Client.new(base_url: WIREMOCK_BASE_URL, token: "<token>")
    client.orders.custom_attributes.delete(
      order_id: "order_id",
      custom_attribute_key: "custom_attribute_key",
      request_options: { base_url: WIREMOCK_BASE_URL,
                         additional_headers: {
                           "X-Test-Id" => "orders.custom_attributes.delete.0"
                         } }
    )

    verify_request_count(
      test_id: test_id,
      method: "DELETE",
      url_path: "/v2/orders/order_id/custom-attributes/custom_attribute_key",
      query_params: nil,
      expected: 1
    )
  end
end
