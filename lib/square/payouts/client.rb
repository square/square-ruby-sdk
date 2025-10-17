# frozen_string_literal: true

module Square
  module Payouts
    class Client
      # @return [Square::Payouts::Client]
      def initialize(client:)
        @client = client
      end

      # Retrieves a list of all payouts for the default location.
      # You can filter payouts by location ID, status, time range, and order them in ascending or descending order.
      # To call this endpoint, set `PAYOUTS_READ` for the OAuth scope.
      #
      # @return [Square::Types::ListPayoutsResponse]
      def list(request_options: {}, **params)
        params = Square::Internal::Types::Utils.symbolize_keys(params)
        _query_param_names = %i[location_id status begin_time end_time sort_order cursor limit]
        _query = params.slice(*_query_param_names)
        params.except(*_query_param_names)

        Square::Internal::CursorItemIterator.new(
          cursor_field: :cursor,
          item_field: :payouts,
          initial_cursor: _query[:cursor]
        ) do |next_cursor|
          _query[:cursor] = next_cursor
          _request = Square::Internal::JSON::Request.new(
            base_url: request_options[:base_url] || Square::Environment::PRODUCTION,
            method: "GET",
            path: "v2/payouts",
            query: _query
          )
          begin
            _response = @client.send(_request)
          rescue Net::HTTPRequestTimeout
            raise Square::Errors::TimeoutError
          end
          code = _response.code.to_i
          if code.between?(200, 299)
            Square::Types::ListPayoutsResponse.load(_response.body)
          else
            error_class = Square::Errors::ResponseError.subclass_for_code(code)
            raise error_class.new(_response.body, code: code)
          end
        end
      end

      # Retrieves details of a specific payout identified by a payout ID.
      # To call this endpoint, set `PAYOUTS_READ` for the OAuth scope.
      #
      # @return [Square::Types::GetPayoutResponse]
      def get(request_options: {}, **params)
        _request = Square::Internal::JSON::Request.new(
          base_url: request_options[:base_url] || Square::Environment::PRODUCTION,
          method: "GET",
          path: "v2/payouts/#{params[:payout_id]}"
        )
        begin
          _response = @client.send(_request)
        rescue Net::HTTPRequestTimeout
          raise Square::Errors::TimeoutError
        end
        code = _response.code.to_i
        if code.between?(200, 299)
          Square::Types::GetPayoutResponse.load(_response.body)
        else
          error_class = Square::Errors::ResponseError.subclass_for_code(code)
          raise error_class.new(_response.body, code: code)
        end
      end

      # Retrieves a list of all payout entries for a specific payout.
      # To call this endpoint, set `PAYOUTS_READ` for the OAuth scope.
      #
      # @return [Square::Types::ListPayoutEntriesResponse]
      def list_entries(request_options: {}, **params)
        params = Square::Internal::Types::Utils.symbolize_keys(params)
        _query_param_names = %i[sort_order cursor limit]
        _query = params.slice(*_query_param_names)
        params = params.except(*_query_param_names)

        Square::Internal::CursorItemIterator.new(
          cursor_field: :cursor,
          item_field: :payout_entries,
          initial_cursor: _query[:cursor]
        ) do |next_cursor|
          _query[:cursor] = next_cursor
          _request = Square::Internal::JSON::Request.new(
            base_url: request_options[:base_url] || Square::Environment::PRODUCTION,
            method: "GET",
            path: "v2/payouts/#{params[:payout_id]}/payout-entries",
            query: _query
          )
          begin
            _response = @client.send(_request)
          rescue Net::HTTPRequestTimeout
            raise Square::Errors::TimeoutError
          end
          code = _response.code.to_i
          if code.between?(200, 299)
            Square::Types::ListPayoutEntriesResponse.load(_response.body)
          else
            error_class = Square::Errors::ResponseError.subclass_for_code(code)
            raise error_class.new(_response.body, code: code)
          end
        end
      end
    end
  end
end
