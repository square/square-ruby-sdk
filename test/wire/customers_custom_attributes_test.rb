# frozen_string_literal: true

require_relative "wiremock_test_case"

class CustomersCustomAttributesWireTest < WireMockTestCase
  def setup
    super

    @client = Square::Client.new(
      token: "<token>",
      base_url: WIREMOCK_BASE_URL
    )
  end

  def test_customers_custom_attributes_list_with_wiremock
    test_id = "customers.custom_attributes.list.0"

    result = @client.customers.custom_attributes.list(
      customer_id: "customer_id",
      limit: 1,
      cursor: "cursor",
      with_definitions: true,
      request_options: {
        additional_headers: {
          "X-Test-Id" => "customers.custom_attributes.list.0"
        }
      }
    )

    result.pages.next_page

    verify_request_count(
      test_id: test_id,
      method: "GET",
      url_path: "/v2/customers/customer_id/custom-attributes",
      query_params: nil,
      expected: 1
    )
  end

  def test_customers_custom_attributes_get_with_wiremock
    test_id = "customers.custom_attributes.get.0"

    @client.customers.custom_attributes.get(
      customer_id: "customer_id",
      key: "key",
      with_definition: true,
      version: 1,
      request_options: {
        additional_headers: {
          "X-Test-Id" => "customers.custom_attributes.get.0"
        }
      }
    )

    verify_request_count(
      test_id: test_id,
      method: "GET",
      url_path: "/v2/customers/customer_id/custom-attributes/key",
      query_params: nil,
      expected: 1
    )
  end

  def test_customers_custom_attributes_upsert_with_wiremock
    test_id = "customers.custom_attributes.upsert.0"

    @client.customers.custom_attributes.upsert(
      customer_id: "customer_id",
      key: "key",
      custom_attribute: {},
      request_options: {
        additional_headers: {
          "X-Test-Id" => "customers.custom_attributes.upsert.0"
        }
      }
    )

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/v2/customers/customer_id/custom-attributes/key",
      query_params: nil,
      expected: 1
    )
  end

  def test_customers_custom_attributes_delete_with_wiremock
    test_id = "customers.custom_attributes.delete.0"

    @client.customers.custom_attributes.delete(
      customer_id: "customer_id",
      key: "key",
      request_options: {
        additional_headers: {
          "X-Test-Id" => "customers.custom_attributes.delete.0"
        }
      }
    )

    verify_request_count(
      test_id: test_id,
      method: "DELETE",
      url_path: "/v2/customers/customer_id/custom-attributes/key",
      query_params: nil,
      expected: 1
    )
  end
end
