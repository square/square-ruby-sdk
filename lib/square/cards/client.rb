
module Square
  module Cards
    class Client
      # @option client [Square::Internal::Http::RawClient]
      #
      # @return [Square::Cards::Client]
      def initialize(client)
        @client = client
      end

      # Retrieves a list of cards owned by the account making the request.
      # A max of 25 cards will be returned.
      #
      # @return [Square::ListCardsResponse]
      def list(request_options: {}, **params)
        _request = params
        _response = @client.send(_request)
        if _response.code >= "200" && _response.code < "300"
          return Square::Types::ListCardsResponse.load(_response.body)
        else
          raise _response.body
        end
      end

      # Adds a card on file to an existing merchant.
      #
      # @return [Square::CreateCardResponse]
      def create(request_options: {}, **params)
        _request = params
        _response = @client.send(_request)
        if _response.code >= "200" && _response.code < "300"
          return Square::Types::CreateCardResponse.load(_response.body)
        else
          raise _response.body
        end
      end

      # Retrieves details for a specific Card.
      #
      # @return [Square::GetCardResponse]
      def get(request_options: {}, **params)
        _request = params
        _response = @client.send(_request)
        if _response.code >= "200" && _response.code < "300"
          return Square::Types::GetCardResponse.load(_response.body)
        else
          raise _response.body
        end
      end

      # Disables the card, preventing any further updates or charges.
      # Disabling an already disabled card is allowed but has no effect.
      #
      # @return [Square::DisableCardResponse]
      def disable(request_options: {}, **params)
        _request = params
        _response = @client.send(_request)
        if _response.code >= "200" && _response.code < "300"
          return Square::Types::DisableCardResponse.load(_response.body)
        else
          raise _response.body
        end
      end

    end
  end
end
