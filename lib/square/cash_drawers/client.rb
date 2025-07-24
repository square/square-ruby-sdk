# frozen_string_literal: true
require_relative "../../requests"
require_relative "shifts/client"
require_relative "../../requests"

module square.rb
  module CashDrawers
    class Client
    # @return [square.rb::CashDrawers::ShiftsClient] 
      attr_reader :shifts


      # @param request_client [square.rb::RequestClient] 
      # @return [square.rb::CashDrawers::Client]
      def initialize(request_client:)
        @shifts = square.rb::CashDrawers::ShiftsClient.new(request_client: request_client)
      end
    end
    class AsyncClient
    # @return [square.rb::CashDrawers::AsyncShiftsClient] 
      attr_reader :shifts


      # @param request_client [square.rb::AsyncRequestClient] 
      # @return [square.rb::CashDrawers::AsyncClient]
      def initialize(request_client:)
        @shifts = square.rb::CashDrawers::AsyncShiftsClient.new(request_client: request_client)
      end
    end
  end
end