# frozen_string_literal: true

require_relative "wire_helper"
require "net/http"
require "json"
require "uri"
require "square"

class GiftCardsWireTest < Minitest::Test
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

  def test_gift_cards_list_with_wiremock
    test_id = "gift_cards.list.0"

    require "square"
    client = Square::Client.new(base_url: WIREMOCK_BASE_URL, token: "<token>")
    client.gift_cards.list(
      type: "type",
      state: "state",
      limit: 1,
      cursor: "cursor",
      customer_id: "customer_id",
      request_options: { base_url: WIREMOCK_BASE_URL,
                         additional_headers: {
                           "X-Test-Id" => "gift_cards.list.0"
                         } }
    )

    verify_request_count(
      test_id: test_id,
      method: "GET",
      url_path: "/v2/gift-cards",
      query_params: nil,
      expected: 1
    )
  end

  def test_gift_cards_create_with_wiremock
    test_id = "gift_cards.create.0"

    require "square"
    client = Square::Client.new(base_url: WIREMOCK_BASE_URL, token: "<token>")
    client.gift_cards.create(
      idempotency_key: "NC9Tm69EjbjtConu",
      location_id: "81FN9BNFZTKS4",
      gift_card: {
        type: "DIGITAL"
      },
      request_options: { base_url: WIREMOCK_BASE_URL,
                         additional_headers: {
                           "X-Test-Id" => "gift_cards.create.0"
                         } }
    )

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/v2/gift-cards",
      query_params: nil,
      expected: 1
    )
  end

  def test_gift_cards_get_from_gan_with_wiremock
    test_id = "gift_cards.get_from_gan.0"

    require "square"
    client = Square::Client.new(base_url: WIREMOCK_BASE_URL, token: "<token>")
    client.gift_cards.get_from_gan(
      gan: "7783320001001635",
      request_options: { base_url: WIREMOCK_BASE_URL,
                         additional_headers: {
                           "X-Test-Id" => "gift_cards.get_from_gan.0"
                         } }
    )

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/v2/gift-cards/from-gan",
      query_params: nil,
      expected: 1
    )
  end

  def test_gift_cards_get_from_nonce_with_wiremock
    test_id = "gift_cards.get_from_nonce.0"

    require "square"
    client = Square::Client.new(base_url: WIREMOCK_BASE_URL, token: "<token>")
    client.gift_cards.get_from_nonce(
      nonce: "cnon:7783322135245171",
      request_options: { base_url: WIREMOCK_BASE_URL,
                         additional_headers: {
                           "X-Test-Id" => "gift_cards.get_from_nonce.0"
                         } }
    )

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/v2/gift-cards/from-nonce",
      query_params: nil,
      expected: 1
    )
  end

  def test_gift_cards_link_customer_with_wiremock
    test_id = "gift_cards.link_customer.0"

    require "square"
    client = Square::Client.new(base_url: WIREMOCK_BASE_URL, token: "<token>")
    client.gift_cards.link_customer(
      gift_card_id: "gift_card_id",
      customer_id: "GKY0FZ3V717AH8Q2D821PNT2ZW",
      request_options: { base_url: WIREMOCK_BASE_URL,
                         additional_headers: {
                           "X-Test-Id" => "gift_cards.link_customer.0"
                         } }
    )

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/v2/gift-cards/gift_card_id/link-customer",
      query_params: nil,
      expected: 1
    )
  end

  def test_gift_cards_unlink_customer_with_wiremock
    test_id = "gift_cards.unlink_customer.0"

    require "square"
    client = Square::Client.new(base_url: WIREMOCK_BASE_URL, token: "<token>")
    client.gift_cards.unlink_customer(
      gift_card_id: "gift_card_id",
      customer_id: "GKY0FZ3V717AH8Q2D821PNT2ZW",
      request_options: { base_url: WIREMOCK_BASE_URL,
                         additional_headers: {
                           "X-Test-Id" => "gift_cards.unlink_customer.0"
                         } }
    )

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/v2/gift-cards/gift_card_id/unlink-customer",
      query_params: nil,
      expected: 1
    )
  end

  def test_gift_cards_get_with_wiremock
    test_id = "gift_cards.get.0"

    require "square"
    client = Square::Client.new(base_url: WIREMOCK_BASE_URL, token: "<token>")
    client.gift_cards.get(
      id: "id",
      request_options: { base_url: WIREMOCK_BASE_URL,
                         additional_headers: {
                           "X-Test-Id" => "gift_cards.get.0"
                         } }
    )

    verify_request_count(
      test_id: test_id,
      method: "GET",
      url_path: "/v2/gift-cards/id",
      query_params: nil,
      expected: 1
    )
  end
end
