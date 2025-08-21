# frozen_string_literal: true

module Square
  module CashDrawers
    class Client
      # @return [Square::CashDrawers::Client]
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
