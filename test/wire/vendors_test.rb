# frozen_string_literal: true

require_relative "wire_helper"
require "net/http"
require "json"
require "uri"
require "square"

class VendorsWireTest < Minitest::Test
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

  def test_vendors_batch_create_with_wiremock
    test_id = "vendors.batch_create.0"

    require "square"
    client = Square::Client.new(base_url: WIREMOCK_BASE_URL, token: "<token>")
    client.vendors.batch_create(
      vendors: {
        "8fc6a5b0-9fe8-4b46-b46b-2ef95793abbe" => {
          name: "Joe's Fresh Seafood",
          address: {
            address_line_1: "505 Electric Ave",
            address_line_2: "Suite 600",
            locality: "New York",
            administrative_district_level_1: "NY",
            postal_code: "10003",
            country: "US"
          },
          contacts: [{
            name: "Joe Burrow",
            email_address: "joe@joesfreshseafood.com",
            phone_number: "1-212-555-4250",
            ordinal: 1
          }],
          account_number: "4025391",
          note: "a vendor"
        }
      },
      request_options: { base_url: WIREMOCK_BASE_URL,
                         additional_headers: {
                           "X-Test-Id" => "vendors.batch_create.0"
                         } }
    )

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/v2/vendors/bulk-create",
      query_params: nil,
      expected: 1
    )
  end

  def test_vendors_batch_get_with_wiremock
    test_id = "vendors.batch_get.0"

    require "square"
    client = Square::Client.new(base_url: WIREMOCK_BASE_URL, token: "<token>")
    client.vendors.batch_get(
      vendor_ids: ["INV_V_JDKYHBWT1D4F8MFH63DBMEN8Y4"],
      request_options: { base_url: WIREMOCK_BASE_URL,
                         additional_headers: {
                           "X-Test-Id" => "vendors.batch_get.0"
                         } }
    )

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/v2/vendors/bulk-retrieve",
      query_params: nil,
      expected: 1
    )
  end

  def test_vendors_batch_update_with_wiremock
    test_id = "vendors.batch_update.0"

    require "square"
    client = Square::Client.new(base_url: WIREMOCK_BASE_URL, token: "<token>")
    client.vendors.batch_update(
      vendors: {
        FMCYHBWT1TPL8MFH52PBMEN92A: {
          vendor: {}
        },
        INV_V_JDKYHBWT1D4F8MFH63DBMEN8Y4: {
          vendor: {}
        }
      },
      request_options: { base_url: WIREMOCK_BASE_URL,
                         additional_headers: {
                           "X-Test-Id" => "vendors.batch_update.0"
                         } }
    )

    verify_request_count(
      test_id: test_id,
      method: "PUT",
      url_path: "/v2/vendors/bulk-update",
      query_params: nil,
      expected: 1
    )
  end

  def test_vendors_create_with_wiremock
    test_id = "vendors.create.0"

    require "square"
    client = Square::Client.new(base_url: WIREMOCK_BASE_URL, token: "<token>")
    client.vendors.create(
      idempotency_key: "8fc6a5b0-9fe8-4b46-b46b-2ef95793abbe",
      vendor: {
        name: "Joe's Fresh Seafood",
        address: {
          address_line_1: "505 Electric Ave",
          address_line_2: "Suite 600",
          locality: "New York",
          administrative_district_level_1: "NY",
          postal_code: "10003",
          country: "US"
        },
        contacts: [{
          name: "Joe Burrow",
          email_address: "joe@joesfreshseafood.com",
          phone_number: "1-212-555-4250",
          ordinal: 1
        }],
        account_number: "4025391",
        note: "a vendor"
      },
      request_options: { base_url: WIREMOCK_BASE_URL,
                         additional_headers: {
                           "X-Test-Id" => "vendors.create.0"
                         } }
    )

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/v2/vendors/create",
      query_params: nil,
      expected: 1
    )
  end

  def test_vendors_search_with_wiremock
    test_id = "vendors.search.0"

    require "square"
    client = Square::Client.new(base_url: WIREMOCK_BASE_URL, token: "<token>")
    client.vendors.search(request_options: { base_url: WIREMOCK_BASE_URL,
                                             additional_headers: {
                                               "X-Test-Id" => "vendors.search.0"
                                             } })

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/v2/vendors/search",
      query_params: nil,
      expected: 1
    )
  end

  def test_vendors_get_with_wiremock
    test_id = "vendors.get.0"

    require "square"
    client = Square::Client.new(base_url: WIREMOCK_BASE_URL, token: "<token>")
    client.vendors.get(
      vendor_id: "vendor_id",
      request_options: { base_url: WIREMOCK_BASE_URL,
                         additional_headers: {
                           "X-Test-Id" => "vendors.get.0"
                         } }
    )

    verify_request_count(
      test_id: test_id,
      method: "GET",
      url_path: "/v2/vendors/vendor_id",
      query_params: nil,
      expected: 1
    )
  end

  def test_vendors_update_with_wiremock
    test_id = "vendors.update.0"

    require "square"
    client = Square::Client.new(base_url: WIREMOCK_BASE_URL, token: "<token>")
    client.vendors.update(
      vendor_id: "vendor_id",
      idempotency_key: "8fc6a5b0-9fe8-4b46-b46b-2ef95793abbe",
      vendor: {
        id: "INV_V_JDKYHBWT1D4F8MFH63DBMEN8Y4",
        name: "Jack's Chicken Shack",
        version: 1,
        status: "ACTIVE"
      },
      request_options: { base_url: WIREMOCK_BASE_URL,
                         additional_headers: {
                           "X-Test-Id" => "vendors.update.0"
                         } }
    )

    verify_request_count(
      test_id: test_id,
      method: "PUT",
      url_path: "/v2/vendors/vendor_id",
      query_params: nil,
      expected: 1
    )
  end
end
