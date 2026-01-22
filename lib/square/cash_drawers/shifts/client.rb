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
        # @return [Square::Types::ListCashDrawerShiftsResponse]
        def list(request_options: {}, **params)
          params = Square::Internal::Types::Utils.symbolize_keys(params)
          query_param_names = %i[location_id sort_order begin_time end_time limit cursor]
          query_params = {}
          query_params["location_id"] = params[:location_id] if params.key?(:location_id)
          query_params["sort_order"] = params[:sort_order] if params.key?(:sort_order)
          query_params["begin_time"] = params[:begin_time] if params.key?(:begin_time)
          query_params["end_time"] = params[:end_time] if params.key?(:end_time)
          query_params["limit"] = params[:limit] if params.key?(:limit)
          query_params["cursor"] = params[:cursor] if params.key?(:cursor)
          params.except(*query_param_names)

          Square::Internal::CursorItemIterator.new(
            cursor_field: :cursor,
            item_field: :cash_drawer_shifts,
            initial_cursor: query_params[:cursor]
          ) do |next_cursor|
            query_params[:cursor] = next_cursor
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
              Square::Types::ListCashDrawerShiftsResponse.load(response.body)
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
        # @return [Square::Types::GetCashDrawerShiftResponse]
        def get(request_options: {}, **params)
          params = Square::Internal::Types::Utils.symbolize_keys(params)
          query_param_names = %i[location_id]
          query_params = {}
          query_params["location_id"] = params[:location_id] if params.key?(:location_id)
          params = params.except(*query_param_names)

          request = Square::Internal::JSON::Request.new(
            base_url: request_options[:base_url],
            method: "GET",
            path: "v2/cash-drawers/shifts/#{params[:shift_id]}",
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
            Square::Types::GetCashDrawerShiftResponse.load(response.body)
          else
            error_class = Square::Errors::ResponseError.subclass_for_code(code)
            raise error_class.new(response.body, code: code)
          end
        end

        # Provides a paginated list of events for a single cash drawer shift.
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
        # @return [Square::Types::ListCashDrawerShiftEventsResponse]
        def list_events(request_options: {}, **params)
          params = Square::Internal::Types::Utils.symbolize_keys(params)
          query_param_names = %i[location_id limit cursor]
          query_params = {}
          query_params["location_id"] = params[:location_id] if params.key?(:location_id)
          query_params["limit"] = params[:limit] if params.key?(:limit)
          query_params["cursor"] = params[:cursor] if params.key?(:cursor)
          params = params.except(*query_param_names)

          Square::Internal::CursorItemIterator.new(
            cursor_field: :cursor,
            item_field: :cash_drawer_shift_events,
            initial_cursor: query_params[:cursor]
          ) do |next_cursor|
            query_params[:cursor] = next_cursor
            request = Square::Internal::JSON::Request.new(
              base_url: request_options[:base_url],
              method: "GET",
              path: "v2/cash-drawers/shifts/#{params[:shift_id]}/events",
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
              Square::Types::ListCashDrawerShiftEventsResponse.load(response.body)
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
