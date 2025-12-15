# frozen_string_literal: true

require_relative "wire_helper"
require "net/http"
require "json"
require "uri"
require "square"

class WebhooksSubscriptionsWireTest < Minitest::Test
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

  def test_webhooks_subscriptions_list_with_wiremock
    test_id = "webhooks.subscriptions.list.0"

    require "square"
    client = Square::Client.new(base_url: WIREMOCK_BASE_URL, token: "<token>")
    client.webhooks.subscriptions.list(
      cursor: "cursor",
      include_disabled: true,
      sort_order: "DESC",
      limit: 1,
      request_options: { base_url: WIREMOCK_BASE_URL,
                         additional_headers: {
                           "X-Test-Id" => "webhooks.subscriptions.list.0"
                         } }
    )

    verify_request_count(
      test_id: test_id,
      method: "GET",
      url_path: "/v2/webhooks/subscriptions",
      query_params: nil,
      expected: 1
    )
  end

  def test_webhooks_subscriptions_create_with_wiremock
    test_id = "webhooks.subscriptions.create.0"

    require "square"
    client = Square::Client.new(base_url: WIREMOCK_BASE_URL, token: "<token>")
    client.webhooks.subscriptions.create(
      idempotency_key: "63f84c6c-2200-4c99-846c-2670a1311fbf",
      subscription: {
        name: "Example Webhook Subscription",
        event_types: ["payment.created", "payment.updated"],
        notification_url: "https://example-webhook-url.com",
        api_version: "2021-12-15"
      },
      request_options: { base_url: WIREMOCK_BASE_URL,
                         additional_headers: {
                           "X-Test-Id" => "webhooks.subscriptions.create.0"
                         } }
    )

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/v2/webhooks/subscriptions",
      query_params: nil,
      expected: 1
    )
  end

  def test_webhooks_subscriptions_get_with_wiremock
    test_id = "webhooks.subscriptions.get.0"

    require "square"
    client = Square::Client.new(base_url: WIREMOCK_BASE_URL, token: "<token>")
    client.webhooks.subscriptions.get(
      subscription_id: "subscription_id",
      request_options: { base_url: WIREMOCK_BASE_URL,
                         additional_headers: {
                           "X-Test-Id" => "webhooks.subscriptions.get.0"
                         } }
    )

    verify_request_count(
      test_id: test_id,
      method: "GET",
      url_path: "/v2/webhooks/subscriptions/subscription_id",
      query_params: nil,
      expected: 1
    )
  end

  def test_webhooks_subscriptions_update_with_wiremock
    test_id = "webhooks.subscriptions.update.0"

    require "square"
    client = Square::Client.new(base_url: WIREMOCK_BASE_URL, token: "<token>")
    client.webhooks.subscriptions.update(
      subscription_id: "subscription_id",
      subscription: {
        name: "Updated Example Webhook Subscription",
        enabled: false
      },
      request_options: { base_url: WIREMOCK_BASE_URL,
                         additional_headers: {
                           "X-Test-Id" => "webhooks.subscriptions.update.0"
                         } }
    )

    verify_request_count(
      test_id: test_id,
      method: "PUT",
      url_path: "/v2/webhooks/subscriptions/subscription_id",
      query_params: nil,
      expected: 1
    )
  end

  def test_webhooks_subscriptions_delete_with_wiremock
    test_id = "webhooks.subscriptions.delete.0"

    require "square"
    client = Square::Client.new(base_url: WIREMOCK_BASE_URL, token: "<token>")
    client.webhooks.subscriptions.delete(
      subscription_id: "subscription_id",
      request_options: { base_url: WIREMOCK_BASE_URL,
                         additional_headers: {
                           "X-Test-Id" => "webhooks.subscriptions.delete.0"
                         } }
    )

    verify_request_count(
      test_id: test_id,
      method: "DELETE",
      url_path: "/v2/webhooks/subscriptions/subscription_id",
      query_params: nil,
      expected: 1
    )
  end

  def test_webhooks_subscriptions_update_signature_key_with_wiremock
    test_id = "webhooks.subscriptions.update_signature_key.0"

    require "square"
    client = Square::Client.new(base_url: WIREMOCK_BASE_URL, token: "<token>")
    client.webhooks.subscriptions.update_signature_key(
      subscription_id: "subscription_id",
      idempotency_key: "ed80ae6b-0654-473b-bbab-a39aee89a60d",
      request_options: { base_url: WIREMOCK_BASE_URL,
                         additional_headers: {
                           "X-Test-Id" => "webhooks.subscriptions.update_signature_key.0"
                         } }
    )

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/v2/webhooks/subscriptions/subscription_id/signature-key",
      query_params: nil,
      expected: 1
    )
  end

  def test_webhooks_subscriptions_test_with_wiremock
    test_id = "webhooks.subscriptions.test.0"

    require "square"
    client = Square::Client.new(base_url: WIREMOCK_BASE_URL, token: "<token>")
    client.webhooks.subscriptions.test(
      subscription_id: "subscription_id",
      event_type: "payment.created",
      request_options: { base_url: WIREMOCK_BASE_URL,
                         additional_headers: {
                           "X-Test-Id" => "webhooks.subscriptions.test.0"
                         } }
    )

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/v2/webhooks/subscriptions/subscription_id/test",
      query_params: nil,
      expected: 1
    )
  end
end
