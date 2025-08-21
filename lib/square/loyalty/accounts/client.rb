# frozen_string_literal: true

module Square
  module Loyalty
    module Accounts
      class Client
        # @return [Square::Loyalty::Accounts::Client]
        def initialize(client:)
          @client = client
        end

        # Creates a loyalty account. To create a loyalty account, you must provide the `program_id` and a `mapping` with the `phone_number` of the buyer.
        #
        # @return [Square::Types::CreateLoyaltyAccountResponse]
        def create(request_options: {}, **params)
          _request = Square::Internal::JSON::Request.new(
            base_url: request_options[:base_url] || Square::Environment::SANDBOX,
            method: "POST",
            path: "v2/loyalty/accounts",
            body: params
          )
          _response = @client.send(_request)
          if _response.code >= "200" && _response.code < "300"
            return Square::Types::CreateLoyaltyAccountResponse.load(_response.body)
          end

          raise _response.body
        end

        # Searches for loyalty accounts in a loyalty program.
        #
        # You can search for a loyalty account using the phone number or customer ID associated with the account. To return all loyalty accounts, specify an empty `query` object or omit it entirely.
        #
        # Search results are sorted by `created_at` in ascending order.
        #
        # @return [Square::Types::SearchLoyaltyAccountsResponse]
        def search(request_options: {}, **params)
          _request = Square::Internal::JSON::Request.new(
            base_url: request_options[:base_url] || Square::Environment::SANDBOX,
            method: "POST",
            path: "v2/loyalty/accounts/search",
            body: params
          )
          _response = @client.send(_request)
          if _response.code >= "200" && _response.code < "300"
            return Square::Types::SearchLoyaltyAccountsResponse.load(_response.body)
          end

          raise _response.body
        end

        # Retrieves a loyalty account.
        #
        # @return [Square::Types::GetLoyaltyAccountResponse]
        def get(request_options: {}, **params)
          _request = Square::Internal::JSON::Request.new(
            base_url: request_options[:base_url] || Square::Environment::SANDBOX,
            method: "GET",
            path: "v2/loyalty/accounts/#{params[:account_id]}"
          )
          _response = @client.send(_request)
          if _response.code >= "200" && _response.code < "300"
            return Square::Types::GetLoyaltyAccountResponse.load(_response.body)
          end

          raise _response.body
        end

        # Adds points earned from a purchase to a [loyalty account](entity:LoyaltyAccount).
        #
        # - If you are using the Orders API to manage orders, provide the `order_id`. Square reads the order
        # to compute the points earned from both the base loyalty program and an associated
        # [loyalty promotion](entity:LoyaltyPromotion). For purchases that qualify for multiple accrual
        # rules, Square computes points based on the accrual rule that grants the most points.
        # For purchases that qualify for multiple promotions, Square computes points based on the most
        # recently created promotion. A purchase must first qualify for program points to be eligible for promotion points.
        #
        # - If you are not using the Orders API to manage orders, provide `points` with the number of points to add.
        # You must first perform a client-side computation of the points earned from the loyalty program and
        # loyalty promotion. For spend-based and visit-based programs, you can call [CalculateLoyaltyPoints](api-endpoint:Loyalty-CalculateLoyaltyPoints)
        # to compute the points earned from the base loyalty program. For information about computing points earned from a loyalty promotion, see
        # [Calculating promotion points](https://developer.squareup.com/docs/loyalty-api/loyalty-promotions#calculate-promotion-points).
        #
        # @return [Square::Types::AccumulateLoyaltyPointsResponse]
        def accumulate_points(request_options: {}, **params)
          _path_param_names = ["account_id"]

          _request = Square::Internal::JSON::Request.new(
            base_url: request_options[:base_url] || Square::Environment::SANDBOX,
            method: "POST",
            path: "v2/loyalty/accounts/#{params[:account_id]}/accumulate",
            body: params.except(*_path_param_names)
          )
          _response = @client.send(_request)
          if _response.code >= "200" && _response.code < "300"
            return Square::Types::AccumulateLoyaltyPointsResponse.load(_response.body)
          end

          raise _response.body
        end

        # Adds points to or subtracts points from a buyer's account.
        #
        # Use this endpoint only when you need to manually adjust points. Otherwise, in your application flow, you call
        # [AccumulateLoyaltyPoints](api-endpoint:Loyalty-AccumulateLoyaltyPoints)
        # to add points when a buyer pays for the purchase.
        #
        # @return [Square::Types::AdjustLoyaltyPointsResponse]
        def adjust(request_options: {}, **params)
          _path_param_names = ["account_id"]

          _request = Square::Internal::JSON::Request.new(
            base_url: request_options[:base_url] || Square::Environment::SANDBOX,
            method: "POST",
            path: "v2/loyalty/accounts/#{params[:account_id]}/adjust",
            body: params.except(*_path_param_names)
          )
          _response = @client.send(_request)
          if _response.code >= "200" && _response.code < "300"
            return Square::Types::AdjustLoyaltyPointsResponse.load(_response.body)
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
