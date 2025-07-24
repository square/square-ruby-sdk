# frozen_string_literal: true
require_relative "../../requests"
require_relative "../types/search_events_query"
require_relative "../types/search_events_response"
require_relative "../types/disable_events_response"
require_relative "../types/enable_events_response"
require_relative "../types/list_event_types_response"
require "async"
require "async"
require "async"
require "async"
require_relative "../../requests"

module square.rb
  class EventsClient
  # @return [square.rb::RequestClient] 
    attr_reader :request_client


    # @param request_client [square.rb::RequestClient] 
    # @return [square.rb::EventsClient]
    def initialize(request_client:)
      @request_client = request_client
    end
# Search for Square API events that occur within a 28-day timeframe.
    #
    # @param cursor [String] A pagination cursor returned by a previous call to this endpoint. Provide this
#  cursor to retrieve the next set of events for your original query.
#  For more information, see
#  ttps://developer.squareup.com/docs/build-basics/common-api-patterns/pagination).
    # @param limit [Integer] The maximum number of events to return in a single page. The response might
#  contain fewer events. The default value is 100, which is also the maximum
#  allowed value.
#  For more information, see
#  ttps://developer.squareup.com/docs/build-basics/common-api-patterns/pagination).
#  Default: 100
    # @param query [Hash] The filtering and sorting criteria for the search request. To retrieve
#  additional pages using a cursor, you must use the original query.Request of type square.rb::SearchEventsQuery, as a Hash
    #   * :filter (Hash)
    #     * :event_types (Array<String>) 
    #     * :merchant_ids (Array<String>) 
    #     * :location_ids (Array<String>) 
    #     * :created_at (Hash)
    #       * :start_at (String) 
    #       * :end_at (String) 
    #   * :sort (Hash)
    #     * :field (square.rb::SEARCH_EVENTS_SORT_FIELD) 
    #     * :order (square.rb::SortOrder) 
    # @param request_options [square.rb::RequestOptions] 
    # @return [square.rb::SearchEventsResponse]
    # @example
#  api = square.rb::Client.new(
#    base_url: "https://api.example.com",
#    environment: square.rb::Environment::PRODUCTION,
#    token: "YOUR_AUTH_TOKEN",
#    version: "Version"
#  )
#  api.events.search_events
    def search_events(cursor: nil, limit: nil, query: nil, request_options: nil)
      response = @request_client.conn.post do | req |
  unless request_options&.timeout_in_seconds.nil?
    req.options.timeout = request_options.timeout_in_seconds
  end
  unless request_options&.token.nil?
    req.headers["Authorization"] = request_options.token
  end
  unless request_options&.version.nil?
    req.headers["Square-Version"] = request_options.version
  end
  req.headers = { **(req.headers || {}), **@request_client.get_headers, **(request_options&.additional_headers || {}) }.compact
  unless request_options.nil? || request_options&.additional_query_parameters.nil?
    req.params = { **(request_options&.additional_query_parameters || {}) }.compact
  end
  req.body = { **(request_options&.additional_body_parameters || {}), cursor: cursor, limit: limit, query: query }.compact
  req.url "#{@request_client.get_url(request_options: request_options)}/v2/events"
end
      square.rb::SearchEventsResponse.from_json(json_object: response.body)
    end
# Disables events to prevent them from being searchable.
#  All events are disabled by default. You must enable events to make them
#  searchable.
#  Disabling events for a specific time period prevents them from being searchable,
#  even if you re-enable them later.
    #
    # @param request_options [square.rb::RequestOptions] 
    # @return [square.rb::DisableEventsResponse]
    # @example
#  api = square.rb::Client.new(
#    base_url: "https://api.example.com",
#    environment: square.rb::Environment::PRODUCTION,
#    token: "YOUR_AUTH_TOKEN",
#    version: "Version"
#  )
#  api.events.disable_events
    def disable_events(request_options: nil)
      response = @request_client.conn.put do | req |
  unless request_options&.timeout_in_seconds.nil?
    req.options.timeout = request_options.timeout_in_seconds
  end
  unless request_options&.token.nil?
    req.headers["Authorization"] = request_options.token
  end
  unless request_options&.version.nil?
    req.headers["Square-Version"] = request_options.version
  end
  req.headers = { **(req.headers || {}), **@request_client.get_headers, **(request_options&.additional_headers || {}) }.compact
  unless request_options.nil? || request_options&.additional_query_parameters.nil?
    req.params = { **(request_options&.additional_query_parameters || {}) }.compact
  end
  unless request_options.nil? || request_options&.additional_body_parameters.nil?
    req.body = { **(request_options&.additional_body_parameters || {}) }.compact
  end
  req.url "#{@request_client.get_url(request_options: request_options)}/v2/events/disable"
end
      square.rb::DisableEventsResponse.from_json(json_object: response.body)
    end
# Enables events to make them searchable. Only events that occur while in the
#  enabled state are searchable.
    #
    # @param request_options [square.rb::RequestOptions] 
    # @return [square.rb::EnableEventsResponse]
    # @example
#  api = square.rb::Client.new(
#    base_url: "https://api.example.com",
#    environment: square.rb::Environment::PRODUCTION,
#    token: "YOUR_AUTH_TOKEN",
#    version: "Version"
#  )
#  api.events.enable_events
    def enable_events(request_options: nil)
      response = @request_client.conn.put do | req |
  unless request_options&.timeout_in_seconds.nil?
    req.options.timeout = request_options.timeout_in_seconds
  end
  unless request_options&.token.nil?
    req.headers["Authorization"] = request_options.token
  end
  unless request_options&.version.nil?
    req.headers["Square-Version"] = request_options.version
  end
  req.headers = { **(req.headers || {}), **@request_client.get_headers, **(request_options&.additional_headers || {}) }.compact
  unless request_options.nil? || request_options&.additional_query_parameters.nil?
    req.params = { **(request_options&.additional_query_parameters || {}) }.compact
  end
  unless request_options.nil? || request_options&.additional_body_parameters.nil?
    req.body = { **(request_options&.additional_body_parameters || {}) }.compact
  end
  req.url "#{@request_client.get_url(request_options: request_options)}/v2/events/enable"
end
      square.rb::EnableEventsResponse.from_json(json_object: response.body)
    end
# Lists all event types that you can subscribe to as webhooks or query using the
#  Events API.
    #
    # @param api_version [String] The API version for which to list event types. Setting this field overrides the
#  default version used by the application.
    # @param request_options [square.rb::RequestOptions] 
    # @return [square.rb::ListEventTypesResponse]
    # @example
#  api = square.rb::Client.new(
#    base_url: "https://api.example.com",
#    environment: square.rb::Environment::PRODUCTION,
#    token: "YOUR_AUTH_TOKEN",
#    version: "Version"
#  )
#  api.events.list_event_types
    def list_event_types(api_version: nil, request_options: nil)
      response = @request_client.conn.get do | req |
  unless request_options&.timeout_in_seconds.nil?
    req.options.timeout = request_options.timeout_in_seconds
  end
  unless request_options&.token.nil?
    req.headers["Authorization"] = request_options.token
  end
  unless request_options&.version.nil?
    req.headers["Square-Version"] = request_options.version
  end
  req.headers = { **(req.headers || {}), **@request_client.get_headers, **(request_options&.additional_headers || {}) }.compact
  req.params = { **(request_options&.additional_query_parameters || {}), "api_version": api_version }.compact
  unless request_options.nil? || request_options&.additional_body_parameters.nil?
    req.body = { **(request_options&.additional_body_parameters || {}) }.compact
  end
  req.url "#{@request_client.get_url(request_options: request_options)}/v2/events/types"
end
      square.rb::ListEventTypesResponse.from_json(json_object: response.body)
    end
  end
  class AsyncEventsClient
  # @return [square.rb::AsyncRequestClient] 
    attr_reader :request_client


    # @param request_client [square.rb::RequestClient] 
    # @return [square.rb::AsyncEventsClient]
    def initialize(request_client:)
      @request_client = request_client
    end
# Search for Square API events that occur within a 28-day timeframe.
    #
    # @param cursor [String] A pagination cursor returned by a previous call to this endpoint. Provide this
#  cursor to retrieve the next set of events for your original query.
#  For more information, see
#  ttps://developer.squareup.com/docs/build-basics/common-api-patterns/pagination).
    # @param limit [Integer] The maximum number of events to return in a single page. The response might
#  contain fewer events. The default value is 100, which is also the maximum
#  allowed value.
#  For more information, see
#  ttps://developer.squareup.com/docs/build-basics/common-api-patterns/pagination).
#  Default: 100
    # @param query [Hash] The filtering and sorting criteria for the search request. To retrieve
#  additional pages using a cursor, you must use the original query.Request of type square.rb::SearchEventsQuery, as a Hash
    #   * :filter (Hash)
    #     * :event_types (Array<String>) 
    #     * :merchant_ids (Array<String>) 
    #     * :location_ids (Array<String>) 
    #     * :created_at (Hash)
    #       * :start_at (String) 
    #       * :end_at (String) 
    #   * :sort (Hash)
    #     * :field (square.rb::SEARCH_EVENTS_SORT_FIELD) 
    #     * :order (square.rb::SortOrder) 
    # @param request_options [square.rb::RequestOptions] 
    # @return [square.rb::SearchEventsResponse]
    # @example
#  api = square.rb::Client.new(
#    base_url: "https://api.example.com",
#    environment: square.rb::Environment::PRODUCTION,
#    token: "YOUR_AUTH_TOKEN",
#    version: "Version"
#  )
#  api.events.search_events
    def search_events(cursor: nil, limit: nil, query: nil, request_options: nil)
      Async do
        response = @request_client.conn.post do | req |
  unless request_options&.timeout_in_seconds.nil?
    req.options.timeout = request_options.timeout_in_seconds
  end
  unless request_options&.token.nil?
    req.headers["Authorization"] = request_options.token
  end
  unless request_options&.version.nil?
    req.headers["Square-Version"] = request_options.version
  end
  req.headers = { **(req.headers || {}), **@request_client.get_headers, **(request_options&.additional_headers || {}) }.compact
  unless request_options.nil? || request_options&.additional_query_parameters.nil?
    req.params = { **(request_options&.additional_query_parameters || {}) }.compact
  end
  req.body = { **(request_options&.additional_body_parameters || {}), cursor: cursor, limit: limit, query: query }.compact
  req.url "#{@request_client.get_url(request_options: request_options)}/v2/events"
end
        square.rb::SearchEventsResponse.from_json(json_object: response.body)
      end
    end
# Disables events to prevent them from being searchable.
#  All events are disabled by default. You must enable events to make them
#  searchable.
#  Disabling events for a specific time period prevents them from being searchable,
#  even if you re-enable them later.
    #
    # @param request_options [square.rb::RequestOptions] 
    # @return [square.rb::DisableEventsResponse]
    # @example
#  api = square.rb::Client.new(
#    base_url: "https://api.example.com",
#    environment: square.rb::Environment::PRODUCTION,
#    token: "YOUR_AUTH_TOKEN",
#    version: "Version"
#  )
#  api.events.disable_events
    def disable_events(request_options: nil)
      Async do
        response = @request_client.conn.put do | req |
  unless request_options&.timeout_in_seconds.nil?
    req.options.timeout = request_options.timeout_in_seconds
  end
  unless request_options&.token.nil?
    req.headers["Authorization"] = request_options.token
  end
  unless request_options&.version.nil?
    req.headers["Square-Version"] = request_options.version
  end
  req.headers = { **(req.headers || {}), **@request_client.get_headers, **(request_options&.additional_headers || {}) }.compact
  unless request_options.nil? || request_options&.additional_query_parameters.nil?
    req.params = { **(request_options&.additional_query_parameters || {}) }.compact
  end
  unless request_options.nil? || request_options&.additional_body_parameters.nil?
    req.body = { **(request_options&.additional_body_parameters || {}) }.compact
  end
  req.url "#{@request_client.get_url(request_options: request_options)}/v2/events/disable"
end
        square.rb::DisableEventsResponse.from_json(json_object: response.body)
      end
    end
# Enables events to make them searchable. Only events that occur while in the
#  enabled state are searchable.
    #
    # @param request_options [square.rb::RequestOptions] 
    # @return [square.rb::EnableEventsResponse]
    # @example
#  api = square.rb::Client.new(
#    base_url: "https://api.example.com",
#    environment: square.rb::Environment::PRODUCTION,
#    token: "YOUR_AUTH_TOKEN",
#    version: "Version"
#  )
#  api.events.enable_events
    def enable_events(request_options: nil)
      Async do
        response = @request_client.conn.put do | req |
  unless request_options&.timeout_in_seconds.nil?
    req.options.timeout = request_options.timeout_in_seconds
  end
  unless request_options&.token.nil?
    req.headers["Authorization"] = request_options.token
  end
  unless request_options&.version.nil?
    req.headers["Square-Version"] = request_options.version
  end
  req.headers = { **(req.headers || {}), **@request_client.get_headers, **(request_options&.additional_headers || {}) }.compact
  unless request_options.nil? || request_options&.additional_query_parameters.nil?
    req.params = { **(request_options&.additional_query_parameters || {}) }.compact
  end
  unless request_options.nil? || request_options&.additional_body_parameters.nil?
    req.body = { **(request_options&.additional_body_parameters || {}) }.compact
  end
  req.url "#{@request_client.get_url(request_options: request_options)}/v2/events/enable"
end
        square.rb::EnableEventsResponse.from_json(json_object: response.body)
      end
    end
# Lists all event types that you can subscribe to as webhooks or query using the
#  Events API.
    #
    # @param api_version [String] The API version for which to list event types. Setting this field overrides the
#  default version used by the application.
    # @param request_options [square.rb::RequestOptions] 
    # @return [square.rb::ListEventTypesResponse]
    # @example
#  api = square.rb::Client.new(
#    base_url: "https://api.example.com",
#    environment: square.rb::Environment::PRODUCTION,
#    token: "YOUR_AUTH_TOKEN",
#    version: "Version"
#  )
#  api.events.list_event_types
    def list_event_types(api_version: nil, request_options: nil)
      Async do
        response = @request_client.conn.get do | req |
  unless request_options&.timeout_in_seconds.nil?
    req.options.timeout = request_options.timeout_in_seconds
  end
  unless request_options&.token.nil?
    req.headers["Authorization"] = request_options.token
  end
  unless request_options&.version.nil?
    req.headers["Square-Version"] = request_options.version
  end
  req.headers = { **(req.headers || {}), **@request_client.get_headers, **(request_options&.additional_headers || {}) }.compact
  req.params = { **(request_options&.additional_query_parameters || {}), "api_version": api_version }.compact
  unless request_options.nil? || request_options&.additional_body_parameters.nil?
    req.body = { **(request_options&.additional_body_parameters || {}) }.compact
  end
  req.url "#{@request_client.get_url(request_options: request_options)}/v2/events/types"
end
        square.rb::ListEventTypesResponse.from_json(json_object: response.body)
      end
    end
  end
end