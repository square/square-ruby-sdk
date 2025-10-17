# frozen_string_literal: true

module Square
  module Webhooks
    module Subscriptions
      class Client
        # @return [Square::Webhooks::Subscriptions::Client]
        def initialize(client:)
          @client = client
        end

        # Lists all webhook subscriptions owned by your application.
        #
        # @return [Square::Types::ListWebhookSubscriptionsResponse]
        def list(request_options: {}, **params)
          params = Square::Internal::Types::Utils.symbolize_keys(params)
          _query_param_names = %i[cursor include_disabled sort_order limit]
          _query = params.slice(*_query_param_names)
          params.except(*_query_param_names)

          Square::Internal::CursorItemIterator.new(
            cursor_field: :cursor,
            item_field: :subscriptions,
            initial_cursor: _query[:cursor]
          ) do |next_cursor|
            _query[:cursor] = next_cursor
            _request = Square::Internal::JSON::Request.new(
              base_url: request_options[:base_url] || Square::Environment::PRODUCTION,
              method: "GET",
              path: "v2/webhooks/subscriptions",
              query: _query
            )
            begin
              _response = @client.send(_request)
            rescue Net::HTTPRequestTimeout
              raise Square::Errors::TimeoutError
            end
            code = _response.code.to_i
            if code.between?(200, 299)
              Square::Types::ListWebhookSubscriptionsResponse.load(_response.body)
            else
              error_class = Square::Errors::ResponseError.subclass_for_code(code)
              raise error_class.new(_response.body, code: code)
            end
          end
        end

        # Creates a webhook subscription.
        #
        # @return [Square::Types::CreateWebhookSubscriptionResponse]
        def create(request_options: {}, **params)
          _request = Square::Internal::JSON::Request.new(
            base_url: request_options[:base_url] || Square::Environment::PRODUCTION,
            method: "POST",
            path: "v2/webhooks/subscriptions",
            body: params
          )
          begin
            _response = @client.send(_request)
          rescue Net::HTTPRequestTimeout
            raise Square::Errors::TimeoutError
          end
          code = _response.code.to_i
          if code.between?(200, 299)
            Square::Types::CreateWebhookSubscriptionResponse.load(_response.body)
          else
            error_class = Square::Errors::ResponseError.subclass_for_code(code)
            raise error_class.new(_response.body, code: code)
          end
        end

        # Retrieves a webhook subscription identified by its ID.
        #
        # @return [Square::Types::GetWebhookSubscriptionResponse]
        def get(request_options: {}, **params)
          _request = Square::Internal::JSON::Request.new(
            base_url: request_options[:base_url] || Square::Environment::PRODUCTION,
            method: "GET",
            path: "v2/webhooks/subscriptions/#{params[:subscription_id]}"
          )
          begin
            _response = @client.send(_request)
          rescue Net::HTTPRequestTimeout
            raise Square::Errors::TimeoutError
          end
          code = _response.code.to_i
          if code.between?(200, 299)
            Square::Types::GetWebhookSubscriptionResponse.load(_response.body)
          else
            error_class = Square::Errors::ResponseError.subclass_for_code(code)
            raise error_class.new(_response.body, code: code)
          end
        end

        # Updates a webhook subscription.
        #
        # @return [Square::Types::UpdateWebhookSubscriptionResponse]
        def update(request_options: {}, **params)
          _path_param_names = ["subscription_id"]

          _request = Square::Internal::JSON::Request.new(
            base_url: request_options[:base_url] || Square::Environment::PRODUCTION,
            method: "PUT",
            path: "v2/webhooks/subscriptions/#{params[:subscription_id]}",
            body: params.except(*_path_param_names)
          )
          begin
            _response = @client.send(_request)
          rescue Net::HTTPRequestTimeout
            raise Square::Errors::TimeoutError
          end
          code = _response.code.to_i
          if code.between?(200, 299)
            Square::Types::UpdateWebhookSubscriptionResponse.load(_response.body)
          else
            error_class = Square::Errors::ResponseError.subclass_for_code(code)
            raise error_class.new(_response.body, code: code)
          end
        end

        # Deletes a webhook subscription.
        #
        # @return [Square::Types::DeleteWebhookSubscriptionResponse]
        def delete(request_options: {}, **params)
          _request = Square::Internal::JSON::Request.new(
            base_url: request_options[:base_url] || Square::Environment::PRODUCTION,
            method: "DELETE",
            path: "v2/webhooks/subscriptions/#{params[:subscription_id]}"
          )
          begin
            _response = @client.send(_request)
          rescue Net::HTTPRequestTimeout
            raise Square::Errors::TimeoutError
          end
          code = _response.code.to_i
          if code.between?(200, 299)
            Square::Types::DeleteWebhookSubscriptionResponse.load(_response.body)
          else
            error_class = Square::Errors::ResponseError.subclass_for_code(code)
            raise error_class.new(_response.body, code: code)
          end
        end

        # Updates a webhook subscription by replacing the existing signature key with a new one.
        #
        # @return [Square::Types::UpdateWebhookSubscriptionSignatureKeyResponse]
        def update_signature_key(request_options: {}, **params)
          _path_param_names = ["subscription_id"]

          _request = Square::Internal::JSON::Request.new(
            base_url: request_options[:base_url] || Square::Environment::PRODUCTION,
            method: "POST",
            path: "v2/webhooks/subscriptions/#{params[:subscription_id]}/signature-key",
            body: params.except(*_path_param_names)
          )
          begin
            _response = @client.send(_request)
          rescue Net::HTTPRequestTimeout
            raise Square::Errors::TimeoutError
          end
          code = _response.code.to_i
          if code.between?(200, 299)
            Square::Types::UpdateWebhookSubscriptionSignatureKeyResponse.load(_response.body)
          else
            error_class = Square::Errors::ResponseError.subclass_for_code(code)
            raise error_class.new(_response.body, code: code)
          end
        end

        # Tests a webhook subscription by sending a test event to the notification URL.
        #
        # @return [Square::Types::TestWebhookSubscriptionResponse]
        def test(request_options: {}, **params)
          _path_param_names = ["subscription_id"]

          _request = Square::Internal::JSON::Request.new(
            base_url: request_options[:base_url] || Square::Environment::PRODUCTION,
            method: "POST",
            path: "v2/webhooks/subscriptions/#{params[:subscription_id]}/test",
            body: params.except(*_path_param_names)
          )
          begin
            _response = @client.send(_request)
          rescue Net::HTTPRequestTimeout
            raise Square::Errors::TimeoutError
          end
          code = _response.code.to_i
          if code.between?(200, 299)
            Square::Types::TestWebhookSubscriptionResponse.load(_response.body)
          else
            error_class = Square::Errors::ResponseError.subclass_for_code(code)
            raise error_class.new(_response.body, code: code)
          end
        end
      end
    end
  end
end
