# frozen_string_literal: true

module Square
  module CashDrawers
    class Client
      # @param client [Square::Internal::Http::RawClient]
      #
      # @return [void]
      def initialize(client:)
        @client = client
      end

      # @return [Square::Shifts::Client]
      def shifts
        @shifts ||= Square::CashDrawers::Shifts::Client.new(client: @client)
      end
    end
  end
end
