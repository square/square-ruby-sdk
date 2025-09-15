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
          _query_param_names = [
            %w[cursor include_disabled sort_order limit],
            %i[cursor include_disabled sort_order limit]
          ].flatten
          _query = params.slice(*_query_param_names)
          params.except(*_query_param_names)

          _request = Square::Internal::JSON::Request.new(
            base_url: request_options[:base_url] || Square::Environment::SANDBOX,
            method: "GET",
            path: "v2/webhooks/subscriptions",
            query: _query
          )
          _response = @client.send(_request)
          if _response.code >= "200" && _response.code < "300"
            return Square::Types::ListWebhookSubscriptionsResponse.load(_response.body)
          end

          raise _response.body
        end

        # Creates a webhook subscription.
        #
        # @return [Square::Types::CreateWebhookSubscriptionResponse]
        def create(request_options: {}, **params)
          _request = Square::Internal::JSON::Request.new(
            base_url: request_options[:base_url] || Square::Environment::SANDBOX,
            method: "POST",
            path: "v2/webhooks/subscriptions",
            body: params
          )
          _response = @client.send(_request)
          if _response.code >= "200" && _response.code < "300"
            return Square::Types::CreateWebhookSubscriptionResponse.load(_response.body)
          end

          raise _response.body
        end

        # Retrieves a webhook subscription identified by its ID.
        #
        # @return [Square::Types::GetWebhookSubscriptionResponse]
        def get(request_options: {}, **params)
          _request = Square::Internal::JSON::Request.new(
            base_url: request_options[:base_url] || Square::Environment::SANDBOX,
            method: "GET",
            path: "v2/webhooks/subscriptions/#{params[:subscription_id]}"
          )
          _response = @client.send(_request)
          if _response.code >= "200" && _response.code < "300"
            return Square::Types::GetWebhookSubscriptionResponse.load(_response.body)
          end

          raise _response.body
        end

        # Updates a webhook subscription.
        #
        # @return [Square::Types::UpdateWebhookSubscriptionResponse]
        def update(request_options: {}, **params)
          _path_param_names = ["subscription_id"]

          _request = Square::Internal::JSON::Request.new(
            base_url: request_options[:base_url] || Square::Environment::SANDBOX,
            method: "PUT",
            path: "v2/webhooks/subscriptions/#{params[:subscription_id]}",
            body: params.except(*_path_param_names)
          )
          _response = @client.send(_request)
          if _response.code >= "200" && _response.code < "300"
            return Square::Types::UpdateWebhookSubscriptionResponse.load(_response.body)
          end

          raise _response.body
        end

        # Deletes a webhook subscription.
        #
        # @return [Square::Types::DeleteWebhookSubscriptionResponse]
        def delete(request_options: {}, **params)
          _request = Square::Internal::JSON::Request.new(
            base_url: request_options[:base_url] || Square::Environment::SANDBOX,
            method: "DELETE",
            path: "v2/webhooks/subscriptions/#{params[:subscription_id]}"
          )
          _response = @client.send(_request)
          if _response.code >= "200" && _response.code < "300"
            return Square::Types::DeleteWebhookSubscriptionResponse.load(_response.body)
          end

          raise _response.body
        end

        # Updates a webhook subscription by replacing the existing signature key with a new one.
        #
        # @return [Square::Types::UpdateWebhookSubscriptionSignatureKeyResponse]
        def update_signature_key(request_options: {}, **params)
          _path_param_names = ["subscription_id"]

          _request = Square::Internal::JSON::Request.new(
            base_url: request_options[:base_url] || Square::Environment::SANDBOX,
            method: "POST",
            path: "v2/webhooks/subscriptions/#{params[:subscription_id]}/signature-key",
            body: params.except(*_path_param_names)
          )
          _response = @client.send(_request)
          if _response.code >= "200" && _response.code < "300"
            return Square::Types::UpdateWebhookSubscriptionSignatureKeyResponse.load(_response.body)
          end

          raise _response.body
        end

        # Tests a webhook subscription by sending a test event to the notification URL.
        #
        # @return [Square::Types::TestWebhookSubscriptionResponse]
        def test(request_options: {}, **params)
          _path_param_names = ["subscription_id"]

          _request = Square::Internal::JSON::Request.new(
            base_url: request_options[:base_url] || Square::Environment::SANDBOX,
            method: "POST",
            path: "v2/webhooks/subscriptions/#{params[:subscription_id]}/test",
            body: params.except(*_path_param_names)
          )
          _response = @client.send(_request)
          if _response.code >= "200" && _response.code < "300"
            return Square::Types::TestWebhookSubscriptionResponse.load(_response.body)
          end

          raise _response.body
        end
      end
    end
  end
end
