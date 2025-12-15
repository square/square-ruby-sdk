# frozen_string_literal: true

require_relative "wire_helper"
require "net/http"
require "json"
require "uri"
require "square"

class GiftCardsActivitiesWireTest < Minitest::Test
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

  def test_gift_cards_activities_list_with_wiremock
    test_id = "gift_cards.activities.list.0"

    require "square"
    client = Square::Client.new(base_url: WIREMOCK_BASE_URL, token: "<token>")
    client.gift_cards.activities.list(
      gift_card_id: "gift_card_id",
      type: "type",
      location_id: "location_id",
      begin_time: "begin_time",
      end_time: "end_time",
      limit: 1,
      cursor: "cursor",
      sort_order: "sort_order",
      request_options: { base_url: WIREMOCK_BASE_URL,
                         additional_headers: {
                           "X-Test-Id" => "gift_cards.activities.list.0"
                         } }
    )

    verify_request_count(
      test_id: test_id,
      method: "GET",
      url_path: "/v2/gift-cards/activities",
      query_params: nil,
      expected: 1
    )
  end

  def test_gift_cards_activities_create_with_wiremock
    test_id = "gift_cards.activities.create.0"

    require "square"
    client = Square::Client.new(base_url: WIREMOCK_BASE_URL, token: "<token>")
    client.gift_cards.activities.create(
      idempotency_key: "U16kfr-kA70er-q4Rsym-7U7NnY",
      gift_card_activity: {
        type: "ACTIVATE",
        location_id: "81FN9BNFZTKS4",
        gift_card_id: "gftc:6d55a72470d940c6ba09c0ab8ad08d20",
        activate_activity_details: {
          order_id: "jJNGHm4gLI6XkFbwtiSLqK72KkAZY",
          line_item_uid: "eIWl7X0nMuO9Ewbh0ChIx"
        }
      },
      request_options: { base_url: WIREMOCK_BASE_URL,
                         additional_headers: {
                           "X-Test-Id" => "gift_cards.activities.create.0"
                         } }
    )

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/v2/gift-cards/activities",
      query_params: nil,
      expected: 1
    )
  end
end
