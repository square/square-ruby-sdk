# frozen_string_literal: true

require_relative "wire_helper"
require "net/http"
require "json"
require "uri"
require "square"

class CustomersWireTest < Minitest::Test
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

  def test_customers_list_with_wiremock
    test_id = "customers.list.0"

    require "square"
    client = Square::Client.new(base_url: WIREMOCK_BASE_URL, token: "<token>")
    client.customers.list(
      cursor: "cursor",
      limit: 1,
      sort_field: "DEFAULT",
      sort_order: "DESC",
      count: true,
      request_options: { base_url: WIREMOCK_BASE_URL,
                         additional_headers: {
                           "X-Test-Id" => "customers.list.0"
                         } }
    )

    verify_request_count(
      test_id: test_id,
      method: "GET",
      url_path: "/v2/customers",
      query_params: nil,
      expected: 1
    )
  end

  def test_customers_create_with_wiremock
    test_id = "customers.create.0"

    require "square"
    client = Square::Client.new(base_url: WIREMOCK_BASE_URL, token: "<token>")
    client.customers.create(
      given_name: "Amelia",
      family_name: "Earhart",
      email_address: "Amelia.Earhart@example.com",
      address: {
        address_line_1: "500 Electric Ave",
        address_line_2: "Suite 600",
        locality: "New York",
        administrative_district_level_1: "NY",
        postal_code: "10003",
        country: "US"
      },
      phone_number: "+1-212-555-4240",
      reference_id: "YOUR_REFERENCE_ID",
      note: "a customer",
      request_options: { base_url: WIREMOCK_BASE_URL,
                         additional_headers: {
                           "X-Test-Id" => "customers.create.0"
                         } }
    )

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/v2/customers",
      query_params: nil,
      expected: 1
    )
  end

  def test_customers_batch_create_with_wiremock
    test_id = "customers.batch_create.0"

    require "square"
    client = Square::Client.new(base_url: WIREMOCK_BASE_URL, token: "<token>")
    client.customers.batch_create(
      customers: {
        "8bb76c4f-e35d-4c5b-90de-1194cd9179f0" => {
          given_name: "Amelia",
          family_name: "Earhart",
          email_address: "Amelia.Earhart@example.com",
          address: {
            address_line_1: "500 Electric Ave",
            address_line_2: "Suite 600",
            locality: "New York",
            administrative_district_level_1: "NY",
            postal_code: "10003",
            country: "US"
          },
          phone_number: "+1-212-555-4240",
          reference_id: "YOUR_REFERENCE_ID",
          note: "a customer"
        },
        "d1689f23-b25d-4932-b2f0-aed00f5e2029" => {
          given_name: "Marie",
          family_name: "Curie",
          email_address: "Marie.Curie@example.com",
          address: {
            address_line_1: "500 Electric Ave",
            address_line_2: "Suite 601",
            locality: "New York",
            administrative_district_level_1: "NY",
            postal_code: "10003",
            country: "US"
          },
          phone_number: "+1-212-444-4240",
          reference_id: "YOUR_REFERENCE_ID",
          note: "another customer"
        }
      },
      request_options: { base_url: WIREMOCK_BASE_URL,
                         additional_headers: {
                           "X-Test-Id" => "customers.batch_create.0"
                         } }
    )

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/v2/customers/bulk-create",
      query_params: nil,
      expected: 1
    )
  end

  def test_customers_bulk_delete_customers_with_wiremock
    test_id = "customers.bulk_delete_customers.0"

    require "square"
    client = Square::Client.new(base_url: WIREMOCK_BASE_URL, token: "<token>")
    client.customers.bulk_delete_customers(
      customer_ids: %w[8DDA5NZVBZFGAX0V3HPF81HHE0 N18CPRVXR5214XPBBA6BZQWF3C 2GYD7WNXF7BJZW1PMGNXZ3Y8M8],
      request_options: { base_url: WIREMOCK_BASE_URL,
                         additional_headers: {
                           "X-Test-Id" => "customers.bulk_delete_customers.0"
                         } }
    )

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/v2/customers/bulk-delete",
      query_params: nil,
      expected: 1
    )
  end

  def test_customers_bulk_retrieve_customers_with_wiremock
    test_id = "customers.bulk_retrieve_customers.0"

    require "square"
    client = Square::Client.new(base_url: WIREMOCK_BASE_URL, token: "<token>")
    client.customers.bulk_retrieve_customers(
      customer_ids: %w[8DDA5NZVBZFGAX0V3HPF81HHE0 N18CPRVXR5214XPBBA6BZQWF3C 2GYD7WNXF7BJZW1PMGNXZ3Y8M8],
      request_options: { base_url: WIREMOCK_BASE_URL,
                         additional_headers: {
                           "X-Test-Id" => "customers.bulk_retrieve_customers.0"
                         } }
    )

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/v2/customers/bulk-retrieve",
      query_params: nil,
      expected: 1
    )
  end

  def test_customers_bulk_update_customers_with_wiremock
    test_id = "customers.bulk_update_customers.0"

    require "square"
    client = Square::Client.new(base_url: WIREMOCK_BASE_URL, token: "<token>")
    client.customers.bulk_update_customers(
      customers: {
        "8DDA5NZVBZFGAX0V3HPF81HHE0" => {
          email_address: "New.Amelia.Earhart@example.com",
          note: "updated customer note",
          version: 2
        },
        N18CPRVXR5214XPBBA6BZQWF3C: {
          given_name: "Marie",
          family_name: "Curie",
          version: 0
        }
      },
      request_options: { base_url: WIREMOCK_BASE_URL,
                         additional_headers: {
                           "X-Test-Id" => "customers.bulk_update_customers.0"
                         } }
    )

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/v2/customers/bulk-update",
      query_params: nil,
      expected: 1
    )
  end

  def test_customers_search_with_wiremock
    test_id = "customers.search.0"

    require "square"
    client = Square::Client.new(base_url: WIREMOCK_BASE_URL, token: "<token>")
    client.customers.search(
      limit: 2,
      query: {
        filter: {
          creation_source: {
            values: ["THIRD_PARTY"],
            rule: "INCLUDE"
          },
          created_at: {
            start_at: "2018-01-01T00:00:00-00:00",
            end_at: "2018-02-01T00:00:00-00:00"
          },
          email_address: {
            fuzzy: "example.com"
          },
          group_ids: {
            all: ["545AXB44B4XXWMVQ4W8SBT3HHF"]
          }
        },
        sort: {
          field: "CREATED_AT",
          order: "ASC"
        }
      },
      request_options: { base_url: WIREMOCK_BASE_URL,
                         additional_headers: {
                           "X-Test-Id" => "customers.search.0"
                         } }
    )

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/v2/customers/search",
      query_params: nil,
      expected: 1
    )
  end

  def test_customers_get_with_wiremock
    test_id = "customers.get.0"

    require "square"
    client = Square::Client.new(base_url: WIREMOCK_BASE_URL, token: "<token>")
    client.customers.get(
      customer_id: "customer_id",
      request_options: { base_url: WIREMOCK_BASE_URL,
                         additional_headers: {
                           "X-Test-Id" => "customers.get.0"
                         } }
    )

    verify_request_count(
      test_id: test_id,
      method: "GET",
      url_path: "/v2/customers/customer_id",
      query_params: nil,
      expected: 1
    )
  end

  def test_customers_update_with_wiremock
    test_id = "customers.update.0"

    require "square"
    client = Square::Client.new(base_url: WIREMOCK_BASE_URL, token: "<token>")
    client.customers.update(
      customer_id: "customer_id",
      email_address: "New.Amelia.Earhart@example.com",
      note: "updated customer note",
      version: 2,
      request_options: { base_url: WIREMOCK_BASE_URL,
                         additional_headers: {
                           "X-Test-Id" => "customers.update.0"
                         } }
    )

    verify_request_count(
      test_id: test_id,
      method: "PUT",
      url_path: "/v2/customers/customer_id",
      query_params: nil,
      expected: 1
    )
  end

  def test_customers_delete_with_wiremock
    test_id = "customers.delete.0"

    require "square"
    client = Square::Client.new(base_url: WIREMOCK_BASE_URL, token: "<token>")
    client.customers.delete(
      customer_id: "customer_id",
      version: 1_000_000,
      request_options: { base_url: WIREMOCK_BASE_URL,
                         additional_headers: {
                           "X-Test-Id" => "customers.delete.0"
                         } }
    )

    verify_request_count(
      test_id: test_id,
      method: "DELETE",
      url_path: "/v2/customers/customer_id",
      query_params: nil,
      expected: 1
    )
  end
end
