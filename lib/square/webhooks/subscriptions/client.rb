
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
        # @return [Square::Types::CreateWebhookSubscriptionResponse]
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
        # @return [Square::Types::GetWebhookSubscriptionResponse]
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
        # @return [Square::Types::UpdateWebhookSubscriptionResponse]
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
        # @return [Square::Types::DeleteWebhookSubscriptionResponse]
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
        # @return [Square::Types::UpdateWebhookSubscriptionSignatureKeyResponse]
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
        # @return [Square::Types::TestWebhookSubscriptionResponse]
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
