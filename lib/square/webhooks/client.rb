# frozen_string_literal: true

module Square
  module Webhooks
    class Client
      # @param client [Square::Internal::Http::RawClient]
      #
      # @return [void]
      def initialize(client:)
        @client = client
      end

      # @return [Square::EventTypes::Client]
      def event_types
        @event_types ||= Square::Webhooks::EventTypes::Client.new(client: @client)
      end

      # @return [Square::Subscriptions::Client]
      def subscriptions
        @subscriptions ||= Square::Webhooks::Subscriptions::Client.new(client: @client)
      end
    end
  end
end
