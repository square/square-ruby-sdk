# frozen_string_literal: true

module Square
  module CashDrawers
    module Shifts
      class Client
        # @param client [Square::Internal::Http::RawClient]
        #
        # @return [void]
        def initialize(client:)
          @client = client
        end

        # Provides the details for all of the cash drawer shifts for a location
        # in a date range.
        #
        # Returns a `Square::Internal::CursorItemIterator` that yields each `Square::Types::CashDrawerShiftSummary` in
        # the `cash_drawer_shifts` field of every page, requesting pages as they are needed. Call `pages` on it to get
        # each page as a `Square::Types::ListCashDrawerShiftsResponse`, including its other fields.
        #
        # No request is sent by this call. The first page is requested when you start iterating (or call
        # `load_first_page`), so an API error is raised by the loop (or by `load_first_page`), not by this call.
        #
        # @param request_options [Hash]
        # @param params [Hash]
        # @option request_options [String] :base_url
        # @option request_options [Hash{String => Object}] :additional_headers
        # @option request_options [Hash{String => Object}] :additional_query_parameters
        # @option request_options [Hash{String => Object}] :additional_body_parameters
        # @option request_options [Integer] :timeout_in_seconds
        # @option params [String] :location_id
        # @option params [Square::Types::SortOrder, nil] :sort_order
        # @option params [String, nil] :begin_time
        # @option params [String, nil] :end_time
        # @option params [Integer, nil] :limit
        # @option params [String, nil] :cursor
        #
        # @example
        #   client.cash_drawers.shifts.list(
        #     location_id: "location_id",
        #     sort_order: "DESC",
        #     begin_time: "begin_time",
        #     end_time: "end_time",
        #     limit: 1,
        #     cursor: "cursor"
        #   )
        #
        # @return [Square::Internal::CursorItemIterator]
        def list(request_options: {}, **params)
          params = Square::Internal::Types::Utils.normalize_keys(params)
          query_params = {}
          query_params["location_id"] = params[:location_id] if params.key?(:location_id)
          query_params["sort_order"] = params[:sort_order] if params.key?(:sort_order)
          query_params["begin_time"] = params[:begin_time] if params.key?(:begin_time)
          query_params["end_time"] = params[:end_time] if params.key?(:end_time)
          query_params["limit"] = params[:limit] if params.key?(:limit)
          query_params["cursor"] = params[:cursor] if params.key?(:cursor)

          Square::Internal::CursorItemIterator.new(
            cursor_field: :cursor,
            item_field: :cash_drawer_shifts,
            initial_cursor: query_params["cursor"]
          ) do |next_cursor|
            query_params["cursor"] = next_cursor
            request = Square::Internal::JSON::Request.new(
              base_url: request_options[:base_url],
              method: "GET",
              path: "v2/cash-drawers/shifts",
              query: query_params,
              request_options: request_options
            )
            begin
              response = @client.send(request)
            rescue Net::HTTPRequestTimeout
              raise Square::Errors::TimeoutError
            end
            code = response.code.to_i
            if code.between?(200, 299)
              parsed_response = (response.body.to_s.empty? ? nil : Square::Types::ListCashDrawerShiftsResponse.load(response.body))
              [parsed_response, response]
            else
              error_class = Square::Errors::ResponseError.subclass_for_code(code)
              raise error_class.new(response.body, code: code)
            end
          end
        end

        # Provides the summary details for a single cash drawer shift. See
        # [ListCashDrawerShiftEvents](api-endpoint:CashDrawers-ListCashDrawerShiftEvents) for a list of cash drawer
        # shift events.
        #
        # @param request_options [Hash]
        # @param params [Hash]
        # @option request_options [String] :base_url
        # @option request_options [Hash{String => Object}] :additional_headers
        # @option request_options [Hash{String => Object}] :additional_query_parameters
        # @option request_options [Hash{String => Object}] :additional_body_parameters
        # @option request_options [Integer] :timeout_in_seconds
        # @option params [String] :shift_id
        # @option params [String] :location_id
        #
        # @example
        #   client.cash_drawers.shifts.get(
        #     shift_id: "shift_id",
        #     location_id: "location_id"
        #   )
        #
        # @return [Square::Types::GetCashDrawerShiftResponse]
        def get(request_options: {}, **params)
          params = Square::Internal::Types::Utils.normalize_keys(params)
          query_params = {}
          query_params["location_id"] = params[:location_id] if params.key?(:location_id)

          request = Square::Internal::JSON::Request.new(
            base_url: request_options[:base_url],
            method: "GET",
            path: "v2/cash-drawers/shifts/#{URI.encode_uri_component(params[:shift_id].to_s)}",
            query: query_params,
            request_options: request_options
          )
          begin
            response = @client.send(request)
          rescue Net::HTTPRequestTimeout
            raise Square::Errors::TimeoutError
          end
          code = response.code.to_i
          if code.between?(200, 299)
            (response.body.to_s.empty? ? nil : Square::Types::GetCashDrawerShiftResponse.load(response.body))
          else
            error_class = Square::Errors::ResponseError.subclass_for_code(code)
            raise error_class.new(response.body, code: code)
          end
        end

        # Provides a paginated list of events for a single cash drawer shift.
        #
        # Returns a `Square::Internal::CursorItemIterator` that yields each `Square::Types::CashDrawerShiftEvent` in the
        # `cash_drawer_shift_events` field of every page, requesting pages as they are needed. Call `pages` on it to get
        # each page as a `Square::Types::ListCashDrawerShiftEventsResponse`, including its other fields.
        #
        # No request is sent by this call. The first page is requested when you start iterating (or call
        # `load_first_page`), so an API error is raised by the loop (or by `load_first_page`), not by this call.
        #
        # @param request_options [Hash]
        # @param params [Hash]
        # @option request_options [String] :base_url
        # @option request_options [Hash{String => Object}] :additional_headers
        # @option request_options [Hash{String => Object}] :additional_query_parameters
        # @option request_options [Hash{String => Object}] :additional_body_parameters
        # @option request_options [Integer] :timeout_in_seconds
        # @option params [String] :shift_id
        # @option params [String] :location_id
        # @option params [Integer, nil] :limit
        # @option params [String, nil] :cursor
        #
        # @example
        #   client.cash_drawers.shifts.list_events(
        #     shift_id: "shift_id",
        #     location_id: "location_id",
        #     limit: 1,
        #     cursor: "cursor"
        #   )
        #
        # @return [Square::Internal::CursorItemIterator]
        def list_events(request_options: {}, **params)
          params = Square::Internal::Types::Utils.normalize_keys(params)
          query_params = {}
          query_params["location_id"] = params[:location_id] if params.key?(:location_id)
          query_params["limit"] = params[:limit] if params.key?(:limit)
          query_params["cursor"] = params[:cursor] if params.key?(:cursor)

          Square::Internal::CursorItemIterator.new(
            cursor_field: :cursor,
            item_field: :cash_drawer_shift_events,
            initial_cursor: query_params["cursor"]
          ) do |next_cursor|
            query_params["cursor"] = next_cursor
            request = Square::Internal::JSON::Request.new(
              base_url: request_options[:base_url],
              method: "GET",
              path: "v2/cash-drawers/shifts/#{URI.encode_uri_component(params[:shift_id].to_s)}/events",
              query: query_params,
              request_options: request_options
            )
            begin
              response = @client.send(request)
            rescue Net::HTTPRequestTimeout
              raise Square::Errors::TimeoutError
            end
            code = response.code.to_i
            if code.between?(200, 299)
              parsed_response = (response.body.to_s.empty? ? nil : Square::Types::ListCashDrawerShiftEventsResponse.load(response.body))
              [parsed_response, response]
            else
              error_class = Square::Errors::ResponseError.subclass_for_code(code)
              raise error_class.new(response.body, code: code)
            end
          end
        end
      end
    end
  end
end
