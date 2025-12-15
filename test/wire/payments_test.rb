# frozen_string_literal: true

require_relative "wire_helper"
require "net/http"
require "json"
require "uri"
require "square"

class PaymentsWireTest < Minitest::Test
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

  def test_payments_list_with_wiremock
    test_id = "payments.list.0"

    require "square"
    client = Square::Client.new(base_url: WIREMOCK_BASE_URL, token: "<token>")
    client.payments.list(
      begin_time: "begin_time",
      end_time: "end_time",
      sort_order: "sort_order",
      cursor: "cursor",
      location_id: "location_id",
      total: 1_000_000,
      last_4: "last_4",
      card_brand: "card_brand",
      limit: 1,
      is_offline_payment: true,
      offline_begin_time: "offline_begin_time",
      offline_end_time: "offline_end_time",
      updated_at_begin_time: "updated_at_begin_time",
      updated_at_end_time: "updated_at_end_time",
      sort_field: "CREATED_AT",
      request_options: { base_url: WIREMOCK_BASE_URL,
                         additional_headers: {
                           "X-Test-Id" => "payments.list.0"
                         } }
    )

    verify_request_count(
      test_id: test_id,
      method: "GET",
      url_path: "/v2/payments",
      query_params: nil,
      expected: 1
    )
  end

  def test_payments_create_with_wiremock
    test_id = "payments.create.0"

    require "square"
    client = Square::Client.new(base_url: WIREMOCK_BASE_URL, token: "<token>")
    client.payments.create(
      source_id: "ccof:GaJGNaZa8x4OgDJn4GB",
      idempotency_key: "7b0f3ec5-086a-4871-8f13-3c81b3875218",
      amount_money: {
        amount: 1000,
        currency: "USD"
      },
      app_fee_money: {
        amount: 10,
        currency: "USD"
      },
      autocomplete: true,
      customer_id: "W92WH6P11H4Z77CTET0RNTGFW8",
      location_id: "L88917AVBK2S5",
      reference_id: "123456",
      note: "Brief description",
      request_options: { base_url: WIREMOCK_BASE_URL,
                         additional_headers: {
                           "X-Test-Id" => "payments.create.0"
                         } }
    )

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/v2/payments",
      query_params: nil,
      expected: 1
    )
  end

  def test_payments_cancel_by_idempotency_key_with_wiremock
    test_id = "payments.cancel_by_idempotency_key.0"

    require "square"
    client = Square::Client.new(base_url: WIREMOCK_BASE_URL, token: "<token>")
    client.payments.cancel_by_idempotency_key(
      idempotency_key: "a7e36d40-d24b-11e8-b568-0800200c9a66",
      request_options: { base_url: WIREMOCK_BASE_URL,
                         additional_headers: {
                           "X-Test-Id" => "payments.cancel_by_idempotency_key.0"
                         } }
    )

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/v2/payments/cancel",
      query_params: nil,
      expected: 1
    )
  end

  def test_payments_get_with_wiremock
    test_id = "payments.get.0"

    require "square"
    client = Square::Client.new(base_url: WIREMOCK_BASE_URL, token: "<token>")
    client.payments.get(
      payment_id: "payment_id",
      request_options: { base_url: WIREMOCK_BASE_URL,
                         additional_headers: {
                           "X-Test-Id" => "payments.get.0"
                         } }
    )

    verify_request_count(
      test_id: test_id,
      method: "GET",
      url_path: "/v2/payments/payment_id",
      query_params: nil,
      expected: 1
    )
  end

  def test_payments_update_with_wiremock
    test_id = "payments.update.0"

    require "square"
    client = Square::Client.new(base_url: WIREMOCK_BASE_URL, token: "<token>")
    client.payments.update(
      payment_id: "payment_id",
      payment: {
        amount_money: {
          amount: 1000,
          currency: "USD"
        },
        tip_money: {
          amount: 100,
          currency: "USD"
        },
        version_token: "ODhwVQ35xwlzRuoZEwKXucfu7583sPTzK48c5zoGd0g6o"
      },
      idempotency_key: "956f8b13-e4ec-45d6-85e8-d1d95ef0c5de",
      request_options: { base_url: WIREMOCK_BASE_URL,
                         additional_headers: {
                           "X-Test-Id" => "payments.update.0"
                         } }
    )

    verify_request_count(
      test_id: test_id,
      method: "PUT",
      url_path: "/v2/payments/payment_id",
      query_params: nil,
      expected: 1
    )
  end

  def test_payments_cancel_with_wiremock
    test_id = "payments.cancel.0"

    require "square"
    client = Square::Client.new(base_url: WIREMOCK_BASE_URL, token: "<token>")
    client.payments.cancel(
      payment_id: "payment_id",
      request_options: { base_url: WIREMOCK_BASE_URL,
                         additional_headers: {
                           "X-Test-Id" => "payments.cancel.0"
                         } }
    )

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/v2/payments/payment_id/cancel",
      query_params: nil,
      expected: 1
    )
  end

  def test_payments_complete_with_wiremock
    test_id = "payments.complete.0"

    require "square"
    client = Square::Client.new(base_url: WIREMOCK_BASE_URL, token: "<token>")
    client.payments.complete(
      payment_id: "payment_id",
      request_options: { base_url: WIREMOCK_BASE_URL,
                         additional_headers: {
                           "X-Test-Id" => "payments.complete.0"
                         } }
    )

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/v2/payments/payment_id/complete",
      query_params: nil,
      expected: 1
    )
  end
end
