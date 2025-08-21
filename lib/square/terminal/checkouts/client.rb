# frozen_string_literal: true

module Square
  module Terminal
    module Checkouts
      class Client
        # @return [Square::Terminal::Checkouts::Client]
        def initialize(client:)
          @client = client
        end

        # Creates a Terminal checkout request and sends it to the specified device to take a payment
        # for the requested amount.
        #
        # @return [Square::Types::CreateTerminalCheckoutResponse]
        def create(request_options: {}, **params)
          _request = Square::Internal::JSON::Request.new(
            base_url: request_options[:base_url] || Square::Environment::SANDBOX,
            method: "POST",
            path: "v2/terminals/checkouts",
            body: params
          )
          _response = @client.send(_request)
          if _response.code >= "200" && _response.code < "300"
            return Square::Types::CreateTerminalCheckoutResponse.load(_response.body)
          end

          raise _response.body
        end

        # Returns a filtered list of Terminal checkout requests created by the application making the request. Only Terminal checkout requests created for the merchant scoped to the OAuth token are returned. Terminal checkout requests are available for 30 days.
        #
        # @return [Square::Types::SearchTerminalCheckoutsResponse]
        def search(request_options: {}, **params)
          _request = Square::Internal::JSON::Request.new(
            base_url: request_options[:base_url] || Square::Environment::SANDBOX,
            method: "POST",
            path: "v2/terminals/checkouts/search",
            body: params
          )
          _response = @client.send(_request)
          if _response.code >= "200" && _response.code < "300"
            return Square::Types::SearchTerminalCheckoutsResponse.load(_response.body)
          end

          raise _response.body
        end

        # Retrieves a Terminal checkout request by `checkout_id`. Terminal checkout requests are available for 30 days.
        #
        # @return [Square::Types::GetTerminalCheckoutResponse]
        def get(request_options: {}, **params)
          _request = Square::Internal::JSON::Request.new(
            base_url: request_options[:base_url] || Square::Environment::SANDBOX,
            method: "GET",
            path: "v2/terminals/checkouts/#{params[:checkout_id]}"
          )
          _response = @client.send(_request)
          if _response.code >= "200" && _response.code < "300"
            return Square::Types::GetTerminalCheckoutResponse.load(_response.body)
          end

          raise _response.body
        end

        # Cancels a Terminal checkout request if the status of the request permits it.
        #
        # @return [Square::Types::CancelTerminalCheckoutResponse]
        def cancel(request_options: {}, **params)
          _request = Square::Internal::JSON::Request.new(
            base_url: request_options[:base_url] || Square::Environment::SANDBOX,
            method: "POST",
            path: "v2/terminals/checkouts/#{params[:checkout_id]}/cancel"
          )
          _response = @client.send(_request)
          if _response.code >= "200" && _response.code < "300"
            return Square::Types::CancelTerminalCheckoutResponse.load(_response.body)
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
