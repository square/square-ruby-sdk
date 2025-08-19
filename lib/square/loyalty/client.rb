
module Square
  module Loyalty
    class Client
      # @return [Square::Loyalty::Client]
      def initialize(client:)
        @client = client
      end

      # Searches for loyalty events.
      # 
      # A Square loyalty program maintains a ledger of events that occur during the lifetime of a
      # buyer's loyalty account. Each change in the point balance
      # (for example, points earned, points redeemed, and points expired) is
      # recorded in the ledger. Using this endpoint, you can search the ledger for events.
      # 
      # Search results are sorted by `created_at` in descending order.
      #
      # @return [Square::Types::SearchLoyaltyEventsResponse]
      def search_events(request_options: {}, **params)
        _request = params
        _response = @client.send(_request)
        if _response.code >= "200" && _response.code < "300"
          return Square::Types::SearchLoyaltyEventsResponse.load(_response.body)
        else
          raise _response.body
        end
      end

    end
  end
end
