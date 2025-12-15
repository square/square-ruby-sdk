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
        # @return [Square::Types::ListWebhookSubscriptionsResponse]
        def list(request_options: {}, **params)
          params = Square::Internal::Types::Utils.symbolize_keys(params)
          query_param_names = %i[cursor include_disabled sort_order limit]
          query_params = {}
          query_params["cursor"] = params[:cursor] if params.key?(:cursor)
          query_params["include_disabled"] = params[:include_disabled] if params.key?(:include_disabled)
          query_params["sort_order"] = params[:sort_order] if params.key?(:sort_order)
          query_params["limit"] = params[:limit] if params.key?(:limit)
          params.except(*query_param_names)

          Square::Internal::CursorItemIterator.new(
            cursor_field: :cursor,
            item_field: :subscriptions,
            initial_cursor: query_params[:cursor]
          ) do |next_cursor|
            query_params[:cursor] = next_cursor
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
              Square::Types::ListWebhookSubscriptionsResponse.load(response.body)
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
        # @return [Square::Types::CreateWebhookSubscriptionResponse]
        def create(request_options: {}, **params)
          body_prop_names = %i[idempotency_key subscription]
          body_bag = params.slice(*body_prop_names)

          request = Square::Internal::JSON::Request.new(
            base_url: request_options[:base_url],
            method: "POST",
            path: "v2/webhooks/subscriptions",
            body: Square::Webhooks::Subscriptions::Types::CreateWebhookSubscriptionRequest.new(body_bag).to_h,
            request_options: request_options
          )
          begin
            response = @client.send(request)
          rescue Net::HTTPRequestTimeout
            raise Square::Errors::TimeoutError
          end
          code = response.code.to_i
          if code.between?(200, 299)
            Square::Types::CreateWebhookSubscriptionResponse.load(response.body)
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
        # @return [Square::Types::GetWebhookSubscriptionResponse]
        def get(request_options: {}, **params)
          request = Square::Internal::JSON::Request.new(
            base_url: request_options[:base_url],
            method: "GET",
            path: "v2/webhooks/subscriptions/#{params[:subscription_id]}",
            request_options: request_options
          )
          begin
            response = @client.send(request)
          rescue Net::HTTPRequestTimeout
            raise Square::Errors::TimeoutError
          end
          code = response.code.to_i
          if code.between?(200, 299)
            Square::Types::GetWebhookSubscriptionResponse.load(response.body)
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
        # @return [Square::Types::UpdateWebhookSubscriptionResponse]
        def update(request_options: {}, **params)
          path_param_names = %i[subscription_id]
          body_params = params.except(*path_param_names)
          body_prop_names = %i[subscription]
          body_bag = body_params.slice(*body_prop_names)

          request = Square::Internal::JSON::Request.new(
            base_url: request_options[:base_url],
            method: "PUT",
            path: "v2/webhooks/subscriptions/#{params[:subscription_id]}",
            body: Square::Webhooks::Subscriptions::Types::UpdateWebhookSubscriptionRequest.new(body_bag).to_h,
            request_options: request_options
          )
          begin
            response = @client.send(request)
          rescue Net::HTTPRequestTimeout
            raise Square::Errors::TimeoutError
          end
          code = response.code.to_i
          if code.between?(200, 299)
            Square::Types::UpdateWebhookSubscriptionResponse.load(response.body)
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
        # @return [Square::Types::DeleteWebhookSubscriptionResponse]
        def delete(request_options: {}, **params)
          request = Square::Internal::JSON::Request.new(
            base_url: request_options[:base_url],
            method: "DELETE",
            path: "v2/webhooks/subscriptions/#{params[:subscription_id]}",
            request_options: request_options
          )
          begin
            response = @client.send(request)
          rescue Net::HTTPRequestTimeout
            raise Square::Errors::TimeoutError
          end
          code = response.code.to_i
          if code.between?(200, 299)
            Square::Types::DeleteWebhookSubscriptionResponse.load(response.body)
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
        # @return [Square::Types::UpdateWebhookSubscriptionSignatureKeyResponse]
        def update_signature_key(request_options: {}, **params)
          path_param_names = %i[subscription_id]
          body_params = params.except(*path_param_names)
          body_prop_names = %i[idempotency_key]
          body_bag = body_params.slice(*body_prop_names)

          request = Square::Internal::JSON::Request.new(
            base_url: request_options[:base_url],
            method: "POST",
            path: "v2/webhooks/subscriptions/#{params[:subscription_id]}/signature-key",
            body: Square::Webhooks::Subscriptions::Types::UpdateWebhookSubscriptionSignatureKeyRequest.new(body_bag).to_h,
            request_options: request_options
          )
          begin
            response = @client.send(request)
          rescue Net::HTTPRequestTimeout
            raise Square::Errors::TimeoutError
          end
          code = response.code.to_i
          if code.between?(200, 299)
            Square::Types::UpdateWebhookSubscriptionSignatureKeyResponse.load(response.body)
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
        # @return [Square::Types::TestWebhookSubscriptionResponse]
        def test(request_options: {}, **params)
          path_param_names = %i[subscription_id]
          body_params = params.except(*path_param_names)
          body_prop_names = %i[event_type]
          body_bag = body_params.slice(*body_prop_names)

          request = Square::Internal::JSON::Request.new(
            base_url: request_options[:base_url],
            method: "POST",
            path: "v2/webhooks/subscriptions/#{params[:subscription_id]}/test",
            body: Square::Webhooks::Subscriptions::Types::TestWebhookSubscriptionRequest.new(body_bag).to_h,
            request_options: request_options
          )
          begin
            response = @client.send(request)
          rescue Net::HTTPRequestTimeout
            raise Square::Errors::TimeoutError
          end
          code = response.code.to_i
          if code.between?(200, 299)
            Square::Types::TestWebhookSubscriptionResponse.load(response.body)
          else
            error_class = Square::Errors::ResponseError.subclass_for_code(code)
            raise error_class.new(response.body, code: code)
          end
        end
      end
    end
  end
end
