# frozen_string_literal: true

module Square
  module Locations
    module Transactions
      class Client
        # @return [Square::Locations::Transactions::Client]
        def initialize(client:)
          @client = client
        end

        # Lists transactions for a particular location.
        #
        # Transactions include payment information from sales and exchanges and refund
        # information from returns and exchanges.
        #
        # Max results per [page](https://developer.squareup.com/docs/working-with-apis/pagination): 50
        #
        # @return [Square::Types::ListTransactionsResponse]
        def list(request_options: {}, **params)
          _query_param_names = %w[begin_time end_time sort_order cursor]
          _query = params.slice(*_query_param_names)
          params = params.except(*_query_param_names)

          _request = Square::Internal::JSON::Request.new(
            base_url: request_options[:base_url] || Square::Environment::SANDBOX,
            method: "GET",
            path: "v2/locations/#{params[:location_id]}/transactions",
            query: _query
          )
          _response = @client.send(_request)
          if _response.code >= "200" && _response.code < "300"
            return Square::Types::ListTransactionsResponse.load(_response.body)
          end

          raise _response.body
        end

        # Retrieves details for a single transaction.
        #
        # @return [Square::Types::GetTransactionResponse]
        def get(request_options: {}, **params)
          _request = Square::Internal::JSON::Request.new(
            base_url: request_options[:base_url] || Square::Environment::SANDBOX,
            method: "GET",
            path: "v2/locations/#{params[:location_id]}/transactions/#{params[:transaction_id]}"
          )
          _response = @client.send(_request)
          if _response.code >= "200" && _response.code < "300"
            return Square::Types::GetTransactionResponse.load(_response.body)
          end

          raise _response.body
        end

        # Captures a transaction that was created with the [Charge](api-endpoint:Transactions-Charge)
        # endpoint with a `delay_capture` value of `true`.
        #
        #
        # See [Delayed capture transactions](https://developer.squareup.com/docs/payments/transactions/overview#delayed-capture)
        # for more information.
        #
        # @return [Square::Types::CaptureTransactionResponse]
        def capture(request_options: {}, **params)
          _request = Square::Internal::JSON::Request.new(
            base_url: request_options[:base_url] || Square::Environment::SANDBOX,
            method: "POST",
            path: "v2/locations/#{params[:location_id]}/transactions/#{params[:transaction_id]}/capture"
          )
          _response = @client.send(_request)
          if _response.code >= "200" && _response.code < "300"
            return Square::Types::CaptureTransactionResponse.load(_response.body)
          end

          raise _response.body
        end

        # Cancels a transaction that was created with the [Charge](api-endpoint:Transactions-Charge)
        # endpoint with a `delay_capture` value of `true`.
        #
        #
        # See [Delayed capture transactions](https://developer.squareup.com/docs/payments/transactions/overview#delayed-capture)
        # for more information.
        #
        # @return [Square::Types::VoidTransactionResponse]
        def void(request_options: {}, **params)
          _request = Square::Internal::JSON::Request.new(
            base_url: request_options[:base_url] || Square::Environment::SANDBOX,
            method: "POST",
            path: "v2/locations/#{params[:location_id]}/transactions/#{params[:transaction_id]}/void"
          )
          _response = @client.send(_request)
          if _response.code >= "200" && _response.code < "300"
            return Square::Types::VoidTransactionResponse.load(_response.body)
          end

          raise _response.body
        end
      end
    end
  end
end
