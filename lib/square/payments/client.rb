# frozen_string_literal: true

module Square
  module Payments
    class Client
      # @return [Square::Payments::Client]
      def initialize(client:)
        @client = client
      end

      # Retrieves a list of payments taken by the account making the request.
      #
      # Results are eventually consistent, and new payments or changes to payments might take several
      # seconds to appear.
      #
      # The maximum results per page is 100.
      #
      # @return [Square::Types::ListPaymentsResponse]
      def list(request_options: {}, **params)
        _query_param_names = %w[begin_time end_time sort_order cursor location_id total last_4
                                card_brand limit is_offline_payment offline_begin_time offline_end_time updated_at_begin_time updated_at_end_time sort_field]
        _query = params.slice(*_query_param_names)
        params.except(*_query_param_names)

        _request = Square::Internal::JSON::Request.new(
          base_url: request_options[:base_url] || Square::Environment::SANDBOX,
          method: "GET",
          path: "v2/payments",
          query: _query
        )
        _response = @client.send(_request)
        code = _response.code.to_i
        if code.between?(200, 299)
          return Square::Types::ListPaymentsResponse.load(_response.body)
        end

        raise _response.body
      end

      # Creates a payment using the provided source. You can use this endpoint
      # to charge a card (credit/debit card or
      # Square gift card) or record a payment that the seller received outside of Square
      # (cash payment from a buyer or a payment that an external entity
      # processed on behalf of the seller).
      #
      # The endpoint creates a
      # `Payment` object and returns it in the response.
      #
      # @return [Square::Types::CreatePaymentResponse]
      def create(request_options: {}, **params)
        _request = Square::Internal::JSON::Request.new(
          base_url: request_options[:base_url] || Square::Environment::SANDBOX,
          method: "POST",
          path: "v2/payments",
          body: params
        )
        _response = @client.send(_request)
        code = _response.code.to_i
        if code.between?(200, 299)
          return Square::Types::CreatePaymentResponse.load(_response.body)
        end

        raise _response.body
      end

      # Cancels (voids) a payment identified by the idempotency key that is specified in the
      # request.
      #
      # Use this method when the status of a `CreatePayment` request is unknown (for example, after you send a
      # `CreatePayment` request, a network error occurs and you do not get a response). In this case, you can
      # direct Square to cancel the payment using this endpoint. In the request, you provide the same
      # idempotency key that you provided in your `CreatePayment` request that you want to cancel. After
      # canceling the payment, you can submit your `CreatePayment` request again.
      #
      # Note that if no payment with the specified idempotency key is found, no action is taken and the endpoint
      # returns successfully.
      #
      # @return [Square::Types::CancelPaymentByIdempotencyKeyResponse]
      def cancel_by_idempotency_key(request_options: {}, **params)
        _request = Square::Internal::JSON::Request.new(
          base_url: request_options[:base_url] || Square::Environment::SANDBOX,
          method: "POST",
          path: "v2/payments/cancel",
          body: params
        )
        _response = @client.send(_request)
        code = _response.code.to_i
        if code.between?(200, 299)
          return Square::Types::CancelPaymentByIdempotencyKeyResponse.load(_response.body)
        end

        raise _response.body
      end

      # Retrieves details for a specific payment.
      #
      # @return [Square::Types::GetPaymentResponse]
      def get(request_options: {}, **params)
        _request = Square::Internal::JSON::Request.new(
          base_url: request_options[:base_url] || Square::Environment::SANDBOX,
          method: "GET",
          path: "v2/payments/#{params[:payment_id]}"
        )
        _response = @client.send(_request)
        code = _response.code.to_i
        if code.between?(200, 299)
          return Square::Types::GetPaymentResponse.load(_response.body)
        end

        raise _response.body
      end

      # Updates a payment with the APPROVED status.
      # You can update the `amount_money` and `tip_money` using this endpoint.
      #
      # @return [Square::Types::UpdatePaymentResponse]
      def update(request_options: {}, **params)
        _path_param_names = ["payment_id"]

        _request = Square::Internal::JSON::Request.new(
          base_url: request_options[:base_url] || Square::Environment::SANDBOX,
          method: "PUT",
          path: "v2/payments/#{params[:payment_id]}",
          body: params.except(*_path_param_names)
        )
        _response = @client.send(_request)
        code = _response.code.to_i
        if code.between?(200, 299)
          return Square::Types::UpdatePaymentResponse.load(_response.body)
        end

        raise _response.body
      end

      # Cancels (voids) a payment. You can use this endpoint to cancel a payment with
      # the APPROVED `status`.
      #
      # @return [Square::Types::CancelPaymentResponse]
      def cancel(request_options: {}, **params)
        _request = Square::Internal::JSON::Request.new(
          base_url: request_options[:base_url] || Square::Environment::SANDBOX,
          method: "POST",
          path: "v2/payments/#{params[:payment_id]}/cancel"
        )
        _response = @client.send(_request)
        code = _response.code.to_i
        if code.between?(200, 299)
          return Square::Types::CancelPaymentResponse.load(_response.body)
        end

        raise _response.body
      end

      # Completes (captures) a payment.
      # By default, payments are set to complete immediately after they are created.
      #
      # You can use this endpoint to complete a payment with the APPROVED `status`.
      #
      # @return [Square::Types::CompletePaymentResponse]
      def complete(request_options: {}, **params)
        _path_param_names = ["payment_id"]

        _request = Square::Internal::JSON::Request.new(
          base_url: request_options[:base_url] || Square::Environment::SANDBOX,
          method: "POST",
          path: "v2/payments/#{params[:payment_id]}/complete",
          body: params.except(*_path_param_names)
        )
        _response = @client.send(_request)
        code = _response.code.to_i
        if code.between?(200, 299)
          return Square::Types::CompletePaymentResponse.load(_response.body)
        end

        raise _response.body
      end
    end
  end
end
