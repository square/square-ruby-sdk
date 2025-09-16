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
        _query_param_names = [
          %w[begin_time end_time sort_order cursor location_id status source_type limit
             updated_at_begin_time updated_at_end_time sort_field],
          %i[begin_time end_time sort_order cursor location_id status source_type limit updated_at_begin_time
             updated_at_end_time sort_field]
        ].flatten
        _query = params.slice(*_query_param_names)
        params.except(*_query_param_names)

        _request = Square::Internal::JSON::Request.new(
          base_url: request_options[:base_url] || Square::Environment::SANDBOX,
          method: "GET",
          path: "v2/refunds",
          query: _query
        )
        _response = @client.send(_request)
        if _response.code >= "200" && _response.code < "300"
          return Square::Types::ListPaymentRefundsResponse.load(_response.body)
        end

        raise _response.body
      end

      # Refunds a payment. You can refund the entire payment amount or a
      # portion of it. You can use this endpoint to refund a card payment or record a
      # refund of a cash or external payment. For more information, see
      # [Refund Payment](https://developer.squareup.com/docs/payments-api/refund-payments).
      #
      # @return [Square::Types::RefundPaymentResponse]
      def refund_payment(request_options: {}, **params)
        _request = Square::Internal::JSON::Request.new(
          base_url: request_options[:base_url] || Square::Environment::SANDBOX,
          method: "POST",
          path: "v2/refunds",
          body: params
        )
        _response = @client.send(_request)
        if _response.code >= "200" && _response.code < "300"
          return Square::Types::RefundPaymentResponse.load(_response.body)
        end

        raise _response.body
      end

      # Retrieves a specific refund using the `refund_id`.
      #
      # @return [Square::Types::GetPaymentRefundResponse]
      def get(request_options: {}, **params)
        _request = Square::Internal::JSON::Request.new(
          base_url: request_options[:base_url] || Square::Environment::SANDBOX,
          method: "GET",
          path: "v2/refunds/#{params[:refund_id]}"
        )
        _response = @client.send(_request)
        if _response.code >= "200" && _response.code < "300"
          return Square::Types::GetPaymentRefundResponse.load(_response.body)
        end

        raise _response.body
      end
    end
  end
end
