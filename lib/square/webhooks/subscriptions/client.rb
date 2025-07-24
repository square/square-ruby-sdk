# frozen_string_literal: true
require_relative "../../../requests"
require_relative "../../types/sort_order"
require_relative "../../types/list_webhook_subscriptions_response"
require_relative "../../types/webhook_subscription"
require_relative "../../types/create_webhook_subscription_response"
require_relative "../../types/get_webhook_subscription_response"
require_relative "../../types/update_webhook_subscription_response"
require_relative "../../types/delete_webhook_subscription_response"
require_relative "../../types/update_webhook_subscription_signature_key_response"
require_relative "../../types/test_webhook_subscription_response"
require "async"
require "async"
require "async"
require "async"
require "async"
require "async"
require "async"
require_relative "../../../requests"

module square.rb
  module Webhooks
    class SubscriptionsClient
    # @return [square.rb::RequestClient] 
      attr_reader :request_client


      # @param request_client [square.rb::RequestClient] 
      # @return [square.rb::Webhooks::SubscriptionsClient]
      def initialize(request_client:)
        @request_client = request_client
      end
# Lists all webhook subscriptions owned by your application.
      #
      # @param cursor [String] A pagination cursor returned by a previous call to this endpoint.
#  Provide this to retrieve the next set of results for your original query.
#  For more information, see
#  ttps://developer.squareup.com/docs/build-basics/common-api-patterns/pagination).
      # @param include_disabled [Boolean] Includes disabled [Subscription](entity:WebhookSubscription)s.
#  By default, all enabled [Subscription](entity:WebhookSubscription)s are
#  returned.
      # @param sort_order [square.rb::SortOrder] Sorts the returned list by when the [Subscription](entity:WebhookSubscription)
#  was created with the specified order.
#  This field defaults to ASC.
      # @param limit [Integer] The maximum number of results to be returned in a single page.
#  It is possible to receive fewer results than the specified limit on a given
#  page.
#  The default value of 100 is also the maximum allowed value.
#  Default: 100
      # @param request_options [square.rb::RequestOptions] 
      # @return [square.rb::ListWebhookSubscriptionsResponse]
      # @example
#  api = square.rb::Client.new(
#    base_url: "https://api.example.com",
#    environment: square.rb::Environment::PRODUCTION,
#    token: "YOUR_AUTH_TOKEN",
#    version: "Version"
#  )
#  api.webhooks.subscriptions.list
      def list(cursor: nil, include_disabled: nil, sort_order: nil, limit: nil, request_options: nil)
        response = @request_client.conn.get do | req |
  unless request_options&.timeout_in_seconds.nil?
    req.options.timeout = request_options.timeout_in_seconds
  end
  unless request_options&.token.nil?
    req.headers["Authorization"] = request_options.token
  end
  unless request_options&.version.nil?
    req.headers["Square-Version"] = request_options.version
  end
  req.headers = { **(req.headers || {}), **@request_client.get_headers, **(request_options&.additional_headers || {}) }.compact
  req.params = { **(request_options&.additional_query_parameters || {}), "cursor": cursor, "include_disabled": include_disabled, "sort_order": sort_order, "limit": limit }.compact
  unless request_options.nil? || request_options&.additional_body_parameters.nil?
    req.body = { **(request_options&.additional_body_parameters || {}) }.compact
  end
  req.url "#{@request_client.get_url(request_options: request_options)}/v2/webhooks/subscriptions"
end
        square.rb::ListWebhookSubscriptionsResponse.from_json(json_object: response.body)
      end
# Creates a webhook subscription.
      #
      # @param idempotency_key [String] A unique string that identifies the
#  ebhookSubscription](api-endpoint:WebhookSubscriptions-CreateWebhookSubscription)
#  request.
      # @param subscription [Hash] The [Subscription](entity:WebhookSubscription) to create.Request of type square.rb::WebhookSubscription, as a Hash
      #   * :id (String) 
      #   * :name (String) 
      #   * :enabled (Boolean) 
      #   * :event_types (Array<String>) 
      #   * :notification_url (String) 
      #   * :api_version (String) 
      #   * :signature_key (String) 
      #   * :created_at (String) 
      #   * :updated_at (String) 
      # @param request_options [square.rb::RequestOptions] 
      # @return [square.rb::CreateWebhookSubscriptionResponse]
      # @example
#  api = square.rb::Client.new(
#    base_url: "https://api.example.com",
#    environment: square.rb::Environment::PRODUCTION,
#    token: "YOUR_AUTH_TOKEN",
#    version: "Version"
#  )
#  api.webhooks.subscriptions.create(idempotency_key: "63f84c6c-2200-4c99-846c-2670a1311fbf", subscription: { name: "Example Webhook Subscription", event_types: ["payment.created", "payment.updated"], notification_url: "https://example-webhook-url.com", api_version: "2021-12-15" })
      def create(idempotency_key: nil, subscription:, request_options: nil)
        response = @request_client.conn.post do | req |
  unless request_options&.timeout_in_seconds.nil?
    req.options.timeout = request_options.timeout_in_seconds
  end
  unless request_options&.token.nil?
    req.headers["Authorization"] = request_options.token
  end
  unless request_options&.version.nil?
    req.headers["Square-Version"] = request_options.version
  end
  req.headers = { **(req.headers || {}), **@request_client.get_headers, **(request_options&.additional_headers || {}) }.compact
  unless request_options.nil? || request_options&.additional_query_parameters.nil?
    req.params = { **(request_options&.additional_query_parameters || {}) }.compact
  end
  req.body = { **(request_options&.additional_body_parameters || {}), idempotency_key: idempotency_key, subscription: subscription }.compact
  req.url "#{@request_client.get_url(request_options: request_options)}/v2/webhooks/subscriptions"
end
        square.rb::CreateWebhookSubscriptionResponse.from_json(json_object: response.body)
      end
# Retrieves a webhook subscription identified by its ID.
      #
      # @param subscription_id [String] [REQUIRED] The ID of the [Subscription](entity:WebhookSubscription) to retrieve.
      # @param request_options [square.rb::RequestOptions] 
      # @return [square.rb::GetWebhookSubscriptionResponse]
      # @example
#  api = square.rb::Client.new(
#    base_url: "https://api.example.com",
#    environment: square.rb::Environment::PRODUCTION,
#    token: "YOUR_AUTH_TOKEN",
#    version: "Version"
#  )
#  api.webhooks.subscriptions.get(subscription_id: "subscription_id")
      def get(subscription_id:, request_options: nil)
        response = @request_client.conn.get do | req |
  unless request_options&.timeout_in_seconds.nil?
    req.options.timeout = request_options.timeout_in_seconds
  end
  unless request_options&.token.nil?
    req.headers["Authorization"] = request_options.token
  end
  unless request_options&.version.nil?
    req.headers["Square-Version"] = request_options.version
  end
  req.headers = { **(req.headers || {}), **@request_client.get_headers, **(request_options&.additional_headers || {}) }.compact
  unless request_options.nil? || request_options&.additional_query_parameters.nil?
    req.params = { **(request_options&.additional_query_parameters || {}) }.compact
  end
  unless request_options.nil? || request_options&.additional_body_parameters.nil?
    req.body = { **(request_options&.additional_body_parameters || {}) }.compact
  end
  req.url "#{@request_client.get_url(request_options: request_options)}/v2/webhooks/subscriptions/#{subscription_id}"
end
        square.rb::GetWebhookSubscriptionResponse.from_json(json_object: response.body)
      end
# Updates a webhook subscription.
      #
      # @param subscription_id [String] [REQUIRED] The ID of the [Subscription](entity:WebhookSubscription) to update.
      # @param subscription [Hash] The [Subscription](entity:WebhookSubscription) to update.Request of type square.rb::WebhookSubscription, as a Hash
      #   * :id (String) 
      #   * :name (String) 
      #   * :enabled (Boolean) 
      #   * :event_types (Array<String>) 
      #   * :notification_url (String) 
      #   * :api_version (String) 
      #   * :signature_key (String) 
      #   * :created_at (String) 
      #   * :updated_at (String) 
      # @param request_options [square.rb::RequestOptions] 
      # @return [square.rb::UpdateWebhookSubscriptionResponse]
      # @example
#  api = square.rb::Client.new(
#    base_url: "https://api.example.com",
#    environment: square.rb::Environment::PRODUCTION,
#    token: "YOUR_AUTH_TOKEN",
#    version: "Version"
#  )
#  api.webhooks.subscriptions.update(subscription_id: "subscription_id", subscription: { name: "Updated Example Webhook Subscription", enabled: false })
      def update(subscription_id:, subscription: nil, request_options: nil)
        response = @request_client.conn.put do | req |
  unless request_options&.timeout_in_seconds.nil?
    req.options.timeout = request_options.timeout_in_seconds
  end
  unless request_options&.token.nil?
    req.headers["Authorization"] = request_options.token
  end
  unless request_options&.version.nil?
    req.headers["Square-Version"] = request_options.version
  end
  req.headers = { **(req.headers || {}), **@request_client.get_headers, **(request_options&.additional_headers || {}) }.compact
  unless request_options.nil? || request_options&.additional_query_parameters.nil?
    req.params = { **(request_options&.additional_query_parameters || {}) }.compact
  end
  req.body = { **(request_options&.additional_body_parameters || {}), subscription: subscription }.compact
  req.url "#{@request_client.get_url(request_options: request_options)}/v2/webhooks/subscriptions/#{subscription_id}"
end
        square.rb::UpdateWebhookSubscriptionResponse.from_json(json_object: response.body)
      end
# Deletes a webhook subscription.
      #
      # @param subscription_id [String] [REQUIRED] The ID of the [Subscription](entity:WebhookSubscription) to delete.
      # @param request_options [square.rb::RequestOptions] 
      # @return [square.rb::DeleteWebhookSubscriptionResponse]
      # @example
#  api = square.rb::Client.new(
#    base_url: "https://api.example.com",
#    environment: square.rb::Environment::PRODUCTION,
#    token: "YOUR_AUTH_TOKEN",
#    version: "Version"
#  )
#  api.webhooks.subscriptions.delete(subscription_id: "subscription_id")
      def delete(subscription_id:, request_options: nil)
        response = @request_client.conn.delete do | req |
  unless request_options&.timeout_in_seconds.nil?
    req.options.timeout = request_options.timeout_in_seconds
  end
  unless request_options&.token.nil?
    req.headers["Authorization"] = request_options.token
  end
  unless request_options&.version.nil?
    req.headers["Square-Version"] = request_options.version
  end
  req.headers = { **(req.headers || {}), **@request_client.get_headers, **(request_options&.additional_headers || {}) }.compact
  unless request_options.nil? || request_options&.additional_query_parameters.nil?
    req.params = { **(request_options&.additional_query_parameters || {}) }.compact
  end
  unless request_options.nil? || request_options&.additional_body_parameters.nil?
    req.body = { **(request_options&.additional_body_parameters || {}) }.compact
  end
  req.url "#{@request_client.get_url(request_options: request_options)}/v2/webhooks/subscriptions/#{subscription_id}"
end
        square.rb::DeleteWebhookSubscriptionResponse.from_json(json_object: response.body)
      end
# Updates a webhook subscription by replacing the existing signature key with a
#  new one.
      #
      # @param subscription_id [String] [REQUIRED] The ID of the [Subscription](entity:WebhookSubscription) to update.
      # @param idempotency_key [String] A unique string that identifies the
#  ureKey](api-endpoint:WebhookSubscriptions-UpdateWebhookSubscriptionSignatureKey)
#  request.
      # @param request_options [square.rb::RequestOptions] 
      # @return [square.rb::UpdateWebhookSubscriptionSignatureKeyResponse]
      # @example
#  api = square.rb::Client.new(
#    base_url: "https://api.example.com",
#    environment: square.rb::Environment::PRODUCTION,
#    token: "YOUR_AUTH_TOKEN",
#    version: "Version"
#  )
#  api.webhooks.subscriptions.update_signature_key(subscription_id: "subscription_id", idempotency_key: "ed80ae6b-0654-473b-bbab-a39aee89a60d")
      def update_signature_key(subscription_id:, idempotency_key: nil, request_options: nil)
        response = @request_client.conn.post do | req |
  unless request_options&.timeout_in_seconds.nil?
    req.options.timeout = request_options.timeout_in_seconds
  end
  unless request_options&.token.nil?
    req.headers["Authorization"] = request_options.token
  end
  unless request_options&.version.nil?
    req.headers["Square-Version"] = request_options.version
  end
  req.headers = { **(req.headers || {}), **@request_client.get_headers, **(request_options&.additional_headers || {}) }.compact
  unless request_options.nil? || request_options&.additional_query_parameters.nil?
    req.params = { **(request_options&.additional_query_parameters || {}) }.compact
  end
  req.body = { **(request_options&.additional_body_parameters || {}), idempotency_key: idempotency_key }.compact
  req.url "#{@request_client.get_url(request_options: request_options)}/v2/webhooks/subscriptions/#{subscription_id}/signature-key"
end
        square.rb::UpdateWebhookSubscriptionSignatureKeyResponse.from_json(json_object: response.body)
      end
# Tests a webhook subscription by sending a test event to the notification URL.
      #
      # @param subscription_id [String] [REQUIRED] The ID of the [Subscription](entity:WebhookSubscription) to test.
      # @param event_type [String] The event type that will be used to test the
#  [Subscription](entity:WebhookSubscription). The event type must be
#  contained in the list of event types in the
#  [Subscription](entity:WebhookSubscription).
      # @param request_options [square.rb::RequestOptions] 
      # @return [square.rb::TestWebhookSubscriptionResponse]
      # @example
#  api = square.rb::Client.new(
#    base_url: "https://api.example.com",
#    environment: square.rb::Environment::PRODUCTION,
#    token: "YOUR_AUTH_TOKEN",
#    version: "Version"
#  )
#  api.webhooks.subscriptions.test(subscription_id: "subscription_id", event_type: "payment.created")
      def test(subscription_id:, event_type: nil, request_options: nil)
        response = @request_client.conn.post do | req |
  unless request_options&.timeout_in_seconds.nil?
    req.options.timeout = request_options.timeout_in_seconds
  end
  unless request_options&.token.nil?
    req.headers["Authorization"] = request_options.token
  end
  unless request_options&.version.nil?
    req.headers["Square-Version"] = request_options.version
  end
  req.headers = { **(req.headers || {}), **@request_client.get_headers, **(request_options&.additional_headers || {}) }.compact
  unless request_options.nil? || request_options&.additional_query_parameters.nil?
    req.params = { **(request_options&.additional_query_parameters || {}) }.compact
  end
  req.body = { **(request_options&.additional_body_parameters || {}), event_type: event_type }.compact
  req.url "#{@request_client.get_url(request_options: request_options)}/v2/webhooks/subscriptions/#{subscription_id}/test"
end
        square.rb::TestWebhookSubscriptionResponse.from_json(json_object: response.body)
      end
    end
    class AsyncSubscriptionsClient
    # @return [square.rb::AsyncRequestClient] 
      attr_reader :request_client


      # @param request_client [square.rb::RequestClient] 
      # @return [square.rb::Webhooks::AsyncSubscriptionsClient]
      def initialize(request_client:)
        @request_client = request_client
      end
# Lists all webhook subscriptions owned by your application.
      #
      # @param cursor [String] A pagination cursor returned by a previous call to this endpoint.
#  Provide this to retrieve the next set of results for your original query.
#  For more information, see
#  ttps://developer.squareup.com/docs/build-basics/common-api-patterns/pagination).
      # @param include_disabled [Boolean] Includes disabled [Subscription](entity:WebhookSubscription)s.
#  By default, all enabled [Subscription](entity:WebhookSubscription)s are
#  returned.
      # @param sort_order [square.rb::SortOrder] Sorts the returned list by when the [Subscription](entity:WebhookSubscription)
#  was created with the specified order.
#  This field defaults to ASC.
      # @param limit [Integer] The maximum number of results to be returned in a single page.
#  It is possible to receive fewer results than the specified limit on a given
#  page.
#  The default value of 100 is also the maximum allowed value.
#  Default: 100
      # @param request_options [square.rb::RequestOptions] 
      # @return [square.rb::ListWebhookSubscriptionsResponse]
      # @example
#  api = square.rb::Client.new(
#    base_url: "https://api.example.com",
#    environment: square.rb::Environment::PRODUCTION,
#    token: "YOUR_AUTH_TOKEN",
#    version: "Version"
#  )
#  api.webhooks.subscriptions.list
      def list(cursor: nil, include_disabled: nil, sort_order: nil, limit: nil, request_options: nil)
        Async do
          response = @request_client.conn.get do | req |
  unless request_options&.timeout_in_seconds.nil?
    req.options.timeout = request_options.timeout_in_seconds
  end
  unless request_options&.token.nil?
    req.headers["Authorization"] = request_options.token
  end
  unless request_options&.version.nil?
    req.headers["Square-Version"] = request_options.version
  end
  req.headers = { **(req.headers || {}), **@request_client.get_headers, **(request_options&.additional_headers || {}) }.compact
  req.params = { **(request_options&.additional_query_parameters || {}), "cursor": cursor, "include_disabled": include_disabled, "sort_order": sort_order, "limit": limit }.compact
  unless request_options.nil? || request_options&.additional_body_parameters.nil?
    req.body = { **(request_options&.additional_body_parameters || {}) }.compact
  end
  req.url "#{@request_client.get_url(request_options: request_options)}/v2/webhooks/subscriptions"
end
          square.rb::ListWebhookSubscriptionsResponse.from_json(json_object: response.body)
        end
      end
# Creates a webhook subscription.
      #
      # @param idempotency_key [String] A unique string that identifies the
#  ebhookSubscription](api-endpoint:WebhookSubscriptions-CreateWebhookSubscription)
#  request.
      # @param subscription [Hash] The [Subscription](entity:WebhookSubscription) to create.Request of type square.rb::WebhookSubscription, as a Hash
      #   * :id (String) 
      #   * :name (String) 
      #   * :enabled (Boolean) 
      #   * :event_types (Array<String>) 
      #   * :notification_url (String) 
      #   * :api_version (String) 
      #   * :signature_key (String) 
      #   * :created_at (String) 
      #   * :updated_at (String) 
      # @param request_options [square.rb::RequestOptions] 
      # @return [square.rb::CreateWebhookSubscriptionResponse]
      # @example
#  api = square.rb::Client.new(
#    base_url: "https://api.example.com",
#    environment: square.rb::Environment::PRODUCTION,
#    token: "YOUR_AUTH_TOKEN",
#    version: "Version"
#  )
#  api.webhooks.subscriptions.create(idempotency_key: "63f84c6c-2200-4c99-846c-2670a1311fbf", subscription: { name: "Example Webhook Subscription", event_types: ["payment.created", "payment.updated"], notification_url: "https://example-webhook-url.com", api_version: "2021-12-15" })
      def create(idempotency_key: nil, subscription:, request_options: nil)
        Async do
          response = @request_client.conn.post do | req |
  unless request_options&.timeout_in_seconds.nil?
    req.options.timeout = request_options.timeout_in_seconds
  end
  unless request_options&.token.nil?
    req.headers["Authorization"] = request_options.token
  end
  unless request_options&.version.nil?
    req.headers["Square-Version"] = request_options.version
  end
  req.headers = { **(req.headers || {}), **@request_client.get_headers, **(request_options&.additional_headers || {}) }.compact
  unless request_options.nil? || request_options&.additional_query_parameters.nil?
    req.params = { **(request_options&.additional_query_parameters || {}) }.compact
  end
  req.body = { **(request_options&.additional_body_parameters || {}), idempotency_key: idempotency_key, subscription: subscription }.compact
  req.url "#{@request_client.get_url(request_options: request_options)}/v2/webhooks/subscriptions"
end
          square.rb::CreateWebhookSubscriptionResponse.from_json(json_object: response.body)
        end
      end
# Retrieves a webhook subscription identified by its ID.
      #
      # @param subscription_id [String] [REQUIRED] The ID of the [Subscription](entity:WebhookSubscription) to retrieve.
      # @param request_options [square.rb::RequestOptions] 
      # @return [square.rb::GetWebhookSubscriptionResponse]
      # @example
#  api = square.rb::Client.new(
#    base_url: "https://api.example.com",
#    environment: square.rb::Environment::PRODUCTION,
#    token: "YOUR_AUTH_TOKEN",
#    version: "Version"
#  )
#  api.webhooks.subscriptions.get(subscription_id: "subscription_id")
      def get(subscription_id:, request_options: nil)
        Async do
          response = @request_client.conn.get do | req |
  unless request_options&.timeout_in_seconds.nil?
    req.options.timeout = request_options.timeout_in_seconds
  end
  unless request_options&.token.nil?
    req.headers["Authorization"] = request_options.token
  end
  unless request_options&.version.nil?
    req.headers["Square-Version"] = request_options.version
  end
  req.headers = { **(req.headers || {}), **@request_client.get_headers, **(request_options&.additional_headers || {}) }.compact
  unless request_options.nil? || request_options&.additional_query_parameters.nil?
    req.params = { **(request_options&.additional_query_parameters || {}) }.compact
  end
  unless request_options.nil? || request_options&.additional_body_parameters.nil?
    req.body = { **(request_options&.additional_body_parameters || {}) }.compact
  end
  req.url "#{@request_client.get_url(request_options: request_options)}/v2/webhooks/subscriptions/#{subscription_id}"
end
          square.rb::GetWebhookSubscriptionResponse.from_json(json_object: response.body)
        end
      end
# Updates a webhook subscription.
      #
      # @param subscription_id [String] [REQUIRED] The ID of the [Subscription](entity:WebhookSubscription) to update.
      # @param subscription [Hash] The [Subscription](entity:WebhookSubscription) to update.Request of type square.rb::WebhookSubscription, as a Hash
      #   * :id (String) 
      #   * :name (String) 
      #   * :enabled (Boolean) 
      #   * :event_types (Array<String>) 
      #   * :notification_url (String) 
      #   * :api_version (String) 
      #   * :signature_key (String) 
      #   * :created_at (String) 
      #   * :updated_at (String) 
      # @param request_options [square.rb::RequestOptions] 
      # @return [square.rb::UpdateWebhookSubscriptionResponse]
      # @example
#  api = square.rb::Client.new(
#    base_url: "https://api.example.com",
#    environment: square.rb::Environment::PRODUCTION,
#    token: "YOUR_AUTH_TOKEN",
#    version: "Version"
#  )
#  api.webhooks.subscriptions.update(subscription_id: "subscription_id", subscription: { name: "Updated Example Webhook Subscription", enabled: false })
      def update(subscription_id:, subscription: nil, request_options: nil)
        Async do
          response = @request_client.conn.put do | req |
  unless request_options&.timeout_in_seconds.nil?
    req.options.timeout = request_options.timeout_in_seconds
  end
  unless request_options&.token.nil?
    req.headers["Authorization"] = request_options.token
  end
  unless request_options&.version.nil?
    req.headers["Square-Version"] = request_options.version
  end
  req.headers = { **(req.headers || {}), **@request_client.get_headers, **(request_options&.additional_headers || {}) }.compact
  unless request_options.nil? || request_options&.additional_query_parameters.nil?
    req.params = { **(request_options&.additional_query_parameters || {}) }.compact
  end
  req.body = { **(request_options&.additional_body_parameters || {}), subscription: subscription }.compact
  req.url "#{@request_client.get_url(request_options: request_options)}/v2/webhooks/subscriptions/#{subscription_id}"
end
          square.rb::UpdateWebhookSubscriptionResponse.from_json(json_object: response.body)
        end
      end
# Deletes a webhook subscription.
      #
      # @param subscription_id [String] [REQUIRED] The ID of the [Subscription](entity:WebhookSubscription) to delete.
      # @param request_options [square.rb::RequestOptions] 
      # @return [square.rb::DeleteWebhookSubscriptionResponse]
      # @example
#  api = square.rb::Client.new(
#    base_url: "https://api.example.com",
#    environment: square.rb::Environment::PRODUCTION,
#    token: "YOUR_AUTH_TOKEN",
#    version: "Version"
#  )
#  api.webhooks.subscriptions.delete(subscription_id: "subscription_id")
      def delete(subscription_id:, request_options: nil)
        Async do
          response = @request_client.conn.delete do | req |
  unless request_options&.timeout_in_seconds.nil?
    req.options.timeout = request_options.timeout_in_seconds
  end
  unless request_options&.token.nil?
    req.headers["Authorization"] = request_options.token
  end
  unless request_options&.version.nil?
    req.headers["Square-Version"] = request_options.version
  end
  req.headers = { **(req.headers || {}), **@request_client.get_headers, **(request_options&.additional_headers || {}) }.compact
  unless request_options.nil? || request_options&.additional_query_parameters.nil?
    req.params = { **(request_options&.additional_query_parameters || {}) }.compact
  end
  unless request_options.nil? || request_options&.additional_body_parameters.nil?
    req.body = { **(request_options&.additional_body_parameters || {}) }.compact
  end
  req.url "#{@request_client.get_url(request_options: request_options)}/v2/webhooks/subscriptions/#{subscription_id}"
end
          square.rb::DeleteWebhookSubscriptionResponse.from_json(json_object: response.body)
        end
      end
# Updates a webhook subscription by replacing the existing signature key with a
#  new one.
      #
      # @param subscription_id [String] [REQUIRED] The ID of the [Subscription](entity:WebhookSubscription) to update.
      # @param idempotency_key [String] A unique string that identifies the
#  ureKey](api-endpoint:WebhookSubscriptions-UpdateWebhookSubscriptionSignatureKey)
#  request.
      # @param request_options [square.rb::RequestOptions] 
      # @return [square.rb::UpdateWebhookSubscriptionSignatureKeyResponse]
      # @example
#  api = square.rb::Client.new(
#    base_url: "https://api.example.com",
#    environment: square.rb::Environment::PRODUCTION,
#    token: "YOUR_AUTH_TOKEN",
#    version: "Version"
#  )
#  api.webhooks.subscriptions.update_signature_key(subscription_id: "subscription_id", idempotency_key: "ed80ae6b-0654-473b-bbab-a39aee89a60d")
      def update_signature_key(subscription_id:, idempotency_key: nil, request_options: nil)
        Async do
          response = @request_client.conn.post do | req |
  unless request_options&.timeout_in_seconds.nil?
    req.options.timeout = request_options.timeout_in_seconds
  end
  unless request_options&.token.nil?
    req.headers["Authorization"] = request_options.token
  end
  unless request_options&.version.nil?
    req.headers["Square-Version"] = request_options.version
  end
  req.headers = { **(req.headers || {}), **@request_client.get_headers, **(request_options&.additional_headers || {}) }.compact
  unless request_options.nil? || request_options&.additional_query_parameters.nil?
    req.params = { **(request_options&.additional_query_parameters || {}) }.compact
  end
  req.body = { **(request_options&.additional_body_parameters || {}), idempotency_key: idempotency_key }.compact
  req.url "#{@request_client.get_url(request_options: request_options)}/v2/webhooks/subscriptions/#{subscription_id}/signature-key"
end
          square.rb::UpdateWebhookSubscriptionSignatureKeyResponse.from_json(json_object: response.body)
        end
      end
# Tests a webhook subscription by sending a test event to the notification URL.
      #
      # @param subscription_id [String] [REQUIRED] The ID of the [Subscription](entity:WebhookSubscription) to test.
      # @param event_type [String] The event type that will be used to test the
#  [Subscription](entity:WebhookSubscription). The event type must be
#  contained in the list of event types in the
#  [Subscription](entity:WebhookSubscription).
      # @param request_options [square.rb::RequestOptions] 
      # @return [square.rb::TestWebhookSubscriptionResponse]
      # @example
#  api = square.rb::Client.new(
#    base_url: "https://api.example.com",
#    environment: square.rb::Environment::PRODUCTION,
#    token: "YOUR_AUTH_TOKEN",
#    version: "Version"
#  )
#  api.webhooks.subscriptions.test(subscription_id: "subscription_id", event_type: "payment.created")
      def test(subscription_id:, event_type: nil, request_options: nil)
        Async do
          response = @request_client.conn.post do | req |
  unless request_options&.timeout_in_seconds.nil?
    req.options.timeout = request_options.timeout_in_seconds
  end
  unless request_options&.token.nil?
    req.headers["Authorization"] = request_options.token
  end
  unless request_options&.version.nil?
    req.headers["Square-Version"] = request_options.version
  end
  req.headers = { **(req.headers || {}), **@request_client.get_headers, **(request_options&.additional_headers || {}) }.compact
  unless request_options.nil? || request_options&.additional_query_parameters.nil?
    req.params = { **(request_options&.additional_query_parameters || {}) }.compact
  end
  req.body = { **(request_options&.additional_body_parameters || {}), event_type: event_type }.compact
  req.url "#{@request_client.get_url(request_options: request_options)}/v2/webhooks/subscriptions/#{subscription_id}/test"
end
          square.rb::TestWebhookSubscriptionResponse.from_json(json_object: response.body)
        end
      end
    end
  end
end