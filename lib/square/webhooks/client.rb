# frozen_string_literal: true

module Square
  module Webhooks
    class Client
      # @return [Square::Webhooks::Client]
      def initialize(client:)
        @client = client
      end
    end
  end
end
