# frozen_string_literal: true

module Square
  module Payouts
    class Client
      # @param client [Square::Internal::Http::RawClient]
      #
      # @return [void]
      def initialize(client:)
        @client = client
      end

      # Retrieves a list of all payouts for the default location.
      # You can filter payouts by location ID, status, time range, and order them in ascending or descending order.
      # To call this endpoint, set `PAYOUTS_READ` for the OAuth scope.
      #
      # @param request_options [Hash]
      # @param params [Hash]
      # @option request_options [String] :base_url
      # @option request_options [Hash{String => Object}] :additional_headers
      # @option request_options [Hash{String => Object}] :additional_query_parameters
      # @option request_options [Hash{String => Object}] :additional_body_parameters
      # @option request_options [Integer] :timeout_in_seconds
      # @option params [String, nil] :location_id
      # @option params [Square::Types::PayoutStatus, nil] :status
      # @option params [String, nil] :begin_time
      # @option params [String, nil] :end_time
      # @option params [Square::Types::SortOrder, nil] :sort_order
      # @option params [String, nil] :cursor
      # @option params [Integer, nil] :limit
      #
      # @return [Square::Types::ListPayoutsResponse]
      def list(request_options: {}, **params)
        params = Square::Internal::Types::Utils.symbolize_keys(params)
        query_param_names = %i[location_id status begin_time end_time sort_order cursor limit]
        query_params = {}
        query_params["location_id"] = params[:location_id] if params.key?(:location_id)
        query_params["status"] = params[:status] if params.key?(:status)
        query_params["begin_time"] = params[:begin_time] if params.key?(:begin_time)
        query_params["end_time"] = params[:end_time] if params.key?(:end_time)
        query_params["sort_order"] = params[:sort_order] if params.key?(:sort_order)
        query_params["cursor"] = params[:cursor] if params.key?(:cursor)
        query_params["limit"] = params[:limit] if params.key?(:limit)
        params.except(*query_param_names)

        Square::Internal::CursorItemIterator.new(
          cursor_field: :cursor,
          item_field: :payouts,
          initial_cursor: query_params[:cursor]
        ) do |next_cursor|
          query_params[:cursor] = next_cursor
          request = Square::Internal::JSON::Request.new(
            base_url: request_options[:base_url],
            method: "GET",
            path: "v2/payouts",
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
            Square::Types::ListPayoutsResponse.load(response.body)
          else
            error_class = Square::Errors::ResponseError.subclass_for_code(code)
            raise error_class.new(response.body, code: code)
          end
        end
      end

      # Retrieves details of a specific payout identified by a payout ID.
      # To call this endpoint, set `PAYOUTS_READ` for the OAuth scope.
      #
      # @param request_options [Hash]
      # @param params [Hash]
      # @option request_options [String] :base_url
      # @option request_options [Hash{String => Object}] :additional_headers
      # @option request_options [Hash{String => Object}] :additional_query_parameters
      # @option request_options [Hash{String => Object}] :additional_body_parameters
      # @option request_options [Integer] :timeout_in_seconds
      # @option params [String] :payout_id
      #
      # @return [Square::Types::GetPayoutResponse]
      def get(request_options: {}, **params)
        request = Square::Internal::JSON::Request.new(
          base_url: request_options[:base_url],
          method: "GET",
          path: "v2/payouts/#{params[:payout_id]}",
          request_options: request_options
        )
        begin
          response = @client.send(request)
        rescue Net::HTTPRequestTimeout
          raise Square::Errors::TimeoutError
        end
        code = response.code.to_i
        if code.between?(200, 299)
          Square::Types::GetPayoutResponse.load(response.body)
        else
          error_class = Square::Errors::ResponseError.subclass_for_code(code)
          raise error_class.new(response.body, code: code)
        end
      end

      # Retrieves a list of all payout entries for a specific payout.
      # To call this endpoint, set `PAYOUTS_READ` for the OAuth scope.
      #
      # @param request_options [Hash]
      # @param params [Hash]
      # @option request_options [String] :base_url
      # @option request_options [Hash{String => Object}] :additional_headers
      # @option request_options [Hash{String => Object}] :additional_query_parameters
      # @option request_options [Hash{String => Object}] :additional_body_parameters
      # @option request_options [Integer] :timeout_in_seconds
      # @option params [String] :payout_id
      # @option params [Square::Types::SortOrder, nil] :sort_order
      # @option params [String, nil] :cursor
      # @option params [Integer, nil] :limit
      #
      # @return [Square::Types::ListPayoutEntriesResponse]
      def list_entries(request_options: {}, **params)
        params = Square::Internal::Types::Utils.symbolize_keys(params)
        query_param_names = %i[sort_order cursor limit]
        query_params = {}
        query_params["sort_order"] = params[:sort_order] if params.key?(:sort_order)
        query_params["cursor"] = params[:cursor] if params.key?(:cursor)
        query_params["limit"] = params[:limit] if params.key?(:limit)
        params = params.except(*query_param_names)

        Square::Internal::CursorItemIterator.new(
          cursor_field: :cursor,
          item_field: :payout_entries,
          initial_cursor: query_params[:cursor]
        ) do |next_cursor|
          query_params[:cursor] = next_cursor
          request = Square::Internal::JSON::Request.new(
            base_url: request_options[:base_url],
            method: "GET",
            path: "v2/payouts/#{params[:payout_id]}/payout-entries",
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
            Square::Types::ListPayoutEntriesResponse.load(response.body)
          else
            error_class = Square::Errors::ResponseError.subclass_for_code(code)
            raise error_class.new(response.body, code: code)
          end
        end
      end
    end
  end
end
