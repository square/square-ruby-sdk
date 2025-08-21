# frozen_string_literal: true

module Square
  module Payments
    class Client
      # @return [Square::Payments::Client]
      def initialize(client:)
        @client = client
      end

      # Retrieves a list of payments taken by the account making the request.
      #
      # Results are eventually consistent, and new payments or changes to payments might take several
      # seconds to appear.
      #
      # The maximum results per page is 100.
      #
      # @return [Square::Types::ListPaymentsResponse]
      def list(request_options: {}, **params)
        _query_param_names = %w[begin_time end_time sort_order cursor location_id total last_4
                                card_brand limit is_offline_payment offline_begin_time offline_end_time updated_at_begin_time updated_at_end_time sort_field]
        _query = params.slice(*_query_param_names)
        params.except(*_query_param_names)

        _request = Square::Internal::JSON::Request.new(
          base_url: request_options[:base_url] || Square::Environment::SANDBOX,
          method: "GET",
          path: "v2/payments",
          query: _query
        )
        _response = @client.send(_request)
        if _response.code >= "200" && _response.code < "300"
          return Square::Types::ListPaymentsResponse.load(_response.body)
        end

        raise _response.body
      end

      # Creates a payment using the provided source. You can use this endpoint
      # to charge a card (credit/debit card or
      # Square gift card) or record a payment that the seller received outside of Square
      # (cash payment from a buyer or a payment that an external entity
      # processed on behalf of the seller).
      #
      # The endpoint creates a
      # `Payment` object and returns it in the response.
      #
      # @return [Square::Types::CreatePaymentResponse]
      def create(request_options: {}, **params)
        _request = Square::Internal::JSON::Request.new(
          base_url: request_options[:base_url] || Square::Environment::SANDBOX,
          method: "POST",
          path: "v2/payments",
          body: params
        )
        _response = @client.send(_request)
        if _response.code >= "200" && _response.code < "300"
          return Square::Types::CreatePaymentResponse.load(_response.body)
        end

        raise _response.body
      end

      # Cancels (voids) a payment identified by the idempotency key that is specified in the
      # request.
      #
      # Use this method when the status of a `CreatePayment` request is unknown (for example, after you send a
      # `CreatePayment` request, a network error occurs and you do not get a response). In this case, you can
      # direct Square to cancel the payment using this endpoint. In the request, you provide the same
      # idempotency key that you provided in your `CreatePayment` request that you want to cancel. After
      # canceling the payment, you can submit your `CreatePayment` request again.
      #
      # Note that if no payment with the specified idempotency key is found, no action is taken and the endpoint
      # returns successfully.
      #
      # @return [Square::Types::CancelPaymentByIdempotencyKeyResponse]
      def cancel_by_idempotency_key(request_options: {}, **params)
        _request = Square::Internal::JSON::Request.new(
          base_url: request_options[:base_url] || Square::Environment::SANDBOX,
          method: "POST",
          path: "v2/payments/cancel",
          body: params
        )
        _response = @client.send(_request)
        if _response.code >= "200" && _response.code < "300"
          return Square::Types::CancelPaymentByIdempotencyKeyResponse.load(_response.body)
        end

        raise _response.body
      end

      # Retrieves details for a specific payment.
      #
      # @return [Square::Types::GetPaymentResponse]
      def get(request_options: {}, **params)
        _request = Square::Internal::JSON::Request.new(
          base_url: request_options[:base_url] || Square::Environment::SANDBOX,
          method: "GET",
          path: "v2/payments/#{params[:payment_id]}"
        )
        _response = @client.send(_request)
        if _response.code >= "200" && _response.code < "300"
          return Square::Types::GetPaymentResponse.load(_response.body)
        end

        raise _response.body
      end

      # Updates a payment with the APPROVED status.
      # You can update the `amount_money` and `tip_money` using this endpoint.
      #
      # @return [Square::Types::UpdatePaymentResponse]
      def update(request_options: {}, **params)
        _path_param_names = ["payment_id"]

        _request = Square::Internal::JSON::Request.new(
          base_url: request_options[:base_url] || Square::Environment::SANDBOX,
          method: "PUT",
          path: "v2/payments/#{params[:payment_id]}",
          body: params.except(*_path_param_names)
        )
        _response = @client.send(_request)
        if _response.code >= "200" && _response.code < "300"
          return Square::Types::UpdatePaymentResponse.load(_response.body)
        end

        raise _response.body
      end

      # Cancels (voids) a payment. You can use this endpoint to cancel a payment with
      # the APPROVED `status`.
      #
      # @return [Square::Types::CancelPaymentResponse]
      def cancel(request_options: {}, **params)
        _request = Square::Internal::JSON::Request.new(
          base_url: request_options[:base_url] || Square::Environment::SANDBOX,
          method: "POST",
          path: "v2/payments/#{params[:payment_id]}/cancel"
        )
        _response = @client.send(_request)
        if _response.code >= "200" && _response.code < "300"
          return Square::Types::CancelPaymentResponse.load(_response.body)
        end

        raise _response.body
      end

      # Completes (captures) a payment.
      # By default, payments are set to complete immediately after they are created.
      #
      # You can use this endpoint to complete a payment with the APPROVED `status`.
      #
      # @return [Square::Types::CompletePaymentResponse]
      def complete(request_options: {}, **params)
        _path_param_names = ["payment_id"]

        _request = Square::Internal::JSON::Request.new(
          base_url: request_options[:base_url] || Square::Environment::SANDBOX,
          method: "POST",
          path: "v2/payments/#{params[:payment_id]}/complete",
          body: params.except(*_path_param_names)
        )
        _response = @client.send(_request)
        if _response.code >= "200" && _response.code < "300"
          return Square::Types::CompletePaymentResponse.load(_response.body)
        end

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
