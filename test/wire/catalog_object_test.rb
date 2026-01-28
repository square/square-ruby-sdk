# frozen_string_literal: true

require_relative "wiremock_test_case"

class CatalogObjectWireTest < WireMockTestCase
  def setup
    super

    @client = Square::Client.new(
      token: "<token>",
      base_url: WIREMOCK_BASE_URL
    )
  end

  def test_catalog_object_upsert_with_wiremock
    test_id = "catalog.object.upsert.0"

    @client.catalog.object.upsert(
      idempotency_key: "af3d1afc-7212-4300-b463-0bfc5314a5ae",
      request_options: {
        additional_headers: {
          "X-Test-Id" => "catalog.object.upsert.0"
        }
      }
    )

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/v2/catalog/object",
      query_params: nil,
      expected: 1
    )
  end

  def test_catalog_object_get_with_wiremock
    test_id = "catalog.object.get.0"

    @client.catalog.object.get(
      object_id_: "object_id",
      include_related_objects: true,
      catalog_version: 1_000_000,
      include_category_path_to_root: true,
      request_options: {
        additional_headers: {
          "X-Test-Id" => "catalog.object.get.0"
        }
      }
    )

    verify_request_count(
      test_id: test_id,
      method: "GET",
      url_path: "/v2/catalog/object/object_id",
      query_params: nil,
      expected: 1
    )
  end

  def test_catalog_object_delete_with_wiremock
    test_id = "catalog.object.delete.0"

    @client.catalog.object.delete(
      object_id_: "object_id",
      request_options: {
        additional_headers: {
          "X-Test-Id" => "catalog.object.delete.0"
        }
      }
    )

    verify_request_count(
      test_id: test_id,
      method: "DELETE",
      url_path: "/v2/catalog/object/object_id",
      query_params: nil,
      expected: 1
    )
  end
end
