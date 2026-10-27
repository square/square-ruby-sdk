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
        # @example
        #   client.locations.transactions.list(
        #     location_id: "location_id",
        #     begin_time: "begin_time",
        #     end_time: "end_time",
        #     sort_order: "DESC",
        #     cursor: "cursor"
        #   )
        #
        # @return [Square::Types::ListTransactionsResponse]
        def list(request_options: {}, **params)
          params = Square::Internal::Types::Utils.normalize_keys(params)
          query_params = {}
          query_params["begin_time"] = params[:begin_time] if params.key?(:begin_time)
          query_params["end_time"] = params[:end_time] if params.key?(:end_time)
          query_params["sort_order"] = params[:sort_order] if params.key?(:sort_order)
          query_params["cursor"] = params[:cursor] if params.key?(:cursor)

          request = Square::Internal::JSON::Request.new(
            base_url: request_options[:base_url],
            method: "GET",
            path: "v2/locations/#{URI.encode_uri_component(params[:location_id].to_s)}/transactions",
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
            (response.body.to_s.empty? ? nil : Square::Types::ListTransactionsResponse.load(response.body))
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
        # @example
        #   client.locations.transactions.get(
        #     location_id: "location_id",
        #     transaction_id: "transaction_id"
        #   )
        #
        # @return [Square::Types::GetTransactionResponse]
        def get(request_options: {}, **params)
          params = Square::Internal::Types::Utils.normalize_keys(params)
          request = Square::Internal::JSON::Request.new(
            base_url: request_options[:base_url],
            method: "GET",
            path: "v2/locations/#{URI.encode_uri_component(params[:location_id].to_s)}/transactions/#{URI.encode_uri_component(params[:transaction_id].to_s)}",
            request_options: request_options
          )
          begin
            response = @client.send(request)
          rescue Net::HTTPRequestTimeout
            raise Square::Errors::TimeoutError
          end
          code = response.code.to_i
          if code.between?(200, 299)
            (response.body.to_s.empty? ? nil : Square::Types::GetTransactionResponse.load(response.body))
          else
            error_class = Square::Errors::ResponseError.subclass_for_code(code)
            raise error_class.new(response.body, code: code)
          end
        end
      end
    end
  end
end
