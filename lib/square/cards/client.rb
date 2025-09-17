# frozen_string_literal: true

module Square
  module Cards
    class Client
      # @return [Square::Cards::Client]
      def initialize(client:)
        @client = client
      end

      # Retrieves an ItemIterator of cards owned by the account making the request.
      #
      # @return Square::Internal::ItemIterator
      def list(request_options: {}, **params)
        _query_param_names = %w[cursor customer_id include_disabled reference_id sort_order]
        _query = params.slice(*_query_param_names)

        Square::Internal::ItemIterator.new(item_field: :cards, initial_cursor: params[:cursor]) do |cursor|
          _request = Square::Internal::JSON::Request.new(
            base_url: request_options[:base_url] || Square::Environment::SANDBOX,
            method: "GET",
            path: "v2/cards",
            query: _query.merge(cursor: cursor)
          )

          begin
            _response = @client.send(_request)
          rescue Net::HTTPRequestTimeout
            raise Square::Errors::TimeoutError
          end
          code = _response.code.to_i
          if code.between?(200, 299)
            Square::Types::ListCardsResponse.load(_response.body)
          else
            subclass = Square::Errors::ResponseError.subclass_for_code(code)
            raise subclass.new(_response.body, code: code)
          end
        end
      end

      # Adds a card on file to an existing merchant.
      #
      # @return [Square::Types::CreateCardResponse]
      def create(request_options: {}, **params)
        _request = Square::Internal::JSON::Request.new(
          base_url: request_options[:base_url] || Square::Environment::SANDBOX,
          method: "POST",
          path: "v2/cards",
          body: params
        )
        _response = @client.send(_request)
        if _response.code >= "200" && _response.code < "300"
          return Square::Types::CreateCardResponse.load(_response.body)
        end

        raise _response.body
      end

      # Retrieves details for a specific Card.
      #
      # @return [Square::Types::GetCardResponse]
      def get(request_options: {}, **params)
        _request = Square::Internal::JSON::Request.new(
          base_url: request_options[:base_url] || Square::Environment::SANDBOX,
          method: "GET",
          path: "v2/cards/#{params[:card_id]}"
        )
        _response = @client.send(_request)
        return Square::Types::GetCardResponse.load(_response.body) if _response.code >= "200" && _response.code < "300"

        raise _response.body
      end

      # Disables the card, preventing any further updates or charges.
      # Disabling an already disabled card is allowed but has no effect.
      #
      # @return [Square::Types::DisableCardResponse]
      def disable(request_options: {}, **params)
        _request = Square::Internal::JSON::Request.new(
          base_url: request_options[:base_url] || Square::Environment::SANDBOX,
          method: "POST",
          path: "v2/cards/#{params[:card_id]}/disable"
        )
        _response = @client.send(_request)
        if _response.code >= "200" && _response.code < "300"
          return Square::Types::DisableCardResponse.load(_response.body)
        end

        raise _response.body
      end
    end
  end
end
