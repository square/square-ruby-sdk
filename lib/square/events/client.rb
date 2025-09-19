# frozen_string_literal: true

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
        _request = Square::Internal::JSON::Request.new(
          base_url: request_options[:base_url] || Square::Environment::PRODUCTION,
          method: "POST",
          path: "v2/events",
          body: params
        )
        begin
          _response = @client.send(_request)
        rescue Net::HTTPRequestTimeout
          raise Square::Errors::TimeoutError
        end
        code = _response.code.to_i
        if code.between?(200, 299)
          Square::Types::SearchEventsResponse.load(_response.body)
        else
          error_class = Square::Errors::ResponseError.subclass_for_code(code)
          raise error_class.new(_response.body, code: code)
        end
      end

      # Disables events to prevent them from being searchable.
      # All events are disabled by default. You must enable events to make them searchable.
      # Disabling events for a specific time period prevents them from being searchable, even if you re-enable them later.
      #
      # @return [Square::Types::DisableEventsResponse]
      def disable_events(request_options: {}, **_params)
        _request = Square::Internal::JSON::Request.new(
          base_url: request_options[:base_url] || Square::Environment::PRODUCTION,
          method: "PUT",
          path: "v2/events/disable"
        )
        begin
          _response = @client.send(_request)
        rescue Net::HTTPRequestTimeout
          raise Square::Errors::TimeoutError
        end
        code = _response.code.to_i
        if code.between?(200, 299)
          Square::Types::DisableEventsResponse.load(_response.body)
        else
          error_class = Square::Errors::ResponseError.subclass_for_code(code)
          raise error_class.new(_response.body, code: code)
        end
      end

      # Enables events to make them searchable. Only events that occur while in the enabled state are searchable.
      #
      # @return [Square::Types::EnableEventsResponse]
      def enable_events(request_options: {}, **_params)
        _request = Square::Internal::JSON::Request.new(
          base_url: request_options[:base_url] || Square::Environment::PRODUCTION,
          method: "PUT",
          path: "v2/events/enable"
        )
        begin
          _response = @client.send(_request)
        rescue Net::HTTPRequestTimeout
          raise Square::Errors::TimeoutError
        end
        code = _response.code.to_i
        if code.between?(200, 299)
          Square::Types::EnableEventsResponse.load(_response.body)
        else
          error_class = Square::Errors::ResponseError.subclass_for_code(code)
          raise error_class.new(_response.body, code: code)
        end
      end

      # Lists all event types that you can subscribe to as webhooks or query using the Events API.
      #
      # @return [Square::Types::ListEventTypesResponse]
      def list_event_types(request_options: {}, **params)
        _query_param_names = [
          ["api_version"],
          %i[api_version]
        ].flatten
        _query = params.slice(*_query_param_names)
        params.except(*_query_param_names)

        _request = Square::Internal::JSON::Request.new(
          base_url: request_options[:base_url] || Square::Environment::PRODUCTION,
          method: "GET",
          path: "v2/events/types",
          query: _query
        )
        begin
          _response = @client.send(_request)
        rescue Net::HTTPRequestTimeout
          raise Square::Errors::TimeoutError
        end
        code = _response.code.to_i
        if code.between?(200, 299)
          Square::Types::ListEventTypesResponse.load(_response.body)
        else
          error_class = Square::Errors::ResponseError.subclass_for_code(code)
          raise error_class.new(_response.body, code: code)
        end
      end
    end
  end
end
