# frozen_string_literal: true
require_relative "../../requests"
require_relative "event_types/client"
require_relative "subscriptions/client"
require_relative "../../requests"

module square.rb
  module Webhooks
    class Client
    # @return [square.rb::Webhooks::EventTypesClient] 
      attr_reader :event_types
    # @return [square.rb::Webhooks::SubscriptionsClient] 
      attr_reader :subscriptions


      # @param request_client [square.rb::RequestClient] 
      # @return [square.rb::Webhooks::Client]
      def initialize(request_client:)
        @event_types = square.rb::Webhooks::EventTypesClient.new(request_client: request_client)
        @subscriptions = square.rb::Webhooks::SubscriptionsClient.new(request_client: request_client)
      end
    end
    class AsyncClient
    # @return [square.rb::Webhooks::AsyncEventTypesClient] 
      attr_reader :event_types
    # @return [square.rb::Webhooks::AsyncSubscriptionsClient] 
      attr_reader :subscriptions


      # @param request_client [square.rb::AsyncRequestClient] 
      # @return [square.rb::Webhooks::AsyncClient]
      def initialize(request_client:)
        @event_types = square.rb::Webhooks::AsyncEventTypesClient.new(request_client: request_client)
        @subscriptions = square.rb::Webhooks::AsyncSubscriptionsClient.new(request_client: request_client)
      end
    end
  end
end