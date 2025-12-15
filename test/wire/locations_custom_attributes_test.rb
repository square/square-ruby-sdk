# frozen_string_literal: true

require_relative "wire_helper"
require "net/http"
require "json"
require "uri"
require "square"

class LocationsCustomAttributesWireTest < Minitest::Test
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

  def test_locations_custom_attributes_batch_delete_with_wiremock
    test_id = "locations.custom_attributes.batch_delete.0"

    require "square"
    client = Square::Client.new(base_url: WIREMOCK_BASE_URL, token: "<token>")
    client.locations.custom_attributes.batch_delete(
      values: {
        id1: {
          key: "bestseller"
        },
        id2: {
          key: "bestseller"
        },
        id3: {
          key: "phone-number"
        }
      },
      request_options: { base_url: WIREMOCK_BASE_URL,
                         additional_headers: {
                           "X-Test-Id" => "locations.custom_attributes.batch_delete.0"
                         } }
    )

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/v2/locations/custom-attributes/bulk-delete",
      query_params: nil,
      expected: 1
    )
  end

  def test_locations_custom_attributes_batch_upsert_with_wiremock
    test_id = "locations.custom_attributes.batch_upsert.0"

    require "square"
    client = Square::Client.new(base_url: WIREMOCK_BASE_URL, token: "<token>")
    client.locations.custom_attributes.batch_upsert(
      values: {
        id1: {
          location_id: "L0TBCBTB7P8RQ",
          custom_attribute: {
            key: "bestseller"
          }
        },
        id2: {
          location_id: "L9XMD04V3STJX",
          custom_attribute: {
            key: "bestseller"
          }
        },
        id3: {
          location_id: "L0TBCBTB7P8RQ",
          custom_attribute: {
            key: "phone-number"
          }
        }
      },
      request_options: { base_url: WIREMOCK_BASE_URL,
                         additional_headers: {
                           "X-Test-Id" => "locations.custom_attributes.batch_upsert.0"
                         } }
    )

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/v2/locations/custom-attributes/bulk-upsert",
      query_params: nil,
      expected: 1
    )
  end

  def test_locations_custom_attributes_list_with_wiremock
    test_id = "locations.custom_attributes.list.0"

    require "square"
    client = Square::Client.new(base_url: WIREMOCK_BASE_URL, token: "<token>")
    client.locations.custom_attributes.list(
      location_id: "location_id",
      visibility_filter: "ALL",
      limit: 1,
      cursor: "cursor",
      with_definitions: true,
      request_options: { base_url: WIREMOCK_BASE_URL,
                         additional_headers: {
                           "X-Test-Id" => "locations.custom_attributes.list.0"
                         } }
    )

    verify_request_count(
      test_id: test_id,
      method: "GET",
      url_path: "/v2/locations/location_id/custom-attributes",
      query_params: nil,
      expected: 1
    )
  end

  def test_locations_custom_attributes_get_with_wiremock
    test_id = "locations.custom_attributes.get.0"

    require "square"
    client = Square::Client.new(base_url: WIREMOCK_BASE_URL, token: "<token>")
    client.locations.custom_attributes.get(
      location_id: "location_id",
      key: "key",
      with_definition: true,
      version: 1,
      request_options: { base_url: WIREMOCK_BASE_URL,
                         additional_headers: {
                           "X-Test-Id" => "locations.custom_attributes.get.0"
                         } }
    )

    verify_request_count(
      test_id: test_id,
      method: "GET",
      url_path: "/v2/locations/location_id/custom-attributes/key",
      query_params: nil,
      expected: 1
    )
  end

  def test_locations_custom_attributes_upsert_with_wiremock
    test_id = "locations.custom_attributes.upsert.0"

    require "square"
    client = Square::Client.new(base_url: WIREMOCK_BASE_URL, token: "<token>")
    client.locations.custom_attributes.upsert(
      location_id: "location_id",
      key: "key",
      custom_attribute: {},
      request_options: { base_url: WIREMOCK_BASE_URL,
                         additional_headers: {
                           "X-Test-Id" => "locations.custom_attributes.upsert.0"
                         } }
    )

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/v2/locations/location_id/custom-attributes/key",
      query_params: nil,
      expected: 1
    )
  end

  def test_locations_custom_attributes_delete_with_wiremock
    test_id = "locations.custom_attributes.delete.0"

    require "square"
    client = Square::Client.new(base_url: WIREMOCK_BASE_URL, token: "<token>")
    client.locations.custom_attributes.delete(
      location_id: "location_id",
      key: "key",
      request_options: { base_url: WIREMOCK_BASE_URL,
                         additional_headers: {
                           "X-Test-Id" => "locations.custom_attributes.delete.0"
                         } }
    )

    verify_request_count(
      test_id: test_id,
      method: "DELETE",
      url_path: "/v2/locations/location_id/custom-attributes/key",
      query_params: nil,
      expected: 1
    )
  end
end
