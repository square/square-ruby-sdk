# frozen_string_literal: true

module Square
  module Loyalty
    module Rewards
      class Client
        # @return [Square::Loyalty::Rewards::Client]
        def initialize(client:)
          @client = client
        end

        # Creates a loyalty reward. In the process, the endpoint does following:
        #
        # - Uses the `reward_tier_id` in the request to determine the number of points
        # to lock for this reward.
        # - If the request includes `order_id`, it adds the reward and related discount to the order.
        #
        # After a reward is created, the points are locked and
        # not available for the buyer to redeem another reward.
        #
        # @return [Square::Types::CreateLoyaltyRewardResponse]
        def create(request_options: {}, **params)
          _request = Square::Internal::JSON::Request.new(
            base_url: request_options[:base_url] || Square::Environment::SANDBOX,
            method: "POST",
            path: "v2/loyalty/rewards",
            body: params
          )
          _response = @client.send(_request)
          if _response.code >= "200" && _response.code < "300"
            return Square::Types::CreateLoyaltyRewardResponse.load(_response.body)
          end

          raise _response.body
        end

        # Searches for loyalty rewards. This endpoint accepts a request with no query filters and returns results for all loyalty accounts.
        # If you include a `query` object, `loyalty_account_id` is required and `status` is  optional.
        #
        # If you know a reward ID, use the
        # [RetrieveLoyaltyReward](api-endpoint:Loyalty-RetrieveLoyaltyReward) endpoint.
        #
        # Search results are sorted by `updated_at` in descending order.
        #
        # @return [Square::Types::SearchLoyaltyRewardsResponse]
        def search(request_options: {}, **params)
          _request = Square::Internal::JSON::Request.new(
            base_url: request_options[:base_url] || Square::Environment::SANDBOX,
            method: "POST",
            path: "v2/loyalty/rewards/search",
            body: params
          )
          _response = @client.send(_request)
          if _response.code >= "200" && _response.code < "300"
            return Square::Types::SearchLoyaltyRewardsResponse.load(_response.body)
          end

          raise _response.body
        end

        # Retrieves a loyalty reward.
        #
        # @return [Square::Types::GetLoyaltyRewardResponse]
        def get(request_options: {}, **params)
          _request = Square::Internal::JSON::Request.new(
            base_url: request_options[:base_url] || Square::Environment::SANDBOX,
            method: "GET",
            path: "v2/loyalty/rewards/#{params[:reward_id]}"
          )
          _response = @client.send(_request)
          if _response.code >= "200" && _response.code < "300"
            return Square::Types::GetLoyaltyRewardResponse.load(_response.body)
          end

          raise _response.body
        end

        # Deletes a loyalty reward by doing the following:
        #
        # - Returns the loyalty points back to the loyalty account.
        # - If an order ID was specified when the reward was created
        # (see [CreateLoyaltyReward](api-endpoint:Loyalty-CreateLoyaltyReward)),
        # it updates the order by removing the reward and related
        # discounts.
        #
        # You cannot delete a reward that has reached the terminal state (REDEEMED).
        #
        # @return [Square::Types::DeleteLoyaltyRewardResponse]
        def delete(request_options: {}, **params)
          _request = Square::Internal::JSON::Request.new(
            base_url: request_options[:base_url] || Square::Environment::SANDBOX,
            method: "DELETE",
            path: "v2/loyalty/rewards/#{params[:reward_id]}"
          )
          _response = @client.send(_request)
          if _response.code >= "200" && _response.code < "300"
            return Square::Types::DeleteLoyaltyRewardResponse.load(_response.body)
          end

          raise _response.body
        end

        # Redeems a loyalty reward.
        #
        # The endpoint sets the reward to the `REDEEMED` terminal state.
        #
        # If you are using your own order processing system (not using the
        # Orders API), you call this endpoint after the buyer paid for the
        # purchase.
        #
        # After the reward reaches the terminal state, it cannot be deleted.
        # In other words, points used for the reward cannot be returned
        # to the account.
        #
        # @return [Square::Types::RedeemLoyaltyRewardResponse]
        def redeem(request_options: {}, **params)
          _path_param_names = ["reward_id"]

          _request = Square::Internal::JSON::Request.new(
            base_url: request_options[:base_url] || Square::Environment::SANDBOX,
            method: "POST",
            path: "v2/loyalty/rewards/#{params[:reward_id]}/redeem",
            body: params.except(*_path_param_names)
          )
          _response = @client.send(_request)
          if _response.code >= "200" && _response.code < "300"
            return Square::Types::RedeemLoyaltyRewardResponse.load(_response.body)
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
