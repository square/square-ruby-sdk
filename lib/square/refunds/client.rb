# frozen_string_literal: true

module Square
  module Refunds
    class Client
      # @return [Square::Refunds::Client]
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
      # @return [Square::Types::ListPaymentRefundsResponse]
      def list(request_options: {}, **params)
        params = Square::Internal::Types::Utils.symbolize_keys(params)
        _query_param_names = %i[begin_time end_time sort_order cursor location_id status source_type limit
                                updated_at_begin_time updated_at_end_time sort_field]
        _query = params.slice(*_query_param_names)
        params.except(*_query_param_names)

        Square::Internal::CursorItemIterator.new(
          cursor_field: :cursor,
          item_field: :refunds,
          initial_cursor: _query[:cursor]
        ) do |next_cursor|
          _query[:cursor] = next_cursor
          _request = Square::Internal::JSON::Request.new(
            base_url: request_options[:base_url] || Square::Environment::PRODUCTION,
            method: "GET",
            path: "v2/refunds",
            query: _query
          )
          begin
            _response = @client.send(_request)
          rescue Net::HTTPRequestTimeout
            raise Square::Errors::TimeoutError
          end
          code = _response.code.to_i
          if code.between?(200, 299)
            Square::Types::ListPaymentRefundsResponse.load(_response.body)
          else
            error_class = Square::Errors::ResponseError.subclass_for_code(code)
            raise error_class.new(_response.body, code: code)
          end
        end
      end

      # Refunds a payment. You can refund the entire payment amount or a
      # portion of it. You can use this endpoint to refund a card payment or record a
      # refund of a cash or external payment. For more information, see
      # [Refund Payment](https://developer.squareup.com/docs/payments-api/refund-payments).
      #
      # @return [Square::Types::RefundPaymentResponse]
      def refund_payment(request_options: {}, **params)
        _request = Square::Internal::JSON::Request.new(
          base_url: request_options[:base_url] || Square::Environment::PRODUCTION,
          method: "POST",
          path: "v2/refunds",
          body: params
        )
        begin
          _response = @client.send(_request)
        rescue Net::HTTPRequestTimeout
          raise Square::Errors::TimeoutError
        end
        code = _response.code.to_i
        if code.between?(200, 299)
          Square::Types::RefundPaymentResponse.load(_response.body)
        else
          error_class = Square::Errors::ResponseError.subclass_for_code(code)
          raise error_class.new(_response.body, code: code)
        end
      end

      # Retrieves a specific refund using the `refund_id`.
      #
      # @return [Square::Types::GetPaymentRefundResponse]
      def get(request_options: {}, **params)
        _request = Square::Internal::JSON::Request.new(
          base_url: request_options[:base_url] || Square::Environment::PRODUCTION,
          method: "GET",
          path: "v2/refunds/#{params[:refund_id]}"
        )
        begin
          _response = @client.send(_request)
        rescue Net::HTTPRequestTimeout
          raise Square::Errors::TimeoutError
        end
        code = _response.code.to_i
        if code.between?(200, 299)
          Square::Types::GetPaymentRefundResponse.load(_response.body)
        else
          error_class = Square::Errors::ResponseError.subclass_for_code(code)
          raise error_class.new(_response.body, code: code)
        end
      end
    end
  end
end
