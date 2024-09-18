module Square
  # OrdersApi
  class OrdersApi < BaseApi
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
    # @return [ApiResponse]  the complete http response with raw body and status code.
    def create_order(body:)
      new_api_call_builder
        .request(new_request_builder(HttpMethodEnum::POST,
                                     '/v2/orders',
                                     'default')
                   .header_param(new_parameter('application/json', key: 'Content-Type'))
                   .body_param(new_parameter(body))
                   .header_param(new_parameter('application/json', key: 'accept'))
                   .body_serializer(proc do |param| param.to_json unless param.nil? end)
                   .auth(Single.new('global')))
        .response(new_response_handler
                    .deserializer(APIHelper.method(:json_deserialize))
                    .is_api_response(true)
                    .convertor(ApiResponse.method(:create)))
        .execute
    end

    # Retrieves a set of [orders]($m/Order) by their IDs.
    # If a given order ID does not exist, the ID is ignored instead of
    # generating an error.
    # @param [BatchRetrieveOrdersRequest] body Required parameter: An object
    # containing the fields to POST for the request.  See the corresponding
    # object definition for field details.
    # @return [ApiResponse]  the complete http response with raw body and status code.
    def batch_retrieve_orders(body:)
      new_api_call_builder
        .request(new_request_builder(HttpMethodEnum::POST,
                                     '/v2/orders/batch-retrieve',
                                     'default')
                   .header_param(new_parameter('application/json', key: 'Content-Type'))
                   .body_param(new_parameter(body))
                   .header_param(new_parameter('application/json', key: 'accept'))
                   .body_serializer(proc do |param| param.to_json unless param.nil? end)
                   .auth(Single.new('global')))
        .response(new_response_handler
                    .deserializer(APIHelper.method(:json_deserialize))
                    .is_api_response(true)
                    .convertor(ApiResponse.method(:create)))
        .execute
    end

    # Enables applications to preview order pricing without creating an order.
    # @param [CalculateOrderRequest] body Required parameter: An object
    # containing the fields to POST for the request.  See the corresponding
    # object definition for field details.
    # @return [ApiResponse]  the complete http response with raw body and status code.
    def calculate_order(body:)
      new_api_call_builder
        .request(new_request_builder(HttpMethodEnum::POST,
                                     '/v2/orders/calculate',
                                     'default')
                   .header_param(new_parameter('application/json', key: 'Content-Type'))
                   .body_param(new_parameter(body))
                   .header_param(new_parameter('application/json', key: 'accept'))
                   .body_serializer(proc do |param| param.to_json unless param.nil? end)
                   .auth(Single.new('global')))
        .response(new_response_handler
                    .deserializer(APIHelper.method(:json_deserialize))
                    .is_api_response(true)
                    .convertor(ApiResponse.method(:create)))
        .execute
    end

    # Creates a new order, in the `DRAFT` state, by duplicating an existing
    # order. The newly created order has
    # only the core fields (such as line items, taxes, and discounts) copied
    # from the original order.
    # @param [CloneOrderRequest] body Required parameter: An object containing
    # the fields to POST for the request.  See the corresponding object
    # definition for field details.
    # @return [ApiResponse]  the complete http response with raw body and status code.
    def clone_order(body:)
      new_api_call_builder
        .request(new_request_builder(HttpMethodEnum::POST,
                                     '/v2/orders/clone',
                                     'default')
                   .header_param(new_parameter('application/json', key: 'Content-Type'))
                   .body_param(new_parameter(body))
                   .header_param(new_parameter('application/json', key: 'accept'))
                   .body_serializer(proc do |param| param.to_json unless param.nil? end)
                   .auth(Single.new('global')))
        .response(new_response_handler
                    .deserializer(APIHelper.method(:json_deserialize))
                    .is_api_response(true)
                    .convertor(ApiResponse.method(:create)))
        .execute
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
    # @return [ApiResponse]  the complete http response with raw body and status code.
    def search_orders(body:)
      new_api_call_builder
        .request(new_request_builder(HttpMethodEnum::POST,
                                     '/v2/orders/search',
                                     'default')
                   .header_param(new_parameter('application/json', key: 'Content-Type'))
                   .body_param(new_parameter(body))
                   .header_param(new_parameter('application/json', key: 'accept'))
                   .body_serializer(proc do |param| param.to_json unless param.nil? end)
                   .auth(Single.new('global')))
        .response(new_response_handler
                    .deserializer(APIHelper.method(:json_deserialize))
                    .is_api_response(true)
                    .convertor(ApiResponse.method(:create)))
        .execute
    end

    # Retrieves an [Order]($m/Order) by ID.
    # @param [String] order_id Required parameter: The ID of the order to
    # retrieve.
    # @return [ApiResponse]  the complete http response with raw body and status code.
    def retrieve_order(order_id:)
      new_api_call_builder
        .request(new_request_builder(HttpMethodEnum::GET,
                                     '/v2/orders/{order_id}',
                                     'default')
                   .template_param(new_parameter(order_id, key: 'order_id')
                                    .should_encode(true))
                   .header_param(new_parameter('application/json', key: 'accept'))
                   .auth(Single.new('global')))
        .response(new_response_handler
                    .deserializer(APIHelper.method(:json_deserialize))
                    .is_api_response(true)
                    .convertor(ApiResponse.method(:create)))
        .execute
    end

    # Updates an open [order]($m/Order) by adding, replacing, or deleting
    # fields. Orders with a `COMPLETED` or `CANCELED` state cannot be updated.
    # An `UpdateOrder` request requires the following:
    # - The `order_id` in the endpoint path, identifying the order to update.
    # - The latest `version` of the order to update.
    # - The [sparse
    # order](https://developer.squareup.com/docs/orders-api/manage-orders/update
    # -orders#sparse-order-objects)
    # containing only the fields to update and the version to which the update
    # is
    # being applied.
    # - If deleting fields, the [dot notation
    # paths](https://developer.squareup.com/docs/orders-api/manage-orders/update
    # -orders#identifying-fields-to-delete)
    # identifying the fields to clear.
    # To pay for an order, see
    # [Pay for
    # Orders](https://developer.squareup.com/docs/orders-api/pay-for-orders).
    # @param [String] order_id Required parameter: The ID of the order to
    # update.
    # @param [UpdateOrderRequest] body Required parameter: An object containing
    # the fields to POST for the request.  See the corresponding object
    # definition for field details.
    # @return [ApiResponse]  the complete http response with raw body and status code.
    def update_order(order_id:,
                     body:)
      new_api_call_builder
        .request(new_request_builder(HttpMethodEnum::PUT,
                                     '/v2/orders/{order_id}',
                                     'default')
                   .template_param(new_parameter(order_id, key: 'order_id')
                                    .should_encode(true))
                   .header_param(new_parameter('application/json', key: 'Content-Type'))
                   .body_param(new_parameter(body))
                   .header_param(new_parameter('application/json', key: 'accept'))
                   .body_serializer(proc do |param| param.to_json unless param.nil? end)
                   .auth(Single.new('global')))
        .response(new_response_handler
                    .deserializer(APIHelper.method(:json_deserialize))
                    .is_api_response(true)
                    .convertor(ApiResponse.method(:create)))
        .execute
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
    # capture](https://developer.squareup.com/docs/payments-api/take-payments/ca
    # rd-payments/delayed-capture).
    # Using a delayed capture payment with `PayOrder` completes the approved
    # payment.
    # @param [String] order_id Required parameter: The ID of the order being
    # paid.
    # @param [PayOrderRequest] body Required parameter: An object containing the
    # fields to POST for the request.  See the corresponding object definition
    # for field details.
    # @return [ApiResponse]  the complete http response with raw body and status code.
    def pay_order(order_id:,
                  body:)
      new_api_call_builder
        .request(new_request_builder(HttpMethodEnum::POST,
                                     '/v2/orders/{order_id}/pay',
                                     'default')
                   .template_param(new_parameter(order_id, key: 'order_id')
                                    .should_encode(true))
                   .header_param(new_parameter('application/json', key: 'Content-Type'))
                   .body_param(new_parameter(body))
                   .header_param(new_parameter('application/json', key: 'accept'))
                   .body_serializer(proc do |param| param.to_json unless param.nil? end)
                   .auth(Single.new('global')))
        .response(new_response_handler
                    .deserializer(APIHelper.method(:json_deserialize))
                    .is_api_response(true)
                    .convertor(ApiResponse.method(:create)))
        .execute
    end
  end
end
