# frozen_string_literal: true

module Square
  module Orders
    class Client
      # @param client [Square::Internal::Http::RawClient]
      #
      # @return [void]
      def initialize(client:)
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
      # @param request_options [Hash]
      # @param params [Square::Types::CreateOrderRequest]
      # @option request_options [String] :base_url
      # @option request_options [Hash{String => Object}] :additional_headers
      # @option request_options [Hash{String => Object}] :additional_query_parameters
      # @option request_options [Hash{String => Object}] :additional_body_parameters
      # @option request_options [Integer] :timeout_in_seconds
      #
      # @example
      #   client.orders.create(
      #     order: {
      #       location_id: "057P5VYJ4A5X1",
      #       reference_id: "my-order-001",
      #       line_items: [{
      #         name: "New York Strip Steak",
      #         quantity: "1",
      #         base_price_money: {
      #           amount: 1599,
      #           currency: "USD"
      #         }
      #       }, {
      #         quantity: "2",
      #         catalog_object_id: "BEMYCSMIJL46OCDV4KYIKXIB",
      #         modifiers: [{
      #           catalog_object_id: "CHQX7Y4KY6N5KINJKZCFURPZ"
      #         }],
      #         applied_discounts: [{
      #           discount_uid: "one-dollar-off"
      #         }]
      #       }],
      #       taxes: [{
      #         uid: "state-sales-tax",
      #         name: "State Sales Tax",
      #         percentage: "9",
      #         scope: "ORDER"
      #       }],
      #       discounts: [{
      #         uid: "labor-day-sale",
      #         name: "Labor Day Sale",
      #         percentage: "5",
      #         scope: "ORDER"
      #       }, {
      #         uid: "membership-discount",
      #         catalog_object_id: "DB7L55ZH2BGWI4H23ULIWOQ7",
      #         scope: "ORDER"
      #       }, {
      #         uid: "one-dollar-off",
      #         name: "Sale - $1.00 off",
      #         amount_money: {
      #           amount: 100,
      #           currency: "USD"
      #         },
      #         scope: "LINE_ITEM"
      #       }]
      #     },
      #     idempotency_key: "8193148c-9586-11e6-99f9-28cfe92138cf"
      #   )
      #
      # @return [Square::Types::CreateOrderResponse]
      def create(request_options: {}, **params)
        params = Square::Internal::Types::Utils.normalize_keys(params)
        request = Square::Internal::JSON::Request.new(
          base_url: request_options[:base_url],
          method: "POST",
          path: "v2/orders",
          body: Square::Types::CreateOrderRequest.new(params).to_h,
          request_options: request_options
        )
        begin
          response = @client.send(request)
        rescue Net::HTTPRequestTimeout
          raise Square::Errors::TimeoutError
        end
        code = response.code.to_i
        if code.between?(200, 299)
          (response.body.to_s.empty? ? nil : Square::Types::CreateOrderResponse.load(response.body))
        else
          error_class = Square::Errors::ResponseError.subclass_for_code(code)
          raise error_class.new(response.body, code: code)
        end
      end

      # Retrieves a set of [orders](entity:Order) by their IDs.
      #
      # If a given order ID does not exist, the ID is ignored instead of generating an error.
      #
      # @param request_options [Hash]
      # @param params [Square::Orders::Types::BatchGetOrdersRequest]
      # @option request_options [String] :base_url
      # @option request_options [Hash{String => Object}] :additional_headers
      # @option request_options [Hash{String => Object}] :additional_query_parameters
      # @option request_options [Hash{String => Object}] :additional_body_parameters
      # @option request_options [Integer] :timeout_in_seconds
      #
      # @example
      #   client.orders.batch_get(
      #     location_id: "057P5VYJ4A5X1",
      #     order_ids: %w[CAISEM82RcpmcFBM0TfOyiHV3es CAISENgvlJ6jLWAzERDzjyHVybY]
      #   )
      #
      # @return [Square::Types::BatchGetOrdersResponse]
      def batch_get(request_options: {}, **params)
        params = Square::Internal::Types::Utils.normalize_keys(params)
        request = Square::Internal::JSON::Request.new(
          base_url: request_options[:base_url],
          method: "POST",
          path: "v2/orders/batch-retrieve",
          body: Square::Orders::Types::BatchGetOrdersRequest.new(params).to_h,
          request_options: request_options
        )
        begin
          response = @client.send(request)
        rescue Net::HTTPRequestTimeout
          raise Square::Errors::TimeoutError
        end
        code = response.code.to_i
        if code.between?(200, 299)
          (response.body.to_s.empty? ? nil : Square::Types::BatchGetOrdersResponse.load(response.body))
        else
          error_class = Square::Errors::ResponseError.subclass_for_code(code)
          raise error_class.new(response.body, code: code)
        end
      end

      # Enables applications to preview order pricing without creating an order.
      #
      # @param request_options [Hash]
      # @param params [Square::Orders::Types::CalculateOrderRequest]
      # @option request_options [String] :base_url
      # @option request_options [Hash{String => Object}] :additional_headers
      # @option request_options [Hash{String => Object}] :additional_query_parameters
      # @option request_options [Hash{String => Object}] :additional_body_parameters
      # @option request_options [Integer] :timeout_in_seconds
      #
      # @example
      #   client.orders.calculate(order: {
      #     location_id: "D7AVYMEAPJ3A3",
      #     line_items: [{
      #       name: "Item 1",
      #       quantity: "1",
      #       base_price_money: {
      #         amount: 500,
      #         currency: "USD"
      #       }
      #     }, {
      #       name: "Item 2",
      #       quantity: "2",
      #       base_price_money: {
      #         amount: 300,
      #         currency: "USD"
      #       }
      #     }],
      #     discounts: [{
      #       name: "50% Off",
      #       percentage: "50",
      #       scope: "ORDER"
      #     }]
      #   })
      #
      # @return [Square::Types::CalculateOrderResponse]
      def calculate(request_options: {}, **params)
        params = Square::Internal::Types::Utils.normalize_keys(params)
        request = Square::Internal::JSON::Request.new(
          base_url: request_options[:base_url],
          method: "POST",
          path: "v2/orders/calculate",
          body: Square::Orders::Types::CalculateOrderRequest.new(params).to_h,
          request_options: request_options
        )
        begin
          response = @client.send(request)
        rescue Net::HTTPRequestTimeout
          raise Square::Errors::TimeoutError
        end
        code = response.code.to_i
        if code.between?(200, 299)
          (response.body.to_s.empty? ? nil : Square::Types::CalculateOrderResponse.load(response.body))
        else
          error_class = Square::Errors::ResponseError.subclass_for_code(code)
          raise error_class.new(response.body, code: code)
        end
      end

      # Creates a new order, in the `DRAFT` state, by duplicating an existing order. The newly created order has
      # only the core fields (such as line items, taxes, and discounts) copied from the original order.
      #
      # @param request_options [Hash]
      # @param params [Square::Orders::Types::CloneOrderRequest]
      # @option request_options [String] :base_url
      # @option request_options [Hash{String => Object}] :additional_headers
      # @option request_options [Hash{String => Object}] :additional_query_parameters
      # @option request_options [Hash{String => Object}] :additional_body_parameters
      # @option request_options [Integer] :timeout_in_seconds
      #
      # @example
      #   client.orders.clone(
      #     order_id: "ZAISEM52YcpmcWAzERDOyiWS123",
      #     version: 3,
      #     idempotency_key: "UNIQUE_STRING"
      #   )
      #
      # @return [Square::Types::CloneOrderResponse]
      def clone(request_options: {}, **params)
        params = Square::Internal::Types::Utils.normalize_keys(params)
        request = Square::Internal::JSON::Request.new(
          base_url: request_options[:base_url],
          method: "POST",
          path: "v2/orders/clone",
          body: Square::Orders::Types::CloneOrderRequest.new(params).to_h,
          request_options: request_options
        )
        begin
          response = @client.send(request)
        rescue Net::HTTPRequestTimeout
          raise Square::Errors::TimeoutError
        end
        code = response.code.to_i
        if code.between?(200, 299)
          (response.body.to_s.empty? ? nil : Square::Types::CloneOrderResponse.load(response.body))
        else
          error_class = Square::Errors::ResponseError.subclass_for_code(code)
          raise error_class.new(response.body, code: code)
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
      # orders have a `created_at` value that reflects the time the order was
      # transmitted to Square and created server-side, not the time the order was
      # created on the Point of Sale device.
      #
      # @param request_options [Hash]
      # @param params [Square::Orders::Types::SearchOrdersRequest]
      # @option request_options [String] :base_url
      # @option request_options [Hash{String => Object}] :additional_headers
      # @option request_options [Hash{String => Object}] :additional_query_parameters
      # @option request_options [Hash{String => Object}] :additional_body_parameters
      # @option request_options [Integer] :timeout_in_seconds
      #
      # @example
      #   client.orders.search(
      #     location_ids: %w[057P5VYJ4A5X1 18YC4JDH91E1H],
      #     query: {
      #       filter: {
      #         state_filter: {
      #           states: ["COMPLETED"]
      #         },
      #         date_time_filter: {
      #           closed_at: {
      #             start_at: "2018-03-03T20:00:00+00:00",
      #             end_at: "2019-03-04T21:54:45+00:00"
      #           }
      #         }
      #       },
      #       sort: {
      #         sort_field: "CLOSED_AT",
      #         sort_order: "DESC"
      #       }
      #     },
      #     limit: 3,
      #     return_entries: true
      #   )
      #
      # @return [Square::Types::SearchOrdersResponse]
      def search(request_options: {}, **params)
        params = Square::Internal::Types::Utils.normalize_keys(params)
        request = Square::Internal::JSON::Request.new(
          base_url: request_options[:base_url],
          method: "POST",
          path: "v2/orders/search",
          body: Square::Orders::Types::SearchOrdersRequest.new(params).to_h,
          request_options: request_options
        )
        begin
          response = @client.send(request)
        rescue Net::HTTPRequestTimeout
          raise Square::Errors::TimeoutError
        end
        code = response.code.to_i
        if code.between?(200, 299)
          (response.body.to_s.empty? ? nil : Square::Types::SearchOrdersResponse.load(response.body))
        else
          error_class = Square::Errors::ResponseError.subclass_for_code(code)
          raise error_class.new(response.body, code: code)
        end
      end

      # Retrieves an [Order](entity:Order) by ID.
      #
      # @param request_options [Hash]
      # @param params [Hash]
      # @option request_options [String] :base_url
      # @option request_options [Hash{String => Object}] :additional_headers
      # @option request_options [Hash{String => Object}] :additional_query_parameters
      # @option request_options [Hash{String => Object}] :additional_body_parameters
      # @option request_options [Integer] :timeout_in_seconds
      # @option params [String] :order_id
      #
      # @example
      #   client.orders.get(order_id: "order_id")
      #
      # @return [Square::Types::GetOrderResponse]
      def get(request_options: {}, **params)
        params = Square::Internal::Types::Utils.normalize_keys(params)
        request = Square::Internal::JSON::Request.new(
          base_url: request_options[:base_url],
          method: "GET",
          path: "v2/orders/#{URI.encode_uri_component(params[:order_id].to_s)}",
          request_options: request_options
        )
        begin
          response = @client.send(request)
        rescue Net::HTTPRequestTimeout
          raise Square::Errors::TimeoutError
        end
        code = response.code.to_i
        if code.between?(200, 299)
          (response.body.to_s.empty? ? nil : Square::Types::GetOrderResponse.load(response.body))
        else
          error_class = Square::Errors::ResponseError.subclass_for_code(code)
          raise error_class.new(response.body, code: code)
        end
      end

      # Updates an open [order](entity:Order) by adding, replacing, or deleting
      # fields. Orders with a `COMPLETED` or `CANCELED` state cannot be updated.
      #
      # An `UpdateOrder` request requires the following:
      #
      # - The `order_id` in the endpoint path, identifying the order to update.
      # - The latest `version` of the order to update.
      # - The [sparse
      # order](https://developer.squareup.com/docs/orders-api/manage-orders/update-orders#sparse-order-objects)
      # containing only the fields to update and the version to which the update is
      # being applied.
      # - If deleting fields, the [dot notation
      # paths](https://developer.squareup.com/docs/orders-api/manage-orders/update-orders#identifying-fields-to-delete)
      # identifying the fields to clear.
      #
      # To pay for an order, see
      # [Pay for Orders](https://developer.squareup.com/docs/orders-api/pay-for-orders).
      #
      # @param request_options [Hash]
      # @param params [Square::Orders::Types::UpdateOrderRequest]
      # @option request_options [String] :base_url
      # @option request_options [Hash{String => Object}] :additional_headers
      # @option request_options [Hash{String => Object}] :additional_query_parameters
      # @option request_options [Hash{String => Object}] :additional_body_parameters
      # @option request_options [Integer] :timeout_in_seconds
      # @option params [String] :order_id
      #
      # @example
      #   client.orders.update(
      #     order_id: "order_id",
      #     order: {
      #       location_id: "location_id",
      #       line_items: [{
      #         uid: "cookie_uid",
      #         name: "COOKIE",
      #         quantity: "2",
      #         base_price_money: {
      #           amount: 200,
      #           currency: "USD"
      #         }
      #       }],
      #       version: 1
      #     },
      #     fields_to_clear: ["discounts"],
      #     idempotency_key: "UNIQUE_STRING"
      #   )
      #
      # @return [Square::Types::UpdateOrderResponse]
      def update(request_options: {}, **params)
        params = Square::Internal::Types::Utils.normalize_keys(params)
        request_data = Square::Orders::Types::UpdateOrderRequest.new(params).to_h
        non_body_param_names = %w[order_id]
        body = request_data.except(*non_body_param_names)

        request = Square::Internal::JSON::Request.new(
          base_url: request_options[:base_url],
          method: "PUT",
          path: "v2/orders/#{URI.encode_uri_component(params[:order_id].to_s)}",
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
          (response.body.to_s.empty? ? nil : Square::Types::UpdateOrderResponse.load(response.body))
        else
          error_class = Square::Errors::ResponseError.subclass_for_code(code)
          raise error_class.new(response.body, code: code)
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
      # - Reference the order by specifying the `order_id` when [creating the
      # payment](api-endpoint:Payments-CreatePayment).
      # Any approved payments that reference the same `order_id` not specified in the
      # `payment_ids` is canceled.
      # - Be approved with [delayed
      # capture](https://developer.squareup.com/docs/payments-api/take-payments/card-payments/delayed-capture).
      # Using a delayed capture payment with `PayOrder` completes the approved payment.
      #
      # @param request_options [Hash]
      # @param params [Square::Orders::Types::PayOrderRequest]
      # @option request_options [String] :base_url
      # @option request_options [Hash{String => Object}] :additional_headers
      # @option request_options [Hash{String => Object}] :additional_query_parameters
      # @option request_options [Hash{String => Object}] :additional_body_parameters
      # @option request_options [Integer] :timeout_in_seconds
      # @option params [String] :order_id
      #
      # @example
      #   client.orders.pay(
      #     order_id: "order_id",
      #     idempotency_key: "c043a359-7ad9-4136-82a9-c3f1d66dcbff",
      #     payment_ids: %w[EnZdNAlWCmfh6Mt5FMNST1o7taB 0LRiVlbXVwe8ozu4KbZxd12mvaB]
      #   )
      #
      # @return [Square::Types::PayOrderResponse]
      def pay(request_options: {}, **params)
        params = Square::Internal::Types::Utils.normalize_keys(params)
        request_data = Square::Orders::Types::PayOrderRequest.new(params).to_h
        non_body_param_names = %w[order_id]
        body = request_data.except(*non_body_param_names)

        request = Square::Internal::JSON::Request.new(
          base_url: request_options[:base_url],
          method: "POST",
          path: "v2/orders/#{URI.encode_uri_component(params[:order_id].to_s)}/pay",
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
          (response.body.to_s.empty? ? nil : Square::Types::PayOrderResponse.load(response.body))
        else
          error_class = Square::Errors::ResponseError.subclass_for_code(code)
          raise error_class.new(response.body, code: code)
        end
      end

      # @return [Square::CustomAttributeDefinitions::Client]
      def custom_attribute_definitions
        @custom_attribute_definitions ||= Square::Orders::CustomAttributeDefinitions::Client.new(client: @client)
      end

      # @return [Square::CustomAttributes::Client]
      def custom_attributes
        @custom_attributes ||= Square::Orders::CustomAttributes::Client.new(client: @client)
      end
    end
  end
end
