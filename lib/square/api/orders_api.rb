module Square
  # OrdersApi
  class OrdersApi < BaseApi
    def initialize(config, http_call_back: nil)
      super(config, http_call_back: http_call_back)
    end

    # Creates a new [Order](#type-order) which can include information on
    # products for
    # purchase and settings to apply to the purchase.
    # To pay for a created order, please refer to the [Pay for
    # Orders](https://developer.squareup.com/docs/orders-api/pay-for-orders)
    # guide.
    # You can modify open orders using the
    # [UpdateOrder](#endpoint-orders-updateorder) endpoint.
    # To learn more about the Orders API, see the
    # [Orders API
    # Overview](https://developer.squareup.com/docs/orders-api/what-it-does).
    # @param [CreateOrderRequest] body Required parameter: An object containing
    # the fields to POST for the request.  See the corresponding object
    # definition for field details.
    # @return [CreateOrderResponse Hash] response from the API call
    def create_order(body:)
      # Prepare query url.
      _query_builder = config.get_base_uri
      _query_builder << '/v2/orders'
      _query_url = APIHelper.clean_url _query_builder

      # Prepare headers.
      _headers = {
        'accept' => 'application/json',
        'content-type' => 'application/json; charset=utf-8'
      }

      # Prepare and execute HttpRequest.
      _request = config.http_client.post(
        _query_url,
        headers: _headers,
        parameters: body.to_json
      )
      OAuth2.apply(config, _request)
      _response = execute_request(_request)

      # Return appropriate response type.
      decoded = APIHelper.json_deserialize(_response.raw_body)
      _errors = APIHelper.map_response(decoded, ['errors'])
      ApiResponse.new(_response, data: decoded, errors: _errors)
    end

    # Retrieves a set of [Order](#type-order)s by their IDs.
    # If a given Order ID does not exist, the ID is ignored instead of
    # generating an error.
    # @param [BatchRetrieveOrdersRequest] body Required parameter: An object
    # containing the fields to POST for the request.  See the corresponding
    # object definition for field details.
    # @return [BatchRetrieveOrdersResponse Hash] response from the API call
    def batch_retrieve_orders(body:)
      # Prepare query url.
      _query_builder = config.get_base_uri
      _query_builder << '/v2/orders/batch-retrieve'
      _query_url = APIHelper.clean_url _query_builder

      # Prepare headers.
      _headers = {
        'accept' => 'application/json',
        'content-type' => 'application/json; charset=utf-8'
      }

      # Prepare and execute HttpRequest.
      _request = config.http_client.post(
        _query_url,
        headers: _headers,
        parameters: body.to_json
      )
      OAuth2.apply(config, _request)
      _response = execute_request(_request)

      # Return appropriate response type.
      decoded = APIHelper.json_deserialize(_response.raw_body)
      _errors = APIHelper.map_response(decoded, ['errors'])
      ApiResponse.new(_response, data: decoded, errors: _errors)
    end

    # Calculates an [Order](#type-order).
    # @param [CalculateOrderRequest] body Required parameter: An object
    # containing the fields to POST for the request.  See the corresponding
    # object definition for field details.
    # @return [CalculateOrderResponse Hash] response from the API call
    def calculate_order(body:)
      # Prepare query url.
      _query_builder = config.get_base_uri
      _query_builder << '/v2/orders/calculate'
      _query_url = APIHelper.clean_url _query_builder

      # Prepare headers.
      _headers = {
        'accept' => 'application/json',
        'content-type' => 'application/json; charset=utf-8'
      }

      # Prepare and execute HttpRequest.
      _request = config.http_client.post(
        _query_url,
        headers: _headers,
        parameters: body.to_json
      )
      OAuth2.apply(config, _request)
      _response = execute_request(_request)

      # Return appropriate response type.
      decoded = APIHelper.json_deserialize(_response.raw_body)
      _errors = APIHelper.map_response(decoded, ['errors'])
      ApiResponse.new(_response, data: decoded, errors: _errors)
    end

    # Search all orders for one or more locations. Orders include all sales,
    # returns, and exchanges regardless of how or when they entered the Square
    # Ecosystem (e.g. Point of Sale, Invoices, Connect APIs, etc).
    # SearchOrders requests need to specify which locations to search and define
    # a
    # [`SearchOrdersQuery`](#type-searchordersquery) object which controls
    # how to sort or filter the results. Your SearchOrdersQuery can:
    #   Set filter criteria.
    #   Set sort order.
    #   Determine whether to return results as complete Order objects, or as
    # [OrderEntry](#type-orderentry) objects.
    # Note that details for orders processed with Square Point of Sale while in
    # offline mode may not be transmitted to Square for up to 72 hours. Offline
    # orders have a `created_at` value that reflects the time the order was
    # created,
    # not the time it was subsequently transmitted to Square.
    # @param [SearchOrdersRequest] body Required parameter: An object containing
    # the fields to POST for the request.  See the corresponding object
    # definition for field details.
    # @return [SearchOrdersResponse Hash] response from the API call
    def search_orders(body:)
      # Prepare query url.
      _query_builder = config.get_base_uri
      _query_builder << '/v2/orders/search'
      _query_url = APIHelper.clean_url _query_builder

      # Prepare headers.
      _headers = {
        'accept' => 'application/json',
        'content-type' => 'application/json; charset=utf-8'
      }

      # Prepare and execute HttpRequest.
      _request = config.http_client.post(
        _query_url,
        headers: _headers,
        parameters: body.to_json
      )
      OAuth2.apply(config, _request)
      _response = execute_request(_request)

      # Return appropriate response type.
      decoded = APIHelper.json_deserialize(_response.raw_body)
      _errors = APIHelper.map_response(decoded, ['errors'])
      ApiResponse.new(_response, data: decoded, errors: _errors)
    end

    # Updates an open [Order](#type-order) by adding, replacing, or deleting
    # fields. Orders with a `COMPLETED` or `CANCELED` state cannot be updated.
    # An UpdateOrder request requires the following:
    # - The `order_id` in the endpoint path, identifying the order to update.
    # - The latest `version` of the order to update.
    # - The [sparse
    # order](https://developer.squareup.com/docs/orders-api/manage-orders#sparse
    # -order-objects)
    # containing only the fields to update and the version the update is
    # being applied to.
    # - If deleting fields, the [dot notation
    # paths](https://developer.squareup.com/docs/orders-api/manage-orders#on-dot
    # -notation)
    # identifying fields to clear.
    # To pay for an order, please refer to the [Pay for
    # Orders](https://developer.squareup.com/docs/orders-api/pay-for-orders)
    # guide.
    # To learn more about the Orders API, see the
    # [Orders API
    # Overview](https://developer.squareup.com/docs/orders-api/what-it-does).
    # @param [String] order_id Required parameter: The ID of the order to
    # update.
    # @param [UpdateOrderRequest] body Required parameter: An object containing
    # the fields to POST for the request.  See the corresponding object
    # definition for field details.
    # @return [UpdateOrderResponse Hash] response from the API call
    def update_order(order_id:,
                     body:)
      # Prepare query url.
      _query_builder = config.get_base_uri
      _query_builder << '/v2/orders/{order_id}'
      _query_builder = APIHelper.append_url_with_template_parameters(
        _query_builder,
        'order_id' => order_id
      )
      _query_url = APIHelper.clean_url _query_builder

      # Prepare headers.
      _headers = {
        'accept' => 'application/json',
        'content-type' => 'application/json; charset=utf-8'
      }

      # Prepare and execute HttpRequest.
      _request = config.http_client.put(
        _query_url,
        headers: _headers,
        parameters: body.to_json
      )
      OAuth2.apply(config, _request)
      _response = execute_request(_request)

      # Return appropriate response type.
      decoded = APIHelper.json_deserialize(_response.raw_body)
      _errors = APIHelper.map_response(decoded, ['errors'])
      ApiResponse.new(_response, data: decoded, errors: _errors)
    end

    # Pay for an [order](#type-order) using one or more approved
    # [payments](#type-payment),
    # or settle an order with a total of `0`.
    # The total of the `payment_ids` listed in the request must be equal to the
    # order
    # total. Orders with a total amount of `0` can be marked as paid by
    # specifying an empty
    # array of `payment_ids` in the request.
    # To be used with PayOrder, a payment must:
    # - Reference the order by specifying the `order_id` when [creating the
    # payment](#endpoint-payments-createpayment).
    # Any approved payments that reference the same `order_id` not specified in
    # the
    # `payment_ids` will be canceled.
    # - Be approved with [delayed
    # capture](https://developer.squareup.com/docs/payments-api/take-payments#de
    # layed-capture).
    # Using a delayed capture payment with PayOrder will complete the approved
    # payment.
    # Learn how to [pay for orders with a single payment using the Payments
    # API](https://developer.squareup.com/docs/orders-api/pay-for-orders).
    # @param [String] order_id Required parameter: The ID of the order being
    # paid.
    # @param [PayOrderRequest] body Required parameter: An object containing the
    # fields to POST for the request.  See the corresponding object definition
    # for field details.
    # @return [PayOrderResponse Hash] response from the API call
    def pay_order(order_id:,
                  body:)
      # Prepare query url.
      _query_builder = config.get_base_uri
      _query_builder << '/v2/orders/{order_id}/pay'
      _query_builder = APIHelper.append_url_with_template_parameters(
        _query_builder,
        'order_id' => order_id
      )
      _query_url = APIHelper.clean_url _query_builder

      # Prepare headers.
      _headers = {
        'accept' => 'application/json',
        'content-type' => 'application/json; charset=utf-8'
      }

      # Prepare and execute HttpRequest.
      _request = config.http_client.post(
        _query_url,
        headers: _headers,
        parameters: body.to_json
      )
      OAuth2.apply(config, _request)
      _response = execute_request(_request)

      # Return appropriate response type.
      decoded = APIHelper.json_deserialize(_response.raw_body)
      _errors = APIHelper.map_response(decoded, ['errors'])
      ApiResponse.new(_response, data: decoded, errors: _errors)
    end
  end
end
