
module Square
  module Webhooks
    module EventTypes
      class Client
        # @option client [Square::Internal::Http::RawClient]
        #
        # @return [Square::Webhooks::EventTypes::Client]
        def initialize(client)
          @client = client
        end

        # Lists all webhook event types that can be subscribed to.
        #
        # @return [Square::Types::ListWebhookEventTypesResponse]
        def list(request_options: {}, **params)
          _request = params
          _response = @client.send(_request)
          if _response.code >= "200" && _response.code < "300"
            return Square::Types::ListWebhookEventTypesResponse.load(_response.body)
          else
            raise _response.body
          end
        end

      end
    end
  end
end
