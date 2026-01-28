# frozen_string_literal: true

require_relative "wiremock_test_case"

class MerchantsCustomAttributesWireTest < WireMockTestCase
  def setup
    super

    @client = Square::Client.new(
      token: "<token>",
      base_url: WIREMOCK_BASE_URL
    )
  end

  def test_merchants_custom_attributes_batch_delete_with_wiremock
    test_id = "merchants.custom_attributes.batch_delete.0"

    @client.merchants.custom_attributes.batch_delete(
      values: {
        id1: {
          key: "alternative_seller_name"
        },
        id2: {
          key: "has_seen_tutorial"
        }
      },
      request_options: {
        additional_headers: {
          "X-Test-Id" => "merchants.custom_attributes.batch_delete.0"
        }
      }
    )

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/v2/merchants/custom-attributes/bulk-delete",
      query_params: nil,
      expected: 1
    )
  end

  def test_merchants_custom_attributes_batch_upsert_with_wiremock
    test_id = "merchants.custom_attributes.batch_upsert.0"

    @client.merchants.custom_attributes.batch_upsert(
      values: {
        id1: {
          merchant_id: "DM7VKY8Q63GNP",
          custom_attribute: {
            key: "alternative_seller_name"
          }
        },
        id2: {
          merchant_id: "DM7VKY8Q63GNP",
          custom_attribute: {
            key: "has_seen_tutorial"
          }
        }
      },
      request_options: {
        additional_headers: {
          "X-Test-Id" => "merchants.custom_attributes.batch_upsert.0"
        }
      }
    )

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/v2/merchants/custom-attributes/bulk-upsert",
      query_params: nil,
      expected: 1
    )
  end

  def test_merchants_custom_attributes_list_with_wiremock
    test_id = "merchants.custom_attributes.list.0"

    result = @client.merchants.custom_attributes.list(
      merchant_id: "merchant_id",
      visibility_filter: "ALL",
      limit: 1,
      cursor: "cursor",
      with_definitions: true,
      request_options: {
        additional_headers: {
          "X-Test-Id" => "merchants.custom_attributes.list.0"
        }
      }
    )

    result.pages.next_page

    verify_request_count(
      test_id: test_id,
      method: "GET",
      url_path: "/v2/merchants/merchant_id/custom-attributes",
      query_params: nil,
      expected: 1
    )
  end

  def test_merchants_custom_attributes_get_with_wiremock
    test_id = "merchants.custom_attributes.get.0"

    @client.merchants.custom_attributes.get(
      merchant_id: "merchant_id",
      key: "key",
      with_definition: true,
      version: 1,
      request_options: {
        additional_headers: {
          "X-Test-Id" => "merchants.custom_attributes.get.0"
        }
      }
    )

    verify_request_count(
      test_id: test_id,
      method: "GET",
      url_path: "/v2/merchants/merchant_id/custom-attributes/key",
      query_params: nil,
      expected: 1
    )
  end

  def test_merchants_custom_attributes_upsert_with_wiremock
    test_id = "merchants.custom_attributes.upsert.0"

    @client.merchants.custom_attributes.upsert(
      merchant_id: "merchant_id",
      key: "key",
      custom_attribute: {},
      request_options: {
        additional_headers: {
          "X-Test-Id" => "merchants.custom_attributes.upsert.0"
        }
      }
    )

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/v2/merchants/merchant_id/custom-attributes/key",
      query_params: nil,
      expected: 1
    )
  end

  def test_merchants_custom_attributes_delete_with_wiremock
    test_id = "merchants.custom_attributes.delete.0"

    @client.merchants.custom_attributes.delete(
      merchant_id: "merchant_id",
      key: "key",
      request_options: {
        additional_headers: {
          "X-Test-Id" => "merchants.custom_attributes.delete.0"
        }
      }
    )

    verify_request_count(
      test_id: test_id,
      method: "DELETE",
      url_path: "/v2/merchants/merchant_id/custom-attributes/key",
      query_params: nil,
      expected: 1
    )
  end
end
