# frozen_string_literal: true
require_relative "environment"
require_relative "types_export"
require_relative "requests"
require_relative "square_rb/mobile/client"
require_relative "square_rb/o_auth/client"
require_relative "square_rb/v_1_transactions/client"
require_relative "square_rb/apple_pay/client"
require_relative "square_rb/bank_accounts/client"
require_relative "square_rb/bookings/client"
require_relative "square_rb/cards/client"
require_relative "square_rb/catalog/client"
require_relative "square_rb/customers/client"
require_relative "square_rb/devices/client"
require_relative "square_rb/disputes/client"
require_relative "square_rb/employees/client"
require_relative "square_rb/events/client"
require_relative "square_rb/gift_cards/client"
require_relative "square_rb/inventory/client"
require_relative "square_rb/invoices/client"
require_relative "square_rb/labor/client"
require_relative "square_rb/locations/client"
require_relative "square_rb/loyalty/client"
require_relative "square_rb/merchants/client"
require_relative "square_rb/checkout/client"
require_relative "square_rb/orders/client"
require_relative "square_rb/payments/client"
require_relative "square_rb/payouts/client"
require_relative "square_rb/refunds/client"
require_relative "square_rb/sites/client"
require_relative "square_rb/snippets/client"
require_relative "square_rb/subscriptions/client"
require_relative "square_rb/team_members/client"
require_relative "square_rb/team/client"
require_relative "square_rb/terminal/client"
require_relative "square_rb/vendors/client"
require_relative "square_rb/cash_drawers/client"
require_relative "square_rb/webhooks/client"
require_relative "requests"
require_relative "square_rb/cash_drawers/client"
require_relative "square_rb/webhooks/client"

module SquareApiClient
  class Client
  # @return [SquareApiClient::MobileClient] 
    attr_reader :mobile
  # @return [SquareApiClient::OAuthClient] 
    attr_reader :o_auth
  # @return [SquareApiClient::V1TransactionsClient] 
    attr_reader :v_1_transactions
  # @return [SquareApiClient::ApplePayClient] 
    attr_reader :apple_pay
  # @return [SquareApiClient::BankAccountsClient] 
    attr_reader :bank_accounts
  # @return [SquareApiClient::BookingsClient] 
    attr_reader :bookings
  # @return [SquareApiClient::CardsClient] 
    attr_reader :cards
  # @return [SquareApiClient::CatalogClient] 
    attr_reader :catalog
  # @return [SquareApiClient::CustomersClient] 
    attr_reader :customers
  # @return [SquareApiClient::DevicesClient] 
    attr_reader :devices
  # @return [SquareApiClient::DisputesClient] 
    attr_reader :disputes
  # @return [SquareApiClient::EmployeesClient] 
    attr_reader :employees
  # @return [SquareApiClient::EventsClient] 
    attr_reader :events
  # @return [SquareApiClient::GiftCardsClient] 
    attr_reader :gift_cards
  # @return [SquareApiClient::InventoryClient] 
    attr_reader :inventory
  # @return [SquareApiClient::InvoicesClient] 
    attr_reader :invoices
  # @return [SquareApiClient::LaborClient] 
    attr_reader :labor
  # @return [SquareApiClient::LocationsClient] 
    attr_reader :locations
  # @return [SquareApiClient::LoyaltyClient] 
    attr_reader :loyalty
  # @return [SquareApiClient::MerchantsClient] 
    attr_reader :merchants
  # @return [SquareApiClient::CheckoutClient] 
    attr_reader :checkout
  # @return [SquareApiClient::OrdersClient] 
    attr_reader :orders
  # @return [SquareApiClient::PaymentsClient] 
    attr_reader :payments
  # @return [SquareApiClient::PayoutsClient] 
    attr_reader :payouts
  # @return [SquareApiClient::RefundsClient] 
    attr_reader :refunds
  # @return [SquareApiClient::SitesClient] 
    attr_reader :sites
  # @return [SquareApiClient::SnippetsClient] 
    attr_reader :snippets
  # @return [SquareApiClient::SubscriptionsClient] 
    attr_reader :subscriptions
  # @return [SquareApiClient::TeamMembersClient] 
    attr_reader :team_members
  # @return [SquareApiClient::TeamClient] 
    attr_reader :team
  # @return [SquareApiClient::TerminalClient] 
    attr_reader :terminal
  # @return [SquareApiClient::VendorsClient] 
    attr_reader :vendors
  # @return [SquareApiClient::CashDrawers::Client] 
    attr_reader :cash_drawers
  # @return [SquareApiClient::Webhooks::Client] 
    attr_reader :webhooks


    # @param base_url [String] 
    # @param environment [SquareApiClient::Environment] 
    # @param max_retries [Long] The number of times to retry a failed request, defaults to 2.
    # @param timeout_in_seconds [Long] 
    # @param token [String] 
    # @param version [String] 
    # @return [SquareApiClient::Client]
    def initialize(base_url: nil, environment: SquareApiClient::Environment::PRODUCTION, max_retries: nil, timeout_in_seconds: nil, token: ENV["SQUARE_TOKEN"], version:)
      @request_client = SquareApiClient::RequestClient.new(
  base_url: base_url,
  environment: environment,
  max_retries: max_retries,
  timeout_in_seconds: timeout_in_seconds,
  token: token,
  version: version
)
      @mobile = SquareApiClient::MobileClient.new(request_client: @request_client)
      @o_auth = SquareApiClient::OAuthClient.new(request_client: @request_client)
      @v_1_transactions = SquareApiClient::V1TransactionsClient.new(request_client: @request_client)
      @apple_pay = SquareApiClient::ApplePayClient.new(request_client: @request_client)
      @bank_accounts = SquareApiClient::BankAccountsClient.new(request_client: @request_client)
      @bookings = SquareApiClient::BookingsClient.new(request_client: @request_client)
      @cards = SquareApiClient::CardsClient.new(request_client: @request_client)
      @catalog = SquareApiClient::CatalogClient.new(request_client: @request_client)
      @customers = SquareApiClient::CustomersClient.new(request_client: @request_client)
      @devices = SquareApiClient::DevicesClient.new(request_client: @request_client)
      @disputes = SquareApiClient::DisputesClient.new(request_client: @request_client)
      @employees = SquareApiClient::EmployeesClient.new(request_client: @request_client)
      @events = SquareApiClient::EventsClient.new(request_client: @request_client)
      @gift_cards = SquareApiClient::GiftCardsClient.new(request_client: @request_client)
      @inventory = SquareApiClient::InventoryClient.new(request_client: @request_client)
      @invoices = SquareApiClient::InvoicesClient.new(request_client: @request_client)
      @labor = SquareApiClient::LaborClient.new(request_client: @request_client)
      @locations = SquareApiClient::LocationsClient.new(request_client: @request_client)
      @loyalty = SquareApiClient::LoyaltyClient.new(request_client: @request_client)
      @merchants = SquareApiClient::MerchantsClient.new(request_client: @request_client)
      @checkout = SquareApiClient::CheckoutClient.new(request_client: @request_client)
      @orders = SquareApiClient::OrdersClient.new(request_client: @request_client)
      @payments = SquareApiClient::PaymentsClient.new(request_client: @request_client)
      @payouts = SquareApiClient::PayoutsClient.new(request_client: @request_client)
      @refunds = SquareApiClient::RefundsClient.new(request_client: @request_client)
      @sites = SquareApiClient::SitesClient.new(request_client: @request_client)
      @snippets = SquareApiClient::SnippetsClient.new(request_client: @request_client)
      @subscriptions = SquareApiClient::SubscriptionsClient.new(request_client: @request_client)
      @team_members = SquareApiClient::TeamMembersClient.new(request_client: @request_client)
      @team = SquareApiClient::TeamClient.new(request_client: @request_client)
      @terminal = SquareApiClient::TerminalClient.new(request_client: @request_client)
      @vendors = SquareApiClient::VendorsClient.new(request_client: @request_client)
      @cash_drawers = SquareApiClient::CashDrawers::Client.new(request_client: @request_client)
      @webhooks = SquareApiClient::Webhooks::Client.new(request_client: @request_client)
    end
  end
  class AsyncClient
  # @return [SquareApiClient::AsyncMobileClient] 
    attr_reader :mobile
  # @return [SquareApiClient::AsyncOAuthClient] 
    attr_reader :o_auth
  # @return [SquareApiClient::AsyncV1TransactionsClient] 
    attr_reader :v_1_transactions
  # @return [SquareApiClient::AsyncApplePayClient] 
    attr_reader :apple_pay
  # @return [SquareApiClient::AsyncBankAccountsClient] 
    attr_reader :bank_accounts
  # @return [SquareApiClient::AsyncBookingsClient] 
    attr_reader :bookings
  # @return [SquareApiClient::AsyncCardsClient] 
    attr_reader :cards
  # @return [SquareApiClient::AsyncCatalogClient] 
    attr_reader :catalog
  # @return [SquareApiClient::AsyncCustomersClient] 
    attr_reader :customers
  # @return [SquareApiClient::AsyncDevicesClient] 
    attr_reader :devices
  # @return [SquareApiClient::AsyncDisputesClient] 
    attr_reader :disputes
  # @return [SquareApiClient::AsyncEmployeesClient] 
    attr_reader :employees
  # @return [SquareApiClient::AsyncEventsClient] 
    attr_reader :events
  # @return [SquareApiClient::AsyncGiftCardsClient] 
    attr_reader :gift_cards
  # @return [SquareApiClient::AsyncInventoryClient] 
    attr_reader :inventory
  # @return [SquareApiClient::AsyncInvoicesClient] 
    attr_reader :invoices
  # @return [SquareApiClient::AsyncLaborClient] 
    attr_reader :labor
  # @return [SquareApiClient::AsyncLocationsClient] 
    attr_reader :locations
  # @return [SquareApiClient::AsyncLoyaltyClient] 
    attr_reader :loyalty
  # @return [SquareApiClient::AsyncMerchantsClient] 
    attr_reader :merchants
  # @return [SquareApiClient::AsyncCheckoutClient] 
    attr_reader :checkout
  # @return [SquareApiClient::AsyncOrdersClient] 
    attr_reader :orders
  # @return [SquareApiClient::AsyncPaymentsClient] 
    attr_reader :payments
  # @return [SquareApiClient::AsyncPayoutsClient] 
    attr_reader :payouts
  # @return [SquareApiClient::AsyncRefundsClient] 
    attr_reader :refunds
  # @return [SquareApiClient::AsyncSitesClient] 
    attr_reader :sites
  # @return [SquareApiClient::AsyncSnippetsClient] 
    attr_reader :snippets
  # @return [SquareApiClient::AsyncSubscriptionsClient] 
    attr_reader :subscriptions
  # @return [SquareApiClient::AsyncTeamMembersClient] 
    attr_reader :team_members
  # @return [SquareApiClient::AsyncTeamClient] 
    attr_reader :team
  # @return [SquareApiClient::AsyncTerminalClient] 
    attr_reader :terminal
  # @return [SquareApiClient::AsyncVendorsClient] 
    attr_reader :vendors
  # @return [SquareApiClient::CashDrawers::AsyncClient] 
    attr_reader :cash_drawers
  # @return [SquareApiClient::Webhooks::AsyncClient] 
    attr_reader :webhooks


    # @param base_url [String] 
    # @param environment [SquareApiClient::Environment] 
    # @param max_retries [Long] The number of times to retry a failed request, defaults to 2.
    # @param timeout_in_seconds [Long] 
    # @param token [String] 
    # @param version [String] 
    # @return [SquareApiClient::AsyncClient]
    def initialize(base_url: nil, environment: SquareApiClient::Environment::PRODUCTION, max_retries: nil, timeout_in_seconds: nil, token: ENV["SQUARE_TOKEN"], version:)
      @async_request_client = SquareApiClient::AsyncRequestClient.new(
  base_url: base_url,
  environment: environment,
  max_retries: max_retries,
  timeout_in_seconds: timeout_in_seconds,
  token: token,
  version: version
)
      @mobile = SquareApiClient::AsyncMobileClient.new(request_client: @async_request_client)
      @o_auth = SquareApiClient::AsyncOAuthClient.new(request_client: @async_request_client)
      @v_1_transactions = SquareApiClient::AsyncV1TransactionsClient.new(request_client: @async_request_client)
      @apple_pay = SquareApiClient::AsyncApplePayClient.new(request_client: @async_request_client)
      @bank_accounts = SquareApiClient::AsyncBankAccountsClient.new(request_client: @async_request_client)
      @bookings = SquareApiClient::AsyncBookingsClient.new(request_client: @async_request_client)
      @cards = SquareApiClient::AsyncCardsClient.new(request_client: @async_request_client)
      @catalog = SquareApiClient::AsyncCatalogClient.new(request_client: @async_request_client)
      @customers = SquareApiClient::AsyncCustomersClient.new(request_client: @async_request_client)
      @devices = SquareApiClient::AsyncDevicesClient.new(request_client: @async_request_client)
      @disputes = SquareApiClient::AsyncDisputesClient.new(request_client: @async_request_client)
      @employees = SquareApiClient::AsyncEmployeesClient.new(request_client: @async_request_client)
      @events = SquareApiClient::AsyncEventsClient.new(request_client: @async_request_client)
      @gift_cards = SquareApiClient::AsyncGiftCardsClient.new(request_client: @async_request_client)
      @inventory = SquareApiClient::AsyncInventoryClient.new(request_client: @async_request_client)
      @invoices = SquareApiClient::AsyncInvoicesClient.new(request_client: @async_request_client)
      @labor = SquareApiClient::AsyncLaborClient.new(request_client: @async_request_client)
      @locations = SquareApiClient::AsyncLocationsClient.new(request_client: @async_request_client)
      @loyalty = SquareApiClient::AsyncLoyaltyClient.new(request_client: @async_request_client)
      @merchants = SquareApiClient::AsyncMerchantsClient.new(request_client: @async_request_client)
      @checkout = SquareApiClient::AsyncCheckoutClient.new(request_client: @async_request_client)
      @orders = SquareApiClient::AsyncOrdersClient.new(request_client: @async_request_client)
      @payments = SquareApiClient::AsyncPaymentsClient.new(request_client: @async_request_client)
      @payouts = SquareApiClient::AsyncPayoutsClient.new(request_client: @async_request_client)
      @refunds = SquareApiClient::AsyncRefundsClient.new(request_client: @async_request_client)
      @sites = SquareApiClient::AsyncSitesClient.new(request_client: @async_request_client)
      @snippets = SquareApiClient::AsyncSnippetsClient.new(request_client: @async_request_client)
      @subscriptions = SquareApiClient::AsyncSubscriptionsClient.new(request_client: @async_request_client)
      @team_members = SquareApiClient::AsyncTeamMembersClient.new(request_client: @async_request_client)
      @team = SquareApiClient::AsyncTeamClient.new(request_client: @async_request_client)
      @terminal = SquareApiClient::AsyncTerminalClient.new(request_client: @async_request_client)
      @vendors = SquareApiClient::AsyncVendorsClient.new(request_client: @async_request_client)
      @cash_drawers = SquareApiClient::CashDrawers::AsyncClient.new(request_client: @async_request_client)
      @webhooks = SquareApiClient::Webhooks::AsyncClient.new(request_client: @async_request_client)
    end
  end
end