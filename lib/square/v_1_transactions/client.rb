# frozen_string_literal: true

module Square
  module V1Transactions
    class Client
      # @param client [Square::Internal::Http::RawClient]
      #
      # @return [void]
      def initialize(client:)
        @client = client
      end

      # Provides summary information for a merchant's online store orders.
      #
      # @param request_options [Hash]
      # @param params [Hash]
      # @option request_options [String] :base_url
      # @option request_options [Hash{String => Object}] :additional_headers
      # @option request_options [Hash{String => Object}] :additional_query_parameters
      # @option request_options [Hash{String => Object}] :additional_body_parameters
      # @option request_options [Integer] :timeout_in_seconds
      # @option params [String] :location_id
      # @option params [Square::Types::SortOrder, nil] :order
      # @option params [Integer, nil] :limit
      # @option params [String, nil] :batch_token
      #
      # @return [Array[Square::Types::V1Order]]
      def v_1_list_orders(request_options: {}, **params)
        params = Square::Internal::Types::Utils.normalize_keys(params)
        query_param_names = %i[order limit batch_token]
        query_params = {}
        query_params["order"] = params[:order] if params.key?(:order)
        query_params["limit"] = params[:limit] if params.key?(:limit)
        query_params["batch_token"] = params[:batch_token] if params.key?(:batch_token)
        params = params.except(*query_param_names)

        request = Square::Internal::JSON::Request.new(
          base_url: request_options[:base_url],
          method: "GET",
          path: "v1/#{params[:location_id]}/orders",
          query: query_params,
          request_options: request_options
        )
        begin
          response = @client.send(request)
        rescue Net::HTTPRequestTimeout
          raise Square::Errors::TimeoutError
        end
        code = response.code.to_i
        return if code.between?(200, 299)

        error_class = Square::Errors::ResponseError.subclass_for_code(code)
        raise error_class.new(response.body, code: code)
      end

      # Provides comprehensive information for a single online store order, including the order's history.
      #
      # @param request_options [Hash]
      # @param params [Hash]
      # @option request_options [String] :base_url
      # @option request_options [Hash{String => Object}] :additional_headers
      # @option request_options [Hash{String => Object}] :additional_query_parameters
      # @option request_options [Hash{String => Object}] :additional_body_parameters
      # @option request_options [Integer] :timeout_in_seconds
      # @option params [String] :location_id
      # @option params [String] :order_id
      #
      # @return [Square::Types::V1Order]
      def v_1_retrieve_order(request_options: {}, **params)
        params = Square::Internal::Types::Utils.normalize_keys(params)
        request = Square::Internal::JSON::Request.new(
          base_url: request_options[:base_url],
          method: "GET",
          path: "v1/#{params[:location_id]}/orders/#{params[:order_id]}",
          request_options: request_options
        )
        begin
          response = @client.send(request)
        rescue Net::HTTPRequestTimeout
          raise Square::Errors::TimeoutError
        end
        code = response.code.to_i
        if code.between?(200, 299)
          Square::Types::V1Order.load(response.body)
        else
          error_class = Square::Errors::ResponseError.subclass_for_code(code)
          raise error_class.new(response.body, code: code)
        end
      end

      # Updates the details of an online store order. Every update you perform on an order corresponds to one of three
      # actions:
      #
      # @param request_options [Hash]
      # @param params [Square::V1Transactions::Types::V1UpdateOrderRequest]
      # @option request_options [String] :base_url
      # @option request_options [Hash{String => Object}] :additional_headers
      # @option request_options [Hash{String => Object}] :additional_query_parameters
      # @option request_options [Hash{String => Object}] :additional_body_parameters
      # @option request_options [Integer] :timeout_in_seconds
      # @option params [String] :location_id
      # @option params [String] :order_id
      #
      # @return [Square::Types::V1Order]
      def v_1_update_order(request_options: {}, **params)
        params = Square::Internal::Types::Utils.normalize_keys(params)
        request_data = Square::V1Transactions::Types::V1UpdateOrderRequest.new(params).to_h
        non_body_param_names = %w[location_id order_id]
        body = request_data.except(*non_body_param_names)

        request = Square::Internal::JSON::Request.new(
          base_url: request_options[:base_url],
          method: "PUT",
          path: "v1/#{params[:location_id]}/orders/#{params[:order_id]}",
          body: body,
          request_options: request_options
        )
        begin
          response = @client.send(request)
        rescue Net::HTTPRequestTimeout
          raise Square::Errors::TimeoutError
        end
        code = response.code.to_i
        if code.between?(200, 299)
          Square::Types::V1Order.load(response.body)
        else
          error_class = Square::Errors::ResponseError.subclass_for_code(code)
          raise error_class.new(response.body, code: code)
        end
      end
    end
  end
end
