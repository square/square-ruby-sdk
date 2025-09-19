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
          base_url: request_options[:base_url] || Square::Environment::PRODUCTION,
          method: "GET",
          path: "v1/#{params[:location_id]}/orders",
          query: _query
        )
        begin
          _response = @client.send(_request)
        rescue Net::HTTPRequestTimeout
          raise Square::Errors::TimeoutError
        end
        code = _response.code.to_i
        return if code.between?(200, 299)

        error_class = Square::Errors::ResponseError.subclass_for_code(code)
        raise error_class.new(_response.body, code: code)
      end

      # Provides comprehensive information for a single online store order, including the order's history.
      #
      # @return [Square::Types::V1Order]
      def v_1_retrieve_order(request_options: {}, **params)
        _request = Square::Internal::JSON::Request.new(
          base_url: request_options[:base_url] || Square::Environment::PRODUCTION,
          method: "GET",
          path: "v1/#{params[:location_id]}/orders/#{params[:order_id]}"
        )
        begin
          _response = @client.send(_request)
        rescue Net::HTTPRequestTimeout
          raise Square::Errors::TimeoutError
        end
        code = _response.code.to_i
        if code.between?(200, 299)
          Square::Types::V1Order.load(_response.body)
        else
          error_class = Square::Errors::ResponseError.subclass_for_code(code)
          raise error_class.new(_response.body, code: code)
        end
      end

      # Updates the details of an online store order. Every update you perform on an order corresponds to one of three actions:
      #
      # @return [Square::Types::V1Order]
      def v_1_update_order(request_options: {}, **params)
        _path_param_names = %w[location_id order_id]

        _request = Square::Internal::JSON::Request.new(
          base_url: request_options[:base_url] || Square::Environment::PRODUCTION,
          method: "PUT",
          path: "v1/#{params[:location_id]}/orders/#{params[:order_id]}",
          body: params.except(*_path_param_names)
        )
        begin
          _response = @client.send(_request)
        rescue Net::HTTPRequestTimeout
          raise Square::Errors::TimeoutError
        end
        code = _response.code.to_i
        if code.between?(200, 299)
          Square::Types::V1Order.load(_response.body)
        else
          error_class = Square::Errors::ResponseError.subclass_for_code(code)
          raise error_class.new(_response.body, code: code)
        end
      end
    end
  end
end
