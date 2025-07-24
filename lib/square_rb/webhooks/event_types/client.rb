# frozen_string_literal: true
require_relative "../../../requests"
require_relative "../../types/list_webhook_event_types_response"
require "async"
require_relative "../../../requests"

module SquareApiClient
  module Webhooks
    class EventTypesClient
    # @return [SquareApiClient::RequestClient] 
      attr_reader :request_client


      # @param request_client [SquareApiClient::RequestClient] 
      # @return [SquareApiClient::Webhooks::EventTypesClient]
      def initialize(request_client:)
        @request_client = request_client
      end
# Lists all webhook event types that can be subscribed to.
      #
      # @param api_version [String] The API version for which to list event types. Setting this field overrides the
#  default version used by the application.
      # @param request_options [SquareApiClient::RequestOptions] 
      # @return [SquareApiClient::ListWebhookEventTypesResponse]
      # @example
#  api = SquareApiClient::Client.new(
#    base_url: "https://api.example.com",
#    environment: SquareApiClient::Environment::PRODUCTION,
#    token: "YOUR_AUTH_TOKEN",
#    version: "Version"
#  )
#  api.webhooks.event_types.list
      def list(api_version: nil, request_options: nil)
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
  req.params = { **(request_options&.additional_query_parameters || {}), "api_version": api_version }.compact
  unless request_options.nil? || request_options&.additional_body_parameters.nil?
    req.body = { **(request_options&.additional_body_parameters || {}) }.compact
  end
  req.url "#{@request_client.get_url(request_options: request_options)}/v2/webhooks/event-types"
end
        SquareApiClient::ListWebhookEventTypesResponse.from_json(json_object: response.body)
      end
    end
    class AsyncEventTypesClient
    # @return [SquareApiClient::AsyncRequestClient] 
      attr_reader :request_client


      # @param request_client [SquareApiClient::RequestClient] 
      # @return [SquareApiClient::Webhooks::AsyncEventTypesClient]
      def initialize(request_client:)
        @request_client = request_client
      end
# Lists all webhook event types that can be subscribed to.
      #
      # @param api_version [String] The API version for which to list event types. Setting this field overrides the
#  default version used by the application.
      # @param request_options [SquareApiClient::RequestOptions] 
      # @return [SquareApiClient::ListWebhookEventTypesResponse]
      # @example
#  api = SquareApiClient::Client.new(
#    base_url: "https://api.example.com",
#    environment: SquareApiClient::Environment::PRODUCTION,
#    token: "YOUR_AUTH_TOKEN",
#    version: "Version"
#  )
#  api.webhooks.event_types.list
      def list(api_version: nil, request_options: nil)
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
  req.params = { **(request_options&.additional_query_parameters || {}), "api_version": api_version }.compact
  unless request_options.nil? || request_options&.additional_body_parameters.nil?
    req.body = { **(request_options&.additional_body_parameters || {}) }.compact
  end
  req.url "#{@request_client.get_url(request_options: request_options)}/v2/webhooks/event-types"
end
          SquareApiClient::ListWebhookEventTypesResponse.from_json(json_object: response.body)
        end
      end
    end
  end
end