# frozen_string_literal: true

require_relative "wire_helper"
require "net/http"
require "json"
require "uri"
require "square"

class OrdersWireTest < Minitest::Test
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

  def test_orders_create_with_wiremock
    test_id = "orders.create.0"

    require "square"
    client = Square::Client.new(base_url: WIREMOCK_BASE_URL, token: "<token>")
    client.orders.create(
      order: {
        location_id: "057P5VYJ4A5X1",
        reference_id: "my-order-001",
        line_items: [{
          name: "New York Strip Steak",
          quantity: "1",
          base_price_money: {
            amount: 1599,
            currency: "USD"
          }
        }, {
          quantity: "2",
          catalog_object_id: "BEMYCSMIJL46OCDV4KYIKXIB",
          modifiers: [{
            catalog_object_id: "CHQX7Y4KY6N5KINJKZCFURPZ"
          }],
          applied_discounts: [{
            discount_uid: "one-dollar-off"
          }]
        }],
        taxes: [{
          uid: "state-sales-tax",
          name: "State Sales Tax",
          percentage: "9",
          scope: "ORDER"
        }],
        discounts: [{
          uid: "labor-day-sale",
          name: "Labor Day Sale",
          percentage: "5",
          scope: "ORDER"
        }, {
          uid: "membership-discount",
          catalog_object_id: "DB7L55ZH2BGWI4H23ULIWOQ7",
          scope: "ORDER"
        }, {
          uid: "one-dollar-off",
          name: "Sale - $1.00 off",
          amount_money: {
            amount: 100,
            currency: "USD"
          },
          scope: "LINE_ITEM"
        }]
      },
      idempotency_key: "8193148c-9586-11e6-99f9-28cfe92138cf",
      request_options: { base_url: WIREMOCK_BASE_URL,
                         additional_headers: {
                           "X-Test-Id" => "orders.create.0"
                         } }
    )

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/v2/orders",
      query_params: nil,
      expected: 1
    )
  end

  def test_orders_batch_get_with_wiremock
    test_id = "orders.batch_get.0"

    require "square"
    client = Square::Client.new(base_url: WIREMOCK_BASE_URL, token: "<token>")
    client.orders.batch_get(
      location_id: "057P5VYJ4A5X1",
      order_ids: %w[CAISEM82RcpmcFBM0TfOyiHV3es CAISENgvlJ6jLWAzERDzjyHVybY],
      request_options: { base_url: WIREMOCK_BASE_URL,
                         additional_headers: {
                           "X-Test-Id" => "orders.batch_get.0"
                         } }
    )

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/v2/orders/batch-retrieve",
      query_params: nil,
      expected: 1
    )
  end

  def test_orders_calculate_with_wiremock
    test_id = "orders.calculate.0"

    require "square"
    client = Square::Client.new(base_url: WIREMOCK_BASE_URL, token: "<token>")
    client.orders.calculate(
      order: {
        location_id: "D7AVYMEAPJ3A3",
        line_items: [{
          name: "Item 1",
          quantity: "1",
          base_price_money: {
            amount: 500,
            currency: "USD"
          }
        }, {
          name: "Item 2",
          quantity: "2",
          base_price_money: {
            amount: 300,
            currency: "USD"
          }
        }],
        discounts: [{
          name: "50% Off",
          percentage: "50",
          scope: "ORDER"
        }]
      },
      request_options: { base_url: WIREMOCK_BASE_URL,
                         additional_headers: {
                           "X-Test-Id" => "orders.calculate.0"
                         } }
    )

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/v2/orders/calculate",
      query_params: nil,
      expected: 1
    )
  end

  def test_orders_clone_with_wiremock
    test_id = "orders.clone.0"

    require "square"
    client = Square::Client.new(base_url: WIREMOCK_BASE_URL, token: "<token>")
    client.orders.clone(
      order_id: "ZAISEM52YcpmcWAzERDOyiWS123",
      version: 3,
      idempotency_key: "UNIQUE_STRING",
      request_options: { base_url: WIREMOCK_BASE_URL,
                         additional_headers: {
                           "X-Test-Id" => "orders.clone.0"
                         } }
    )

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/v2/orders/clone",
      query_params: nil,
      expected: 1
    )
  end

  def test_orders_search_with_wiremock
    test_id = "orders.search.0"

    require "square"
    client = Square::Client.new(base_url: WIREMOCK_BASE_URL, token: "<token>")
    client.orders.search(
      location_ids: %w[057P5VYJ4A5X1 18YC4JDH91E1H],
      query: {
        filter: {
          state_filter: {
            states: ["COMPLETED"]
          },
          date_time_filter: {
            closed_at: {
              start_at: "2018-03-03T20:00:00+00:00",
              end_at: "2019-03-04T21:54:45+00:00"
            }
          }
        },
        sort: {
          sort_field: "CLOSED_AT",
          sort_order: "DESC"
        }
      },
      limit: 3,
      return_entries: true,
      request_options: { base_url: WIREMOCK_BASE_URL,
                         additional_headers: {
                           "X-Test-Id" => "orders.search.0"
                         } }
    )

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/v2/orders/search",
      query_params: nil,
      expected: 1
    )
  end

  def test_orders_get_with_wiremock
    test_id = "orders.get.0"

    require "square"
    client = Square::Client.new(base_url: WIREMOCK_BASE_URL, token: "<token>")
    client.orders.get(
      order_id: "order_id",
      request_options: { base_url: WIREMOCK_BASE_URL,
                         additional_headers: {
                           "X-Test-Id" => "orders.get.0"
                         } }
    )

    verify_request_count(
      test_id: test_id,
      method: "GET",
      url_path: "/v2/orders/order_id",
      query_params: nil,
      expected: 1
    )
  end

  def test_orders_update_with_wiremock
    test_id = "orders.update.0"

    require "square"
    client = Square::Client.new(base_url: WIREMOCK_BASE_URL, token: "<token>")
    client.orders.update(
      order_id: "order_id",
      order: {
        location_id: "location_id",
        line_items: [{
          uid: "cookie_uid",
          name: "COOKIE",
          quantity: "2",
          base_price_money: {
            amount: 200,
            currency: "USD"
          }
        }],
        version: 1
      },
      fields_to_clear: ["discounts"],
      idempotency_key: "UNIQUE_STRING",
      request_options: { base_url: WIREMOCK_BASE_URL,
                         additional_headers: {
                           "X-Test-Id" => "orders.update.0"
                         } }
    )

    verify_request_count(
      test_id: test_id,
      method: "PUT",
      url_path: "/v2/orders/order_id",
      query_params: nil,
      expected: 1
    )
  end

  def test_orders_pay_with_wiremock
    test_id = "orders.pay.0"

    require "square"
    client = Square::Client.new(base_url: WIREMOCK_BASE_URL, token: "<token>")
    client.orders.pay(
      order_id: "order_id",
      idempotency_key: "c043a359-7ad9-4136-82a9-c3f1d66dcbff",
      payment_ids: %w[EnZdNAlWCmfh6Mt5FMNST1o7taB 0LRiVlbXVwe8ozu4KbZxd12mvaB],
      request_options: { base_url: WIREMOCK_BASE_URL,
                         additional_headers: {
                           "X-Test-Id" => "orders.pay.0"
                         } }
    )

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/v2/orders/order_id/pay",
      query_params: nil,
      expected: 1
    )
  end
end
