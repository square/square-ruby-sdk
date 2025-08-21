# frozen_string_literal: true

module Square
  module Loyalty
    module Programs
      module Promotions
        class Client
          # @return [Square::Loyalty::Programs::Promotions::Client]
          def initialize(client:)
            @client = client
          end

          # Lists the loyalty promotions associated with a [loyalty program](entity:LoyaltyProgram).
          # Results are sorted by the `created_at` date in descending order (newest to oldest).
          #
          # @return [Square::Types::ListLoyaltyPromotionsResponse]
          def list(request_options: {}, **params)
            _query_param_names = %w[status cursor limit]
            _query = params.slice(*_query_param_names)
            params = params.except(*_query_param_names)

            _request = Square::Internal::JSON::Request.new(
              base_url: request_options[:base_url] || Square::Environment::SANDBOX,
              method: "GET",
              path: "v2/loyalty/programs/#{params[:program_id]}/promotions",
              query: _query
            )
            _response = @client.send(_request)
            if _response.code >= "200" && _response.code < "300"
              return Square::Types::ListLoyaltyPromotionsResponse.load(_response.body)
            end

            raise _response.body
          end

          # Creates a loyalty promotion for a [loyalty program](entity:LoyaltyProgram). A loyalty promotion
          # enables buyers to earn points in addition to those earned from the base loyalty program.
          #
          # This endpoint sets the loyalty promotion to the `ACTIVE` or `SCHEDULED` status, depending on the
          # `available_time` setting. A loyalty program can have a maximum of 10 loyalty promotions with an
          # `ACTIVE` or `SCHEDULED` status.
          #
          # @return [Square::Types::CreateLoyaltyPromotionResponse]
          def create(request_options: {}, **params)
            _path_param_names = ["program_id"]

            _request = Square::Internal::JSON::Request.new(
              base_url: request_options[:base_url] || Square::Environment::SANDBOX,
              method: "POST",
              path: "v2/loyalty/programs/#{params[:program_id]}/promotions",
              body: params.except(*_path_param_names)
            )
            _response = @client.send(_request)
            if _response.code >= "200" && _response.code < "300"
              return Square::Types::CreateLoyaltyPromotionResponse.load(_response.body)
            end

            raise _response.body
          end

          # Retrieves a loyalty promotion.
          #
          # @return [Square::Types::GetLoyaltyPromotionResponse]
          def get(request_options: {}, **params)
            _request = Square::Internal::JSON::Request.new(
              base_url: request_options[:base_url] || Square::Environment::SANDBOX,
              method: "GET",
              path: "v2/loyalty/programs/#{params[:program_id]}/promotions/#{params[:promotion_id]}"
            )
            _response = @client.send(_request)
            if _response.code >= "200" && _response.code < "300"
              return Square::Types::GetLoyaltyPromotionResponse.load(_response.body)
            end

            raise _response.body
          end

          # Cancels a loyalty promotion. Use this endpoint to cancel an `ACTIVE` promotion earlier than the
          # end date, cancel an `ACTIVE` promotion when an end date is not specified, or cancel a `SCHEDULED` promotion.
          # Because updating a promotion is not supported, you can also use this endpoint to cancel a promotion before
          # you create a new one.
          #
          # This endpoint sets the loyalty promotion to the `CANCELED` state
          #
          # @return [Square::Types::CancelLoyaltyPromotionResponse]
          def cancel(request_options: {}, **params)
            _request = Square::Internal::JSON::Request.new(
              base_url: request_options[:base_url] || Square::Environment::SANDBOX,
              method: "POST",
              path: "v2/loyalty/programs/#{params[:program_id]}/promotions/#{params[:promotion_id]}/cancel"
            )
            _response = @client.send(_request)
            if _response.code >= "200" && _response.code < "300"
              return Square::Types::CancelLoyaltyPromotionResponse.load(_response.body)
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
end
