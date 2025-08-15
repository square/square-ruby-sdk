
module Square
  module Webhooks
    module Subscriptions
      class Client
        # @option client [Square::Internal::Http::RawClient]
        #
        # @return [Square::Webhooks::Subscriptions::Client]
        def initialize(client)
          @client = client
        end

        # Lists all webhook subscriptions owned by your application.
        #
        # @return [Square::ListWebhookSubscriptionsResponse]
        def list(request_options: {}, **params)
          _request = params
          _response = @client.send(_request)
          if _response.code >= "200" && _response.code < "300"
            return Square::Types::ListWebhookSubscriptionsResponse.load(_response.body)
          else
            raise _response.body
          end
        end

        # Creates a webhook subscription.
        #
        # @return [Square::CreateWebhookSubscriptionResponse]
        def create(request_options: {}, **params)
          _request = params
          _response = @client.send(_request)
          if _response.code >= "200" && _response.code < "300"
            return Square::Types::CreateWebhookSubscriptionResponse.load(_response.body)
          else
            raise _response.body
          end
        end

        # Retrieves a webhook subscription identified by its ID.
        #
        # @return [Square::GetWebhookSubscriptionResponse]
        def get(request_options: {}, **params)
          _request = params
          _response = @client.send(_request)
          if _response.code >= "200" && _response.code < "300"
            return Square::Types::GetWebhookSubscriptionResponse.load(_response.body)
          else
            raise _response.body
          end
        end

        # Updates a webhook subscription.
        #
        # @return [Square::UpdateWebhookSubscriptionResponse]
        def update(request_options: {}, **params)
          _request = params
          _response = @client.send(_request)
          if _response.code >= "200" && _response.code < "300"
            return Square::Types::UpdateWebhookSubscriptionResponse.load(_response.body)
          else
            raise _response.body
          end
        end

        # Deletes a webhook subscription.
        #
        # @return [Square::DeleteWebhookSubscriptionResponse]
        def delete(request_options: {}, **params)
          _request = params
          _response = @client.send(_request)
          if _response.code >= "200" && _response.code < "300"
            return Square::Types::DeleteWebhookSubscriptionResponse.load(_response.body)
          else
            raise _response.body
          end
        end

        # Updates a webhook subscription by replacing the existing signature key with a new one.
        #
        # @return [Square::UpdateWebhookSubscriptionSignatureKeyResponse]
        def update_signature_key(request_options: {}, **params)
          _request = params
          _response = @client.send(_request)
          if _response.code >= "200" && _response.code < "300"
            return Square::Types::UpdateWebhookSubscriptionSignatureKeyResponse.load(_response.body)
          else
            raise _response.body
          end
        end

        # Tests a webhook subscription by sending a test event to the notification URL.
        #
        # @return [Square::TestWebhookSubscriptionResponse]
        def test(request_options: {}, **params)
          _request = params
          _response = @client.send(_request)
          if _response.code >= "200" && _response.code < "300"
            return Square::Types::TestWebhookSubscriptionResponse.load(_response.body)
          else
            raise _response.body
          end
        end

      end
    end
  end
end
