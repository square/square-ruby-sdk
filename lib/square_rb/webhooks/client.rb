# frozen_string_literal: true
require_relative "../../requests"
require_relative "event_types/client"
require_relative "subscriptions/client"
require_relative "../../requests"

module SquareApiClient
  module Webhooks
    class Client
    # @return [SquareApiClient::Webhooks::EventTypesClient] 
      attr_reader :event_types
    # @return [SquareApiClient::Webhooks::SubscriptionsClient] 
      attr_reader :subscriptions


      # @param request_client [SquareApiClient::RequestClient] 
      # @return [SquareApiClient::Webhooks::Client]
      def initialize(request_client:)
        @event_types = SquareApiClient::Webhooks::EventTypesClient.new(request_client: request_client)
        @subscriptions = SquareApiClient::Webhooks::SubscriptionsClient.new(request_client: request_client)
      end
    end
    class AsyncClient
    # @return [SquareApiClient::Webhooks::AsyncEventTypesClient] 
      attr_reader :event_types
    # @return [SquareApiClient::Webhooks::AsyncSubscriptionsClient] 
      attr_reader :subscriptions


      # @param request_client [SquareApiClient::AsyncRequestClient] 
      # @return [SquareApiClient::Webhooks::AsyncClient]
      def initialize(request_client:)
        @event_types = SquareApiClient::Webhooks::AsyncEventTypesClient.new(request_client: request_client)
        @subscriptions = SquareApiClient::Webhooks::AsyncSubscriptionsClient.new(request_client: request_client)
      end
    end
  end
end