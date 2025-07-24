# frozen_string_literal: true
require_relative "../../../requests"
require_relative "../../types/sort_order"
require_relative "../../types/list_cash_drawer_shifts_response"
require_relative "../../types/get_cash_drawer_shift_response"
require_relative "../../types/list_cash_drawer_shift_events_response"
require "async"
require "async"
require "async"
require_relative "../../../requests"

module SquareApiClient
  module CashDrawers
    class ShiftsClient
    # @return [SquareApiClient::RequestClient] 
      attr_reader :request_client


      # @param request_client [SquareApiClient::RequestClient] 
      # @return [SquareApiClient::CashDrawers::ShiftsClient]
      def initialize(request_client:)
        @request_client = request_client
      end
# Provides the details for all of the cash drawer shifts for a location
#  in a date range.
      #
      # @param location_id [String] The ID of the location to query for a list of cash drawer shifts.
      # @param sort_order [SquareApiClient::SortOrder] The order in which cash drawer shifts are listed in the response,
#  based on their opened_at field. Default value: ASC
      # @param begin_time [String] The inclusive start time of the query on opened_at, in ISO 8601 format.
      # @param end_time [String] The exclusive end date of the query on opened_at, in ISO 8601 format.
      # @param limit [Integer] Number of cash drawer shift events in a page of results (200 by
#  default, 1000 max).
      # @param cursor [String] Opaque cursor for fetching the next page of results.
      # @param request_options [SquareApiClient::RequestOptions] 
      # @return [SquareApiClient::ListCashDrawerShiftsResponse]
      # @example
#  api = SquareApiClient::Client.new(
#    base_url: "https://api.example.com",
#    environment: SquareApiClient::Environment::PRODUCTION,
#    token: "YOUR_AUTH_TOKEN",
#    version: "Version"
#  )
#  api.cash_drawers.shifts.list(location_id: "location_id")
      def list(location_id:, sort_order: nil, begin_time: nil, end_time: nil, limit: nil, cursor: nil, request_options: nil)
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
  req.params = { **(request_options&.additional_query_parameters || {}), "location_id": location_id, "sort_order": sort_order, "begin_time": begin_time, "end_time": end_time, "limit": limit, "cursor": cursor }.compact
  unless request_options.nil? || request_options&.additional_body_parameters.nil?
    req.body = { **(request_options&.additional_body_parameters || {}) }.compact
  end
  req.url "#{@request_client.get_url(request_options: request_options)}/v2/cash-drawers/shifts"
end
        SquareApiClient::ListCashDrawerShiftsResponse.from_json(json_object: response.body)
      end
# Provides the summary details for a single cash drawer shift. See
#  [ListCashDrawerShiftEvents](api-endpoint:CashDrawers-ListCashDrawerShiftEvents)
#  for a list of cash drawer shift events.
      #
      # @param shift_id [String] The shift ID.
      # @param location_id [String] The ID of the location to retrieve cash drawer shifts from.
      # @param request_options [SquareApiClient::RequestOptions] 
      # @return [SquareApiClient::GetCashDrawerShiftResponse]
      # @example
#  api = SquareApiClient::Client.new(
#    base_url: "https://api.example.com",
#    environment: SquareApiClient::Environment::PRODUCTION,
#    token: "YOUR_AUTH_TOKEN",
#    version: "Version"
#  )
#  api.cash_drawers.shifts.get(shift_id: "shift_id", location_id: "location_id")
      def get(shift_id:, location_id:, request_options: nil)
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
  req.params = { **(request_options&.additional_query_parameters || {}), "location_id": location_id }.compact
  unless request_options.nil? || request_options&.additional_body_parameters.nil?
    req.body = { **(request_options&.additional_body_parameters || {}) }.compact
  end
  req.url "#{@request_client.get_url(request_options: request_options)}/v2/cash-drawers/shifts/#{shift_id}"
end
        SquareApiClient::GetCashDrawerShiftResponse.from_json(json_object: response.body)
      end
# Provides a paginated list of events for a single cash drawer shift.
      #
      # @param shift_id [String] The shift ID.
      # @param location_id [String] The ID of the location to list cash drawer shifts for.
      # @param limit [Integer] Number of resources to be returned in a page of results (200 by
#  default, 1000 max).
      # @param cursor [String] Opaque cursor for fetching the next page of results.
      # @param request_options [SquareApiClient::RequestOptions] 
      # @return [SquareApiClient::ListCashDrawerShiftEventsResponse]
      # @example
#  api = SquareApiClient::Client.new(
#    base_url: "https://api.example.com",
#    environment: SquareApiClient::Environment::PRODUCTION,
#    token: "YOUR_AUTH_TOKEN",
#    version: "Version"
#  )
#  api.cash_drawers.shifts.list_events(shift_id: "shift_id", location_id: "location_id")
      def list_events(shift_id:, location_id:, limit: nil, cursor: nil, request_options: nil)
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
  req.params = { **(request_options&.additional_query_parameters || {}), "location_id": location_id, "limit": limit, "cursor": cursor }.compact
  unless request_options.nil? || request_options&.additional_body_parameters.nil?
    req.body = { **(request_options&.additional_body_parameters || {}) }.compact
  end
  req.url "#{@request_client.get_url(request_options: request_options)}/v2/cash-drawers/shifts/#{shift_id}/events"
end
        SquareApiClient::ListCashDrawerShiftEventsResponse.from_json(json_object: response.body)
      end
    end
    class AsyncShiftsClient
    # @return [SquareApiClient::AsyncRequestClient] 
      attr_reader :request_client


      # @param request_client [SquareApiClient::RequestClient] 
      # @return [SquareApiClient::CashDrawers::AsyncShiftsClient]
      def initialize(request_client:)
        @request_client = request_client
      end
# Provides the details for all of the cash drawer shifts for a location
#  in a date range.
      #
      # @param location_id [String] The ID of the location to query for a list of cash drawer shifts.
      # @param sort_order [SquareApiClient::SortOrder] The order in which cash drawer shifts are listed in the response,
#  based on their opened_at field. Default value: ASC
      # @param begin_time [String] The inclusive start time of the query on opened_at, in ISO 8601 format.
      # @param end_time [String] The exclusive end date of the query on opened_at, in ISO 8601 format.
      # @param limit [Integer] Number of cash drawer shift events in a page of results (200 by
#  default, 1000 max).
      # @param cursor [String] Opaque cursor for fetching the next page of results.
      # @param request_options [SquareApiClient::RequestOptions] 
      # @return [SquareApiClient::ListCashDrawerShiftsResponse]
      # @example
#  api = SquareApiClient::Client.new(
#    base_url: "https://api.example.com",
#    environment: SquareApiClient::Environment::PRODUCTION,
#    token: "YOUR_AUTH_TOKEN",
#    version: "Version"
#  )
#  api.cash_drawers.shifts.list(location_id: "location_id")
      def list(location_id:, sort_order: nil, begin_time: nil, end_time: nil, limit: nil, cursor: nil, request_options: nil)
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
  req.params = { **(request_options&.additional_query_parameters || {}), "location_id": location_id, "sort_order": sort_order, "begin_time": begin_time, "end_time": end_time, "limit": limit, "cursor": cursor }.compact
  unless request_options.nil? || request_options&.additional_body_parameters.nil?
    req.body = { **(request_options&.additional_body_parameters || {}) }.compact
  end
  req.url "#{@request_client.get_url(request_options: request_options)}/v2/cash-drawers/shifts"
end
          SquareApiClient::ListCashDrawerShiftsResponse.from_json(json_object: response.body)
        end
      end
# Provides the summary details for a single cash drawer shift. See
#  [ListCashDrawerShiftEvents](api-endpoint:CashDrawers-ListCashDrawerShiftEvents)
#  for a list of cash drawer shift events.
      #
      # @param shift_id [String] The shift ID.
      # @param location_id [String] The ID of the location to retrieve cash drawer shifts from.
      # @param request_options [SquareApiClient::RequestOptions] 
      # @return [SquareApiClient::GetCashDrawerShiftResponse]
      # @example
#  api = SquareApiClient::Client.new(
#    base_url: "https://api.example.com",
#    environment: SquareApiClient::Environment::PRODUCTION,
#    token: "YOUR_AUTH_TOKEN",
#    version: "Version"
#  )
#  api.cash_drawers.shifts.get(shift_id: "shift_id", location_id: "location_id")
      def get(shift_id:, location_id:, request_options: nil)
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
  req.params = { **(request_options&.additional_query_parameters || {}), "location_id": location_id }.compact
  unless request_options.nil? || request_options&.additional_body_parameters.nil?
    req.body = { **(request_options&.additional_body_parameters || {}) }.compact
  end
  req.url "#{@request_client.get_url(request_options: request_options)}/v2/cash-drawers/shifts/#{shift_id}"
end
          SquareApiClient::GetCashDrawerShiftResponse.from_json(json_object: response.body)
        end
      end
# Provides a paginated list of events for a single cash drawer shift.
      #
      # @param shift_id [String] The shift ID.
      # @param location_id [String] The ID of the location to list cash drawer shifts for.
      # @param limit [Integer] Number of resources to be returned in a page of results (200 by
#  default, 1000 max).
      # @param cursor [String] Opaque cursor for fetching the next page of results.
      # @param request_options [SquareApiClient::RequestOptions] 
      # @return [SquareApiClient::ListCashDrawerShiftEventsResponse]
      # @example
#  api = SquareApiClient::Client.new(
#    base_url: "https://api.example.com",
#    environment: SquareApiClient::Environment::PRODUCTION,
#    token: "YOUR_AUTH_TOKEN",
#    version: "Version"
#  )
#  api.cash_drawers.shifts.list_events(shift_id: "shift_id", location_id: "location_id")
      def list_events(shift_id:, location_id:, limit: nil, cursor: nil, request_options: nil)
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
  req.params = { **(request_options&.additional_query_parameters || {}), "location_id": location_id, "limit": limit, "cursor": cursor }.compact
  unless request_options.nil? || request_options&.additional_body_parameters.nil?
    req.body = { **(request_options&.additional_body_parameters || {}) }.compact
  end
  req.url "#{@request_client.get_url(request_options: request_options)}/v2/cash-drawers/shifts/#{shift_id}/events"
end
          SquareApiClient::ListCashDrawerShiftEventsResponse.from_json(json_object: response.body)
        end
      end
    end
  end
end