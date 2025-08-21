# frozen_string_literal: true

module Square
  module Webhooks
    class Client
      # @return [Square::Webhooks::Client]
      def initialize(client:)
        @client = client
      end

      # @return [Square::EventTypes::Client]
      def eventTypes
        @eventTypes ||= Square::EventTypes::Client.new(client: @raw_client)
      end

      # @return [Square::Subscriptions::Client]
      def subscriptions
        @subscriptions ||= Square::Subscriptions::Client.new(client: @raw_client)
      end
    end
  end
end
