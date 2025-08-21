# frozen_string_literal: true

module Square
  module Labor
    module Shifts
      class Client
        # @return [Square::Labor::Shifts::Client]
        def initialize(client:)
          @client = client
        end

        # Creates a new `Shift`.
        #
        # A `Shift` represents a complete workday for a single team member.
        # You must provide the following values in your request to this
        # endpoint:
        #
        # - `location_id`
        # - `team_member_id`
        # - `start_at`
        #
        # An attempt to create a new `Shift` can result in a `BAD_REQUEST` error when:
        # - The `status` of the new `Shift` is `OPEN` and the team member has another
        # shift with an `OPEN` status.
        # - The `start_at` date is in the future.
        # - The `start_at` or `end_at` date overlaps another shift for the same team member.
        # - The `Break` instances are set in the request and a break `start_at`
        # is before the `Shift.start_at`, a break `end_at` is after
        # the `Shift.end_at`, or both.
        #
        # @return [Square::Types::CreateShiftResponse]
        def create(request_options: {}, **params)
          _request = Square::Internal::JSON::Request.new(
            base_url: request_options[:base_url] || Square::Environment::SANDBOX,
            method: "POST",
            path: "v2/labor/shifts",
            body: params
          )
          _response = @client.send(_request)
          if _response.code >= "200" && _response.code < "300"
            return Square::Types::CreateShiftResponse.load(_response.body)
          end

          raise _response.body
        end

        # Returns a paginated list of `Shift` records for a business.
        # The list to be returned can be filtered by:
        # - Location IDs
        # - Team member IDs
        # - Shift status (`OPEN` or `CLOSED`)
        # - Shift start
        # - Shift end
        # - Workday details
        #
        # The list can be sorted by:
        # - `START_AT`
        # - `END_AT`
        # - `CREATED_AT`
        # - `UPDATED_AT`
        #
        # @return [Square::Types::SearchShiftsResponse]
        def search(request_options: {}, **params)
          _request = Square::Internal::JSON::Request.new(
            base_url: request_options[:base_url] || Square::Environment::SANDBOX,
            method: "POST",
            path: "v2/labor/shifts/search",
            body: params
          )
          _response = @client.send(_request)
          if _response.code >= "200" && _response.code < "300"
            return Square::Types::SearchShiftsResponse.load(_response.body)
          end

          raise _response.body
        end

        # Returns a single `Shift` specified by `id`.
        #
        # @return [Square::Types::GetShiftResponse]
        def get(request_options: {}, **params)
          _request = Square::Internal::JSON::Request.new(
            base_url: request_options[:base_url] || Square::Environment::SANDBOX,
            method: "GET",
            path: "v2/labor/shifts/#{params[:id]}"
          )
          _response = @client.send(_request)
          if _response.code >= "200" && _response.code < "300"
            return Square::Types::GetShiftResponse.load(_response.body)
          end

          raise _response.body
        end

        # Updates an existing `Shift`.
        #
        # When adding a `Break` to a `Shift`, any earlier `Break` instances in the `Shift` have
        # the `end_at` property set to a valid RFC-3339 datetime string.
        #
        # When closing a `Shift`, all `Break` instances in the `Shift` must be complete with `end_at`
        # set on each `Break`.
        #
        # @return [Square::Types::UpdateShiftResponse]
        def update(request_options: {}, **params)
          _path_param_names = ["id"]

          _request = Square::Internal::JSON::Request.new(
            base_url: request_options[:base_url] || Square::Environment::SANDBOX,
            method: "PUT",
            path: "v2/labor/shifts/#{params[:id]}",
            body: params.except(*_path_param_names)
          )
          _response = @client.send(_request)
          if _response.code >= "200" && _response.code < "300"
            return Square::Types::UpdateShiftResponse.load(_response.body)
          end

          raise _response.body
        end

        # Deletes a `Shift`.
        #
        # @return [Square::Types::DeleteShiftResponse]
        def delete(request_options: {}, **params)
          _request = Square::Internal::JSON::Request.new(
            base_url: request_options[:base_url] || Square::Environment::SANDBOX,
            method: "DELETE",
            path: "v2/labor/shifts/#{params[:id]}"
          )
          _response = @client.send(_request)
          if _response.code >= "200" && _response.code < "300"
            return Square::Types::DeleteShiftResponse.load(_response.body)
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
