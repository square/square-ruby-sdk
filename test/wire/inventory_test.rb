# frozen_string_literal: true

require_relative "wire_helper"
require "net/http"
require "json"
require "uri"
require "square"

class InventoryWireTest < Minitest::Test
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

  def test_inventory_deprecated_get_adjustment_with_wiremock
    test_id = "inventory.deprecated_get_adjustment.0"

    require "square"
    client = Square::Client.new(base_url: WIREMOCK_BASE_URL, token: "<token>")
    client.inventory.deprecated_get_adjustment(
      adjustment_id: "adjustment_id",
      request_options: { base_url: WIREMOCK_BASE_URL,
                         additional_headers: {
                           "X-Test-Id" => "inventory.deprecated_get_adjustment.0"
                         } }
    )

    verify_request_count(
      test_id: test_id,
      method: "GET",
      url_path: "/v2/inventory/adjustment/adjustment_id",
      query_params: nil,
      expected: 1
    )
  end

  def test_inventory_get_adjustment_with_wiremock
    test_id = "inventory.get_adjustment.0"

    require "square"
    client = Square::Client.new(base_url: WIREMOCK_BASE_URL, token: "<token>")
    client.inventory.get_adjustment(
      adjustment_id: "adjustment_id",
      request_options: { base_url: WIREMOCK_BASE_URL,
                         additional_headers: {
                           "X-Test-Id" => "inventory.get_adjustment.0"
                         } }
    )

    verify_request_count(
      test_id: test_id,
      method: "GET",
      url_path: "/v2/inventory/adjustments/adjustment_id",
      query_params: nil,
      expected: 1
    )
  end

  def test_inventory_deprecated_batch_change_with_wiremock
    test_id = "inventory.deprecated_batch_change.0"

    require "square"
    client = Square::Client.new(base_url: WIREMOCK_BASE_URL, token: "<token>")
    client.inventory.deprecated_batch_change(
      idempotency_key: "8fc6a5b0-9fe8-4b46-b46b-2ef95793abbe",
      changes: [{
        type: "PHYSICAL_COUNT",
        physical_count: {
          reference_id: "1536bfbf-efed-48bf-b17d-a197141b2a92",
          catalog_object_id: "W62UWFY35CWMYGVWK6TWJDNI",
          state: "IN_STOCK",
          location_id: "C6W5YS5QM06F5",
          quantity: "53",
          team_member_id: "LRK57NSQ5X7PUD05",
          occurred_at: "2016-11-16T22:25:24.878Z"
        }
      }],
      ignore_unchanged_counts: true,
      request_options: { base_url: WIREMOCK_BASE_URL,
                         additional_headers: {
                           "X-Test-Id" => "inventory.deprecated_batch_change.0"
                         } }
    )

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/v2/inventory/batch-change",
      query_params: nil,
      expected: 1
    )
  end

  def test_inventory_deprecated_batch_get_changes_with_wiremock
    test_id = "inventory.deprecated_batch_get_changes.0"

    require "square"
    client = Square::Client.new(base_url: WIREMOCK_BASE_URL, token: "<token>")
    client.inventory.deprecated_batch_get_changes(
      catalog_object_ids: ["W62UWFY35CWMYGVWK6TWJDNI"],
      location_ids: ["C6W5YS5QM06F5"],
      types: ["PHYSICAL_COUNT"],
      states: ["IN_STOCK"],
      updated_after: "2016-11-01T00:00:00.000Z",
      updated_before: "2016-12-01T00:00:00.000Z",
      request_options: { base_url: WIREMOCK_BASE_URL,
                         additional_headers: {
                           "X-Test-Id" => "inventory.deprecated_batch_get_changes.0"
                         } }
    )

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/v2/inventory/batch-retrieve-changes",
      query_params: nil,
      expected: 1
    )
  end

  def test_inventory_deprecated_batch_get_counts_with_wiremock
    test_id = "inventory.deprecated_batch_get_counts.0"

    require "square"
    client = Square::Client.new(base_url: WIREMOCK_BASE_URL, token: "<token>")
    client.inventory.deprecated_batch_get_counts(
      catalog_object_ids: ["W62UWFY35CWMYGVWK6TWJDNI"],
      location_ids: ["59TNP9SA8VGDA"],
      updated_after: "2016-11-16T00:00:00.000Z",
      request_options: { base_url: WIREMOCK_BASE_URL,
                         additional_headers: {
                           "X-Test-Id" => "inventory.deprecated_batch_get_counts.0"
                         } }
    )

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/v2/inventory/batch-retrieve-counts",
      query_params: nil,
      expected: 1
    )
  end

  def test_inventory_batch_create_changes_with_wiremock
    test_id = "inventory.batch_create_changes.0"

    require "square"
    client = Square::Client.new(base_url: WIREMOCK_BASE_URL, token: "<token>")
    client.inventory.batch_create_changes(
      idempotency_key: "8fc6a5b0-9fe8-4b46-b46b-2ef95793abbe",
      changes: [{
        type: "PHYSICAL_COUNT",
        physical_count: {
          reference_id: "1536bfbf-efed-48bf-b17d-a197141b2a92",
          catalog_object_id: "W62UWFY35CWMYGVWK6TWJDNI",
          state: "IN_STOCK",
          location_id: "C6W5YS5QM06F5",
          quantity: "53",
          team_member_id: "LRK57NSQ5X7PUD05",
          occurred_at: "2016-11-16T22:25:24.878Z"
        }
      }],
      ignore_unchanged_counts: true,
      request_options: { base_url: WIREMOCK_BASE_URL,
                         additional_headers: {
                           "X-Test-Id" => "inventory.batch_create_changes.0"
                         } }
    )

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/v2/inventory/changes/batch-create",
      query_params: nil,
      expected: 1
    )
  end

  def test_inventory_batch_get_changes_with_wiremock
    test_id = "inventory.batch_get_changes.0"

    require "square"
    client = Square::Client.new(base_url: WIREMOCK_BASE_URL, token: "<token>")
    client.inventory.batch_get_changes(
      catalog_object_ids: ["W62UWFY35CWMYGVWK6TWJDNI"],
      location_ids: ["C6W5YS5QM06F5"],
      types: ["PHYSICAL_COUNT"],
      states: ["IN_STOCK"],
      updated_after: "2016-11-01T00:00:00.000Z",
      updated_before: "2016-12-01T00:00:00.000Z",
      request_options: { base_url: WIREMOCK_BASE_URL,
                         additional_headers: {
                           "X-Test-Id" => "inventory.batch_get_changes.0"
                         } }
    )

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/v2/inventory/changes/batch-retrieve",
      query_params: nil,
      expected: 1
    )
  end

  def test_inventory_batch_get_counts_with_wiremock
    test_id = "inventory.batch_get_counts.0"

    require "square"
    client = Square::Client.new(base_url: WIREMOCK_BASE_URL, token: "<token>")
    client.inventory.batch_get_counts(
      catalog_object_ids: ["W62UWFY35CWMYGVWK6TWJDNI"],
      location_ids: ["59TNP9SA8VGDA"],
      updated_after: "2016-11-16T00:00:00.000Z",
      request_options: { base_url: WIREMOCK_BASE_URL,
                         additional_headers: {
                           "X-Test-Id" => "inventory.batch_get_counts.0"
                         } }
    )

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/v2/inventory/counts/batch-retrieve",
      query_params: nil,
      expected: 1
    )
  end

  def test_inventory_deprecated_get_physical_count_with_wiremock
    test_id = "inventory.deprecated_get_physical_count.0"

    require "square"
    client = Square::Client.new(base_url: WIREMOCK_BASE_URL, token: "<token>")
    client.inventory.deprecated_get_physical_count(
      physical_count_id: "physical_count_id",
      request_options: { base_url: WIREMOCK_BASE_URL,
                         additional_headers: {
                           "X-Test-Id" => "inventory.deprecated_get_physical_count.0"
                         } }
    )

    verify_request_count(
      test_id: test_id,
      method: "GET",
      url_path: "/v2/inventory/physical-count/physical_count_id",
      query_params: nil,
      expected: 1
    )
  end

  def test_inventory_get_physical_count_with_wiremock
    test_id = "inventory.get_physical_count.0"

    require "square"
    client = Square::Client.new(base_url: WIREMOCK_BASE_URL, token: "<token>")
    client.inventory.get_physical_count(
      physical_count_id: "physical_count_id",
      request_options: { base_url: WIREMOCK_BASE_URL,
                         additional_headers: {
                           "X-Test-Id" => "inventory.get_physical_count.0"
                         } }
    )

    verify_request_count(
      test_id: test_id,
      method: "GET",
      url_path: "/v2/inventory/physical-counts/physical_count_id",
      query_params: nil,
      expected: 1
    )
  end

  def test_inventory_get_transfer_with_wiremock
    test_id = "inventory.get_transfer.0"

    require "square"
    client = Square::Client.new(base_url: WIREMOCK_BASE_URL, token: "<token>")
    client.inventory.get_transfer(
      transfer_id: "transfer_id",
      request_options: { base_url: WIREMOCK_BASE_URL,
                         additional_headers: {
                           "X-Test-Id" => "inventory.get_transfer.0"
                         } }
    )

    verify_request_count(
      test_id: test_id,
      method: "GET",
      url_path: "/v2/inventory/transfers/transfer_id",
      query_params: nil,
      expected: 1
    )
  end

  def test_inventory_get_with_wiremock
    test_id = "inventory.get.0"

    require "square"
    client = Square::Client.new(base_url: WIREMOCK_BASE_URL, token: "<token>")
    client.inventory.get(
      catalog_object_id: "catalog_object_id",
      location_ids: "location_ids",
      cursor: "cursor",
      request_options: { base_url: WIREMOCK_BASE_URL,
                         additional_headers: {
                           "X-Test-Id" => "inventory.get.0"
                         } }
    )

    verify_request_count(
      test_id: test_id,
      method: "GET",
      url_path: "/v2/inventory/catalog_object_id",
      query_params: nil,
      expected: 1
    )
  end

  def test_inventory_changes_with_wiremock
    test_id = "inventory.changes.0"

    require "square"
    client = Square::Client.new(base_url: WIREMOCK_BASE_URL, token: "<token>")
    client.inventory.changes(
      catalog_object_id: "catalog_object_id",
      location_ids: "location_ids",
      cursor: "cursor",
      request_options: { base_url: WIREMOCK_BASE_URL,
                         additional_headers: {
                           "X-Test-Id" => "inventory.changes.0"
                         } }
    )

    verify_request_count(
      test_id: test_id,
      method: "GET",
      url_path: "/v2/inventory/catalog_object_id/changes",
      query_params: nil,
      expected: 1
    )
  end
end
