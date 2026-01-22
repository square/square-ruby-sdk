# frozen_string_literal: true

require_relative "wire_helper"
require "net/http"
require "json"
require "uri"
require "square"

class CheckoutPaymentLinksWireTest < Minitest::Test
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

  def test_checkout_payment_links_list_with_wiremock
    test_id = "checkout.payment_links.list.0"

    require "square"
    client = Square::Client.new(base_url: WIREMOCK_BASE_URL, token: "<token>")
    client.checkout.payment_links.list(
      cursor: "cursor",
      limit: 1,
      request_options: { base_url: WIREMOCK_BASE_URL,
                         additional_headers: {
                           "X-Test-Id" => "checkout.payment_links.list.0"
                         } }
    )

    verify_request_count(
      test_id: test_id,
      method: "GET",
      url_path: "/v2/online-checkout/payment-links",
      query_params: nil,
      expected: 1
    )
  end

  def test_checkout_payment_links_create_with_wiremock
    test_id = "checkout.payment_links.create.0"

    require "square"
    client = Square::Client.new(base_url: WIREMOCK_BASE_URL, token: "<token>")
    client.checkout.payment_links.create(
      idempotency_key: "cd9e25dc-d9f2-4430-aedb-61605070e95f",
      quick_pay: {
        name: "Auto Detailing",
        price_money: {
          amount: 10_000,
          currency: "USD"
        },
        location_id: "A9Y43N9ABXZBP"
      },
      request_options: { base_url: WIREMOCK_BASE_URL,
                         additional_headers: {
                           "X-Test-Id" => "checkout.payment_links.create.0"
                         } }
    )

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/v2/online-checkout/payment-links",
      query_params: nil,
      expected: 1
    )
  end

  def test_checkout_payment_links_get_with_wiremock
    test_id = "checkout.payment_links.get.0"

    require "square"
    client = Square::Client.new(base_url: WIREMOCK_BASE_URL, token: "<token>")
    client.checkout.payment_links.get(
      id: "id",
      request_options: { base_url: WIREMOCK_BASE_URL,
                         additional_headers: {
                           "X-Test-Id" => "checkout.payment_links.get.0"
                         } }
    )

    verify_request_count(
      test_id: test_id,
      method: "GET",
      url_path: "/v2/online-checkout/payment-links/id",
      query_params: nil,
      expected: 1
    )
  end

  def test_checkout_payment_links_update_with_wiremock
    test_id = "checkout.payment_links.update.0"

    require "square"
    client = Square::Client.new(base_url: WIREMOCK_BASE_URL, token: "<token>")
    client.checkout.payment_links.update(
      id: "id",
      payment_link: {
        version: 1,
        checkout_options: {
          ask_for_shipping_address: true
        }
      },
      request_options: { base_url: WIREMOCK_BASE_URL,
                         additional_headers: {
                           "X-Test-Id" => "checkout.payment_links.update.0"
                         } }
    )

    verify_request_count(
      test_id: test_id,
      method: "PUT",
      url_path: "/v2/online-checkout/payment-links/id",
      query_params: nil,
      expected: 1
    )
  end

  def test_checkout_payment_links_delete_with_wiremock
    test_id = "checkout.payment_links.delete.0"

    require "square"
    client = Square::Client.new(base_url: WIREMOCK_BASE_URL, token: "<token>")
    client.checkout.payment_links.delete(
      id: "id",
      request_options: { base_url: WIREMOCK_BASE_URL,
                         additional_headers: {
                           "X-Test-Id" => "checkout.payment_links.delete.0"
                         } }
    )

    verify_request_count(
      test_id: test_id,
      method: "DELETE",
      url_path: "/v2/online-checkout/payment-links/id",
      query_params: nil,
      expected: 1
    )
  end
end
