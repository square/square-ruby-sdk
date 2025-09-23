# frozen_string_literal: true

module Square
  class Client
    # @return [Square::Client]
    def initialize(base_url:, token: ENV.fetch("SQUARE_TOKEN", nil))
      @raw_client = Square::Internal::Http::RawClient.new(
        base_url: base_url,
        headers: {
          "User-Agent": "square.rb/44.1.0.20250924",
          "X-Fern-Language": "Ruby",
          Authorization: "Bearer #{token}"
        }
      )
    end

    # @return [Square::Mobile::Client]
    def mobile
      @mobile ||= Square::Mobile::Client.new(client: @raw_client)
    end

    # @return [Square::OAuth::Client]
    def o_auth
      @o_auth ||= Square::OAuth::Client.new(client: @raw_client)
    end

    # @return [Square::V1Transactions::Client]
    def v_1_transactions
      @v_1_transactions ||= Square::V1Transactions::Client.new(client: @raw_client)
    end

    # @return [Square::ApplePay::Client]
    def apple_pay
      @apple_pay ||= Square::ApplePay::Client.new(client: @raw_client)
    end

    # @return [Square::BankAccounts::Client]
    def bank_accounts
      @bank_accounts ||= Square::BankAccounts::Client.new(client: @raw_client)
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
    def gift_cards
      @gift_cards ||= Square::GiftCards::Client.new(client: @raw_client)
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
    def team_members
      @team_members ||= Square::TeamMembers::Client.new(client: @raw_client)
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
    def cash_drawers
      @cash_drawers ||= Square::CashDrawers::Client.new(client: @raw_client)
    end

    # @return [Square::Webhooks::Client]
    def webhooks
      @webhooks ||= Square::Webhooks::Client.new(client: @raw_client)
    end
  end
end
