module Square
  # OrdersApi
  class OrdersApi < BaseApi
    def initialize(config, http_call_back: nil)
      super(config, http_call_back: http_call_back)
    end

    # Creates a new [order]($m/Order) that can include information about
    # products for
    # purchase and settings to apply to the purchase.
    # To pay for a created order, see
    # [Pay for
    # Orders](https://developer.squareup.com/docs/orders-api/pay-for-orders).
    # You can modify open orders using the [UpdateOrder]($e/Orders/UpdateOrder)
    # endpoint.
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
      ApiResponse.new(
        _response, data: decoded, errors: _errors
      )
    end

    # Retrieves a set of [orders]($m/Order) by their IDs.
    # If a given order ID does not exist, the ID is ignored instead of
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
      ApiResponse.new(
        _response, data: decoded, errors: _errors
      )
    end

    # Enables applications to preview order pricing without creating an order.
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
      ApiResponse.new(
        _response, data: decoded, errors: _errors
      )
    end

    # Search all orders for one or more locations. Orders include all sales,
    # returns, and exchanges regardless of how or when they entered the Square
    # ecosystem (such as Point of Sale, Invoices, and Connect APIs).
    # `SearchOrders` requests need to specify which locations to search and
    # define a
    # [SearchOrdersQuery]($m/SearchOrdersQuery) object that controls
    # how to sort or filter the results. Your `SearchOrdersQuery` can:
    #   Set filter criteria.
    #   Set the sort order.
    #   Determine whether to return results as complete `Order` objects or as
    # [OrderEntry]($m/OrderEntry) objects.
    # Note that details for orders processed with Square Point of Sale while in
    # offline mode might not be transmitted to Square for up to 72 hours.
    # Offline
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
      ApiResponse.new(
        _response, data: decoded, errors: _errors
      )
    end

    # Retrieves an [Order]($m/Order) by ID.
    # @param [String] order_id Required parameter: The ID of the order to
    # retrieve.
    # @return [RetrieveOrderResponse Hash] response from the API call
    def retrieve_order(order_id:)
      # Prepare query url.
      _query_builder = config.get_base_uri
      _query_builder << '/v2/orders/{order_id}'
      _query_builder = APIHelper.append_url_with_template_parameters(
        _query_builder,
        'order_id' => { 'value' => order_id, 'encode' => true }
      )
      _query_url = APIHelper.clean_url _query_builder

      # Prepare headers.
      _headers = {
        'accept' => 'application/json'
      }

      # Prepare and execute HttpRequest.
      _request = config.http_client.get(
        _query_url,
        headers: _headers
      )
      OAuth2.apply(config, _request)
      _response = execute_request(_request)

      # Return appropriate response type.
      decoded = APIHelper.json_deserialize(_response.raw_body)
      _errors = APIHelper.map_response(decoded, ['errors'])
      ApiResponse.new(
        _response, data: decoded, errors: _errors
      )
    end

    # Updates an open [order]($m/Order) by adding, replacing, or deleting
    # fields. Orders with a `COMPLETED` or `CANCELED` state cannot be updated.
    # An `UpdateOrder` request requires the following:
    # - The `order_id` in the endpoint path, identifying the order to update.
    # - The latest `version` of the order to update.
    # - The [sparse
    # order](https://developer.squareup.com/docs/orders-api/manage-orders#sparse
    # -order-objects)
    # containing only the fields to update and the version to which the update
    # is
    # being applied.
    # - If deleting fields, the [dot notation
    # paths](https://developer.squareup.com/docs/orders-api/manage-orders#on-dot
    # -notation)
    # identifying the fields to clear.
    # To pay for an order, see
    # [Pay for
    # Orders](https://developer.squareup.com/docs/orders-api/pay-for-orders).
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
        'order_id' => { 'value' => order_id, 'encode' => true }
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
      ApiResponse.new(
        _response, data: decoded, errors: _errors
      )
    end

    # Pay for an [order]($m/Order) using one or more approved
    # [payments]($m/Payment)
    # or settle an order with a total of `0`.
    # The total of the `payment_ids` listed in the request must be equal to the
    # order
    # total. Orders with a total amount of `0` can be marked as paid by
    # specifying an empty
    # array of `payment_ids` in the request.
    # To be used with `PayOrder`, a payment must:
    # - Reference the order by specifying the `order_id` when [creating the
    # payment]($e/Payments/CreatePayment).
    # Any approved payments that reference the same `order_id` not specified in
    # the
    # `payment_ids` is canceled.
    # - Be approved with [delayed
    # capture](https://developer.squareup.com/docs/payments-api/take-payments#de
    # layed-capture).
    # Using a delayed capture payment with `PayOrder` completes the approved
    # payment.
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
        'order_id' => { 'value' => order_id, 'encode' => true }
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
      ApiResponse.new(
        _response, data: decoded, errors: _errors
      )
    end
  end
end
