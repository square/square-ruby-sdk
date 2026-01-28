# frozen_string_literal: true

require_relative "wiremock_test_case"

class OrdersCustomAttributeDefinitionsWireTest < WireMockTestCase
  def setup
    super

    @client = Square::Client.new(
      token: "<token>",
      base_url: WIREMOCK_BASE_URL
    )
  end

  def test_orders_custom_attribute_definitions_list_with_wiremock
    test_id = "orders.custom_attribute_definitions.list.0"

    result = @client.orders.custom_attribute_definitions.list(
      visibility_filter: "ALL",
      cursor: "cursor",
      limit: 1,
      request_options: {
        additional_headers: {
          "X-Test-Id" => "orders.custom_attribute_definitions.list.0"
        }
      }
    )

    result.pages.next_page

    verify_request_count(
      test_id: test_id,
      method: "GET",
      url_path: "/v2/orders/custom-attribute-definitions",
      query_params: nil,
      expected: 1
    )
  end

  def test_orders_custom_attribute_definitions_create_with_wiremock
    test_id = "orders.custom_attribute_definitions.create.0"

    @client.orders.custom_attribute_definitions.create(
      custom_attribute_definition: {
        key: "cover-count",
        schema: {},
        name: "Cover count",
        description: "The number of people seated at a table",
        visibility: "VISIBILITY_READ_WRITE_VALUES"
      },
      idempotency_key: "IDEMPOTENCY_KEY",
      request_options: {
        additional_headers: {
          "X-Test-Id" => "orders.custom_attribute_definitions.create.0"
        }
      }
    )

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/v2/orders/custom-attribute-definitions",
      query_params: nil,
      expected: 1
    )
  end

  def test_orders_custom_attribute_definitions_get_with_wiremock
    test_id = "orders.custom_attribute_definitions.get.0"

    @client.orders.custom_attribute_definitions.get(
      key: "key",
      version: 1,
      request_options: {
        additional_headers: {
          "X-Test-Id" => "orders.custom_attribute_definitions.get.0"
        }
      }
    )

    verify_request_count(
      test_id: test_id,
      method: "GET",
      url_path: "/v2/orders/custom-attribute-definitions/key",
      query_params: nil,
      expected: 1
    )
  end

  def test_orders_custom_attribute_definitions_update_with_wiremock
    test_id = "orders.custom_attribute_definitions.update.0"

    @client.orders.custom_attribute_definitions.update(
      key: "key",
      custom_attribute_definition: {
        key: "cover-count",
        visibility: "VISIBILITY_READ_ONLY",
        version: 1
      },
      idempotency_key: "IDEMPOTENCY_KEY",
      request_options: {
        additional_headers: {
          "X-Test-Id" => "orders.custom_attribute_definitions.update.0"
        }
      }
    )

    verify_request_count(
      test_id: test_id,
      method: "PUT",
      url_path: "/v2/orders/custom-attribute-definitions/key",
      query_params: nil,
      expected: 1
    )
  end

  def test_orders_custom_attribute_definitions_delete_with_wiremock
    test_id = "orders.custom_attribute_definitions.delete.0"

    @client.orders.custom_attribute_definitions.delete(
      key: "key",
      request_options: {
        additional_headers: {
          "X-Test-Id" => "orders.custom_attribute_definitions.delete.0"
        }
      }
    )

    verify_request_count(
      test_id: test_id,
      method: "DELETE",
      url_path: "/v2/orders/custom-attribute-definitions/key",
      query_params: nil,
      expected: 1
    )
  end
end
