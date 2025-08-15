
module Square
  module Orders
    class Client
      # @option client [Square::Internal::Http::RawClient]
      #
      # @return [Square::Orders::Client]
      def initialize(client)
        @client = client
      end

      # Creates a new [order](entity:Order) that can include information about products for
      # purchase and settings to apply to the purchase.
      # 
      # To pay for a created order, see
      # [Pay for Orders](https://developer.squareup.com/docs/orders-api/pay-for-orders).
      # 
      # You can modify open orders using the [UpdateOrder](api-endpoint:Orders-UpdateOrder) endpoint.
      #
      # @return [Square::CreateOrderResponse]
      def create(request_options: {}, **params)
        _request = Square::Internal::Http::JSONRequest.new(
          method: POST,
          path: "v2/orders"
        )
        _response = @client.send(_request)
        if _response.code >= "200" && _response.code < "300"
          return Square::Types::CreateOrderResponse.load(_response.body)
        else
          raise _response.body
        end
      end

      # Retrieves a set of [orders](entity:Order) by their IDs.
      # 
      # If a given order ID does not exist, the ID is ignored instead of generating an error.
      #
      # @return [Square::BatchGetOrdersResponse]
      def batch_get(request_options: {}, **params)
        _request = params
        _response = @client.send(_request)
        if _response.code >= "200" && _response.code < "300"
          return Square::Types::BatchGetOrdersResponse.load(_response.body)
        else
          raise _response.body
        end
      end

      # Enables applications to preview order pricing without creating an order.
      #
      # @return [Square::CalculateOrderResponse]
      def calculate(request_options: {}, **params)
        _request = params
        _response = @client.send(_request)
        if _response.code >= "200" && _response.code < "300"
          return Square::Types::CalculateOrderResponse.load(_response.body)
        else
          raise _response.body
        end
      end

      # Creates a new order, in the `DRAFT` state, by duplicating an existing order. The newly created order has
      # only the core fields (such as line items, taxes, and discounts) copied from the original order.
      #
      # @return [Square::CloneOrderResponse]
      def clone(request_options: {}, **params)
        _request = params
        _response = @client.send(_request)
        if _response.code >= "200" && _response.code < "300"
          return Square::Types::CloneOrderResponse.load(_response.body)
        else
          raise _response.body
        end
      end

      # Search all orders for one or more locations. Orders include all sales,
      # returns, and exchanges regardless of how or when they entered the Square
      # ecosystem (such as Point of Sale, Invoices, and Connect APIs).
      # 
      # `SearchOrders` requests need to specify which locations to search and define a
      # [SearchOrdersQuery](entity:SearchOrdersQuery) object that controls
      # how to sort or filter the results. Your `SearchOrdersQuery` can:
      # 
      #   Set filter criteria.
      #   Set the sort order.
      #   Determine whether to return results as complete `Order` objects or as
      # [OrderEntry](entity:OrderEntry) objects.
      # 
      # Note that details for orders processed with Square Point of Sale while in
      # offline mode might not be transmitted to Square for up to 72 hours. Offline
      # orders have a `created_at` value that reflects the time the order was created,
      # not the time it was subsequently transmitted to Square.
      #
      # @return [Square::SearchOrdersResponse]
      def search(request_options: {}, **params)
        _request = params
        _response = @client.send(_request)
        if _response.code >= "200" && _response.code < "300"
          return Square::Types::SearchOrdersResponse.load(_response.body)
        else
          raise _response.body
        end
      end

      # Retrieves an [Order](entity:Order) by ID.
      #
      # @return [Square::GetOrderResponse]
      def get(request_options: {}, **params)
        _request = params
        _response = @client.send(_request)
        if _response.code >= "200" && _response.code < "300"
          return Square::Types::GetOrderResponse.load(_response.body)
        else
          raise _response.body
        end
      end

      # Updates an open [order](entity:Order) by adding, replacing, or deleting
      # fields. Orders with a `COMPLETED` or `CANCELED` state cannot be updated.
      # 
      # An `UpdateOrder` request requires the following:
      # 
      # - The `order_id` in the endpoint path, identifying the order to update.
      # - The latest `version` of the order to update.
      # - The [sparse order](https://developer.squareup.com/docs/orders-api/manage-orders/update-orders#sparse-order-objects)
      # containing only the fields to update and the version to which the update is
      # being applied.
      # - If deleting fields, the [dot notation paths](https://developer.squareup.com/docs/orders-api/manage-orders/update-orders#identifying-fields-to-delete)
      # identifying the fields to clear.
      # 
      # To pay for an order, see
      # [Pay for Orders](https://developer.squareup.com/docs/orders-api/pay-for-orders).
      #
      # @return [Square::UpdateOrderResponse]
      def update(request_options: {}, **params)
        _request = params
        _response = @client.send(_request)
        if _response.code >= "200" && _response.code < "300"
          return Square::Types::UpdateOrderResponse.load(_response.body)
        else
          raise _response.body
        end
      end

      # Pay for an [order](entity:Order) using one or more approved [payments](entity:Payment)
      # or settle an order with a total of `0`.
      # 
      # The total of the `payment_ids` listed in the request must be equal to the order
      # total. Orders with a total amount of `0` can be marked as paid by specifying an empty
      # array of `payment_ids` in the request.
      # 
      # To be used with `PayOrder`, a payment must:
      # 
      # - Reference the order by specifying the `order_id` when [creating the payment](api-endpoint:Payments-CreatePayment).
      # Any approved payments that reference the same `order_id` not specified in the
      # `payment_ids` is canceled.
      # - Be approved with [delayed capture](https://developer.squareup.com/docs/payments-api/take-payments/card-payments/delayed-capture).
      # Using a delayed capture payment with `PayOrder` completes the approved payment.
      #
      # @return [Square::PayOrderResponse]
      def pay(request_options: {}, **params)
        _request = params
        _response = @client.send(_request)
        if _response.code >= "200" && _response.code < "300"
          return Square::Types::PayOrderResponse.load(_response.body)
        else
          raise _response.body
        end
      end

    end
  end
end
