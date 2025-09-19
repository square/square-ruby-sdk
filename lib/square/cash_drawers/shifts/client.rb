# frozen_string_literal: true

module Square
  module CashDrawers
    module Shifts
      class Client
        # @return [Square::CashDrawers::Shifts::Client]
        def initialize(client:)
          @client = client
        end

        # Provides the details for all of the cash drawer shifts for a location
        # in a date range.
        #
        # @return [Square::Types::ListCashDrawerShiftsResponse]
        def list(request_options: {}, **params)
          _query_param_names = [
            %w[location_id sort_order begin_time end_time limit cursor],
            %i[location_id sort_order begin_time end_time limit cursor]
          ].flatten
          _query = params.slice(*_query_param_names)
          params.except(*_query_param_names)

          _request = Square::Internal::JSON::Request.new(
            base_url: request_options[:base_url] || Square::Environment::PRODUCTION,
            method: "GET",
            path: "v2/cash-drawers/shifts",
            query: _query
          )
          begin
            _response = @client.send(_request)
          rescue Net::HTTPRequestTimeout
            raise Square::Errors::TimeoutError
          end
          code = _response.code.to_i
          if code.between?(200, 299)
            Square::Types::ListCashDrawerShiftsResponse.load(_response.body)
          else
            error_class = Square::Errors::ResponseError.subclass_for_code(code)
            raise error_class.new(_response.body, code: code)
          end
        end

        # Provides the summary details for a single cash drawer shift. See
        # [ListCashDrawerShiftEvents](api-endpoint:CashDrawers-ListCashDrawerShiftEvents) for a list of cash drawer shift events.
        #
        # @return [Square::Types::GetCashDrawerShiftResponse]
        def get(request_options: {}, **params)
          _query_param_names = [
            ["location_id"],
            %i[location_id]
          ].flatten
          _query = params.slice(*_query_param_names)
          params = params.except(*_query_param_names)

          _request = Square::Internal::JSON::Request.new(
            base_url: request_options[:base_url] || Square::Environment::PRODUCTION,
            method: "GET",
            path: "v2/cash-drawers/shifts/#{params[:shift_id]}",
            query: _query
          )
          begin
            _response = @client.send(_request)
          rescue Net::HTTPRequestTimeout
            raise Square::Errors::TimeoutError
          end
          code = _response.code.to_i
          if code.between?(200, 299)
            Square::Types::GetCashDrawerShiftResponse.load(_response.body)
          else
            error_class = Square::Errors::ResponseError.subclass_for_code(code)
            raise error_class.new(_response.body, code: code)
          end
        end

        # Provides a paginated list of events for a single cash drawer shift.
        #
        # @return [Square::Types::ListCashDrawerShiftEventsResponse]
        def list_events(request_options: {}, **params)
          _query_param_names = [
            %w[location_id limit cursor],
            %i[location_id limit cursor]
          ].flatten
          _query = params.slice(*_query_param_names)
          params = params.except(*_query_param_names)

          _request = Square::Internal::JSON::Request.new(
            base_url: request_options[:base_url] || Square::Environment::PRODUCTION,
            method: "GET",
            path: "v2/cash-drawers/shifts/#{params[:shift_id]}/events",
            query: _query
          )
          begin
            _response = @client.send(_request)
          rescue Net::HTTPRequestTimeout
            raise Square::Errors::TimeoutError
          end
          code = _response.code.to_i
          if code.between?(200, 299)
            Square::Types::ListCashDrawerShiftEventsResponse.load(_response.body)
          else
            error_class = Square::Errors::ResponseError.subclass_for_code(code)
            raise error_class.new(_response.body, code: code)
          end
        end
      end
    end
  end
end
