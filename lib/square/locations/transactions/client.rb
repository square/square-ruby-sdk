# frozen_string_literal: true

module Square
  module Locations
    module Transactions
      class Client
        # @param client [Square::Internal::Http::RawClient]
        #
        # @return [void]
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
        # @param request_options [Hash]
        # @param params [Hash]
        # @option request_options [String] :base_url
        # @option request_options [Hash{String => Object}] :additional_headers
        # @option request_options [Hash{String => Object}] :additional_query_parameters
        # @option request_options [Hash{String => Object}] :additional_body_parameters
        # @option request_options [Integer] :timeout_in_seconds
        # @option params [String] :location_id
        # @option params [String, nil] :begin_time
        # @option params [String, nil] :end_time
        # @option params [Square::Types::SortOrder, nil] :sort_order
        # @option params [String, nil] :cursor
        #
        # @return [Square::Types::ListTransactionsResponse]
        def list(request_options: {}, **params)
          params = Square::Internal::Types::Utils.normalize_keys(params)
          query_param_names = %i[begin_time end_time sort_order cursor]
          query_params = {}
          query_params["begin_time"] = params[:begin_time] if params.key?(:begin_time)
          query_params["end_time"] = params[:end_time] if params.key?(:end_time)
          query_params["sort_order"] = params[:sort_order] if params.key?(:sort_order)
          query_params["cursor"] = params[:cursor] if params.key?(:cursor)
          params = params.except(*query_param_names)

          request = Square::Internal::JSON::Request.new(
            base_url: request_options[:base_url],
            method: "GET",
            path: "v2/locations/#{params[:location_id]}/transactions",
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
            Square::Types::ListTransactionsResponse.load(response.body)
          else
            error_class = Square::Errors::ResponseError.subclass_for_code(code)
            raise error_class.new(response.body, code: code)
          end
        end

        # Retrieves details for a single transaction.
        #
        # @param request_options [Hash]
        # @param params [Hash]
        # @option request_options [String] :base_url
        # @option request_options [Hash{String => Object}] :additional_headers
        # @option request_options [Hash{String => Object}] :additional_query_parameters
        # @option request_options [Hash{String => Object}] :additional_body_parameters
        # @option request_options [Integer] :timeout_in_seconds
        # @option params [String] :location_id
        # @option params [String] :transaction_id
        #
        # @return [Square::Types::GetTransactionResponse]
        def get(request_options: {}, **params)
          params = Square::Internal::Types::Utils.normalize_keys(params)
          request = Square::Internal::JSON::Request.new(
            base_url: request_options[:base_url],
            method: "GET",
            path: "v2/locations/#{params[:location_id]}/transactions/#{params[:transaction_id]}",
            request_options: request_options
          )
          begin
            response = @client.send(request)
          rescue Net::HTTPRequestTimeout
            raise Square::Errors::TimeoutError
          end
          code = response.code.to_i
          if code.between?(200, 299)
            Square::Types::GetTransactionResponse.load(response.body)
          else
            error_class = Square::Errors::ResponseError.subclass_for_code(code)
            raise error_class.new(response.body, code: code)
          end
        end

        # Captures a transaction that was created with the [Charge](api-endpoint:Transactions-Charge)
        # endpoint with a `delay_capture` value of `true`.
        #
        #
        # See [Delayed capture
        # transactions](https://developer.squareup.com/docs/payments/transactions/overview#delayed-capture)
        # for more information.
        #
        # @param request_options [Hash]
        # @param params [Hash]
        # @option request_options [String] :base_url
        # @option request_options [Hash{String => Object}] :additional_headers
        # @option request_options [Hash{String => Object}] :additional_query_parameters
        # @option request_options [Hash{String => Object}] :additional_body_parameters
        # @option request_options [Integer] :timeout_in_seconds
        # @option params [String] :location_id
        # @option params [String] :transaction_id
        #
        # @return [Square::Types::CaptureTransactionResponse]
        def capture(request_options: {}, **params)
          params = Square::Internal::Types::Utils.normalize_keys(params)
          request = Square::Internal::JSON::Request.new(
            base_url: request_options[:base_url],
            method: "POST",
            path: "v2/locations/#{params[:location_id]}/transactions/#{params[:transaction_id]}/capture",
            request_options: request_options
          )
          begin
            response = @client.send(request)
          rescue Net::HTTPRequestTimeout
            raise Square::Errors::TimeoutError
          end
          code = response.code.to_i
          if code.between?(200, 299)
            Square::Types::CaptureTransactionResponse.load(response.body)
          else
            error_class = Square::Errors::ResponseError.subclass_for_code(code)
            raise error_class.new(response.body, code: code)
          end
        end

        # Cancels a transaction that was created with the [Charge](api-endpoint:Transactions-Charge)
        # endpoint with a `delay_capture` value of `true`.
        #
        #
        # See [Delayed capture
        # transactions](https://developer.squareup.com/docs/payments/transactions/overview#delayed-capture)
        # for more information.
        #
        # @param request_options [Hash]
        # @param params [Hash]
        # @option request_options [String] :base_url
        # @option request_options [Hash{String => Object}] :additional_headers
        # @option request_options [Hash{String => Object}] :additional_query_parameters
        # @option request_options [Hash{String => Object}] :additional_body_parameters
        # @option request_options [Integer] :timeout_in_seconds
        # @option params [String] :location_id
        # @option params [String] :transaction_id
        #
        # @return [Square::Types::VoidTransactionResponse]
        def void(request_options: {}, **params)
          params = Square::Internal::Types::Utils.normalize_keys(params)
          request = Square::Internal::JSON::Request.new(
            base_url: request_options[:base_url],
            method: "POST",
            path: "v2/locations/#{params[:location_id]}/transactions/#{params[:transaction_id]}/void",
            request_options: request_options
          )
          begin
            response = @client.send(request)
          rescue Net::HTTPRequestTimeout
            raise Square::Errors::TimeoutError
          end
          code = response.code.to_i
          if code.between?(200, 299)
            Square::Types::VoidTransactionResponse.load(response.body)
          else
            error_class = Square::Errors::ResponseError.subclass_for_code(code)
            raise error_class.new(response.body, code: code)
          end
        end
      end
    end
  end
end
