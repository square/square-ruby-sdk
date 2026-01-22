# frozen_string_literal: true

require_relative "wire_helper"
require "net/http"
require "json"
require "uri"
require "square"

class CatalogWireTest < Minitest::Test
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

  def test_catalog_batch_delete_with_wiremock
    test_id = "catalog.batch_delete.0"

    require "square"
    client = Square::Client.new(base_url: WIREMOCK_BASE_URL, token: "<token>")
    client.catalog.batch_delete(
      object_ids: %w[W62UWFY35CWMYGVWK6TWJDNI AA27W3M2GGTF3H6AVPNB77CK],
      request_options: { base_url: WIREMOCK_BASE_URL,
                         additional_headers: {
                           "X-Test-Id" => "catalog.batch_delete.0"
                         } }
    )

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/v2/catalog/batch-delete",
      query_params: nil,
      expected: 1
    )
  end

  def test_catalog_batch_get_with_wiremock
    test_id = "catalog.batch_get.0"

    require "square"
    client = Square::Client.new(base_url: WIREMOCK_BASE_URL, token: "<token>")
    client.catalog.batch_get(
      object_ids: %w[W62UWFY35CWMYGVWK6TWJDNI AA27W3M2GGTF3H6AVPNB77CK],
      include_related_objects: true,
      request_options: { base_url: WIREMOCK_BASE_URL,
                         additional_headers: {
                           "X-Test-Id" => "catalog.batch_get.0"
                         } }
    )

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/v2/catalog/batch-retrieve",
      query_params: nil,
      expected: 1
    )
  end

  def test_catalog_batch_upsert_with_wiremock
    test_id = "catalog.batch_upsert.0"

    require "square"
    client = Square::Client.new(base_url: WIREMOCK_BASE_URL, token: "<token>")
    client.catalog.batch_upsert(
      idempotency_key: "789ff020-f723-43a9-b4b5-43b5dc1fa3dc",
      batches: [{
        objects: []
      }],
      request_options: { base_url: WIREMOCK_BASE_URL,
                         additional_headers: {
                           "X-Test-Id" => "catalog.batch_upsert.0"
                         } }
    )

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/v2/catalog/batch-upsert",
      query_params: nil,
      expected: 1
    )
  end

  def test_catalog_info_with_wiremock
    test_id = "catalog.info.0"

    require "square"
    client = Square::Client.new(base_url: WIREMOCK_BASE_URL, token: "<token>")
    client.catalog.info(request_options: { base_url: WIREMOCK_BASE_URL,
                                           additional_headers: {
                                             "X-Test-Id" => "catalog.info.0"
                                           } })

    verify_request_count(
      test_id: test_id,
      method: "GET",
      url_path: "/v2/catalog/info",
      query_params: nil,
      expected: 1
    )
  end

  def test_catalog_list_with_wiremock
    test_id = "catalog.list.0"

    require "square"
    client = Square::Client.new(base_url: WIREMOCK_BASE_URL, token: "<token>")
    client.catalog.list(
      cursor: "cursor",
      types: "types",
      catalog_version: 1_000_000,
      request_options: { base_url: WIREMOCK_BASE_URL,
                         additional_headers: {
                           "X-Test-Id" => "catalog.list.0"
                         } }
    )

    verify_request_count(
      test_id: test_id,
      method: "GET",
      url_path: "/v2/catalog/list",
      query_params: nil,
      expected: 1
    )
  end

  def test_catalog_search_with_wiremock
    test_id = "catalog.search.0"

    require "square"
    client = Square::Client.new(base_url: WIREMOCK_BASE_URL, token: "<token>")
    client.catalog.search(
      object_types: ["ITEM"],
      query: {
        prefix_query: {
          attribute_name: "name",
          attribute_prefix: "tea"
        }
      },
      limit: 100,
      request_options: { base_url: WIREMOCK_BASE_URL,
                         additional_headers: {
                           "X-Test-Id" => "catalog.search.0"
                         } }
    )

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/v2/catalog/search",
      query_params: nil,
      expected: 1
    )
  end

  def test_catalog_search_items_with_wiremock
    test_id = "catalog.search_items.0"

    require "square"
    client = Square::Client.new(base_url: WIREMOCK_BASE_URL, token: "<token>")
    client.catalog.search_items(
      text_filter: "red",
      category_ids: ["WINE_CATEGORY_ID"],
      stock_levels: %w[OUT LOW],
      enabled_location_ids: ["ATL_LOCATION_ID"],
      limit: 100,
      sort_order: "ASC",
      product_types: ["REGULAR"],
      custom_attribute_filters: [{
        custom_attribute_definition_id: "VEGAN_DEFINITION_ID",
        bool_filter: true
      }, {
        custom_attribute_definition_id: "BRAND_DEFINITION_ID",
        string_filter: "Dark Horse"
      }, {
        key: "VINTAGE",
        number_filter: {
          min: "min",
          max: "max"
        }
      }, {
        custom_attribute_definition_id: "VARIETAL_DEFINITION_ID"
      }],
      request_options: { base_url: WIREMOCK_BASE_URL,
                         additional_headers: {
                           "X-Test-Id" => "catalog.search_items.0"
                         } }
    )

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/v2/catalog/search-catalog-items",
      query_params: nil,
      expected: 1
    )
  end

  def test_catalog_update_item_modifier_lists_with_wiremock
    test_id = "catalog.update_item_modifier_lists.0"

    require "square"
    client = Square::Client.new(base_url: WIREMOCK_BASE_URL, token: "<token>")
    client.catalog.update_item_modifier_lists(
      item_ids: %w[H42BRLUJ5KTZTTMPVSLFAACQ 2JXOBJIHCWBQ4NZ3RIXQGJA6],
      modifier_lists_to_enable: %w[H42BRLUJ5KTZTTMPVSLFAACQ 2JXOBJIHCWBQ4NZ3RIXQGJA6],
      modifier_lists_to_disable: ["7WRC16CJZDVLSNDQ35PP6YAD"],
      request_options: { base_url: WIREMOCK_BASE_URL,
                         additional_headers: {
                           "X-Test-Id" => "catalog.update_item_modifier_lists.0"
                         } }
    )

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/v2/catalog/update-item-modifier-lists",
      query_params: nil,
      expected: 1
    )
  end

  def test_catalog_update_item_taxes_with_wiremock
    test_id = "catalog.update_item_taxes.0"

    require "square"
    client = Square::Client.new(base_url: WIREMOCK_BASE_URL, token: "<token>")
    client.catalog.update_item_taxes(
      item_ids: %w[H42BRLUJ5KTZTTMPVSLFAACQ 2JXOBJIHCWBQ4NZ3RIXQGJA6],
      taxes_to_enable: ["4WRCNHCJZDVLSNDQ35PP6YAD"],
      taxes_to_disable: ["AQCEGCEBBQONINDOHRGZISEX"],
      request_options: { base_url: WIREMOCK_BASE_URL,
                         additional_headers: {
                           "X-Test-Id" => "catalog.update_item_taxes.0"
                         } }
    )

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/v2/catalog/update-item-taxes",
      query_params: nil,
      expected: 1
    )
  end
end
