
module Square
  module Locations
    module Transactions
      class Client
        # @option client [Square::Internal::Http::RawClient]
        #
        # @return [Square::Locations::Transactions::Client]
        def initialize(client)
          @client = client
        end

        # Lists transactions for a particular location.
        # 
        # Transactions include payment information from sales and exchanges and refund
        # information from returns and exchanges.
        # 
        # Max results per [page](https://developer.squareup.com/docs/working-with-apis/pagination): 50
        #
        # @return [Square::ListTransactionsResponse]
        def list(request_options: {}, **params)
          _request = params
          _response = @client.send(_request)
          if _response.code >= "200" && _response.code < "300"
            return Square::Types::ListTransactionsResponse.load(_response.body)
          else
            raise _response.body
          end
        end

        # Retrieves details for a single transaction.
        #
        # @return [Square::GetTransactionResponse]
        def get(request_options: {}, **params)
          _request = params
          _response = @client.send(_request)
          if _response.code >= "200" && _response.code < "300"
            return Square::Types::GetTransactionResponse.load(_response.body)
          else
            raise _response.body
          end
        end

        # Captures a transaction that was created with the [Charge](api-endpoint:Transactions-Charge)
        # endpoint with a `delay_capture` value of `true`.
        # 
        # 
        # See [Delayed capture transactions](https://developer.squareup.com/docs/payments/transactions/overview#delayed-capture)
        # for more information.
        #
        # @return [Square::CaptureTransactionResponse]
        def capture(request_options: {}, **params)
          _request = params
          _response = @client.send(_request)
          if _response.code >= "200" && _response.code < "300"
            return Square::Types::CaptureTransactionResponse.load(_response.body)
          else
            raise _response.body
          end
        end

        # Cancels a transaction that was created with the [Charge](api-endpoint:Transactions-Charge)
        # endpoint with a `delay_capture` value of `true`.
        # 
        # 
        # See [Delayed capture transactions](https://developer.squareup.com/docs/payments/transactions/overview#delayed-capture)
        # for more information.
        #
        # @return [Square::VoidTransactionResponse]
        def void(request_options: {}, **params)
          _request = params
          _response = @client.send(_request)
          if _response.code >= "200" && _response.code < "300"
            return Square::Types::VoidTransactionResponse.load(_response.body)
          else
            raise _response.body
          end
        end

      end
    end
  end
end
