
module Square
  module V1Transactions
    class Client
      # @option client [Square::Internal::Http::RawClient]
      #
      # @return [Square::V1Transactions::Client]
      def initialize(client)
        @client = client
      end

      # Provides summary information for a merchant's online store orders.
      #
      # @return [Array[Square::Types::V1Order]]
      def v_1_list_orders(request_options: {}, **params)
        _request = params
        _response = @client.send(_request)
        if _response.code >= "200" && _response.code < "300"
          return 
        else
          raise _response.body
        end
      end

      # Provides comprehensive information for a single online store order, including the order's history.
      #
      # @return [Square::Types::V1Order]
      def v_1_retrieve_order(request_options: {}, **params)
        _request = params
        _response = @client.send(_request)
        if _response.code >= "200" && _response.code < "300"
          return Square::Types::V1Order.load(_response.body)
        else
          raise _response.body
        end
      end

      # Updates the details of an online store order. Every update you perform on an order corresponds to one of three actions:
      #
      # @return [Square::Types::V1Order]
      def v_1_update_order(request_options: {}, **params)
        _request = params
        _response = @client.send(_request)
        if _response.code >= "200" && _response.code < "300"
          return Square::Types::V1Order.load(_response.body)
        else
          raise _response.body
        end
      end

    end
  end
end
