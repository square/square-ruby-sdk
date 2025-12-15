# frozen_string_literal: true

require_relative "wire_helper"
require "net/http"
require "json"
require "uri"
require "square"

class LocationsWireTest < Minitest::Test
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

  def test_locations_list_with_wiremock
    test_id = "locations.list.0"

    require "square"
    client = Square::Client.new(base_url: WIREMOCK_BASE_URL, token: "<token>")
    client.locations.list(request_options: { base_url: WIREMOCK_BASE_URL,
                                             additional_headers: {
                                               "X-Test-Id" => "locations.list.0"
                                             } })

    verify_request_count(
      test_id: test_id,
      method: "GET",
      url_path: "/v2/locations",
      query_params: nil,
      expected: 1
    )
  end

  def test_locations_create_with_wiremock
    test_id = "locations.create.0"

    require "square"
    client = Square::Client.new(base_url: WIREMOCK_BASE_URL, token: "<token>")
    client.locations.create(
      location: {
        name: "Midtown",
        address: {
          address_line_1: "1234 Peachtree St. NE",
          locality: "Atlanta",
          administrative_district_level_1: "GA",
          postal_code: "30309"
        },
        description: "Midtown Atlanta store"
      },
      request_options: { base_url: WIREMOCK_BASE_URL,
                         additional_headers: {
                           "X-Test-Id" => "locations.create.0"
                         } }
    )

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/v2/locations",
      query_params: nil,
      expected: 1
    )
  end

  def test_locations_get_with_wiremock
    test_id = "locations.get.0"

    require "square"
    client = Square::Client.new(base_url: WIREMOCK_BASE_URL, token: "<token>")
    client.locations.get(
      location_id: "location_id",
      request_options: { base_url: WIREMOCK_BASE_URL,
                         additional_headers: {
                           "X-Test-Id" => "locations.get.0"
                         } }
    )

    verify_request_count(
      test_id: test_id,
      method: "GET",
      url_path: "/v2/locations/location_id",
      query_params: nil,
      expected: 1
    )
  end

  def test_locations_update_with_wiremock
    test_id = "locations.update.0"

    require "square"
    client = Square::Client.new(base_url: WIREMOCK_BASE_URL, token: "<token>")
    client.locations.update(
      location_id: "location_id",
      location: {
        business_hours: {
          periods: [{
            day_of_week: "FRI",
            start_local_time: "07:00",
            end_local_time: "18:00"
          }, {
            day_of_week: "SAT",
            start_local_time: "07:00",
            end_local_time: "18:00"
          }, {
            day_of_week: "SUN",
            start_local_time: "09:00",
            end_local_time: "15:00"
          }]
        },
        description: "Midtown Atlanta store - Open weekends"
      },
      request_options: { base_url: WIREMOCK_BASE_URL,
                         additional_headers: {
                           "X-Test-Id" => "locations.update.0"
                         } }
    )

    verify_request_count(
      test_id: test_id,
      method: "PUT",
      url_path: "/v2/locations/location_id",
      query_params: nil,
      expected: 1
    )
  end

  def test_locations_checkouts_with_wiremock
    test_id = "locations.checkouts.0"

    require "square"
    client = Square::Client.new(base_url: WIREMOCK_BASE_URL, token: "<token>")
    client.locations.checkouts(
      location_id: "location_id",
      idempotency_key: "86ae1696-b1e3-4328-af6d-f1e04d947ad6",
      order: {
        order: {
          location_id: "location_id",
          reference_id: "reference_id",
          customer_id: "customer_id",
          line_items: [{
            name: "Printed T Shirt",
            quantity: "2",
            applied_taxes: [{
              tax_uid: "38ze1696-z1e3-5628-af6d-f1e04d947fg3"
            }],
            applied_discounts: [{
              discount_uid: "56ae1696-z1e3-9328-af6d-f1e04d947gd4"
            }],
            base_price_money: {
              amount: 1500,
              currency: "USD"
            }
          }, {
            name: "Slim Jeans",
            quantity: "1",
            base_price_money: {
              amount: 2500,
              currency: "USD"
            }
          }, {
            name: "Woven Sweater",
            quantity: "3",
            base_price_money: {
              amount: 3500,
              currency: "USD"
            }
          }],
          taxes: [{
            uid: "38ze1696-z1e3-5628-af6d-f1e04d947fg3",
            type: "INCLUSIVE",
            percentage: "7.75",
            scope: "LINE_ITEM"
          }],
          discounts: [{
            uid: "56ae1696-z1e3-9328-af6d-f1e04d947gd4",
            type: "FIXED_AMOUNT",
            amount_money: {
              amount: 100,
              currency: "USD"
            },
            scope: "LINE_ITEM"
          }]
        },
        idempotency_key: "12ae1696-z1e3-4328-af6d-f1e04d947gd4"
      },
      ask_for_shipping_address: true,
      merchant_support_email: "merchant+support@website.com",
      pre_populate_buyer_email: "example@email.com",
      pre_populate_shipping_address: {
        address_line_1: "1455 Market St.",
        address_line_2: "Suite 600",
        locality: "San Francisco",
        administrative_district_level_1: "CA",
        postal_code: "94103",
        country: "US",
        first_name: "Jane",
        last_name: "Doe"
      },
      redirect_url: "https://merchant.website.com/order-confirm",
      additional_recipients: [{
        location_id: "057P5VYJ4A5X1",
        description: "Application fees",
        amount_money: {
          amount: 60,
          currency: "USD"
        }
      }],
      request_options: { base_url: WIREMOCK_BASE_URL,
                         additional_headers: {
                           "X-Test-Id" => "locations.checkouts.0"
                         } }
    )

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/v2/locations/location_id/checkouts",
      query_params: nil,
      expected: 1
    )
  end
end
