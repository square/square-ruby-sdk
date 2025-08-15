
module Square
  module Payments
    class Client
      # @option client [Square::Internal::Http::RawClient]
      #
      # @return [Square::Payments::Client]
      def initialize(client)
        @client = client
      end

      # Retrieves a list of payments taken by the account making the request.
      # 
      # Results are eventually consistent, and new payments or changes to payments might take several
      # seconds to appear.
      # 
      # The maximum results per page is 100.
      #
      # @return [Square::ListPaymentsResponse]
      def list(request_options: {}, **params)
        _request = params
        _response = @client.send(_request)
        if _response.code >= "200" && _response.code < "300"
          return Square::Types::ListPaymentsResponse.load(_response.body)
        else
          raise _response.body
        end
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
      # @return [Square::CreatePaymentResponse]
      def create(request_options: {}, **params)
        _request = params
        _response = @client.send(_request)
        if _response.code >= "200" && _response.code < "300"
          return Square::Types::CreatePaymentResponse.load(_response.body)
        else
          raise _response.body
        end
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
      # @return [Square::CancelPaymentByIdempotencyKeyResponse]
      def cancel_by_idempotency_key(request_options: {}, **params)
        _request = params
        _response = @client.send(_request)
        if _response.code >= "200" && _response.code < "300"
          return Square::Types::CancelPaymentByIdempotencyKeyResponse.load(_response.body)
        else
          raise _response.body
        end
      end

      # Retrieves details for a specific payment.
      #
      # @return [Square::GetPaymentResponse]
      def get(request_options: {}, **params)
        _request = params
        _response = @client.send(_request)
        if _response.code >= "200" && _response.code < "300"
          return Square::Types::GetPaymentResponse.load(_response.body)
        else
          raise _response.body
        end
      end

      # Updates a payment with the APPROVED status.
      # You can update the `amount_money` and `tip_money` using this endpoint.
      #
      # @return [Square::UpdatePaymentResponse]
      def update(request_options: {}, **params)
        _request = params
        _response = @client.send(_request)
        if _response.code >= "200" && _response.code < "300"
          return Square::Types::UpdatePaymentResponse.load(_response.body)
        else
          raise _response.body
        end
      end

      # Cancels (voids) a payment. You can use this endpoint to cancel a payment with 
      # the APPROVED `status`.
      #
      # @return [Square::CancelPaymentResponse]
      def cancel(request_options: {}, **params)
        _request = params
        _response = @client.send(_request)
        if _response.code >= "200" && _response.code < "300"
          return Square::Types::CancelPaymentResponse.load(_response.body)
        else
          raise _response.body
        end
      end

      # Completes (captures) a payment.
      # By default, payments are set to complete immediately after they are created.
      # 
      # You can use this endpoint to complete a payment with the APPROVED `status`.
      #
      # @return [Square::CompletePaymentResponse]
      def complete(request_options: {}, **params)
        _request = params
        _response = @client.send(_request)
        if _response.code >= "200" && _response.code < "300"
          return Square::Types::CompletePaymentResponse.load(_response.body)
        else
          raise _response.body
        end
      end

    end
  end
end
