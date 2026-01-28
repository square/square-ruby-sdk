# frozen_string_literal: true

require_relative "wiremock_test_case"

class WebhooksSubscriptionsWireTest < WireMockTestCase
  def setup
    super

    @client = Square::Client.new(
      token: "<token>",
      base_url: WIREMOCK_BASE_URL
    )
  end

  def test_webhooks_subscriptions_list_with_wiremock
    test_id = "webhooks.subscriptions.list.0"

    result = @client.webhooks.subscriptions.list(
      cursor: "cursor",
      include_disabled: true,
      sort_order: "DESC",
      limit: 1,
      request_options: {
        additional_headers: {
          "X-Test-Id" => "webhooks.subscriptions.list.0"
        }
      }
    )

    result.pages.next_page

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

    @client.webhooks.subscriptions.create(
      idempotency_key: "63f84c6c-2200-4c99-846c-2670a1311fbf",
      subscription: {
        name: "Example Webhook Subscription",
        event_types: ["payment.created", "payment.updated"],
        notification_url: "https://example-webhook-url.com",
        api_version: "2021-12-15"
      },
      request_options: {
        additional_headers: {
          "X-Test-Id" => "webhooks.subscriptions.create.0"
        }
      }
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

    @client.webhooks.subscriptions.get(
      subscription_id: "subscription_id",
      request_options: {
        additional_headers: {
          "X-Test-Id" => "webhooks.subscriptions.get.0"
        }
      }
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

    @client.webhooks.subscriptions.update(
      subscription_id: "subscription_id",
      subscription: {
        name: "Updated Example Webhook Subscription",
        enabled: false
      },
      request_options: {
        additional_headers: {
          "X-Test-Id" => "webhooks.subscriptions.update.0"
        }
      }
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

    @client.webhooks.subscriptions.delete(
      subscription_id: "subscription_id",
      request_options: {
        additional_headers: {
          "X-Test-Id" => "webhooks.subscriptions.delete.0"
        }
      }
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

    @client.webhooks.subscriptions.update_signature_key(
      subscription_id: "subscription_id",
      idempotency_key: "ed80ae6b-0654-473b-bbab-a39aee89a60d",
      request_options: {
        additional_headers: {
          "X-Test-Id" => "webhooks.subscriptions.update_signature_key.0"
        }
      }
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

    @client.webhooks.subscriptions.test(
      subscription_id: "subscription_id",
      event_type: "payment.created",
      request_options: {
        additional_headers: {
          "X-Test-Id" => "webhooks.subscriptions.test.0"
        }
      }
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
