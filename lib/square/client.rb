module Square
  #  square client class.
  class Client
    include CoreLibrary
    attr_reader :config, :auth_managers

    def sdk_version
      '42.2.0.20250521'
    end

    def square_version
      config.square_version
    end

    def user_agent_detail
      config.user_agent_detail
    end

    # Access to mobile_authorization controller.
    # @return [MobileAuthorizationApi] Returns the controller instance.
    def mobile_authorization
      @mobile_authorization ||= MobileAuthorizationApi.new @global_configuration
    end

    # Access to o_auth controller.
    # @return [OAuthApi] Returns the controller instance.
    def o_auth
      @o_auth ||= OAuthApi.new @global_configuration
    end

    # Access to v1_transactions controller.
    # @return [V1TransactionsApi] Returns the controller instance.
    def v1_transactions
      @v1_transactions ||= V1TransactionsApi.new @global_configuration
    end

    # Access to apple_pay controller.
    # @return [ApplePayApi] Returns the controller instance.
    def apple_pay
      @apple_pay ||= ApplePayApi.new @global_configuration
    end

    # Access to bank_accounts controller.
    # @return [BankAccountsApi] Returns the controller instance.
    def bank_accounts
      @bank_accounts ||= BankAccountsApi.new @global_configuration
    end

    # Access to bookings controller.
    # @return [BookingsApi] Returns the controller instance.
    def bookings
      @bookings ||= BookingsApi.new @global_configuration
    end

    # Access to booking_custom_attributes controller.
    # @return [BookingCustomAttributesApi] Returns the controller instance.
    def booking_custom_attributes
      @booking_custom_attributes ||= BookingCustomAttributesApi.new @global_configuration
    end

    # Access to cards controller.
    # @return [CardsApi] Returns the controller instance.
    def cards
      @cards ||= CardsApi.new @global_configuration
    end

    # Access to cash_drawers controller.
    # @return [CashDrawersApi] Returns the controller instance.
    def cash_drawers
      @cash_drawers ||= CashDrawersApi.new @global_configuration
    end

    # Access to catalog controller.
    # @return [CatalogApi] Returns the controller instance.
    def catalog
      @catalog ||= CatalogApi.new @global_configuration
    end

    # Access to customers controller.
    # @return [CustomersApi] Returns the controller instance.
    def customers
      @customers ||= CustomersApi.new @global_configuration
    end

    # Access to customer_custom_attributes controller.
    # @return [CustomerCustomAttributesApi] Returns the controller instance.
    def customer_custom_attributes
      @customer_custom_attributes ||= CustomerCustomAttributesApi.new @global_configuration
    end

    # Access to customer_groups controller.
    # @return [CustomerGroupsApi] Returns the controller instance.
    def customer_groups
      @customer_groups ||= CustomerGroupsApi.new @global_configuration
    end

    # Access to customer_segments controller.
    # @return [CustomerSegmentsApi] Returns the controller instance.
    def customer_segments
      @customer_segments ||= CustomerSegmentsApi.new @global_configuration
    end

    # Access to devices controller.
    # @return [DevicesApi] Returns the controller instance.
    def devices
      @devices ||= DevicesApi.new @global_configuration
    end

    # Access to disputes controller.
    # @return [DisputesApi] Returns the controller instance.
    def disputes
      @disputes ||= DisputesApi.new @global_configuration
    end

    # Access to employees controller.
    # @return [EmployeesApi] Returns the controller instance.
    def employees
      @employees ||= EmployeesApi.new @global_configuration
    end

    # Access to events controller.
    # @return [EventsApi] Returns the controller instance.
    def events
      @events ||= EventsApi.new @global_configuration
    end

    # Access to gift_cards controller.
    # @return [GiftCardsApi] Returns the controller instance.
    def gift_cards
      @gift_cards ||= GiftCardsApi.new @global_configuration
    end

    # Access to gift_card_activities controller.
    # @return [GiftCardActivitiesApi] Returns the controller instance.
    def gift_card_activities
      @gift_card_activities ||= GiftCardActivitiesApi.new @global_configuration
    end

    # Access to inventory controller.
    # @return [InventoryApi] Returns the controller instance.
    def inventory
      @inventory ||= InventoryApi.new @global_configuration
    end

    # Access to invoices controller.
    # @return [InvoicesApi] Returns the controller instance.
    def invoices
      @invoices ||= InvoicesApi.new @global_configuration
    end

    # Access to labor controller.
    # @return [LaborApi] Returns the controller instance.
    def labor
      @labor ||= LaborApi.new @global_configuration
    end

    # Access to locations controller.
    # @return [LocationsApi] Returns the controller instance.
    def locations
      @locations ||= LocationsApi.new @global_configuration
    end

    # Access to location_custom_attributes controller.
    # @return [LocationCustomAttributesApi] Returns the controller instance.
    def location_custom_attributes
      @location_custom_attributes ||= LocationCustomAttributesApi.new @global_configuration
    end

    # Access to checkout controller.
    # @return [CheckoutApi] Returns the controller instance.
    def checkout
      @checkout ||= CheckoutApi.new @global_configuration
    end

    # Access to transactions controller.
    # @return [TransactionsApi] Returns the controller instance.
    def transactions
      @transactions ||= TransactionsApi.new @global_configuration
    end

    # Access to loyalty controller.
    # @return [LoyaltyApi] Returns the controller instance.
    def loyalty
      @loyalty ||= LoyaltyApi.new @global_configuration
    end

    # Access to merchants controller.
    # @return [MerchantsApi] Returns the controller instance.
    def merchants
      @merchants ||= MerchantsApi.new @global_configuration
    end

    # Access to merchant_custom_attributes controller.
    # @return [MerchantCustomAttributesApi] Returns the controller instance.
    def merchant_custom_attributes
      @merchant_custom_attributes ||= MerchantCustomAttributesApi.new @global_configuration
    end

    # Access to orders controller.
    # @return [OrdersApi] Returns the controller instance.
    def orders
      @orders ||= OrdersApi.new @global_configuration
    end

    # Access to order_custom_attributes controller.
    # @return [OrderCustomAttributesApi] Returns the controller instance.
    def order_custom_attributes
      @order_custom_attributes ||= OrderCustomAttributesApi.new @global_configuration
    end

    # Access to payments controller.
    # @return [PaymentsApi] Returns the controller instance.
    def payments
      @payments ||= PaymentsApi.new @global_configuration
    end

    # Access to payouts controller.
    # @return [PayoutsApi] Returns the controller instance.
    def payouts
      @payouts ||= PayoutsApi.new @global_configuration
    end

    # Access to refunds controller.
    # @return [RefundsApi] Returns the controller instance.
    def refunds
      @refunds ||= RefundsApi.new @global_configuration
    end

    # Access to sites controller.
    # @return [SitesApi] Returns the controller instance.
    def sites
      @sites ||= SitesApi.new @global_configuration
    end

    # Access to snippets controller.
    # @return [SnippetsApi] Returns the controller instance.
    def snippets
      @snippets ||= SnippetsApi.new @global_configuration
    end

    # Access to subscriptions controller.
    # @return [SubscriptionsApi] Returns the controller instance.
    def subscriptions
      @subscriptions ||= SubscriptionsApi.new @global_configuration
    end

    # Access to team controller.
    # @return [TeamApi] Returns the controller instance.
    def team
      @team ||= TeamApi.new @global_configuration
    end

    # Access to terminal controller.
    # @return [TerminalApi] Returns the controller instance.
    def terminal
      @terminal ||= TerminalApi.new @global_configuration
    end

    # Access to vendors controller.
    # @return [VendorsApi] Returns the controller instance.
    def vendors
      @vendors ||= VendorsApi.new @global_configuration
    end

    # Access to webhook_subscriptions controller.
    # @return [WebhookSubscriptionsApi] Returns the controller instance.
    def webhook_subscriptions
      @webhook_subscriptions ||= WebhookSubscriptionsApi.new @global_configuration
    end

    def initialize(
      connection: nil, adapter: :net_http_persistent, timeout: 60,
      max_retries: 0, retry_interval: 1, backoff_factor: 2,
      retry_statuses: [408, 413, 429, 500, 502, 503, 504, 521, 522, 524],
      retry_methods: %i[get put], http_callback: nil, environment: 'production',
      custom_url: 'https://connect.squareup.com', access_token: nil,
      bearer_auth_credentials: nil, square_version: '2025-05-21',
      user_agent_detail: '', additional_headers: {}, config: nil
    )
      @config = if config.nil?
                  Configuration.new(
                    connection: connection, adapter: adapter, timeout: timeout,
                    max_retries: max_retries, retry_interval: retry_interval,
                    backoff_factor: backoff_factor,
                    retry_statuses: retry_statuses,
                    retry_methods: retry_methods, http_callback: http_callback,
                    environment: environment, custom_url: custom_url,
                    access_token: access_token,
                    bearer_auth_credentials: bearer_auth_credentials,
                    square_version: square_version,
                    user_agent_detail: user_agent_detail,
                    additional_headers: additional_headers
                  )
                else
                  config
                end

      custom_user_agent_parameters = {
        '{api-version}' => { 'value': @config.square_version, 'encode': false },
        '{detail}' => { 'value': @config.user_agent_detail, 'encode': true }
      }

      user_agent_params = BaseApi.user_agent_parameters.merge!(custom_user_agent_parameters)

      @global_configuration = GlobalConfiguration.new(client_configuration: @config)
                                                 .base_uri_executor(@config.method(:get_base_uri))
                                                 .user_agent(BaseApi.user_agent,
                                                             agent_parameters: user_agent_params)
                                                 .additional_headers(@config.additional_headers)
                                                 .global_header('Square-Version', @config.square_version)
                                                 .symbolize_hash(true)

      initialize_auth_managers(@global_configuration)
      @global_configuration = @global_configuration.auth_managers(@auth_managers)
    end

    # Initializes the auth managers hash used for authenticating API calls.
    # @param [GlobalConfiguration] global_config The global configuration of the SDK)
    def initialize_auth_managers(global_config)
      @auth_managers = {}
      http_client_config = global_config.client_configuration
      %w[global].each { |auth| @auth_managers[auth] = nil }
      @auth_managers['global'] = OAuth2.new(http_client_config.bearer_auth_credentials)
    end
  end
end
