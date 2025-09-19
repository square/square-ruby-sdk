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
          base_url: request_options[:base_url] || Square::Environment::PRODUCTION,
          method: "POST",
          path: "v2/loyalty/events/search",
          body: params
        )
        begin
          _response = @client.send(_request)
        rescue Net::HTTPRequestTimeout
          raise Square::Errors::TimeoutError
        end
        code = _response.code.to_i
        if code.between?(200, 299)
          Square::Types::SearchLoyaltyEventsResponse.load(_response.body)
        else
          error_class = Square::Errors::ResponseError.subclass_for_code(code)
          raise error_class.new(_response.body, code: code)
        end
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
