# frozen_string_literal: true
require_relative "../../requests"
require_relative "custom_attribute_definitions/client"
require_relative "custom_attributes/client"
require_relative "transactions/client"
require_relative "../types/list_locations_response"
require_relative "../types/location"
require_relative "../types/create_location_response"
require_relative "../types/get_location_response"
require_relative "../types/update_location_response"
require_relative "../types/create_order_request"
require_relative "../types/address"
require_relative "../types/charge_request_additional_recipient"
require_relative "../types/create_checkout_response"
require "async"
require "async"
require "async"
require "async"
require "async"
require_relative "../../requests"

module SquareApiClient
  class LocationsClient
  # @return [SquareApiClient::RequestClient] 
    attr_reader :request_client
  # @return [SquareApiClient::Locations::CustomAttributeDefinitionsClient] 
    attr_reader :custom_attribute_definitions
  # @return [SquareApiClient::Locations::CustomAttributesClient] 
    attr_reader :custom_attributes
  # @return [SquareApiClient::Locations::TransactionsClient] 
    attr_reader :transactions


    # @param request_client [SquareApiClient::RequestClient] 
    # @return [SquareApiClient::LocationsClient]
    def initialize(request_client:)
      @request_client = request_client
      @custom_attribute_definitions = SquareApiClient::Locations::CustomAttributeDefinitionsClient.new(request_client: request_client)
      @custom_attributes = SquareApiClient::Locations::CustomAttributesClient.new(request_client: request_client)
      @transactions = SquareApiClient::Locations::TransactionsClient.new(request_client: request_client)
    end
# Provides details about all of the seller's
#  [locations](https://developer.squareup.com/docs/locations-api),
#  including those with an inactive status. Locations are listed alphabetically by
#  `name`.
    #
    # @param request_options [SquareApiClient::RequestOptions] 
    # @return [SquareApiClient::ListLocationsResponse]
    # @example
#  api = SquareApiClient::Client.new(
#    base_url: "https://api.example.com",
#    environment: SquareApiClient::Environment::PRODUCTION,
#    token: "YOUR_AUTH_TOKEN",
#    version: "Version"
#  )
#  api.locations.list
    def list(request_options: nil)
      response = @request_client.conn.get do | req |
  unless request_options&.timeout_in_seconds.nil?
    req.options.timeout = request_options.timeout_in_seconds
  end
  unless request_options&.token.nil?
    req.headers["Authorization"] = request_options.token
  end
  unless request_options&.version.nil?
    req.headers["Square-Version"] = request_options.version
  end
  req.headers = { **(req.headers || {}), **@request_client.get_headers, **(request_options&.additional_headers || {}) }.compact
  unless request_options.nil? || request_options&.additional_query_parameters.nil?
    req.params = { **(request_options&.additional_query_parameters || {}) }.compact
  end
  unless request_options.nil? || request_options&.additional_body_parameters.nil?
    req.body = { **(request_options&.additional_body_parameters || {}) }.compact
  end
  req.url "#{@request_client.get_url(request_options: request_options)}/v2/locations"
end
      SquareApiClient::ListLocationsResponse.from_json(json_object: response.body)
    end
# Creates a [location](https://developer.squareup.com/docs/locations-api).
#  Creating new locations allows for separate configuration of receipt layouts,
#  item prices,
#  and sales reports. Developers can use locations to separate sales activity
#  through applications
#  that integrate with Square from sales activity elsewhere in a seller's account.
#  Locations created programmatically with the Locations API last forever and
#  are visible to the seller for their own management. Therefore, ensure that
#  each location has a sensible and unique name.
    #
    # @param location [Hash] The initial values of the location being created. The `name` field is required
#  and must be unique within a seller account.
#  All other fields are optional, but any information you care about for the
#  location should be included.
#  The remaining fields are automatically added based on the data from the [main
#  ion](https://developer.squareup.com/docs/locations-api#about-the-main-location).Request of type SquareApiClient::Location, as a Hash
    #   * :id (String) 
    #   * :name (String) 
    #   * :address (Hash)
    #     * :address_line_1 (String) 
    #     * :address_line_2 (String) 
    #     * :address_line_3 (String) 
    #     * :locality (String) 
    #     * :sublocality (String) 
    #     * :sublocality_2 (String) 
    #     * :sublocality_3 (String) 
    #     * :administrative_district_level_1 (String) 
    #     * :administrative_district_level_2 (String) 
    #     * :administrative_district_level_3 (String) 
    #     * :postal_code (String) 
    #     * :country (SquareApiClient::Country) 
    #     * :first_name (String) 
    #     * :last_name (String) 
    #   * :timezone (String) 
    #   * :capabilities (Array<SquareApiClient::LocationCapability>) 
    #   * :status (SquareApiClient::LocationStatus) 
    #   * :created_at (String) 
    #   * :merchant_id (String) 
    #   * :country (SquareApiClient::Country) 
    #   * :language_code (String) 
    #   * :currency (SquareApiClient::Currency) 
    #   * :phone_number (String) 
    #   * :business_name (String) 
    #   * :type (SquareApiClient::LocationType) 
    #   * :website_url (String) 
    #   * :business_hours (Hash)
    #     * :periods (Array<SquareApiClient::BusinessHoursPeriod>) 
    #   * :business_email (String) 
    #   * :description (String) 
    #   * :twitter_username (String) 
    #   * :instagram_username (String) 
    #   * :facebook_url (String) 
    #   * :coordinates (Hash)
    #     * :latitude (Float) 
    #     * :longitude (Float) 
    #   * :logo_url (String) 
    #   * :pos_background_url (String) 
    #   * :mcc (String) 
    #   * :full_format_logo_url (String) 
    #   * :tax_ids (Hash)
    #     * :eu_vat (String) 
    #     * :fr_siret (String) 
    #     * :fr_naf (String) 
    #     * :es_nif (String) 
    #     * :jp_qii (String) 
    # @param request_options [SquareApiClient::RequestOptions] 
    # @return [SquareApiClient::CreateLocationResponse]
    # @example
#  api = SquareApiClient::Client.new(
#    base_url: "https://api.example.com",
#    environment: SquareApiClient::Environment::PRODUCTION,
#    token: "YOUR_AUTH_TOKEN",
#    version: "Version"
#  )
#  api.locations.create(location: { name: "Midtown", address: { address_line_1: "1234 Peachtree St. NE", locality: "Atlanta", administrative_district_level_1: "GA", postal_code: "30309" }, description: "Midtown Atlanta store" })
    def create(location: nil, request_options: nil)
      response = @request_client.conn.post do | req |
  unless request_options&.timeout_in_seconds.nil?
    req.options.timeout = request_options.timeout_in_seconds
  end
  unless request_options&.token.nil?
    req.headers["Authorization"] = request_options.token
  end
  unless request_options&.version.nil?
    req.headers["Square-Version"] = request_options.version
  end
  req.headers = { **(req.headers || {}), **@request_client.get_headers, **(request_options&.additional_headers || {}) }.compact
  unless request_options.nil? || request_options&.additional_query_parameters.nil?
    req.params = { **(request_options&.additional_query_parameters || {}) }.compact
  end
  req.body = { **(request_options&.additional_body_parameters || {}), location: location }.compact
  req.url "#{@request_client.get_url(request_options: request_options)}/v2/locations"
end
      SquareApiClient::CreateLocationResponse.from_json(json_object: response.body)
    end
# Retrieves details of a single location. Specify "main"
#  as the location ID to retrieve details of the [main
#  ion](https://developer.squareup.com/docs/locations-api#about-the-main-location).
    #
    # @param location_id [String] The ID of the location to retrieve. Specify the string
#  "main" to return the main location.
    # @param request_options [SquareApiClient::RequestOptions] 
    # @return [SquareApiClient::GetLocationResponse]
    # @example
#  api = SquareApiClient::Client.new(
#    base_url: "https://api.example.com",
#    environment: SquareApiClient::Environment::PRODUCTION,
#    token: "YOUR_AUTH_TOKEN",
#    version: "Version"
#  )
#  api.locations.get(location_id: "location_id")
    def get(location_id:, request_options: nil)
      response = @request_client.conn.get do | req |
  unless request_options&.timeout_in_seconds.nil?
    req.options.timeout = request_options.timeout_in_seconds
  end
  unless request_options&.token.nil?
    req.headers["Authorization"] = request_options.token
  end
  unless request_options&.version.nil?
    req.headers["Square-Version"] = request_options.version
  end
  req.headers = { **(req.headers || {}), **@request_client.get_headers, **(request_options&.additional_headers || {}) }.compact
  unless request_options.nil? || request_options&.additional_query_parameters.nil?
    req.params = { **(request_options&.additional_query_parameters || {}) }.compact
  end
  unless request_options.nil? || request_options&.additional_body_parameters.nil?
    req.body = { **(request_options&.additional_body_parameters || {}) }.compact
  end
  req.url "#{@request_client.get_url(request_options: request_options)}/v2/locations/#{location_id}"
end
      SquareApiClient::GetLocationResponse.from_json(json_object: response.body)
    end
# Updates a [location](https://developer.squareup.com/docs/locations-api).
    #
    # @param location_id [String] The ID of the location to update.
    # @param location [Hash] The `Location` object with only the fields to update.Request of type SquareApiClient::Location, as a Hash
    #   * :id (String) 
    #   * :name (String) 
    #   * :address (Hash)
    #     * :address_line_1 (String) 
    #     * :address_line_2 (String) 
    #     * :address_line_3 (String) 
    #     * :locality (String) 
    #     * :sublocality (String) 
    #     * :sublocality_2 (String) 
    #     * :sublocality_3 (String) 
    #     * :administrative_district_level_1 (String) 
    #     * :administrative_district_level_2 (String) 
    #     * :administrative_district_level_3 (String) 
    #     * :postal_code (String) 
    #     * :country (SquareApiClient::Country) 
    #     * :first_name (String) 
    #     * :last_name (String) 
    #   * :timezone (String) 
    #   * :capabilities (Array<SquareApiClient::LocationCapability>) 
    #   * :status (SquareApiClient::LocationStatus) 
    #   * :created_at (String) 
    #   * :merchant_id (String) 
    #   * :country (SquareApiClient::Country) 
    #   * :language_code (String) 
    #   * :currency (SquareApiClient::Currency) 
    #   * :phone_number (String) 
    #   * :business_name (String) 
    #   * :type (SquareApiClient::LocationType) 
    #   * :website_url (String) 
    #   * :business_hours (Hash)
    #     * :periods (Array<SquareApiClient::BusinessHoursPeriod>) 
    #   * :business_email (String) 
    #   * :description (String) 
    #   * :twitter_username (String) 
    #   * :instagram_username (String) 
    #   * :facebook_url (String) 
    #   * :coordinates (Hash)
    #     * :latitude (Float) 
    #     * :longitude (Float) 
    #   * :logo_url (String) 
    #   * :pos_background_url (String) 
    #   * :mcc (String) 
    #   * :full_format_logo_url (String) 
    #   * :tax_ids (Hash)
    #     * :eu_vat (String) 
    #     * :fr_siret (String) 
    #     * :fr_naf (String) 
    #     * :es_nif (String) 
    #     * :jp_qii (String) 
    # @param request_options [SquareApiClient::RequestOptions] 
    # @return [SquareApiClient::UpdateLocationResponse]
    # @example
#  api = SquareApiClient::Client.new(
#    base_url: "https://api.example.com",
#    environment: SquareApiClient::Environment::PRODUCTION,
#    token: "YOUR_AUTH_TOKEN",
#    version: "Version"
#  )
#  api.locations.update(location_id: "location_id", location: { business_hours: { periods: [{ day_of_week: FRI, start_local_time: "07:00", end_local_time: "18:00" }, { day_of_week: SAT, start_local_time: "07:00", end_local_time: "18:00" }, { day_of_week: SUN, start_local_time: "09:00", end_local_time: "15:00" }] }, description: "Midtown Atlanta store - Open weekends" })
    def update(location_id:, location: nil, request_options: nil)
      response = @request_client.conn.put do | req |
  unless request_options&.timeout_in_seconds.nil?
    req.options.timeout = request_options.timeout_in_seconds
  end
  unless request_options&.token.nil?
    req.headers["Authorization"] = request_options.token
  end
  unless request_options&.version.nil?
    req.headers["Square-Version"] = request_options.version
  end
  req.headers = { **(req.headers || {}), **@request_client.get_headers, **(request_options&.additional_headers || {}) }.compact
  unless request_options.nil? || request_options&.additional_query_parameters.nil?
    req.params = { **(request_options&.additional_query_parameters || {}) }.compact
  end
  req.body = { **(request_options&.additional_body_parameters || {}), location: location }.compact
  req.url "#{@request_client.get_url(request_options: request_options)}/v2/locations/#{location_id}"
end
      SquareApiClient::UpdateLocationResponse.from_json(json_object: response.body)
    end
# Links a `checkoutId` to a `checkout_page_url` that customers are
#  directed to in order to provide their payment information using a
#  payment processing workflow hosted on connect.squareup.com.
#  NOTE: The Checkout API has been updated with new features.
#  For more information, see [Checkout API
#  ghts](https://developer.squareup.com/docs/checkout-api#checkout-api-highlights).
    #
    # @param location_id [String] The ID of the business location to associate the checkout with.
    # @param idempotency_key [String] A unique string that identifies this checkout among others you have created. It
#  can be
#  any valid string but must be unique for every order sent to Square Checkout for
#  a given location ID.
#  The idempotency key is used to avoid processing the same order more than once.
#  If you are
#  unsure whether a particular checkout was created successfully, you can attempt
#  it again with
#  the same idempotency key and all the same other parameters without worrying
#  about creating duplicates.
#  You should use a random number/string generator native to the language
#  you are working in to generate strings for your idempotency keys.
#  For more information, see
#  Idempotency](https://developer.squareup.com/docs/working-with-apis/idempotency).
    # @param order [Hash] The order including line items to be checked out.Request of type SquareApiClient::CreateOrderRequest, as a Hash
    #   * :order (Hash)
    #     * :id (String) 
    #     * :location_id (String) 
    #     * :reference_id (String) 
    #     * :source (Hash)
    #       * :name (String) 
    #     * :customer_id (String) 
    #     * :line_items (Array<SquareApiClient::OrderLineItem>) 
    #     * :taxes (Array<SquareApiClient::OrderLineItemTax>) 
    #     * :discounts (Array<SquareApiClient::OrderLineItemDiscount>) 
    #     * :service_charges (Array<SquareApiClient::OrderServiceCharge>) 
    #     * :fulfillments (Array<SquareApiClient::Fulfillment>) 
    #     * :returns (Array<SquareApiClient::OrderReturn>) 
    #     * :return_amounts (Hash)
    #       * :total_money (Hash)
    #         * :amount (Long) 
    #         * :currency (SquareApiClient::Currency) 
    #       * :tax_money (Hash)
    #         * :amount (Long) 
    #         * :currency (SquareApiClient::Currency) 
    #       * :discount_money (Hash)
    #         * :amount (Long) 
    #         * :currency (SquareApiClient::Currency) 
    #       * :tip_money (Hash)
    #         * :amount (Long) 
    #         * :currency (SquareApiClient::Currency) 
    #       * :service_charge_money (Hash)
    #         * :amount (Long) 
    #         * :currency (SquareApiClient::Currency) 
    #     * :net_amounts (Hash)
    #       * :total_money (Hash)
    #         * :amount (Long) 
    #         * :currency (SquareApiClient::Currency) 
    #       * :tax_money (Hash)
    #         * :amount (Long) 
    #         * :currency (SquareApiClient::Currency) 
    #       * :discount_money (Hash)
    #         * :amount (Long) 
    #         * :currency (SquareApiClient::Currency) 
    #       * :tip_money (Hash)
    #         * :amount (Long) 
    #         * :currency (SquareApiClient::Currency) 
    #       * :service_charge_money (Hash)
    #         * :amount (Long) 
    #         * :currency (SquareApiClient::Currency) 
    #     * :rounding_adjustment (Hash)
    #       * :uid (String) 
    #       * :name (String) 
    #       * :amount_money (Hash)
    #         * :amount (Long) 
    #         * :currency (SquareApiClient::Currency) 
    #     * :tenders (Array<SquareApiClient::Tender>) 
    #     * :refunds (Array<SquareApiClient::Refund>) 
    #     * :metadata (Hash{String => String}) 
    #     * :created_at (String) 
    #     * :updated_at (String) 
    #     * :closed_at (String) 
    #     * :state (SquareApiClient::OrderState) 
    #     * :version (Integer) 
    #     * :total_money (Hash)
    #       * :amount (Long) 
    #       * :currency (SquareApiClient::Currency) 
    #     * :total_tax_money (Hash)
    #       * :amount (Long) 
    #       * :currency (SquareApiClient::Currency) 
    #     * :total_discount_money (Hash)
    #       * :amount (Long) 
    #       * :currency (SquareApiClient::Currency) 
    #     * :total_tip_money (Hash)
    #       * :amount (Long) 
    #       * :currency (SquareApiClient::Currency) 
    #     * :total_service_charge_money (Hash)
    #       * :amount (Long) 
    #       * :currency (SquareApiClient::Currency) 
    #     * :ticket_name (String) 
    #     * :pricing_options (Hash)
    #       * :auto_apply_discounts (Boolean) 
    #       * :auto_apply_taxes (Boolean) 
    #     * :rewards (Array<SquareApiClient::OrderReward>) 
    #     * :net_amount_due_money (Hash)
    #       * :amount (Long) 
    #       * :currency (SquareApiClient::Currency) 
    #   * :idempotency_key (String) 
    # @param ask_for_shipping_address [Boolean] If `true`, Square Checkout collects shipping information on your behalf and
#  stores
#  that information with the transaction information in the Square Seller
#  Dashboard.
#  Default: `false`.
    # @param merchant_support_email [String] The email address to display on the Square Checkout confirmation page
#  and confirmation email that the buyer can use to contact the seller.
#  If this value is not set, the confirmation page and email display the
#  primary email address associated with the seller's Square account.
#  Default: none; only exists if explicitly set.
    # @param pre_populate_buyer_email [String] If provided, the buyer's email is prepopulated on the checkout page
#  as an editable text field.
#  Default: none; only exists if explicitly set.
    # @param pre_populate_shipping_address [Hash] If provided, the buyer's shipping information is prepopulated on the
#  checkout page as editable text fields.
#  Default: none; only exists if explicitly set.Request of type SquareApiClient::Address, as a Hash
    #   * :address_line_1 (String) 
    #   * :address_line_2 (String) 
    #   * :address_line_3 (String) 
    #   * :locality (String) 
    #   * :sublocality (String) 
    #   * :sublocality_2 (String) 
    #   * :sublocality_3 (String) 
    #   * :administrative_district_level_1 (String) 
    #   * :administrative_district_level_2 (String) 
    #   * :administrative_district_level_3 (String) 
    #   * :postal_code (String) 
    #   * :country (SquareApiClient::Country) 
    #   * :first_name (String) 
    #   * :last_name (String) 
    # @param redirect_url [String] The URL to redirect to after the checkout is completed with `checkoutId`,
#  `transactionId`, and `referenceId` appended as URL parameters. For example,
#  if the provided redirect URL is `http://www.example.com/order-complete`, a
#  successful transaction redirects the customer to:
#  rder-complete?checkoutId=xxxxxx&amp;referenceId=xxxxxx&amp;transactionId=xxxxxx`
#  If you do not provide a redirect URL, Square Checkout displays an order
#  confirmation page on your behalf; however, it is strongly recommended that
#  you provide a redirect URL so you can verify the transaction results and
#  finalize the order through your existing/normal confirmation workflow.
#  Default: none; only exists if explicitly set.
    # @param additional_recipients [Array<Hash>] The basic primitive of a multi-party transaction. The value is optional.
#  The transaction facilitated by you can be split from here.
#  If you provide this value, the `amount_money` value in your
#  `additional_recipients` field
#  cannot be more than 90% of the `total_money` calculated by Square for your
#  order.
#  The `location_id` must be a valid seller location where the checkout is
#  occurring.
#  This field requires `PAYMENTS_WRITE_ADDITIONAL_RECIPIENTS` OAuth permission.
#  This field is currently not supported in the Square Sandbox.Request of type Array<SquareApiClient::ChargeRequestAdditionalRecipient>, as a Hash
    #   * :location_id (String) 
    #   * :description (String) 
    #   * :amount_money (Hash)
    #     * :amount (Long) 
    #     * :currency (SquareApiClient::Currency) 
    # @param note [String] An optional note to associate with the `checkout` object.
#  This value cannot exceed 60 characters.
    # @param request_options [SquareApiClient::RequestOptions] 
    # @return [SquareApiClient::CreateCheckoutResponse]
    # @example
#  api = SquareApiClient::Client.new(
#    base_url: "https://api.example.com",
#    environment: SquareApiClient::Environment::PRODUCTION,
#    token: "YOUR_AUTH_TOKEN",
#    version: "Version"
#  )
#  api.locations.checkouts(
#    location_id: "location_id",
#    idempotency_key: "86ae1696-b1e3-4328-af6d-f1e04d947ad6",
#    order: { order: { location_id: "location_id", reference_id: "reference_id", customer_id: "customer_id", line_items: [{ name: "Printed T Shirt", quantity: "2", applied_taxes: [{ tax_uid: "38ze1696-z1e3-5628-af6d-f1e04d947fg3" }], applied_discounts: [{ discount_uid: "56ae1696-z1e3-9328-af6d-f1e04d947gd4" }], base_price_money: { amount: 1500, currency: USD } }, { name: "Slim Jeans", quantity: "1", base_price_money: { amount: 2500, currency: USD } }, { name: "Woven Sweater", quantity: "3", base_price_money: { amount: 3500, currency: USD } }], taxes: [{ uid: "38ze1696-z1e3-5628-af6d-f1e04d947fg3", type: INCLUSIVE, percentage: "7.75", scope: LINE_ITEM }], discounts: [{ uid: "56ae1696-z1e3-9328-af6d-f1e04d947gd4", type: FIXED_AMOUNT, amount_money: { amount: 100, currency: USD }, scope: LINE_ITEM }] }, idempotency_key: "12ae1696-z1e3-4328-af6d-f1e04d947gd4" },
#    ask_for_shipping_address: true,
#    merchant_support_email: "merchant+support@website.com",
#    pre_populate_buyer_email: "example@email.com",
#    pre_populate_shipping_address: { address_line_1: "1455 Market St.", address_line_2: "Suite 600", locality: "San Francisco", administrative_district_level_1: "CA", postal_code: "94103", country: US, first_name: "Jane", last_name: "Doe" },
#    redirect_url: "https://merchant.website.com/order-confirm",
#    additional_recipients: [{ location_id: "057P5VYJ4A5X1", description: "Application fees", amount_money: { amount: 60, currency: USD } }]
#  )
    def checkouts(location_id:, idempotency_key:, order:, ask_for_shipping_address: nil, merchant_support_email: nil, pre_populate_buyer_email: nil, pre_populate_shipping_address: nil, redirect_url: nil, additional_recipients: nil, note: nil, request_options: nil)
      response = @request_client.conn.post do | req |
  unless request_options&.timeout_in_seconds.nil?
    req.options.timeout = request_options.timeout_in_seconds
  end
  unless request_options&.token.nil?
    req.headers["Authorization"] = request_options.token
  end
  unless request_options&.version.nil?
    req.headers["Square-Version"] = request_options.version
  end
  req.headers = { **(req.headers || {}), **@request_client.get_headers, **(request_options&.additional_headers || {}) }.compact
  unless request_options.nil? || request_options&.additional_query_parameters.nil?
    req.params = { **(request_options&.additional_query_parameters || {}) }.compact
  end
  req.body = { **(request_options&.additional_body_parameters || {}), idempotency_key: idempotency_key, order: order, ask_for_shipping_address: ask_for_shipping_address, merchant_support_email: merchant_support_email, pre_populate_buyer_email: pre_populate_buyer_email, pre_populate_shipping_address: pre_populate_shipping_address, redirect_url: redirect_url, additional_recipients: additional_recipients, note: note }.compact
  req.url "#{@request_client.get_url(request_options: request_options)}/v2/locations/#{location_id}/checkouts"
end
      SquareApiClient::CreateCheckoutResponse.from_json(json_object: response.body)
    end
  end
  class AsyncLocationsClient
  # @return [SquareApiClient::AsyncRequestClient] 
    attr_reader :request_client
  # @return [SquareApiClient::Locations::CustomAttributeDefinitionsClient] 
    attr_reader :custom_attribute_definitions
  # @return [SquareApiClient::Locations::CustomAttributesClient] 
    attr_reader :custom_attributes
  # @return [SquareApiClient::Locations::TransactionsClient] 
    attr_reader :transactions


    # @param request_client [SquareApiClient::RequestClient] 
    # @return [SquareApiClient::AsyncLocationsClient]
    def initialize(request_client:)
      @request_client = request_client
      @custom_attribute_definitions = SquareApiClient::Locations::AsyncCustomAttributeDefinitionsClient.new(request_client: request_client)
      @custom_attributes = SquareApiClient::Locations::AsyncCustomAttributesClient.new(request_client: request_client)
      @transactions = SquareApiClient::Locations::AsyncTransactionsClient.new(request_client: request_client)
    end
# Provides details about all of the seller's
#  [locations](https://developer.squareup.com/docs/locations-api),
#  including those with an inactive status. Locations are listed alphabetically by
#  `name`.
    #
    # @param request_options [SquareApiClient::RequestOptions] 
    # @return [SquareApiClient::ListLocationsResponse]
    # @example
#  api = SquareApiClient::Client.new(
#    base_url: "https://api.example.com",
#    environment: SquareApiClient::Environment::PRODUCTION,
#    token: "YOUR_AUTH_TOKEN",
#    version: "Version"
#  )
#  api.locations.list
    def list(request_options: nil)
      Async do
        response = @request_client.conn.get do | req |
  unless request_options&.timeout_in_seconds.nil?
    req.options.timeout = request_options.timeout_in_seconds
  end
  unless request_options&.token.nil?
    req.headers["Authorization"] = request_options.token
  end
  unless request_options&.version.nil?
    req.headers["Square-Version"] = request_options.version
  end
  req.headers = { **(req.headers || {}), **@request_client.get_headers, **(request_options&.additional_headers || {}) }.compact
  unless request_options.nil? || request_options&.additional_query_parameters.nil?
    req.params = { **(request_options&.additional_query_parameters || {}) }.compact
  end
  unless request_options.nil? || request_options&.additional_body_parameters.nil?
    req.body = { **(request_options&.additional_body_parameters || {}) }.compact
  end
  req.url "#{@request_client.get_url(request_options: request_options)}/v2/locations"
end
        SquareApiClient::ListLocationsResponse.from_json(json_object: response.body)
      end
    end
# Creates a [location](https://developer.squareup.com/docs/locations-api).
#  Creating new locations allows for separate configuration of receipt layouts,
#  item prices,
#  and sales reports. Developers can use locations to separate sales activity
#  through applications
#  that integrate with Square from sales activity elsewhere in a seller's account.
#  Locations created programmatically with the Locations API last forever and
#  are visible to the seller for their own management. Therefore, ensure that
#  each location has a sensible and unique name.
    #
    # @param location [Hash] The initial values of the location being created. The `name` field is required
#  and must be unique within a seller account.
#  All other fields are optional, but any information you care about for the
#  location should be included.
#  The remaining fields are automatically added based on the data from the [main
#  ion](https://developer.squareup.com/docs/locations-api#about-the-main-location).Request of type SquareApiClient::Location, as a Hash
    #   * :id (String) 
    #   * :name (String) 
    #   * :address (Hash)
    #     * :address_line_1 (String) 
    #     * :address_line_2 (String) 
    #     * :address_line_3 (String) 
    #     * :locality (String) 
    #     * :sublocality (String) 
    #     * :sublocality_2 (String) 
    #     * :sublocality_3 (String) 
    #     * :administrative_district_level_1 (String) 
    #     * :administrative_district_level_2 (String) 
    #     * :administrative_district_level_3 (String) 
    #     * :postal_code (String) 
    #     * :country (SquareApiClient::Country) 
    #     * :first_name (String) 
    #     * :last_name (String) 
    #   * :timezone (String) 
    #   * :capabilities (Array<SquareApiClient::LocationCapability>) 
    #   * :status (SquareApiClient::LocationStatus) 
    #   * :created_at (String) 
    #   * :merchant_id (String) 
    #   * :country (SquareApiClient::Country) 
    #   * :language_code (String) 
    #   * :currency (SquareApiClient::Currency) 
    #   * :phone_number (String) 
    #   * :business_name (String) 
    #   * :type (SquareApiClient::LocationType) 
    #   * :website_url (String) 
    #   * :business_hours (Hash)
    #     * :periods (Array<SquareApiClient::BusinessHoursPeriod>) 
    #   * :business_email (String) 
    #   * :description (String) 
    #   * :twitter_username (String) 
    #   * :instagram_username (String) 
    #   * :facebook_url (String) 
    #   * :coordinates (Hash)
    #     * :latitude (Float) 
    #     * :longitude (Float) 
    #   * :logo_url (String) 
    #   * :pos_background_url (String) 
    #   * :mcc (String) 
    #   * :full_format_logo_url (String) 
    #   * :tax_ids (Hash)
    #     * :eu_vat (String) 
    #     * :fr_siret (String) 
    #     * :fr_naf (String) 
    #     * :es_nif (String) 
    #     * :jp_qii (String) 
    # @param request_options [SquareApiClient::RequestOptions] 
    # @return [SquareApiClient::CreateLocationResponse]
    # @example
#  api = SquareApiClient::Client.new(
#    base_url: "https://api.example.com",
#    environment: SquareApiClient::Environment::PRODUCTION,
#    token: "YOUR_AUTH_TOKEN",
#    version: "Version"
#  )
#  api.locations.create(location: { name: "Midtown", address: { address_line_1: "1234 Peachtree St. NE", locality: "Atlanta", administrative_district_level_1: "GA", postal_code: "30309" }, description: "Midtown Atlanta store" })
    def create(location: nil, request_options: nil)
      Async do
        response = @request_client.conn.post do | req |
  unless request_options&.timeout_in_seconds.nil?
    req.options.timeout = request_options.timeout_in_seconds
  end
  unless request_options&.token.nil?
    req.headers["Authorization"] = request_options.token
  end
  unless request_options&.version.nil?
    req.headers["Square-Version"] = request_options.version
  end
  req.headers = { **(req.headers || {}), **@request_client.get_headers, **(request_options&.additional_headers || {}) }.compact
  unless request_options.nil? || request_options&.additional_query_parameters.nil?
    req.params = { **(request_options&.additional_query_parameters || {}) }.compact
  end
  req.body = { **(request_options&.additional_body_parameters || {}), location: location }.compact
  req.url "#{@request_client.get_url(request_options: request_options)}/v2/locations"
end
        SquareApiClient::CreateLocationResponse.from_json(json_object: response.body)
      end
    end
# Retrieves details of a single location. Specify "main"
#  as the location ID to retrieve details of the [main
#  ion](https://developer.squareup.com/docs/locations-api#about-the-main-location).
    #
    # @param location_id [String] The ID of the location to retrieve. Specify the string
#  "main" to return the main location.
    # @param request_options [SquareApiClient::RequestOptions] 
    # @return [SquareApiClient::GetLocationResponse]
    # @example
#  api = SquareApiClient::Client.new(
#    base_url: "https://api.example.com",
#    environment: SquareApiClient::Environment::PRODUCTION,
#    token: "YOUR_AUTH_TOKEN",
#    version: "Version"
#  )
#  api.locations.get(location_id: "location_id")
    def get(location_id:, request_options: nil)
      Async do
        response = @request_client.conn.get do | req |
  unless request_options&.timeout_in_seconds.nil?
    req.options.timeout = request_options.timeout_in_seconds
  end
  unless request_options&.token.nil?
    req.headers["Authorization"] = request_options.token
  end
  unless request_options&.version.nil?
    req.headers["Square-Version"] = request_options.version
  end
  req.headers = { **(req.headers || {}), **@request_client.get_headers, **(request_options&.additional_headers || {}) }.compact
  unless request_options.nil? || request_options&.additional_query_parameters.nil?
    req.params = { **(request_options&.additional_query_parameters || {}) }.compact
  end
  unless request_options.nil? || request_options&.additional_body_parameters.nil?
    req.body = { **(request_options&.additional_body_parameters || {}) }.compact
  end
  req.url "#{@request_client.get_url(request_options: request_options)}/v2/locations/#{location_id}"
end
        SquareApiClient::GetLocationResponse.from_json(json_object: response.body)
      end
    end
# Updates a [location](https://developer.squareup.com/docs/locations-api).
    #
    # @param location_id [String] The ID of the location to update.
    # @param location [Hash] The `Location` object with only the fields to update.Request of type SquareApiClient::Location, as a Hash
    #   * :id (String) 
    #   * :name (String) 
    #   * :address (Hash)
    #     * :address_line_1 (String) 
    #     * :address_line_2 (String) 
    #     * :address_line_3 (String) 
    #     * :locality (String) 
    #     * :sublocality (String) 
    #     * :sublocality_2 (String) 
    #     * :sublocality_3 (String) 
    #     * :administrative_district_level_1 (String) 
    #     * :administrative_district_level_2 (String) 
    #     * :administrative_district_level_3 (String) 
    #     * :postal_code (String) 
    #     * :country (SquareApiClient::Country) 
    #     * :first_name (String) 
    #     * :last_name (String) 
    #   * :timezone (String) 
    #   * :capabilities (Array<SquareApiClient::LocationCapability>) 
    #   * :status (SquareApiClient::LocationStatus) 
    #   * :created_at (String) 
    #   * :merchant_id (String) 
    #   * :country (SquareApiClient::Country) 
    #   * :language_code (String) 
    #   * :currency (SquareApiClient::Currency) 
    #   * :phone_number (String) 
    #   * :business_name (String) 
    #   * :type (SquareApiClient::LocationType) 
    #   * :website_url (String) 
    #   * :business_hours (Hash)
    #     * :periods (Array<SquareApiClient::BusinessHoursPeriod>) 
    #   * :business_email (String) 
    #   * :description (String) 
    #   * :twitter_username (String) 
    #   * :instagram_username (String) 
    #   * :facebook_url (String) 
    #   * :coordinates (Hash)
    #     * :latitude (Float) 
    #     * :longitude (Float) 
    #   * :logo_url (String) 
    #   * :pos_background_url (String) 
    #   * :mcc (String) 
    #   * :full_format_logo_url (String) 
    #   * :tax_ids (Hash)
    #     * :eu_vat (String) 
    #     * :fr_siret (String) 
    #     * :fr_naf (String) 
    #     * :es_nif (String) 
    #     * :jp_qii (String) 
    # @param request_options [SquareApiClient::RequestOptions] 
    # @return [SquareApiClient::UpdateLocationResponse]
    # @example
#  api = SquareApiClient::Client.new(
#    base_url: "https://api.example.com",
#    environment: SquareApiClient::Environment::PRODUCTION,
#    token: "YOUR_AUTH_TOKEN",
#    version: "Version"
#  )
#  api.locations.update(location_id: "location_id", location: { business_hours: { periods: [{ day_of_week: FRI, start_local_time: "07:00", end_local_time: "18:00" }, { day_of_week: SAT, start_local_time: "07:00", end_local_time: "18:00" }, { day_of_week: SUN, start_local_time: "09:00", end_local_time: "15:00" }] }, description: "Midtown Atlanta store - Open weekends" })
    def update(location_id:, location: nil, request_options: nil)
      Async do
        response = @request_client.conn.put do | req |
  unless request_options&.timeout_in_seconds.nil?
    req.options.timeout = request_options.timeout_in_seconds
  end
  unless request_options&.token.nil?
    req.headers["Authorization"] = request_options.token
  end
  unless request_options&.version.nil?
    req.headers["Square-Version"] = request_options.version
  end
  req.headers = { **(req.headers || {}), **@request_client.get_headers, **(request_options&.additional_headers || {}) }.compact
  unless request_options.nil? || request_options&.additional_query_parameters.nil?
    req.params = { **(request_options&.additional_query_parameters || {}) }.compact
  end
  req.body = { **(request_options&.additional_body_parameters || {}), location: location }.compact
  req.url "#{@request_client.get_url(request_options: request_options)}/v2/locations/#{location_id}"
end
        SquareApiClient::UpdateLocationResponse.from_json(json_object: response.body)
      end
    end
# Links a `checkoutId` to a `checkout_page_url` that customers are
#  directed to in order to provide their payment information using a
#  payment processing workflow hosted on connect.squareup.com.
#  NOTE: The Checkout API has been updated with new features.
#  For more information, see [Checkout API
#  ghts](https://developer.squareup.com/docs/checkout-api#checkout-api-highlights).
    #
    # @param location_id [String] The ID of the business location to associate the checkout with.
    # @param idempotency_key [String] A unique string that identifies this checkout among others you have created. It
#  can be
#  any valid string but must be unique for every order sent to Square Checkout for
#  a given location ID.
#  The idempotency key is used to avoid processing the same order more than once.
#  If you are
#  unsure whether a particular checkout was created successfully, you can attempt
#  it again with
#  the same idempotency key and all the same other parameters without worrying
#  about creating duplicates.
#  You should use a random number/string generator native to the language
#  you are working in to generate strings for your idempotency keys.
#  For more information, see
#  Idempotency](https://developer.squareup.com/docs/working-with-apis/idempotency).
    # @param order [Hash] The order including line items to be checked out.Request of type SquareApiClient::CreateOrderRequest, as a Hash
    #   * :order (Hash)
    #     * :id (String) 
    #     * :location_id (String) 
    #     * :reference_id (String) 
    #     * :source (Hash)
    #       * :name (String) 
    #     * :customer_id (String) 
    #     * :line_items (Array<SquareApiClient::OrderLineItem>) 
    #     * :taxes (Array<SquareApiClient::OrderLineItemTax>) 
    #     * :discounts (Array<SquareApiClient::OrderLineItemDiscount>) 
    #     * :service_charges (Array<SquareApiClient::OrderServiceCharge>) 
    #     * :fulfillments (Array<SquareApiClient::Fulfillment>) 
    #     * :returns (Array<SquareApiClient::OrderReturn>) 
    #     * :return_amounts (Hash)
    #       * :total_money (Hash)
    #         * :amount (Long) 
    #         * :currency (SquareApiClient::Currency) 
    #       * :tax_money (Hash)
    #         * :amount (Long) 
    #         * :currency (SquareApiClient::Currency) 
    #       * :discount_money (Hash)
    #         * :amount (Long) 
    #         * :currency (SquareApiClient::Currency) 
    #       * :tip_money (Hash)
    #         * :amount (Long) 
    #         * :currency (SquareApiClient::Currency) 
    #       * :service_charge_money (Hash)
    #         * :amount (Long) 
    #         * :currency (SquareApiClient::Currency) 
    #     * :net_amounts (Hash)
    #       * :total_money (Hash)
    #         * :amount (Long) 
    #         * :currency (SquareApiClient::Currency) 
    #       * :tax_money (Hash)
    #         * :amount (Long) 
    #         * :currency (SquareApiClient::Currency) 
    #       * :discount_money (Hash)
    #         * :amount (Long) 
    #         * :currency (SquareApiClient::Currency) 
    #       * :tip_money (Hash)
    #         * :amount (Long) 
    #         * :currency (SquareApiClient::Currency) 
    #       * :service_charge_money (Hash)
    #         * :amount (Long) 
    #         * :currency (SquareApiClient::Currency) 
    #     * :rounding_adjustment (Hash)
    #       * :uid (String) 
    #       * :name (String) 
    #       * :amount_money (Hash)
    #         * :amount (Long) 
    #         * :currency (SquareApiClient::Currency) 
    #     * :tenders (Array<SquareApiClient::Tender>) 
    #     * :refunds (Array<SquareApiClient::Refund>) 
    #     * :metadata (Hash{String => String}) 
    #     * :created_at (String) 
    #     * :updated_at (String) 
    #     * :closed_at (String) 
    #     * :state (SquareApiClient::OrderState) 
    #     * :version (Integer) 
    #     * :total_money (Hash)
    #       * :amount (Long) 
    #       * :currency (SquareApiClient::Currency) 
    #     * :total_tax_money (Hash)
    #       * :amount (Long) 
    #       * :currency (SquareApiClient::Currency) 
    #     * :total_discount_money (Hash)
    #       * :amount (Long) 
    #       * :currency (SquareApiClient::Currency) 
    #     * :total_tip_money (Hash)
    #       * :amount (Long) 
    #       * :currency (SquareApiClient::Currency) 
    #     * :total_service_charge_money (Hash)
    #       * :amount (Long) 
    #       * :currency (SquareApiClient::Currency) 
    #     * :ticket_name (String) 
    #     * :pricing_options (Hash)
    #       * :auto_apply_discounts (Boolean) 
    #       * :auto_apply_taxes (Boolean) 
    #     * :rewards (Array<SquareApiClient::OrderReward>) 
    #     * :net_amount_due_money (Hash)
    #       * :amount (Long) 
    #       * :currency (SquareApiClient::Currency) 
    #   * :idempotency_key (String) 
    # @param ask_for_shipping_address [Boolean] If `true`, Square Checkout collects shipping information on your behalf and
#  stores
#  that information with the transaction information in the Square Seller
#  Dashboard.
#  Default: `false`.
    # @param merchant_support_email [String] The email address to display on the Square Checkout confirmation page
#  and confirmation email that the buyer can use to contact the seller.
#  If this value is not set, the confirmation page and email display the
#  primary email address associated with the seller's Square account.
#  Default: none; only exists if explicitly set.
    # @param pre_populate_buyer_email [String] If provided, the buyer's email is prepopulated on the checkout page
#  as an editable text field.
#  Default: none; only exists if explicitly set.
    # @param pre_populate_shipping_address [Hash] If provided, the buyer's shipping information is prepopulated on the
#  checkout page as editable text fields.
#  Default: none; only exists if explicitly set.Request of type SquareApiClient::Address, as a Hash
    #   * :address_line_1 (String) 
    #   * :address_line_2 (String) 
    #   * :address_line_3 (String) 
    #   * :locality (String) 
    #   * :sublocality (String) 
    #   * :sublocality_2 (String) 
    #   * :sublocality_3 (String) 
    #   * :administrative_district_level_1 (String) 
    #   * :administrative_district_level_2 (String) 
    #   * :administrative_district_level_3 (String) 
    #   * :postal_code (String) 
    #   * :country (SquareApiClient::Country) 
    #   * :first_name (String) 
    #   * :last_name (String) 
    # @param redirect_url [String] The URL to redirect to after the checkout is completed with `checkoutId`,
#  `transactionId`, and `referenceId` appended as URL parameters. For example,
#  if the provided redirect URL is `http://www.example.com/order-complete`, a
#  successful transaction redirects the customer to:
#  rder-complete?checkoutId=xxxxxx&amp;referenceId=xxxxxx&amp;transactionId=xxxxxx`
#  If you do not provide a redirect URL, Square Checkout displays an order
#  confirmation page on your behalf; however, it is strongly recommended that
#  you provide a redirect URL so you can verify the transaction results and
#  finalize the order through your existing/normal confirmation workflow.
#  Default: none; only exists if explicitly set.
    # @param additional_recipients [Array<Hash>] The basic primitive of a multi-party transaction. The value is optional.
#  The transaction facilitated by you can be split from here.
#  If you provide this value, the `amount_money` value in your
#  `additional_recipients` field
#  cannot be more than 90% of the `total_money` calculated by Square for your
#  order.
#  The `location_id` must be a valid seller location where the checkout is
#  occurring.
#  This field requires `PAYMENTS_WRITE_ADDITIONAL_RECIPIENTS` OAuth permission.
#  This field is currently not supported in the Square Sandbox.Request of type Array<SquareApiClient::ChargeRequestAdditionalRecipient>, as a Hash
    #   * :location_id (String) 
    #   * :description (String) 
    #   * :amount_money (Hash)
    #     * :amount (Long) 
    #     * :currency (SquareApiClient::Currency) 
    # @param note [String] An optional note to associate with the `checkout` object.
#  This value cannot exceed 60 characters.
    # @param request_options [SquareApiClient::RequestOptions] 
    # @return [SquareApiClient::CreateCheckoutResponse]
    # @example
#  api = SquareApiClient::Client.new(
#    base_url: "https://api.example.com",
#    environment: SquareApiClient::Environment::PRODUCTION,
#    token: "YOUR_AUTH_TOKEN",
#    version: "Version"
#  )
#  api.locations.checkouts(
#    location_id: "location_id",
#    idempotency_key: "86ae1696-b1e3-4328-af6d-f1e04d947ad6",
#    order: { order: { location_id: "location_id", reference_id: "reference_id", customer_id: "customer_id", line_items: [{ name: "Printed T Shirt", quantity: "2", applied_taxes: [{ tax_uid: "38ze1696-z1e3-5628-af6d-f1e04d947fg3" }], applied_discounts: [{ discount_uid: "56ae1696-z1e3-9328-af6d-f1e04d947gd4" }], base_price_money: { amount: 1500, currency: USD } }, { name: "Slim Jeans", quantity: "1", base_price_money: { amount: 2500, currency: USD } }, { name: "Woven Sweater", quantity: "3", base_price_money: { amount: 3500, currency: USD } }], taxes: [{ uid: "38ze1696-z1e3-5628-af6d-f1e04d947fg3", type: INCLUSIVE, percentage: "7.75", scope: LINE_ITEM }], discounts: [{ uid: "56ae1696-z1e3-9328-af6d-f1e04d947gd4", type: FIXED_AMOUNT, amount_money: { amount: 100, currency: USD }, scope: LINE_ITEM }] }, idempotency_key: "12ae1696-z1e3-4328-af6d-f1e04d947gd4" },
#    ask_for_shipping_address: true,
#    merchant_support_email: "merchant+support@website.com",
#    pre_populate_buyer_email: "example@email.com",
#    pre_populate_shipping_address: { address_line_1: "1455 Market St.", address_line_2: "Suite 600", locality: "San Francisco", administrative_district_level_1: "CA", postal_code: "94103", country: US, first_name: "Jane", last_name: "Doe" },
#    redirect_url: "https://merchant.website.com/order-confirm",
#    additional_recipients: [{ location_id: "057P5VYJ4A5X1", description: "Application fees", amount_money: { amount: 60, currency: USD } }]
#  )
    def checkouts(location_id:, idempotency_key:, order:, ask_for_shipping_address: nil, merchant_support_email: nil, pre_populate_buyer_email: nil, pre_populate_shipping_address: nil, redirect_url: nil, additional_recipients: nil, note: nil, request_options: nil)
      Async do
        response = @request_client.conn.post do | req |
  unless request_options&.timeout_in_seconds.nil?
    req.options.timeout = request_options.timeout_in_seconds
  end
  unless request_options&.token.nil?
    req.headers["Authorization"] = request_options.token
  end
  unless request_options&.version.nil?
    req.headers["Square-Version"] = request_options.version
  end
  req.headers = { **(req.headers || {}), **@request_client.get_headers, **(request_options&.additional_headers || {}) }.compact
  unless request_options.nil? || request_options&.additional_query_parameters.nil?
    req.params = { **(request_options&.additional_query_parameters || {}) }.compact
  end
  req.body = { **(request_options&.additional_body_parameters || {}), idempotency_key: idempotency_key, order: order, ask_for_shipping_address: ask_for_shipping_address, merchant_support_email: merchant_support_email, pre_populate_buyer_email: pre_populate_buyer_email, pre_populate_shipping_address: pre_populate_shipping_address, redirect_url: redirect_url, additional_recipients: additional_recipients, note: note }.compact
  req.url "#{@request_client.get_url(request_options: request_options)}/v2/locations/#{location_id}/checkouts"
end
        SquareApiClient::CreateCheckoutResponse.from_json(json_object: response.body)
      end
    end
  end
end