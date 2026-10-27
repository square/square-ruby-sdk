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
      # Returns a `Square::Internal::CursorItemIterator` that yields each `Square::Types::PaymentRefund` in the
      # `refunds` field of every page, requesting pages as they are needed. Call `pages` on it to get each page as a
      # `Square::Types::ListPaymentRefundsResponse`, including its other fields.
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
      # @example
      #   client.refunds.list(
      #     begin_time: "begin_time",
      #     end_time: "end_time",
      #     sort_order: "sort_order",
      #     cursor: "cursor",
      #     location_id: "location_id",
      #     status: "status",
      #     source_type: "source_type",
      #     limit: 1,
      #     updated_at_begin_time: "updated_at_begin_time",
      #     updated_at_end_time: "updated_at_end_time",
      #     sort_field: "CREATED_AT"
      #   )
      #
      # @return [Square::Internal::CursorItemIterator]
      def list(request_options: {}, **params)
        params = Square::Internal::Types::Utils.normalize_keys(params)
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

        Square::Internal::CursorItemIterator.new(
          cursor_field: :cursor,
          item_field: :refunds,
          initial_cursor: query_params["cursor"]
        ) do |next_cursor|
          query_params["cursor"] = next_cursor
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
            parsed_response = (response.body.to_s.empty? ? nil : Square::Types::ListPaymentRefundsResponse.load(response.body))
            [parsed_response, response]
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
      # @example
      #   client.refunds.refund_payment(
      #     idempotency_key: "9b7f2dcf-49da-4411-b23e-a2d6af21333a",
      #     amount_money: {
      #       amount: 1000,
      #       currency: "USD"
      #     },
      #     app_fee_money: {
      #       amount: 10,
      #       currency: "USD"
      #     },
      #     payment_id: "R2B3Z8WMVt3EAmzYWLZvz7Y69EbZY",
      #     reason: "Example"
      #   )
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
          (response.body.to_s.empty? ? nil : Square::Types::RefundPaymentResponse.load(response.body))
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
      # @example
      #   client.refunds.get(refund_id: "refund_id")
      #
      # @return [Square::Types::GetPaymentRefundResponse]
      def get(request_options: {}, **params)
        params = Square::Internal::Types::Utils.normalize_keys(params)
        request = Square::Internal::JSON::Request.new(
          base_url: request_options[:base_url],
          method: "GET",
          path: "v2/refunds/#{URI.encode_uri_component(params[:refund_id].to_s)}",
          request_options: request_options
        )
        begin
          response = @client.send(request)
        rescue Net::HTTPRequestTimeout
          raise Square::Errors::TimeoutError
        end
        code = response.code.to_i
        if code.between?(200, 299)
          (response.body.to_s.empty? ? nil : Square::Types::GetPaymentRefundResponse.load(response.body))
        else
          error_class = Square::Errors::ResponseError.subclass_for_code(code)
          raise error_class.new(response.body, code: code)
        end
      end
    end
  end
end
