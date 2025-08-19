
module Square
  module Events
    class Client
      # @return [Square::Events::Client]
      def initialize(client:)
        @client = client
      end

      # Search for Square API events that occur within a 28-day timeframe.
      #
      # @return [Square::Types::SearchEventsResponse]
      def search_events(request_options: {}, **params)
        _request = params
        _response = @client.send(_request)
        if _response.code >= "200" && _response.code < "300"
          return Square::Types::SearchEventsResponse.load(_response.body)
        else
          raise _response.body
        end
      end

      # Disables events to prevent them from being searchable.
      # All events are disabled by default. You must enable events to make them searchable.
      # Disabling events for a specific time period prevents them from being searchable, even if you re-enable them later.
      #
      # @return [Square::Types::DisableEventsResponse]
      def disable_events(request_options: {}, **params)
        _request = params
        _response = @client.send(_request)
        if _response.code >= "200" && _response.code < "300"
          return Square::Types::DisableEventsResponse.load(_response.body)
        else
          raise _response.body
        end
      end

      # Enables events to make them searchable. Only events that occur while in the enabled state are searchable.
      #
      # @return [Square::Types::EnableEventsResponse]
      def enable_events(request_options: {}, **params)
        _request = params
        _response = @client.send(_request)
        if _response.code >= "200" && _response.code < "300"
          return Square::Types::EnableEventsResponse.load(_response.body)
        else
          raise _response.body
        end
      end

      # Lists all event types that you can subscribe to as webhooks or query using the Events API.
      #
      # @return [Square::Types::ListEventTypesResponse]
      def list_event_types(request_options: {}, **params)
        _request = params
        _response = @client.send(_request)
        if _response.code >= "200" && _response.code < "300"
          return Square::Types::ListEventTypesResponse.load(_response.body)
        else
          raise _response.body
        end
      end

    end
  end
end
