# frozen_string_literal: true

module Square
  module Subscriptions
    class Client
      # @return [Square::Subscriptions::Client]
      def initialize(client:)
        @client = client
      end

      # Enrolls a customer in a subscription.
      #
      # If you provide a card on file in the request, Square charges the card for
      # the subscription. Otherwise, Square sends an invoice to the customer's email
      # address. The subscription starts immediately, unless the request includes
      # the optional `start_date`. Each individual subscription is associated with a particular location.
      #
      # For more information, see [Create a subscription](https://developer.squareup.com/docs/subscriptions-api/manage-subscriptions#create-a-subscription).
      #
      # @return [Square::Types::CreateSubscriptionResponse]
      def create(request_options: {}, **params)
        _request = Square::Internal::JSON::Request.new(
          base_url: request_options[:base_url] || Square::Environment::SANDBOX,
          method: "POST",
          path: "v2/subscriptions",
          body: params
        )
        _response = @client.send(_request)
        if _response.code >= "200" && _response.code < "300"
          return Square::Types::CreateSubscriptionResponse.load(_response.body)
        end

        raise _response.body
      end

      # Schedules a plan variation change for all active subscriptions under a given plan
      # variation. For more information, see [Swap Subscription Plan Variations](https://developer.squareup.com/docs/subscriptions-api/swap-plan-variations).
      #
      # @return [Square::Types::BulkSwapPlanResponse]
      def bulk_swap_plan(request_options: {}, **params)
        _request = Square::Internal::JSON::Request.new(
          base_url: request_options[:base_url] || Square::Environment::SANDBOX,
          method: "POST",
          path: "v2/subscriptions/bulk-swap-plan",
          body: params
        )
        _response = @client.send(_request)
        if _response.code >= "200" && _response.code < "300"
          return Square::Types::BulkSwapPlanResponse.load(_response.body)
        end

        raise _response.body
      end

      # Searches for subscriptions.
      #
      # Results are ordered chronologically by subscription creation date. If
      # the request specifies more than one location ID,
      # the endpoint orders the result
      # by location ID, and then by creation date within each location. If no locations are given
      # in the query, all locations are searched.
      #
      # You can also optionally specify `customer_ids` to search by customer.
      # If left unset, all customers
      # associated with the specified locations are returned.
      # If the request specifies customer IDs, the endpoint orders results
      # first by location, within location by customer ID, and within
      # customer by subscription creation date.
      #
      # @return [Square::Types::SearchSubscriptionsResponse]
      def search(request_options: {}, **params)
        _request = Square::Internal::JSON::Request.new(
          base_url: request_options[:base_url] || Square::Environment::SANDBOX,
          method: "POST",
          path: "v2/subscriptions/search",
          body: params
        )
        _response = @client.send(_request)
        if _response.code >= "200" && _response.code < "300"
          return Square::Types::SearchSubscriptionsResponse.load(_response.body)
        end

        raise _response.body
      end

      # Retrieves a specific subscription.
      #
      # @return [Square::Types::GetSubscriptionResponse]
      def get(request_options: {}, **params)
        _query_param_names = ["include"]
        _query = params.slice(*_query_param_names)
        params = params.except(*_query_param_names)

        _request = Square::Internal::JSON::Request.new(
          base_url: request_options[:base_url] || Square::Environment::SANDBOX,
          method: "GET",
          path: "v2/subscriptions/#{params[:subscription_id]}",
          query: _query
        )
        _response = @client.send(_request)
        if _response.code >= "200" && _response.code < "300"
          return Square::Types::GetSubscriptionResponse.load(_response.body)
        end

        raise _response.body
      end

      # Updates a subscription by modifying or clearing `subscription` field values.
      # To clear a field, set its value to `null`.
      #
      # @return [Square::Types::UpdateSubscriptionResponse]
      def update(request_options: {}, **params)
        _path_param_names = ["subscription_id"]

        _request = Square::Internal::JSON::Request.new(
          base_url: request_options[:base_url] || Square::Environment::SANDBOX,
          method: "PUT",
          path: "v2/subscriptions/#{params[:subscription_id]}",
          body: params.except(*_path_param_names)
        )
        _response = @client.send(_request)
        if _response.code >= "200" && _response.code < "300"
          return Square::Types::UpdateSubscriptionResponse.load(_response.body)
        end

        raise _response.body
      end

      # Deletes a scheduled action for a subscription.
      #
      # @return [Square::Types::DeleteSubscriptionActionResponse]
      def delete_action(request_options: {}, **params)
        _request = Square::Internal::JSON::Request.new(
          base_url: request_options[:base_url] || Square::Environment::SANDBOX,
          method: "DELETE",
          path: "v2/subscriptions/#{params[:subscription_id]}/actions/#{params[:action_id]}"
        )
        _response = @client.send(_request)
        if _response.code >= "200" && _response.code < "300"
          return Square::Types::DeleteSubscriptionActionResponse.load(_response.body)
        end

        raise _response.body
      end

      # Changes the [billing anchor date](https://developer.squareup.com/docs/subscriptions-api/subscription-billing#billing-dates)
      # for a subscription.
      #
      # @return [Square::Types::ChangeBillingAnchorDateResponse]
      def change_billing_anchor_date(request_options: {}, **params)
        _path_param_names = ["subscription_id"]

        _request = Square::Internal::JSON::Request.new(
          base_url: request_options[:base_url] || Square::Environment::SANDBOX,
          method: "POST",
          path: "v2/subscriptions/#{params[:subscription_id]}/billing-anchor",
          body: params.except(*_path_param_names)
        )
        _response = @client.send(_request)
        if _response.code >= "200" && _response.code < "300"
          return Square::Types::ChangeBillingAnchorDateResponse.load(_response.body)
        end

        raise _response.body
      end

      # Schedules a `CANCEL` action to cancel an active subscription. This
      # sets the `canceled_date` field to the end of the active billing period. After this date,
      # the subscription status changes from ACTIVE to CANCELED.
      #
      # @return [Square::Types::CancelSubscriptionResponse]
      def cancel(request_options: {}, **params)
        _request = Square::Internal::JSON::Request.new(
          base_url: request_options[:base_url] || Square::Environment::SANDBOX,
          method: "POST",
          path: "v2/subscriptions/#{params[:subscription_id]}/cancel"
        )
        _response = @client.send(_request)
        if _response.code >= "200" && _response.code < "300"
          return Square::Types::CancelSubscriptionResponse.load(_response.body)
        end

        raise _response.body
      end

      # Lists all [events](https://developer.squareup.com/docs/subscriptions-api/actions-events) for a specific subscription.
      #
      # @return [Square::Types::ListSubscriptionEventsResponse]
      def list_events(request_options: {}, **params)
        _query_param_names = %w[cursor limit]
        _query = params.slice(*_query_param_names)
        params = params.except(*_query_param_names)

        _request = Square::Internal::JSON::Request.new(
          base_url: request_options[:base_url] || Square::Environment::SANDBOX,
          method: "GET",
          path: "v2/subscriptions/#{params[:subscription_id]}/events",
          query: _query
        )
        _response = @client.send(_request)
        if _response.code >= "200" && _response.code < "300"
          return Square::Types::ListSubscriptionEventsResponse.load(_response.body)
        end

        raise _response.body
      end

      # Schedules a `PAUSE` action to pause an active subscription.
      #
      # @return [Square::Types::PauseSubscriptionResponse]
      def pause(request_options: {}, **params)
        _path_param_names = ["subscription_id"]

        _request = Square::Internal::JSON::Request.new(
          base_url: request_options[:base_url] || Square::Environment::SANDBOX,
          method: "POST",
          path: "v2/subscriptions/#{params[:subscription_id]}/pause",
          body: params.except(*_path_param_names)
        )
        _response = @client.send(_request)
        if _response.code >= "200" && _response.code < "300"
          return Square::Types::PauseSubscriptionResponse.load(_response.body)
        end

        raise _response.body
      end

      # Schedules a `RESUME` action to resume a paused or a deactivated subscription.
      #
      # @return [Square::Types::ResumeSubscriptionResponse]
      def resume(request_options: {}, **params)
        _path_param_names = ["subscription_id"]

        _request = Square::Internal::JSON::Request.new(
          base_url: request_options[:base_url] || Square::Environment::SANDBOX,
          method: "POST",
          path: "v2/subscriptions/#{params[:subscription_id]}/resume",
          body: params.except(*_path_param_names)
        )
        _response = @client.send(_request)
        if _response.code >= "200" && _response.code < "300"
          return Square::Types::ResumeSubscriptionResponse.load(_response.body)
        end

        raise _response.body
      end

      # Schedules a `SWAP_PLAN` action to swap a subscription plan variation in an existing subscription.
      # For more information, see [Swap Subscription Plan Variations](https://developer.squareup.com/docs/subscriptions-api/swap-plan-variations).
      #
      # @return [Square::Types::SwapPlanResponse]
      def swap_plan(request_options: {}, **params)
        _path_param_names = ["subscription_id"]

        _request = Square::Internal::JSON::Request.new(
          base_url: request_options[:base_url] || Square::Environment::SANDBOX,
          method: "POST",
          path: "v2/subscriptions/#{params[:subscription_id]}/swap-plan",
          body: params.except(*_path_param_names)
        )
        _response = @client.send(_request)
        return Square::Types::SwapPlanResponse.load(_response.body) if _response.code >= "200" && _response.code < "300"

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
