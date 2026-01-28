# frozen_string_literal: true

module Square
  module Loyalty
    class Client
      # @param client [Square::Internal::Http::RawClient]
      #
      # @return [void]
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
      # @param request_options [Hash]
      # @param params [Square::Loyalty::Types::SearchLoyaltyEventsRequest]
      # @option request_options [String] :base_url
      # @option request_options [Hash{String => Object}] :additional_headers
      # @option request_options [Hash{String => Object}] :additional_query_parameters
      # @option request_options [Hash{String => Object}] :additional_body_parameters
      # @option request_options [Integer] :timeout_in_seconds
      #
      # @return [Square::Types::SearchLoyaltyEventsResponse]
      def search_events(request_options: {}, **params)
        params = Square::Internal::Types::Utils.normalize_keys(params)
        request = Square::Internal::JSON::Request.new(
          base_url: request_options[:base_url],
          method: "POST",
          path: "v2/loyalty/events/search",
          body: Square::Loyalty::Types::SearchLoyaltyEventsRequest.new(params).to_h,
          request_options: request_options
        )
        begin
          response = @client.send(request)
        rescue Net::HTTPRequestTimeout
          raise Square::Errors::TimeoutError
        end
        code = response.code.to_i
        if code.between?(200, 299)
          Square::Types::SearchLoyaltyEventsResponse.load(response.body)
        else
          error_class = Square::Errors::ResponseError.subclass_for_code(code)
          raise error_class.new(response.body, code: code)
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
