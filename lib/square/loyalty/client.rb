# frozen_string_literal: true

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
        _request = Square::Internal::JSON::Request.new(
          base_url: request_options[:base_url] || Square::Environment::SANDBOX,
          method: "POST",
          path: "v2/loyalty/events/search",
          body: params
        )
        _response = @client.send(_request)
        if _response.code >= "200" && _response.code < "300"
          return Square::Types::SearchLoyaltyEventsResponse.load(_response.body)
        end

        raise _response.body
      end

      # @return [Square::Accounts::Client]
      def accounts
        @accounts ||= Square::Loyalty::Accounts::Client.new(client: @client)
      end

      # @return [Square::Programs::Client]
      def programs
        @programs ||= Square::Loyalty::Programs::Client.new(client: @client)
      end

      # @return [Square::Rewards::Client]
      def rewards
        @rewards ||= Square::Loyalty::Rewards::Client.new(client: @client)
      end
    end
  end
end
