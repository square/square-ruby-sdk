# frozen_string_literal: true
require_relative "../../requests"
require_relative "shifts/client"
require_relative "../../requests"

module SquareApiClient
  module CashDrawers
    class Client
    # @return [SquareApiClient::CashDrawers::ShiftsClient] 
      attr_reader :shifts


      # @param request_client [SquareApiClient::RequestClient] 
      # @return [SquareApiClient::CashDrawers::Client]
      def initialize(request_client:)
        @shifts = SquareApiClient::CashDrawers::ShiftsClient.new(request_client: request_client)
      end
    end
    class AsyncClient
    # @return [SquareApiClient::CashDrawers::AsyncShiftsClient] 
      attr_reader :shifts


      # @param request_client [SquareApiClient::AsyncRequestClient] 
      # @return [SquareApiClient::CashDrawers::AsyncClient]
      def initialize(request_client:)
        @shifts = SquareApiClient::CashDrawers::AsyncShiftsClient.new(request_client: request_client)
      end
    end
  end
end