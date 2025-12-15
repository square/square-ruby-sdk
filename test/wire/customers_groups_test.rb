# frozen_string_literal: true

require_relative "wire_helper"
require "net/http"
require "json"
require "uri"
require "square"

class CustomersGroupsWireTest < Minitest::Test
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

  def test_customers_groups_list_with_wiremock
    test_id = "customers.groups.list.0"

    require "square"
    client = Square::Client.new(base_url: WIREMOCK_BASE_URL, token: "<token>")
    client.customers.groups.list(
      cursor: "cursor",
      limit: 1,
      request_options: { base_url: WIREMOCK_BASE_URL,
                         additional_headers: {
                           "X-Test-Id" => "customers.groups.list.0"
                         } }
    )

    verify_request_count(
      test_id: test_id,
      method: "GET",
      url_path: "/v2/customers/groups",
      query_params: nil,
      expected: 1
    )
  end

  def test_customers_groups_create_with_wiremock
    test_id = "customers.groups.create.0"

    require "square"
    client = Square::Client.new(base_url: WIREMOCK_BASE_URL, token: "<token>")
    client.customers.groups.create(
      group: {
        name: "Loyal Customers"
      },
      request_options: { base_url: WIREMOCK_BASE_URL,
                         additional_headers: {
                           "X-Test-Id" => "customers.groups.create.0"
                         } }
    )

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/v2/customers/groups",
      query_params: nil,
      expected: 1
    )
  end

  def test_customers_groups_get_with_wiremock
    test_id = "customers.groups.get.0"

    require "square"
    client = Square::Client.new(base_url: WIREMOCK_BASE_URL, token: "<token>")
    client.customers.groups.get(
      group_id: "group_id",
      request_options: { base_url: WIREMOCK_BASE_URL,
                         additional_headers: {
                           "X-Test-Id" => "customers.groups.get.0"
                         } }
    )

    verify_request_count(
      test_id: test_id,
      method: "GET",
      url_path: "/v2/customers/groups/group_id",
      query_params: nil,
      expected: 1
    )
  end

  def test_customers_groups_update_with_wiremock
    test_id = "customers.groups.update.0"

    require "square"
    client = Square::Client.new(base_url: WIREMOCK_BASE_URL, token: "<token>")
    client.customers.groups.update(
      group_id: "group_id",
      group: {
        name: "Loyal Customers"
      },
      request_options: { base_url: WIREMOCK_BASE_URL,
                         additional_headers: {
                           "X-Test-Id" => "customers.groups.update.0"
                         } }
    )

    verify_request_count(
      test_id: test_id,
      method: "PUT",
      url_path: "/v2/customers/groups/group_id",
      query_params: nil,
      expected: 1
    )
  end

  def test_customers_groups_delete_with_wiremock
    test_id = "customers.groups.delete.0"

    require "square"
    client = Square::Client.new(base_url: WIREMOCK_BASE_URL, token: "<token>")
    client.customers.groups.delete(
      group_id: "group_id",
      request_options: { base_url: WIREMOCK_BASE_URL,
                         additional_headers: {
                           "X-Test-Id" => "customers.groups.delete.0"
                         } }
    )

    verify_request_count(
      test_id: test_id,
      method: "DELETE",
      url_path: "/v2/customers/groups/group_id",
      query_params: nil,
      expected: 1
    )
  end

  def test_customers_groups_add_with_wiremock
    test_id = "customers.groups.add.0"

    require "square"
    client = Square::Client.new(base_url: WIREMOCK_BASE_URL, token: "<token>")
    client.customers.groups.add(
      customer_id: "customer_id",
      group_id: "group_id",
      request_options: { base_url: WIREMOCK_BASE_URL,
                         additional_headers: {
                           "X-Test-Id" => "customers.groups.add.0"
                         } }
    )

    verify_request_count(
      test_id: test_id,
      method: "PUT",
      url_path: "/v2/customers/customer_id/groups/group_id",
      query_params: nil,
      expected: 1
    )
  end

  def test_customers_groups_remove_with_wiremock
    test_id = "customers.groups.remove.0"

    require "square"
    client = Square::Client.new(base_url: WIREMOCK_BASE_URL, token: "<token>")
    client.customers.groups.remove(
      customer_id: "customer_id",
      group_id: "group_id",
      request_options: { base_url: WIREMOCK_BASE_URL,
                         additional_headers: {
                           "X-Test-Id" => "customers.groups.remove.0"
                         } }
    )

    verify_request_count(
      test_id: test_id,
      method: "DELETE",
      url_path: "/v2/customers/customer_id/groups/group_id",
      query_params: nil,
      expected: 1
    )
  end
end
