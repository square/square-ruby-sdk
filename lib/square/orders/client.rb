# frozen_string_literal: true

module Square
  module Orders
    class Client
      # @return [Square::Orders::Client]
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
      # @return [Square::Types::CreateOrderResponse]
      def create(request_options: {}, **params)
        _request = Square::Internal::JSON::Request.new(
          base_url: request_options[:base_url] || Square::Environment::SANDBOX,
          method: "POST",
          path: "v2/orders",
          body: Square::Types::CreateOrderRequest.new(params[:request]).to_h
        )
        _response = @client.send(_request)
        if _response.code >= "200" && _response.code < "300"
          return Square::Types::CreateOrderResponse.load(_response.body)
        end

        raise _response.body
      end

      # Retrieves a set of [orders](entity:Order) by their IDs.
      #
      # If a given order ID does not exist, the ID is ignored instead of generating an error.
      #
      # @return [Square::Types::BatchGetOrdersResponse]
      def batch_get(request_options: {}, **params)
        _request = Square::Internal::JSON::Request.new(
          base_url: request_options[:base_url] || Square::Environment::SANDBOX,
          method: "POST",
          path: "v2/orders/batch-retrieve",
          body: params
        )
        _response = @client.send(_request)
        if _response.code >= "200" && _response.code < "300"
          return Square::Types::BatchGetOrdersResponse.load(_response.body)
        end

        raise _response.body
      end

      # Enables applications to preview order pricing without creating an order.
      #
      # @return [Square::Types::CalculateOrderResponse]
      def calculate(request_options: {}, **params)
        _request = Square::Internal::JSON::Request.new(
          base_url: request_options[:base_url] || Square::Environment::SANDBOX,
          method: "POST",
          path: "v2/orders/calculate",
          body: params
        )
        _response = @client.send(_request)
        if _response.code >= "200" && _response.code < "300"
          return Square::Types::CalculateOrderResponse.load(_response.body)
        end

        raise _response.body
      end

      # Creates a new order, in the `DRAFT` state, by duplicating an existing order. The newly created order has
      # only the core fields (such as line items, taxes, and discounts) copied from the original order.
      #
      # @return [Square::Types::CloneOrderResponse]
      def clone(request_options: {}, **params)
        _request = Square::Internal::JSON::Request.new(
          base_url: request_options[:base_url] || Square::Environment::SANDBOX,
          method: "POST",
          path: "v2/orders/clone",
          body: params
        )
        _response = @client.send(_request)
        if _response.code >= "200" && _response.code < "300"
          return Square::Types::CloneOrderResponse.load(_response.body)
        end

        raise _response.body
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
      # @return [Square::Types::SearchOrdersResponse]
      def search(request_options: {}, **params)
        _request = Square::Internal::JSON::Request.new(
          base_url: request_options[:base_url] || Square::Environment::SANDBOX,
          method: "POST",
          path: "v2/orders/search",
          body: params
        )
        _response = @client.send(_request)
        if _response.code >= "200" && _response.code < "300"
          return Square::Types::SearchOrdersResponse.load(_response.body)
        end

        raise _response.body
      end

      # Retrieves an [Order](entity:Order) by ID.
      #
      # @return [Square::Types::GetOrderResponse]
      def get(request_options: {}, **params)
        _request = Square::Internal::JSON::Request.new(
          base_url: request_options[:base_url] || Square::Environment::SANDBOX,
          method: "GET",
          path: "v2/orders/#{params[:order_id]}"
        )
        _response = @client.send(_request)
        return Square::Types::GetOrderResponse.load(_response.body) if _response.code >= "200" && _response.code < "300"

        raise _response.body
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
      # @return [Square::Types::UpdateOrderResponse]
      def update(request_options: {}, **params)
        _path_param_names = ["order_id"]

        _request = Square::Internal::JSON::Request.new(
          base_url: request_options[:base_url] || Square::Environment::SANDBOX,
          method: "PUT",
          path: "v2/orders/#{params[:order_id]}",
          body: params.except(*_path_param_names)
        )
        _response = @client.send(_request)
        if _response.code >= "200" && _response.code < "300"
          return Square::Types::UpdateOrderResponse.load(_response.body)
        end

        raise _response.body
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
      # @return [Square::Types::PayOrderResponse]
      def pay(request_options: {}, **params)
        _path_param_names = ["order_id"]

        _request = Square::Internal::JSON::Request.new(
          base_url: request_options[:base_url] || Square::Environment::SANDBOX,
          method: "POST",
          path: "v2/orders/#{params[:order_id]}/pay",
          body: params.except(*_path_param_names)
        )
        _response = @client.send(_request)
        return Square::Types::PayOrderResponse.load(_response.body) if _response.code >= "200" && _response.code < "300"

        raise _response.body
      end

      # @return [Square::Mobile::Client]
      def mobile
        @mobile ||= Square::Mobile::Client.new(client: @raw_client)
      end

      # @return [Square::OAuth::Client]
      def oAuth
        @oAuth ||= Square::OAuth::Client.new(client: @raw_client)
      end

      # @return [Square::V1Transactions::Client]
      def v1Transactions
        @v1Transactions ||= Square::V1Transactions::Client.new(client: @raw_client)
      end

      # @return [Square::ApplePay::Client]
      def applePay
        @applePay ||= Square::ApplePay::Client.new(client: @raw_client)
      end

      # @return [Square::BankAccounts::Client]
      def bankAccounts
        @bankAccounts ||= Square::BankAccounts::Client.new(client: @raw_client)
      end

      # @return [Square::Bookings::Client]
      def bookings
        @bookings ||= Square::Bookings::Client.new(client: @raw_client)
      end

      # @return [Square::Cards::Client]
      def cards
        @cards ||= Square::Cards::Client.new(client: @raw_client)
      end

      # @return [Square::Catalog::Client]
      def catalog
        @catalog ||= Square::Catalog::Client.new(client: @raw_client)
      end

      # @return [Square::Customers::Client]
      def customers
        @customers ||= Square::Customers::Client.new(client: @raw_client)
      end

      # @return [Square::Devices::Client]
      def devices
        @devices ||= Square::Devices::Client.new(client: @raw_client)
      end

      # @return [Square::Disputes::Client]
      def disputes
        @disputes ||= Square::Disputes::Client.new(client: @raw_client)
      end

      # @return [Square::Employees::Client]
      def employees
        @employees ||= Square::Employees::Client.new(client: @raw_client)
      end

      # @return [Square::Events::Client]
      def events
        @events ||= Square::Events::Client.new(client: @raw_client)
      end

      # @return [Square::GiftCards::Client]
      def giftCards
        @giftCards ||= Square::GiftCards::Client.new(client: @raw_client)
      end

      # @return [Square::Inventory::Client]
      def inventory
        @inventory ||= Square::Inventory::Client.new(client: @raw_client)
      end

      # @return [Square::Invoices::Client]
      def invoices
        @invoices ||= Square::Invoices::Client.new(client: @raw_client)
      end

      # @return [Square::Labor::Client]
      def labor
        @labor ||= Square::Labor::Client.new(client: @raw_client)
      end

      # @return [Square::Locations::Client]
      def locations
        @locations ||= Square::Locations::Client.new(client: @raw_client)
      end

      # @return [Square::Loyalty::Client]
      def loyalty
        @loyalty ||= Square::Loyalty::Client.new(client: @raw_client)
      end

      # @return [Square::Merchants::Client]
      def merchants
        @merchants ||= Square::Merchants::Client.new(client: @raw_client)
      end

      # @return [Square::Checkout::Client]
      def checkout
        @checkout ||= Square::Checkout::Client.new(client: @raw_client)
      end

      # @return [Square::Orders::Client]
      def orders
        @orders ||= Square::Orders::Client.new(client: @raw_client)
      end

      # @return [Square::Payments::Client]
      def payments
        @payments ||= Square::Payments::Client.new(client: @raw_client)
      end

      # @return [Square::Payouts::Client]
      def payouts
        @payouts ||= Square::Payouts::Client.new(client: @raw_client)
      end

      # @return [Square::Refunds::Client]
      def refunds
        @refunds ||= Square::Refunds::Client.new(client: @raw_client)
      end

      # @return [Square::Sites::Client]
      def sites
        @sites ||= Square::Sites::Client.new(client: @raw_client)
      end

      # @return [Square::Snippets::Client]
      def snippets
        @snippets ||= Square::Snippets::Client.new(client: @raw_client)
      end

      # @return [Square::Subscriptions::Client]
      def subscriptions
        @subscriptions ||= Square::Subscriptions::Client.new(client: @raw_client)
      end

      # @return [Square::TeamMembers::Client]
      def teamMembers
        @teamMembers ||= Square::TeamMembers::Client.new(client: @raw_client)
      end

      # @return [Square::Team::Client]
      def team
        @team ||= Square::Team::Client.new(client: @raw_client)
      end

      # @return [Square::Terminal::Client]
      def terminal
        @terminal ||= Square::Terminal::Client.new(client: @raw_client)
      end

      # @return [Square::Vendors::Client]
      def vendors
        @vendors ||= Square::Vendors::Client.new(client: @raw_client)
      end

      # @return [Square::CashDrawers::Client]
      def cashDrawers
        @cashDrawers ||= Square::CashDrawers::Client.new(client: @raw_client)
      end

      # @return [Square::Webhooks::Client]
      def webhooks
        @webhooks ||= Square::Webhooks::Client.new(client: @raw_client)
      end
    end
  end
end
