# frozen_string_literal: true

require_relative "wiremock_test_case"

class CustomersCustomAttributeDefinitionsWireTest < WireMockTestCase
  def setup
    super

    @client = Square::Client.new(
      token: "<token>",
      base_url: WIREMOCK_BASE_URL
    )
  end

  def test_customers_custom_attribute_definitions_list_with_wiremock
    test_id = "customers.custom_attribute_definitions.list.0"

    result = @client.customers.custom_attribute_definitions.list(
      limit: 1,
      cursor: "cursor",
      request_options: {
        additional_headers: {
          "X-Test-Id" => "customers.custom_attribute_definitions.list.0"
        }
      }
    )

    result.pages.next_page

    verify_request_count(
      test_id: test_id,
      method: "GET",
      url_path: "/v2/customers/custom-attribute-definitions",
      query_params: nil,
      expected: 1
    )
  end

  def test_customers_custom_attribute_definitions_create_with_wiremock
    test_id = "customers.custom_attribute_definitions.create.0"

    @client.customers.custom_attribute_definitions.create(
      custom_attribute_definition: {
        key: "favoritemovie",
        schema: {},
        name: "Favorite Movie",
        description: "The favorite movie of the customer.",
        visibility: "VISIBILITY_HIDDEN"
      },
      request_options: {
        additional_headers: {
          "X-Test-Id" => "customers.custom_attribute_definitions.create.0"
        }
      }
    )

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/v2/customers/custom-attribute-definitions",
      query_params: nil,
      expected: 1
    )
  end

  def test_customers_custom_attribute_definitions_get_with_wiremock
    test_id = "customers.custom_attribute_definitions.get.0"

    @client.customers.custom_attribute_definitions.get(
      key: "key",
      version: 1,
      request_options: {
        additional_headers: {
          "X-Test-Id" => "customers.custom_attribute_definitions.get.0"
        }
      }
    )

    verify_request_count(
      test_id: test_id,
      method: "GET",
      url_path: "/v2/customers/custom-attribute-definitions/key",
      query_params: nil,
      expected: 1
    )
  end

  def test_customers_custom_attribute_definitions_update_with_wiremock
    test_id = "customers.custom_attribute_definitions.update.0"

    @client.customers.custom_attribute_definitions.update(
      key: "key",
      custom_attribute_definition: {
        description: "Update the description as desired.",
        visibility: "VISIBILITY_READ_ONLY"
      },
      request_options: {
        additional_headers: {
          "X-Test-Id" => "customers.custom_attribute_definitions.update.0"
        }
      }
    )

    verify_request_count(
      test_id: test_id,
      method: "PUT",
      url_path: "/v2/customers/custom-attribute-definitions/key",
      query_params: nil,
      expected: 1
    )
  end

  def test_customers_custom_attribute_definitions_delete_with_wiremock
    test_id = "customers.custom_attribute_definitions.delete.0"

    @client.customers.custom_attribute_definitions.delete(
      key: "key",
      request_options: {
        additional_headers: {
          "X-Test-Id" => "customers.custom_attribute_definitions.delete.0"
        }
      }
    )

    verify_request_count(
      test_id: test_id,
      method: "DELETE",
      url_path: "/v2/customers/custom-attribute-definitions/key",
      query_params: nil,
      expected: 1
    )
  end

  def test_customers_custom_attribute_definitions_batch_upsert_with_wiremock
    test_id = "customers.custom_attribute_definitions.batch_upsert.0"

    @client.customers.custom_attribute_definitions.batch_upsert(
      values: {
        id1: {
          customer_id: "N3NCVYY3WS27HF0HKANA3R9FP8",
          custom_attribute: {
            key: "favoritemovie"
          }
        },
        id2: {
          customer_id: "SY8EMWRNDN3TQDP2H4KS1QWMMM",
          custom_attribute: {
            key: "ownsmovie"
          }
        },
        id3: {
          customer_id: "SY8EMWRNDN3TQDP2H4KS1QWMMM",
          custom_attribute: {
            key: "favoritemovie"
          }
        },
        id4: {
          customer_id: "N3NCVYY3WS27HF0HKANA3R9FP8",
          custom_attribute: {
            key: "square:a0f1505a-2aa1-490d-91a8-8d31ff181808"
          }
        },
        id5: {
          customer_id: "70548QG1HN43B05G0KCZ4MMC1G",
          custom_attribute: {
            key: "sq0ids-0evKIskIGaY45fCyNL66aw:backupemail"
          }
        }
      },
      request_options: {
        additional_headers: {
          "X-Test-Id" => "customers.custom_attribute_definitions.batch_upsert.0"
        }
      }
    )

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/v2/customers/custom-attributes/bulk-upsert",
      query_params: nil,
      expected: 1
    )
  end
end
