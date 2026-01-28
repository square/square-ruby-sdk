# frozen_string_literal: true

module Square
  module Refunds
    class Client
      # @param client [Square::Internal::Http::RawClient]
      #
      # @return [void]
      def initialize(client:)
        @client = client
      end

      # Retrieves a list of refunds for the account making the request.
      #
      # Results are eventually consistent, and new refunds or changes to refunds might take several
      # seconds to appear.
      #
      # The maximum results per page is 100.
      #
      # @param request_options [Hash]
      # @param params [Hash]
      # @option request_options [String] :base_url
      # @option request_options [Hash{String => Object}] :additional_headers
      # @option request_options [Hash{String => Object}] :additional_query_parameters
      # @option request_options [Hash{String => Object}] :additional_body_parameters
      # @option request_options [Integer] :timeout_in_seconds
      # @option params [String, nil] :begin_time
      # @option params [String, nil] :end_time
      # @option params [String, nil] :sort_order
      # @option params [String, nil] :cursor
      # @option params [String, nil] :location_id
      # @option params [String, nil] :status
      # @option params [String, nil] :source_type
      # @option params [Integer, nil] :limit
      # @option params [String, nil] :updated_at_begin_time
      # @option params [String, nil] :updated_at_end_time
      # @option params [Square::Types::ListPaymentRefundsRequestSortField, nil] :sort_field
      #
      # @return [Square::Types::ListPaymentRefundsResponse]
      def list(request_options: {}, **params)
        params = Square::Internal::Types::Utils.normalize_keys(params)
        query_param_names = %i[begin_time end_time sort_order cursor location_id status source_type limit updated_at_begin_time updated_at_end_time sort_field]
        query_params = {}
        query_params["begin_time"] = params[:begin_time] if params.key?(:begin_time)
        query_params["end_time"] = params[:end_time] if params.key?(:end_time)
        query_params["sort_order"] = params[:sort_order] if params.key?(:sort_order)
        query_params["cursor"] = params[:cursor] if params.key?(:cursor)
        query_params["location_id"] = params[:location_id] if params.key?(:location_id)
        query_params["status"] = params[:status] if params.key?(:status)
        query_params["source_type"] = params[:source_type] if params.key?(:source_type)
        query_params["limit"] = params[:limit] if params.key?(:limit)
        query_params["updated_at_begin_time"] = params[:updated_at_begin_time] if params.key?(:updated_at_begin_time)
        query_params["updated_at_end_time"] = params[:updated_at_end_time] if params.key?(:updated_at_end_time)
        query_params["sort_field"] = params[:sort_field] if params.key?(:sort_field)
        params.except(*query_param_names)

        Square::Internal::CursorItemIterator.new(
          cursor_field: :cursor,
          item_field: :refunds,
          initial_cursor: query_params[:cursor]
        ) do |next_cursor|
          query_params[:cursor] = next_cursor
          request = Square::Internal::JSON::Request.new(
            base_url: request_options[:base_url],
            method: "GET",
            path: "v2/refunds",
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
            Square::Types::ListPaymentRefundsResponse.load(response.body)
          else
            error_class = Square::Errors::ResponseError.subclass_for_code(code)
            raise error_class.new(response.body, code: code)
          end
        end
      end

      # Refunds a payment. You can refund the entire payment amount or a
      # portion of it. You can use this endpoint to refund a card payment or record a
      # refund of a cash or external payment. For more information, see
      # [Refund Payment](https://developer.squareup.com/docs/payments-api/refund-payments).
      #
      # @param request_options [Hash]
      # @param params [Square::Refunds::Types::RefundPaymentRequest]
      # @option request_options [String] :base_url
      # @option request_options [Hash{String => Object}] :additional_headers
      # @option request_options [Hash{String => Object}] :additional_query_parameters
      # @option request_options [Hash{String => Object}] :additional_body_parameters
      # @option request_options [Integer] :timeout_in_seconds
      #
      # @return [Square::Types::RefundPaymentResponse]
      def refund_payment(request_options: {}, **params)
        params = Square::Internal::Types::Utils.normalize_keys(params)
        request = Square::Internal::JSON::Request.new(
          base_url: request_options[:base_url],
          method: "POST",
          path: "v2/refunds",
          body: Square::Refunds::Types::RefundPaymentRequest.new(params).to_h,
          request_options: request_options
        )
        begin
          response = @client.send(request)
        rescue Net::HTTPRequestTimeout
          raise Square::Errors::TimeoutError
        end
        code = response.code.to_i
        if code.between?(200, 299)
          Square::Types::RefundPaymentResponse.load(response.body)
        else
          error_class = Square::Errors::ResponseError.subclass_for_code(code)
          raise error_class.new(response.body, code: code)
        end
      end

      # Retrieves a specific refund using the `refund_id`.
      #
      # @param request_options [Hash]
      # @param params [Hash]
      # @option request_options [String] :base_url
      # @option request_options [Hash{String => Object}] :additional_headers
      # @option request_options [Hash{String => Object}] :additional_query_parameters
      # @option request_options [Hash{String => Object}] :additional_body_parameters
      # @option request_options [Integer] :timeout_in_seconds
      # @option params [String] :refund_id
      #
      # @return [Square::Types::GetPaymentRefundResponse]
      def get(request_options: {}, **params)
        params = Square::Internal::Types::Utils.normalize_keys(params)
        request = Square::Internal::JSON::Request.new(
          base_url: request_options[:base_url],
          method: "GET",
          path: "v2/refunds/#{params[:refund_id]}",
          request_options: request_options
        )
        begin
          response = @client.send(request)
        rescue Net::HTTPRequestTimeout
          raise Square::Errors::TimeoutError
        end
        code = response.code.to_i
        if code.between?(200, 299)
          Square::Types::GetPaymentRefundResponse.load(response.body)
        else
          error_class = Square::Errors::ResponseError.subclass_for_code(code)
          raise error_class.new(response.body, code: code)
        end
      end
    end
  end
end
