# frozen_string_literal: true

require_relative "wire_helper"
require "net/http"
require "json"
require "uri"
require "square"

class CustomersCustomAttributeDefinitionsWireTest < Minitest::Test
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

  def test_customers_custom_attribute_definitions_list_with_wiremock
    test_id = "customers.custom_attribute_definitions.list.0"

    require "square"
    client = Square::Client.new(base_url: WIREMOCK_BASE_URL, token: "<token>")
    client.customers.custom_attribute_definitions.list(
      limit: 1,
      cursor: "cursor",
      request_options: { base_url: WIREMOCK_BASE_URL,
                         additional_headers: {
                           "X-Test-Id" => "customers.custom_attribute_definitions.list.0"
                         } }
    )

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

    require "square"
    client = Square::Client.new(base_url: WIREMOCK_BASE_URL, token: "<token>")
    client.customers.custom_attribute_definitions.create(
      custom_attribute_definition: {
        key: "favoritemovie",
        schema: {},
        name: "Favorite Movie",
        description: "The favorite movie of the customer.",
        visibility: "VISIBILITY_HIDDEN"
      },
      request_options: { base_url: WIREMOCK_BASE_URL,
                         additional_headers: {
                           "X-Test-Id" => "customers.custom_attribute_definitions.create.0"
                         } }
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

    require "square"
    client = Square::Client.new(base_url: WIREMOCK_BASE_URL, token: "<token>")
    client.customers.custom_attribute_definitions.get(
      key: "key",
      version: 1,
      request_options: { base_url: WIREMOCK_BASE_URL,
                         additional_headers: {
                           "X-Test-Id" => "customers.custom_attribute_definitions.get.0"
                         } }
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

    require "square"
    client = Square::Client.new(base_url: WIREMOCK_BASE_URL, token: "<token>")
    client.customers.custom_attribute_definitions.update(
      key: "key",
      custom_attribute_definition: {
        description: "Update the description as desired.",
        visibility: "VISIBILITY_READ_ONLY"
      },
      request_options: { base_url: WIREMOCK_BASE_URL,
                         additional_headers: {
                           "X-Test-Id" => "customers.custom_attribute_definitions.update.0"
                         } }
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

    require "square"
    client = Square::Client.new(base_url: WIREMOCK_BASE_URL, token: "<token>")
    client.customers.custom_attribute_definitions.delete(
      key: "key",
      request_options: { base_url: WIREMOCK_BASE_URL,
                         additional_headers: {
                           "X-Test-Id" => "customers.custom_attribute_definitions.delete.0"
                         } }
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

    require "square"
    client = Square::Client.new(base_url: WIREMOCK_BASE_URL, token: "<token>")
    client.customers.custom_attribute_definitions.batch_upsert(
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
      request_options: { base_url: WIREMOCK_BASE_URL,
                         additional_headers: {
                           "X-Test-Id" => "customers.custom_attribute_definitions.batch_upsert.0"
                         } }
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
