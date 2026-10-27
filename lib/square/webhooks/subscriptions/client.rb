# frozen_string_literal: true

module Square
  module Webhooks
    module Subscriptions
      class Client
        # @param client [Square::Internal::Http::RawClient]
        #
        # @return [void]
        def initialize(client:)
          @client = client
        end

        # Lists all webhook subscriptions owned by your application.
        #
        # Returns a `Square::Internal::CursorItemIterator` that yields each `Square::Types::WebhookSubscription` in the
        # `subscriptions` field of every page, requesting pages as they are needed. Call `pages` on it to get each page
        # as a `Square::Types::ListWebhookSubscriptionsResponse`, including its other fields.
        #
        # No request is sent by this call. The first page is requested when you start iterating (or call
        # `load_first_page`), so an API error is raised by the loop (or by `load_first_page`), not by this call.
        #
        # @param request_options [Hash]
        # @param params [Hash]
        # @option request_options [String] :base_url
        # @option request_options [Hash{String => Object}] :additional_headers
        # @option request_options [Hash{String => Object}] :additional_query_parameters
        # @option request_options [Hash{String => Object}] :additional_body_parameters
        # @option request_options [Integer] :timeout_in_seconds
        # @option params [String, nil] :cursor
        # @option params [Boolean, nil] :include_disabled
        # @option params [Square::Types::SortOrder, nil] :sort_order
        # @option params [Integer, nil] :limit
        #
        # @example
        #   client.webhooks.subscriptions.list(
        #     cursor: "cursor",
        #     include_disabled: true,
        #     sort_order: "DESC",
        #     limit: 1
        #   )
        #
        # @return [Square::Internal::CursorItemIterator]
        def list(request_options: {}, **params)
          params = Square::Internal::Types::Utils.normalize_keys(params)
          query_params = {}
          query_params["cursor"] = params[:cursor] if params.key?(:cursor)
          query_params["include_disabled"] = params[:include_disabled] if params.key?(:include_disabled)
          query_params["sort_order"] = params[:sort_order] if params.key?(:sort_order)
          query_params["limit"] = params[:limit] if params.key?(:limit)

          Square::Internal::CursorItemIterator.new(
            cursor_field: :cursor,
            item_field: :subscriptions,
            initial_cursor: query_params["cursor"]
          ) do |next_cursor|
            query_params["cursor"] = next_cursor
            request = Square::Internal::JSON::Request.new(
              base_url: request_options[:base_url],
              method: "GET",
              path: "v2/webhooks/subscriptions",
              query: query_params,
              request_options: request_options
            )
            begin
              response = @client.send(request)
            rescue Net::HTTPRequestTimeout
              raise Square::Errors::TimeoutError
            end
            code = response.code.to_i
            if code.between?(200, 299)
              parsed_response = (response.body.to_s.empty? ? nil : Square::Types::ListWebhookSubscriptionsResponse.load(response.body))
              [parsed_response, response]
            else
              error_class = Square::Errors::ResponseError.subclass_for_code(code)
              raise error_class.new(response.body, code: code)
            end
          end
        end

        # Creates a webhook subscription.
        #
        # @param request_options [Hash]
        # @param params [Square::Webhooks::Subscriptions::Types::CreateWebhookSubscriptionRequest]
        # @option request_options [String] :base_url
        # @option request_options [Hash{String => Object}] :additional_headers
        # @option request_options [Hash{String => Object}] :additional_query_parameters
        # @option request_options [Hash{String => Object}] :additional_body_parameters
        # @option request_options [Integer] :timeout_in_seconds
        #
        # @example
        #   client.webhooks.subscriptions.create(
        #     idempotency_key: "63f84c6c-2200-4c99-846c-2670a1311fbf",
        #     subscription: {
        #       name: "Example Webhook Subscription",
        #       event_types: %w[payment.created payment.updated],
        #       notification_url: "https://example-webhook-url.com",
        #       api_version: "2021-12-15"
        #     }
        #   )
        #
        # @return [Square::Types::CreateWebhookSubscriptionResponse]
        def create(request_options: {}, **params)
          params = Square::Internal::Types::Utils.normalize_keys(params)
          request = Square::Internal::JSON::Request.new(
            base_url: request_options[:base_url],
            method: "POST",
            path: "v2/webhooks/subscriptions",
            body: Square::Webhooks::Subscriptions::Types::CreateWebhookSubscriptionRequest.new(params).to_h,
            request_options: request_options
          )
          begin
            response = @client.send(request)
          rescue Net::HTTPRequestTimeout
            raise Square::Errors::TimeoutError
          end
          code = response.code.to_i
          if code.between?(200, 299)
            (response.body.to_s.empty? ? nil : Square::Types::CreateWebhookSubscriptionResponse.load(response.body))
          else
            error_class = Square::Errors::ResponseError.subclass_for_code(code)
            raise error_class.new(response.body, code: code)
          end
        end

        # Retrieves a webhook subscription identified by its ID.
        #
        # @param request_options [Hash]
        # @param params [Hash]
        # @option request_options [String] :base_url
        # @option request_options [Hash{String => Object}] :additional_headers
        # @option request_options [Hash{String => Object}] :additional_query_parameters
        # @option request_options [Hash{String => Object}] :additional_body_parameters
        # @option request_options [Integer] :timeout_in_seconds
        # @option params [String] :subscription_id
        #
        # @example
        #   client.webhooks.subscriptions.get(subscription_id: "subscription_id")
        #
        # @return [Square::Types::GetWebhookSubscriptionResponse]
        def get(request_options: {}, **params)
          params = Square::Internal::Types::Utils.normalize_keys(params)
          request = Square::Internal::JSON::Request.new(
            base_url: request_options[:base_url],
            method: "GET",
            path: "v2/webhooks/subscriptions/#{URI.encode_uri_component(params[:subscription_id].to_s)}",
            request_options: request_options
          )
          begin
            response = @client.send(request)
          rescue Net::HTTPRequestTimeout
            raise Square::Errors::TimeoutError
          end
          code = response.code.to_i
          if code.between?(200, 299)
            (response.body.to_s.empty? ? nil : Square::Types::GetWebhookSubscriptionResponse.load(response.body))
          else
            error_class = Square::Errors::ResponseError.subclass_for_code(code)
            raise error_class.new(response.body, code: code)
          end
        end

        # Updates a webhook subscription.
        #
        # @param request_options [Hash]
        # @param params [Square::Webhooks::Subscriptions::Types::UpdateWebhookSubscriptionRequest]
        # @option request_options [String] :base_url
        # @option request_options [Hash{String => Object}] :additional_headers
        # @option request_options [Hash{String => Object}] :additional_query_parameters
        # @option request_options [Hash{String => Object}] :additional_body_parameters
        # @option request_options [Integer] :timeout_in_seconds
        # @option params [String] :subscription_id
        #
        # @example
        #   client.webhooks.subscriptions.update(
        #     subscription_id: "subscription_id",
        #     subscription: {
        #       name: "Updated Example Webhook Subscription",
        #       enabled: false
        #     }
        #   )
        #
        # @return [Square::Types::UpdateWebhookSubscriptionResponse]
        def update(request_options: {}, **params)
          params = Square::Internal::Types::Utils.normalize_keys(params)
          request_data = Square::Webhooks::Subscriptions::Types::UpdateWebhookSubscriptionRequest.new(params).to_h
          non_body_param_names = %w[subscription_id]
          body = request_data.except(*non_body_param_names)

          request = Square::Internal::JSON::Request.new(
            base_url: request_options[:base_url],
            method: "PUT",
            path: "v2/webhooks/subscriptions/#{URI.encode_uri_component(params[:subscription_id].to_s)}",
            body: body,
            request_options: request_options
          )
          begin
            response = @client.send(request)
          rescue Net::HTTPRequestTimeout
            raise Square::Errors::TimeoutError
          end
          code = response.code.to_i
          if code.between?(200, 299)
            (response.body.to_s.empty? ? nil : Square::Types::UpdateWebhookSubscriptionResponse.load(response.body))
          else
            error_class = Square::Errors::ResponseError.subclass_for_code(code)
            raise error_class.new(response.body, code: code)
          end
        end

        # Deletes a webhook subscription.
        #
        # @param request_options [Hash]
        # @param params [Hash]
        # @option request_options [String] :base_url
        # @option request_options [Hash{String => Object}] :additional_headers
        # @option request_options [Hash{String => Object}] :additional_query_parameters
        # @option request_options [Hash{String => Object}] :additional_body_parameters
        # @option request_options [Integer] :timeout_in_seconds
        # @option params [String] :subscription_id
        #
        # @example
        #   client.webhooks.subscriptions.delete(subscription_id: "subscription_id")
        #
        # @return [Square::Types::DeleteWebhookSubscriptionResponse]
        def delete(request_options: {}, **params)
          params = Square::Internal::Types::Utils.normalize_keys(params)
          request = Square::Internal::JSON::Request.new(
            base_url: request_options[:base_url],
            method: "DELETE",
            path: "v2/webhooks/subscriptions/#{URI.encode_uri_component(params[:subscription_id].to_s)}",
            request_options: request_options
          )
          begin
            response = @client.send(request)
          rescue Net::HTTPRequestTimeout
            raise Square::Errors::TimeoutError
          end
          code = response.code.to_i
          if code.between?(200, 299)
            (response.body.to_s.empty? ? nil : Square::Types::DeleteWebhookSubscriptionResponse.load(response.body))
          else
            error_class = Square::Errors::ResponseError.subclass_for_code(code)
            raise error_class.new(response.body, code: code)
          end
        end

        # Updates a webhook subscription by replacing the existing signature key with a new one.
        #
        # @param request_options [Hash]
        # @param params [Square::Webhooks::Subscriptions::Types::UpdateWebhookSubscriptionSignatureKeyRequest]
        # @option request_options [String] :base_url
        # @option request_options [Hash{String => Object}] :additional_headers
        # @option request_options [Hash{String => Object}] :additional_query_parameters
        # @option request_options [Hash{String => Object}] :additional_body_parameters
        # @option request_options [Integer] :timeout_in_seconds
        # @option params [String] :subscription_id
        #
        # @example
        #   client.webhooks.subscriptions.update_signature_key(
        #     subscription_id: "subscription_id",
        #     idempotency_key: "ed80ae6b-0654-473b-bbab-a39aee89a60d"
        #   )
        #
        # @return [Square::Types::UpdateWebhookSubscriptionSignatureKeyResponse]
        def update_signature_key(request_options: {}, **params)
          params = Square::Internal::Types::Utils.normalize_keys(params)
          request_data = Square::Webhooks::Subscriptions::Types::UpdateWebhookSubscriptionSignatureKeyRequest.new(params).to_h
          non_body_param_names = %w[subscription_id]
          body = request_data.except(*non_body_param_names)

          request = Square::Internal::JSON::Request.new(
            base_url: request_options[:base_url],
            method: "POST",
            path: "v2/webhooks/subscriptions/#{URI.encode_uri_component(params[:subscription_id].to_s)}/signature-key",
            body: body,
            request_options: request_options
          )
          begin
            response = @client.send(request)
          rescue Net::HTTPRequestTimeout
            raise Square::Errors::TimeoutError
          end
          code = response.code.to_i
          if code.between?(200, 299)
            (response.body.to_s.empty? ? nil : Square::Types::UpdateWebhookSubscriptionSignatureKeyResponse.load(response.body))
          else
            error_class = Square::Errors::ResponseError.subclass_for_code(code)
            raise error_class.new(response.body, code: code)
          end
        end

        # Tests a webhook subscription by sending a test event to the notification URL.
        #
        # @param request_options [Hash]
        # @param params [Square::Webhooks::Subscriptions::Types::TestWebhookSubscriptionRequest]
        # @option request_options [String] :base_url
        # @option request_options [Hash{String => Object}] :additional_headers
        # @option request_options [Hash{String => Object}] :additional_query_parameters
        # @option request_options [Hash{String => Object}] :additional_body_parameters
        # @option request_options [Integer] :timeout_in_seconds
        # @option params [String] :subscription_id
        #
        # @example
        #   client.webhooks.subscriptions.test(
        #     subscription_id: "subscription_id",
        #     event_type: "payment.created"
        #   )
        #
        # @return [Square::Types::TestWebhookSubscriptionResponse]
        def test(request_options: {}, **params)
          params = Square::Internal::Types::Utils.normalize_keys(params)
          request_data = Square::Webhooks::Subscriptions::Types::TestWebhookSubscriptionRequest.new(params).to_h
          non_body_param_names = %w[subscription_id]
          body = request_data.except(*non_body_param_names)

          request = Square::Internal::JSON::Request.new(
            base_url: request_options[:base_url],
            method: "POST",
            path: "v2/webhooks/subscriptions/#{URI.encode_uri_component(params[:subscription_id].to_s)}/test",
            body: body,
            request_options: request_options
          )
          begin
            response = @client.send(request)
          rescue Net::HTTPRequestTimeout
            raise Square::Errors::TimeoutError
          end
          code = response.code.to_i
          if code.between?(200, 299)
            (response.body.to_s.empty? ? nil : Square::Types::TestWebhookSubscriptionResponse.load(response.body))
          else
            error_class = Square::Errors::ResponseError.subclass_for_code(code)
            raise error_class.new(response.body, code: code)
          end
        end
      end
    end
  end
end
