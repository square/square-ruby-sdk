# frozen_string_literal: true
require_relative "environment"
require_relative "types_export"
require_relative "requests"
require_relative "square/mobile/client"
require_relative "square/o_auth/client"
require_relative "square/v_1_transactions/client"
require_relative "square/apple_pay/client"
require_relative "square/bank_accounts/client"
require_relative "square/bookings/client"
require_relative "square/cards/client"
require_relative "square/catalog/client"
require_relative "square/customers/client"
require_relative "square/devices/client"
require_relative "square/disputes/client"
require_relative "square/employees/client"
require_relative "square/events/client"
require_relative "square/gift_cards/client"
require_relative "square/inventory/client"
require_relative "square/invoices/client"
require_relative "square/labor/client"
require_relative "square/locations/client"
require_relative "square/loyalty/client"
require_relative "square/merchants/client"
require_relative "square/checkout/client"
require_relative "square/orders/client"
require_relative "square/payments/client"
require_relative "square/payouts/client"
require_relative "square/refunds/client"
require_relative "square/sites/client"
require_relative "square/snippets/client"
require_relative "square/subscriptions/client"
require_relative "square/team_members/client"
require_relative "square/team/client"
require_relative "square/terminal/client"
require_relative "square/vendors/client"
require_relative "square/cash_drawers/client"
require_relative "square/webhooks/client"
require_relative "requests"
require_relative "square/cash_drawers/client"
require_relative "square/webhooks/client"

module square.rb
  class Client
  # @return [square.rb::MobileClient] 
    attr_reader :mobile
  # @return [square.rb::OAuthClient] 
    attr_reader :o_auth
  # @return [square.rb::V1TransactionsClient] 
    attr_reader :v_1_transactions
  # @return [square.rb::ApplePayClient] 
    attr_reader :apple_pay
  # @return [square.rb::BankAccountsClient] 
    attr_reader :bank_accounts
  # @return [square.rb::BookingsClient] 
    attr_reader :bookings
  # @return [square.rb::CardsClient] 
    attr_reader :cards
  # @return [square.rb::CatalogClient] 
    attr_reader :catalog
  # @return [square.rb::CustomersClient] 
    attr_reader :customers
  # @return [square.rb::DevicesClient] 
    attr_reader :devices
  # @return [square.rb::DisputesClient] 
    attr_reader :disputes
  # @return [square.rb::EmployeesClient] 
    attr_reader :employees
  # @return [square.rb::EventsClient] 
    attr_reader :events
  # @return [square.rb::GiftCardsClient] 
    attr_reader :gift_cards
  # @return [square.rb::InventoryClient] 
    attr_reader :inventory
  # @return [square.rb::InvoicesClient] 
    attr_reader :invoices
  # @return [square.rb::LaborClient] 
    attr_reader :labor
  # @return [square.rb::LocationsClient] 
    attr_reader :locations
  # @return [square.rb::LoyaltyClient] 
    attr_reader :loyalty
  # @return [square.rb::MerchantsClient] 
    attr_reader :merchants
  # @return [square.rb::CheckoutClient] 
    attr_reader :checkout
  # @return [square.rb::OrdersClient] 
    attr_reader :orders
  # @return [square.rb::PaymentsClient] 
    attr_reader :payments
  # @return [square.rb::PayoutsClient] 
    attr_reader :payouts
  # @return [square.rb::RefundsClient] 
    attr_reader :refunds
  # @return [square.rb::SitesClient] 
    attr_reader :sites
  # @return [square.rb::SnippetsClient] 
    attr_reader :snippets
  # @return [square.rb::SubscriptionsClient] 
    attr_reader :subscriptions
  # @return [square.rb::TeamMembersClient] 
    attr_reader :team_members
  # @return [square.rb::TeamClient] 
    attr_reader :team
  # @return [square.rb::TerminalClient] 
    attr_reader :terminal
  # @return [square.rb::VendorsClient] 
    attr_reader :vendors
  # @return [square.rb::CashDrawers::Client] 
    attr_reader :cash_drawers
  # @return [square.rb::Webhooks::Client] 
    attr_reader :webhooks


    # @param base_url [String] 
    # @param environment [square.rb::Environment] 
    # @param max_retries [Long] The number of times to retry a failed request, defaults to 2.
    # @param timeout_in_seconds [Long] 
    # @param token [String] 
    # @param version [String] 
    # @return [square.rb::Client]
    def initialize(base_url: nil, environment: square.rb::Environment::PRODUCTION, max_retries: nil, timeout_in_seconds: nil, token: ENV["SQUARE_TOKEN"], version:)
      @request_client = square.rb::RequestClient.new(
  base_url: base_url,
  environment: environment,
  max_retries: max_retries,
  timeout_in_seconds: timeout_in_seconds,
  token: token,
  version: version
)
      @mobile = square.rb::MobileClient.new(request_client: @request_client)
      @o_auth = square.rb::OAuthClient.new(request_client: @request_client)
      @v_1_transactions = square.rb::V1TransactionsClient.new(request_client: @request_client)
      @apple_pay = square.rb::ApplePayClient.new(request_client: @request_client)
      @bank_accounts = square.rb::BankAccountsClient.new(request_client: @request_client)
      @bookings = square.rb::BookingsClient.new(request_client: @request_client)
      @cards = square.rb::CardsClient.new(request_client: @request_client)
      @catalog = square.rb::CatalogClient.new(request_client: @request_client)
      @customers = square.rb::CustomersClient.new(request_client: @request_client)
      @devices = square.rb::DevicesClient.new(request_client: @request_client)
      @disputes = square.rb::DisputesClient.new(request_client: @request_client)
      @employees = square.rb::EmployeesClient.new(request_client: @request_client)
      @events = square.rb::EventsClient.new(request_client: @request_client)
      @gift_cards = square.rb::GiftCardsClient.new(request_client: @request_client)
      @inventory = square.rb::InventoryClient.new(request_client: @request_client)
      @invoices = square.rb::InvoicesClient.new(request_client: @request_client)
      @labor = square.rb::LaborClient.new(request_client: @request_client)
      @locations = square.rb::LocationsClient.new(request_client: @request_client)
      @loyalty = square.rb::LoyaltyClient.new(request_client: @request_client)
      @merchants = square.rb::MerchantsClient.new(request_client: @request_client)
      @checkout = square.rb::CheckoutClient.new(request_client: @request_client)
      @orders = square.rb::OrdersClient.new(request_client: @request_client)
      @payments = square.rb::PaymentsClient.new(request_client: @request_client)
      @payouts = square.rb::PayoutsClient.new(request_client: @request_client)
      @refunds = square.rb::RefundsClient.new(request_client: @request_client)
      @sites = square.rb::SitesClient.new(request_client: @request_client)
      @snippets = square.rb::SnippetsClient.new(request_client: @request_client)
      @subscriptions = square.rb::SubscriptionsClient.new(request_client: @request_client)
      @team_members = square.rb::TeamMembersClient.new(request_client: @request_client)
      @team = square.rb::TeamClient.new(request_client: @request_client)
      @terminal = square.rb::TerminalClient.new(request_client: @request_client)
      @vendors = square.rb::VendorsClient.new(request_client: @request_client)
      @cash_drawers = square.rb::CashDrawers::Client.new(request_client: @request_client)
      @webhooks = square.rb::Webhooks::Client.new(request_client: @request_client)
    end
  end
  class AsyncClient
  # @return [square.rb::AsyncMobileClient] 
    attr_reader :mobile
  # @return [square.rb::AsyncOAuthClient] 
    attr_reader :o_auth
  # @return [square.rb::AsyncV1TransactionsClient] 
    attr_reader :v_1_transactions
  # @return [square.rb::AsyncApplePayClient] 
    attr_reader :apple_pay
  # @return [square.rb::AsyncBankAccountsClient] 
    attr_reader :bank_accounts
  # @return [square.rb::AsyncBookingsClient] 
    attr_reader :bookings
  # @return [square.rb::AsyncCardsClient] 
    attr_reader :cards
  # @return [square.rb::AsyncCatalogClient] 
    attr_reader :catalog
  # @return [square.rb::AsyncCustomersClient] 
    attr_reader :customers
  # @return [square.rb::AsyncDevicesClient] 
    attr_reader :devices
  # @return [square.rb::AsyncDisputesClient] 
    attr_reader :disputes
  # @return [square.rb::AsyncEmployeesClient] 
    attr_reader :employees
  # @return [square.rb::AsyncEventsClient] 
    attr_reader :events
  # @return [square.rb::AsyncGiftCardsClient] 
    attr_reader :gift_cards
  # @return [square.rb::AsyncInventoryClient] 
    attr_reader :inventory
  # @return [square.rb::AsyncInvoicesClient] 
    attr_reader :invoices
  # @return [square.rb::AsyncLaborClient] 
    attr_reader :labor
  # @return [square.rb::AsyncLocationsClient] 
    attr_reader :locations
  # @return [square.rb::AsyncLoyaltyClient] 
    attr_reader :loyalty
  # @return [square.rb::AsyncMerchantsClient] 
    attr_reader :merchants
  # @return [square.rb::AsyncCheckoutClient] 
    attr_reader :checkout
  # @return [square.rb::AsyncOrdersClient] 
    attr_reader :orders
  # @return [square.rb::AsyncPaymentsClient] 
    attr_reader :payments
  # @return [square.rb::AsyncPayoutsClient] 
    attr_reader :payouts
  # @return [square.rb::AsyncRefundsClient] 
    attr_reader :refunds
  # @return [square.rb::AsyncSitesClient] 
    attr_reader :sites
  # @return [square.rb::AsyncSnippetsClient] 
    attr_reader :snippets
  # @return [square.rb::AsyncSubscriptionsClient] 
    attr_reader :subscriptions
  # @return [square.rb::AsyncTeamMembersClient] 
    attr_reader :team_members
  # @return [square.rb::AsyncTeamClient] 
    attr_reader :team
  # @return [square.rb::AsyncTerminalClient] 
    attr_reader :terminal
  # @return [square.rb::AsyncVendorsClient] 
    attr_reader :vendors
  # @return [square.rb::CashDrawers::AsyncClient] 
    attr_reader :cash_drawers
  # @return [square.rb::Webhooks::AsyncClient] 
    attr_reader :webhooks


    # @param base_url [String] 
    # @param environment [square.rb::Environment] 
    # @param max_retries [Long] The number of times to retry a failed request, defaults to 2.
    # @param timeout_in_seconds [Long] 
    # @param token [String] 
    # @param version [String] 
    # @return [square.rb::AsyncClient]
    def initialize(base_url: nil, environment: square.rb::Environment::PRODUCTION, max_retries: nil, timeout_in_seconds: nil, token: ENV["SQUARE_TOKEN"], version:)
      @async_request_client = square.rb::AsyncRequestClient.new(
  base_url: base_url,
  environment: environment,
  max_retries: max_retries,
  timeout_in_seconds: timeout_in_seconds,
  token: token,
  version: version
)
      @mobile = square.rb::AsyncMobileClient.new(request_client: @async_request_client)
      @o_auth = square.rb::AsyncOAuthClient.new(request_client: @async_request_client)
      @v_1_transactions = square.rb::AsyncV1TransactionsClient.new(request_client: @async_request_client)
      @apple_pay = square.rb::AsyncApplePayClient.new(request_client: @async_request_client)
      @bank_accounts = square.rb::AsyncBankAccountsClient.new(request_client: @async_request_client)
      @bookings = square.rb::AsyncBookingsClient.new(request_client: @async_request_client)
      @cards = square.rb::AsyncCardsClient.new(request_client: @async_request_client)
      @catalog = square.rb::AsyncCatalogClient.new(request_client: @async_request_client)
      @customers = square.rb::AsyncCustomersClient.new(request_client: @async_request_client)
      @devices = square.rb::AsyncDevicesClient.new(request_client: @async_request_client)
      @disputes = square.rb::AsyncDisputesClient.new(request_client: @async_request_client)
      @employees = square.rb::AsyncEmployeesClient.new(request_client: @async_request_client)
      @events = square.rb::AsyncEventsClient.new(request_client: @async_request_client)
      @gift_cards = square.rb::AsyncGiftCardsClient.new(request_client: @async_request_client)
      @inventory = square.rb::AsyncInventoryClient.new(request_client: @async_request_client)
      @invoices = square.rb::AsyncInvoicesClient.new(request_client: @async_request_client)
      @labor = square.rb::AsyncLaborClient.new(request_client: @async_request_client)
      @locations = square.rb::AsyncLocationsClient.new(request_client: @async_request_client)
      @loyalty = square.rb::AsyncLoyaltyClient.new(request_client: @async_request_client)
      @merchants = square.rb::AsyncMerchantsClient.new(request_client: @async_request_client)
      @checkout = square.rb::AsyncCheckoutClient.new(request_client: @async_request_client)
      @orders = square.rb::AsyncOrdersClient.new(request_client: @async_request_client)
      @payments = square.rb::AsyncPaymentsClient.new(request_client: @async_request_client)
      @payouts = square.rb::AsyncPayoutsClient.new(request_client: @async_request_client)
      @refunds = square.rb::AsyncRefundsClient.new(request_client: @async_request_client)
      @sites = square.rb::AsyncSitesClient.new(request_client: @async_request_client)
      @snippets = square.rb::AsyncSnippetsClient.new(request_client: @async_request_client)
      @subscriptions = square.rb::AsyncSubscriptionsClient.new(request_client: @async_request_client)
      @team_members = square.rb::AsyncTeamMembersClient.new(request_client: @async_request_client)
      @team = square.rb::AsyncTeamClient.new(request_client: @async_request_client)
      @terminal = square.rb::AsyncTerminalClient.new(request_client: @async_request_client)
      @vendors = square.rb::AsyncVendorsClient.new(request_client: @async_request_client)
      @cash_drawers = square.rb::CashDrawers::AsyncClient.new(request_client: @async_request_client)
      @webhooks = square.rb::Webhooks::AsyncClient.new(request_client: @async_request_client)
    end
  end
end