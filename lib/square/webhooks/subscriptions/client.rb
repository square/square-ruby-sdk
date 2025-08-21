# frozen_string_literal: true

module Square
  module Webhooks
    module Subscriptions
      class Client
        # @return [Square::Webhooks::Subscriptions::Client]
        def initialize(client:)
          @client = client
        end

        # Lists all webhook subscriptions owned by your application.
        #
        # @return [Square::Types::ListWebhookSubscriptionsResponse]
        def list(request_options: {}, **params)
          _query_param_names = %w[cursor include_disabled sort_order limit]
          _query = params.slice(*_query_param_names)
          params.except(*_query_param_names)

          _request = Square::Internal::JSON::Request.new(
            base_url: request_options[:base_url] || Square::Environment::SANDBOX,
            method: "GET",
            path: "v2/webhooks/subscriptions",
            query: _query
          )
          _response = @client.send(_request)
          if _response.code >= "200" && _response.code < "300"
            return Square::Types::ListWebhookSubscriptionsResponse.load(_response.body)
          end

          raise _response.body
        end

        # Creates a webhook subscription.
        #
        # @return [Square::Types::CreateWebhookSubscriptionResponse]
        def create(request_options: {}, **params)
          _request = Square::Internal::JSON::Request.new(
            base_url: request_options[:base_url] || Square::Environment::SANDBOX,
            method: "POST",
            path: "v2/webhooks/subscriptions",
            body: params
          )
          _response = @client.send(_request)
          if _response.code >= "200" && _response.code < "300"
            return Square::Types::CreateWebhookSubscriptionResponse.load(_response.body)
          end

          raise _response.body
        end

        # Retrieves a webhook subscription identified by its ID.
        #
        # @return [Square::Types::GetWebhookSubscriptionResponse]
        def get(request_options: {}, **params)
          _request = Square::Internal::JSON::Request.new(
            base_url: request_options[:base_url] || Square::Environment::SANDBOX,
            method: "GET",
            path: "v2/webhooks/subscriptions/#{params[:subscription_id]}"
          )
          _response = @client.send(_request)
          if _response.code >= "200" && _response.code < "300"
            return Square::Types::GetWebhookSubscriptionResponse.load(_response.body)
          end

          raise _response.body
        end

        # Updates a webhook subscription.
        #
        # @return [Square::Types::UpdateWebhookSubscriptionResponse]
        def update(request_options: {}, **params)
          _path_param_names = ["subscription_id"]

          _request = Square::Internal::JSON::Request.new(
            base_url: request_options[:base_url] || Square::Environment::SANDBOX,
            method: "PUT",
            path: "v2/webhooks/subscriptions/#{params[:subscription_id]}",
            body: params.except(*_path_param_names)
          )
          _response = @client.send(_request)
          if _response.code >= "200" && _response.code < "300"
            return Square::Types::UpdateWebhookSubscriptionResponse.load(_response.body)
          end

          raise _response.body
        end

        # Deletes a webhook subscription.
        #
        # @return [Square::Types::DeleteWebhookSubscriptionResponse]
        def delete(request_options: {}, **params)
          _request = Square::Internal::JSON::Request.new(
            base_url: request_options[:base_url] || Square::Environment::SANDBOX,
            method: "DELETE",
            path: "v2/webhooks/subscriptions/#{params[:subscription_id]}"
          )
          _response = @client.send(_request)
          if _response.code >= "200" && _response.code < "300"
            return Square::Types::DeleteWebhookSubscriptionResponse.load(_response.body)
          end

          raise _response.body
        end

        # Updates a webhook subscription by replacing the existing signature key with a new one.
        #
        # @return [Square::Types::UpdateWebhookSubscriptionSignatureKeyResponse]
        def update_signature_key(request_options: {}, **params)
          _path_param_names = ["subscription_id"]

          _request = Square::Internal::JSON::Request.new(
            base_url: request_options[:base_url] || Square::Environment::SANDBOX,
            method: "POST",
            path: "v2/webhooks/subscriptions/#{params[:subscription_id]}/signature-key",
            body: params.except(*_path_param_names)
          )
          _response = @client.send(_request)
          if _response.code >= "200" && _response.code < "300"
            return Square::Types::UpdateWebhookSubscriptionSignatureKeyResponse.load(_response.body)
          end

          raise _response.body
        end

        # Tests a webhook subscription by sending a test event to the notification URL.
        #
        # @return [Square::Types::TestWebhookSubscriptionResponse]
        def test(request_options: {}, **params)
          _path_param_names = ["subscription_id"]

          _request = Square::Internal::JSON::Request.new(
            base_url: request_options[:base_url] || Square::Environment::SANDBOX,
            method: "POST",
            path: "v2/webhooks/subscriptions/#{params[:subscription_id]}/test",
            body: params.except(*_path_param_names)
          )
          _response = @client.send(_request)
          if _response.code >= "200" && _response.code < "300"
            return Square::Types::TestWebhookSubscriptionResponse.load(_response.body)
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
end
