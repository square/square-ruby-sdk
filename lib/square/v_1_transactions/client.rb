# frozen_string_literal: true

module Square
  module V1Transactions
    class Client
      # @return [Square::V1Transactions::Client]
      def initialize(client:)
        @client = client
      end

      # Provides summary information for a merchant's online store orders.
      #
      # @return [Array[Square::Types::V1Order]]
      def v_1_list_orders(request_options: {}, **params)
        _query_param_names = [
          %w[order limit batch_token],
          %i[order limit batch_token]
        ].flatten
        _query = params.slice(*_query_param_names)
        params = params.except(*_query_param_names)

        _request = Square::Internal::JSON::Request.new(
          base_url: request_options[:base_url] || Square::Environment::SANDBOX,
          method: "GET",
          path: "v1/#{params[:location_id]}/orders",
          query: _query
        )
        _response = @client.send(_request)
        return if _response.code >= "200" && _response.code < "300"

        raise _response.body
      end

      # Provides comprehensive information for a single online store order, including the order's history.
      #
      # @return [Square::Types::V1Order]
      def v_1_retrieve_order(request_options: {}, **params)
        _request = Square::Internal::JSON::Request.new(
          base_url: request_options[:base_url] || Square::Environment::SANDBOX,
          method: "GET",
          path: "v1/#{params[:location_id]}/orders/#{params[:order_id]}"
        )
        _response = @client.send(_request)
        return Square::Types::V1Order.load(_response.body) if _response.code >= "200" && _response.code < "300"

        raise _response.body
      end

      # Updates the details of an online store order. Every update you perform on an order corresponds to one of three actions:
      #
      # @return [Square::Types::V1Order]
      def v_1_update_order(request_options: {}, **params)
        _path_param_names = %w[location_id order_id]

        _request = Square::Internal::JSON::Request.new(
          base_url: request_options[:base_url] || Square::Environment::SANDBOX,
          method: "PUT",
          path: "v1/#{params[:location_id]}/orders/#{params[:order_id]}",
          body: params.except(*_path_param_names)
        )
        _response = @client.send(_request)
        return Square::Types::V1Order.load(_response.body) if _response.code >= "200" && _response.code < "300"

        raise _response.body
      end
    end
  end
end
