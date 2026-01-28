# frozen_string_literal: true

require_relative "wiremock_test_case"

class CatalogWireTest < WireMockTestCase
  def setup
    super

    @client = Square::Client.new(
      token: "<token>",
      base_url: WIREMOCK_BASE_URL
    )
  end

  def test_catalog_batch_delete_with_wiremock
    test_id = "catalog.batch_delete.0"

    @client.catalog.batch_delete(
      object_ids: %w[W62UWFY35CWMYGVWK6TWJDNI AA27W3M2GGTF3H6AVPNB77CK],
      request_options: {
        additional_headers: {
          "X-Test-Id" => "catalog.batch_delete.0"
        }
      }
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

    @client.catalog.batch_get(
      object_ids: %w[W62UWFY35CWMYGVWK6TWJDNI AA27W3M2GGTF3H6AVPNB77CK],
      include_related_objects: true,
      request_options: {
        additional_headers: {
          "X-Test-Id" => "catalog.batch_get.0"
        }
      }
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

    @client.catalog.batch_upsert(
      idempotency_key: "789ff020-f723-43a9-b4b5-43b5dc1fa3dc",
      batches: [{
        objects: []
      }],
      request_options: {
        additional_headers: {
          "X-Test-Id" => "catalog.batch_upsert.0"
        }
      }
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

    @client.catalog.info(request_options: {
                           additional_headers: {
                             "X-Test-Id" => "catalog.info.0"
                           }
                         })

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

    result = @client.catalog.list(
      cursor: "cursor",
      types: "types",
      catalog_version: 1_000_000,
      request_options: {
        additional_headers: {
          "X-Test-Id" => "catalog.list.0"
        }
      }
    )

    result.pages.next_page

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

    @client.catalog.search(
      object_types: ["ITEM"],
      query: {
        prefix_query: {
          attribute_name: "name",
          attribute_prefix: "tea"
        }
      },
      limit: 100,
      request_options: {
        additional_headers: {
          "X-Test-Id" => "catalog.search.0"
        }
      }
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

    @client.catalog.search_items(
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
      request_options: {
        additional_headers: {
          "X-Test-Id" => "catalog.search_items.0"
        }
      }
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

    @client.catalog.update_item_modifier_lists(
      item_ids: %w[H42BRLUJ5KTZTTMPVSLFAACQ 2JXOBJIHCWBQ4NZ3RIXQGJA6],
      modifier_lists_to_enable: %w[H42BRLUJ5KTZTTMPVSLFAACQ 2JXOBJIHCWBQ4NZ3RIXQGJA6],
      modifier_lists_to_disable: ["7WRC16CJZDVLSNDQ35PP6YAD"],
      request_options: {
        additional_headers: {
          "X-Test-Id" => "catalog.update_item_modifier_lists.0"
        }
      }
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

    @client.catalog.update_item_taxes(
      item_ids: %w[H42BRLUJ5KTZTTMPVSLFAACQ 2JXOBJIHCWBQ4NZ3RIXQGJA6],
      taxes_to_enable: ["4WRCNHCJZDVLSNDQ35PP6YAD"],
      taxes_to_disable: ["AQCEGCEBBQONINDOHRGZISEX"],
      request_options: {
        additional_headers: {
          "X-Test-Id" => "catalog.update_item_taxes.0"
        }
      }
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
