# frozen_string_literal: true

require_relative "wire_helper"
require "net/http"
require "json"
require "uri"
require "square"

class TransferOrdersWireTest < Minitest::Test
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

  def test_transfer_orders_create_with_wiremock
    test_id = "transfer_orders.create.0"

    require "square"
    client = Square::Client.new(base_url: WIREMOCK_BASE_URL, token: "<token>")
    client.transfer_orders.create(
      idempotency_key: "65cc0586-3e82-384s-b524-3885cffd52",
      transfer_order: {
        source_location_id: "EXAMPLE_SOURCE_LOCATION_ID_123",
        destination_location_id: "EXAMPLE_DEST_LOCATION_ID_456",
        expected_at: "2025-11-09T05:00:00Z",
        notes: "Example transfer order for inventory redistribution between locations",
        tracking_number: "TRACK123456789",
        created_by_team_member_id: "EXAMPLE_TEAM_MEMBER_ID_789",
        line_items: [{
          item_variation_id: "EXAMPLE_ITEM_VARIATION_ID_001",
          quantity_ordered: "5"
        }, {
          item_variation_id: "EXAMPLE_ITEM_VARIATION_ID_002",
          quantity_ordered: "3"
        }]
      },
      request_options: { base_url: WIREMOCK_BASE_URL,
                         additional_headers: {
                           "X-Test-Id" => "transfer_orders.create.0"
                         } }
    )

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/v2/transfer-orders",
      query_params: nil,
      expected: 1
    )
  end

  def test_transfer_orders_search_with_wiremock
    test_id = "transfer_orders.search.0"

    require "square"
    client = Square::Client.new(base_url: WIREMOCK_BASE_URL, token: "<token>")
    client.transfer_orders.search(
      query: {
        filter: {
          source_location_ids: ["EXAMPLE_SOURCE_LOCATION_ID_123"],
          destination_location_ids: ["EXAMPLE_DEST_LOCATION_ID_456"],
          statuses: %w[STARTED PARTIALLY_RECEIVED]
        },
        sort: {
          field: "UPDATED_AT",
          order: "DESC"
        }
      },
      cursor: "eyJsYXN0X3VwZGF0ZWRfYXQiOjE3NTMxMTg2NjQ4NzN9",
      limit: 10,
      request_options: { base_url: WIREMOCK_BASE_URL,
                         additional_headers: {
                           "X-Test-Id" => "transfer_orders.search.0"
                         } }
    )

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/v2/transfer-orders/search",
      query_params: nil,
      expected: 1
    )
  end

  def test_transfer_orders_get_with_wiremock
    test_id = "transfer_orders.get.0"

    require "square"
    client = Square::Client.new(base_url: WIREMOCK_BASE_URL, token: "<token>")
    client.transfer_orders.get(
      transfer_order_id: "transfer_order_id",
      request_options: { base_url: WIREMOCK_BASE_URL,
                         additional_headers: {
                           "X-Test-Id" => "transfer_orders.get.0"
                         } }
    )

    verify_request_count(
      test_id: test_id,
      method: "GET",
      url_path: "/v2/transfer-orders/transfer_order_id",
      query_params: nil,
      expected: 1
    )
  end

  def test_transfer_orders_update_with_wiremock
    test_id = "transfer_orders.update.0"

    require "square"
    client = Square::Client.new(base_url: WIREMOCK_BASE_URL, token: "<token>")
    client.transfer_orders.update(
      transfer_order_id: "transfer_order_id",
      idempotency_key: "f47ac10b-58cc-4372-a567-0e02b2c3d479",
      transfer_order: {
        source_location_id: "EXAMPLE_SOURCE_LOCATION_ID_789",
        destination_location_id: "EXAMPLE_DEST_LOCATION_ID_101",
        expected_at: "2025-11-10T08:00:00Z",
        notes: "Updated: Priority transfer due to low stock at destination",
        tracking_number: "TRACK987654321",
        line_items: [{
          uid: "1",
          quantity_ordered: "7"
        }, {
          item_variation_id: "EXAMPLE_NEW_ITEM_VARIATION_ID_003",
          quantity_ordered: "2"
        }, {
          uid: "2",
          remove: true
        }]
      },
      version: 1_753_109_537_351,
      request_options: { base_url: WIREMOCK_BASE_URL,
                         additional_headers: {
                           "X-Test-Id" => "transfer_orders.update.0"
                         } }
    )

    verify_request_count(
      test_id: test_id,
      method: "PUT",
      url_path: "/v2/transfer-orders/transfer_order_id",
      query_params: nil,
      expected: 1
    )
  end

  def test_transfer_orders_delete_with_wiremock
    test_id = "transfer_orders.delete.0"

    require "square"
    client = Square::Client.new(base_url: WIREMOCK_BASE_URL, token: "<token>")
    client.transfer_orders.delete(
      transfer_order_id: "transfer_order_id",
      version: 1_000_000,
      request_options: { base_url: WIREMOCK_BASE_URL,
                         additional_headers: {
                           "X-Test-Id" => "transfer_orders.delete.0"
                         } }
    )

    verify_request_count(
      test_id: test_id,
      method: "DELETE",
      url_path: "/v2/transfer-orders/transfer_order_id",
      query_params: nil,
      expected: 1
    )
  end

  def test_transfer_orders_cancel_with_wiremock
    test_id = "transfer_orders.cancel.0"

    require "square"
    client = Square::Client.new(base_url: WIREMOCK_BASE_URL, token: "<token>")
    client.transfer_orders.cancel(
      transfer_order_id: "transfer_order_id",
      idempotency_key: "65cc0586-3e82-4d08-b524-3885cffd52",
      version: 1_753_117_449_752,
      request_options: { base_url: WIREMOCK_BASE_URL,
                         additional_headers: {
                           "X-Test-Id" => "transfer_orders.cancel.0"
                         } }
    )

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/v2/transfer-orders/transfer_order_id/cancel",
      query_params: nil,
      expected: 1
    )
  end

  def test_transfer_orders_receive_with_wiremock
    test_id = "transfer_orders.receive.0"

    require "square"
    client = Square::Client.new(base_url: WIREMOCK_BASE_URL, token: "<token>")
    client.transfer_orders.receive(
      transfer_order_id: "transfer_order_id",
      idempotency_key: "EXAMPLE_IDEMPOTENCY_KEY_101",
      receipt: {
        line_items: [{
          transfer_order_line_uid: "1",
          quantity_received: "3",
          quantity_damaged: "1",
          quantity_canceled: "1"
        }, {
          transfer_order_line_uid: "2",
          quantity_received: "2",
          quantity_canceled: "1"
        }]
      },
      version: 1_753_118_664_873,
      request_options: { base_url: WIREMOCK_BASE_URL,
                         additional_headers: {
                           "X-Test-Id" => "transfer_orders.receive.0"
                         } }
    )

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/v2/transfer-orders/transfer_order_id/receive",
      query_params: nil,
      expected: 1
    )
  end

  def test_transfer_orders_start_with_wiremock
    test_id = "transfer_orders.start.0"

    require "square"
    client = Square::Client.new(base_url: WIREMOCK_BASE_URL, token: "<token>")
    client.transfer_orders.start(
      transfer_order_id: "transfer_order_id",
      idempotency_key: "EXAMPLE_IDEMPOTENCY_KEY_789",
      version: 1_753_109_537_351,
      request_options: { base_url: WIREMOCK_BASE_URL,
                         additional_headers: {
                           "X-Test-Id" => "transfer_orders.start.0"
                         } }
    )

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/v2/transfer-orders/transfer_order_id/start",
      query_params: nil,
      expected: 1
    )
  end
end
