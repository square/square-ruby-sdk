# frozen_string_literal: true
require_relative "../../requests"
require_relative "payment_links/client"
require_relative "../types/retrieve_location_settings_response"
require_relative "../types/checkout_location_settings"
require_relative "../types/update_location_settings_response"
require_relative "../types/retrieve_merchant_settings_response"
require_relative "../types/checkout_merchant_settings"
require_relative "../types/update_merchant_settings_response"
require "async"
require "async"
require "async"
require "async"
require_relative "../../requests"

module square.rb
  class CheckoutClient
  # @return [square.rb::RequestClient] 
    attr_reader :request_client
  # @return [square.rb::Checkout::PaymentLinksClient] 
    attr_reader :payment_links


    # @param request_client [square.rb::RequestClient] 
    # @return [square.rb::CheckoutClient]
    def initialize(request_client:)
      @request_client = request_client
      @payment_links = square.rb::Checkout::PaymentLinksClient.new(request_client: request_client)
    end
# Retrieves the location-level settings for a Square-hosted checkout page.
    #
    # @param location_id [String] The ID of the location for which to retrieve settings.
    # @param request_options [square.rb::RequestOptions] 
    # @return [square.rb::RetrieveLocationSettingsResponse]
    # @example
#  api = square.rb::Client.new(
#    base_url: "https://api.example.com",
#    environment: square.rb::Environment::PRODUCTION,
#    token: "YOUR_AUTH_TOKEN",
#    version: "Version"
#  )
#  api.checkout.retrieve_location_settings(location_id: "location_id")
    def retrieve_location_settings(location_id:, request_options: nil)
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
  req.url "#{@request_client.get_url(request_options: request_options)}/v2/online-checkout/location-settings/#{location_id}"
end
      square.rb::RetrieveLocationSettingsResponse.from_json(json_object: response.body)
    end
# Updates the location-level settings for a Square-hosted checkout page.
    #
    # @param location_id [String] The ID of the location for which to retrieve settings.
    # @param location_settings [Hash] Describe your updates using the `location_settings` object. Make sure it
#  contains only the fields that have changed.Request of type square.rb::CheckoutLocationSettings, as a Hash
    #   * :location_id (String) 
    #   * :customer_notes_enabled (Boolean) 
    #   * :policies (Array<square.rb::CheckoutLocationSettingsPolicy>) 
    #   * :branding (Hash)
    #     * :header_type (square.rb::CheckoutLocationSettingsBrandingHeaderType) 
    #     * :button_color (String) 
    #     * :button_shape (square.rb::CheckoutLocationSettingsBrandingButtonShape) 
    #   * :tipping (Hash)
    #     * :percentages (Array<Integer>) 
    #     * :smart_tipping_enabled (Boolean) 
    #     * :default_percent (Integer) 
    #     * :smart_tips (Array<square.rb::Money>) 
    #     * :default_smart_tip (Hash)
    #       * :amount (Long) 
    #       * :currency (square.rb::Currency) 
    #   * :coupons (Hash)
    #     * :enabled (Boolean) 
    #   * :updated_at (String) 
    # @param request_options [square.rb::RequestOptions] 
    # @return [square.rb::UpdateLocationSettingsResponse]
    # @example
#  api = square.rb::Client.new(
#    base_url: "https://api.example.com",
#    environment: square.rb::Environment::PRODUCTION,
#    token: "YOUR_AUTH_TOKEN",
#    version: "Version"
#  )
#  api.checkout.update_location_settings(location_id: "location_id", location_settings: {  })
    def update_location_settings(location_id:, location_settings:, request_options: nil)
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
  req.body = { **(request_options&.additional_body_parameters || {}), location_settings: location_settings }.compact
  req.url "#{@request_client.get_url(request_options: request_options)}/v2/online-checkout/location-settings/#{location_id}"
end
      square.rb::UpdateLocationSettingsResponse.from_json(json_object: response.body)
    end
# Retrieves the merchant-level settings for a Square-hosted checkout page.
    #
    # @param request_options [square.rb::RequestOptions] 
    # @return [square.rb::RetrieveMerchantSettingsResponse]
    # @example
#  api = square.rb::Client.new(
#    base_url: "https://api.example.com",
#    environment: square.rb::Environment::PRODUCTION,
#    token: "YOUR_AUTH_TOKEN",
#    version: "Version"
#  )
#  api.checkout.retrieve_merchant_settings
    def retrieve_merchant_settings(request_options: nil)
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
  req.url "#{@request_client.get_url(request_options: request_options)}/v2/online-checkout/merchant-settings"
end
      square.rb::RetrieveMerchantSettingsResponse.from_json(json_object: response.body)
    end
# Updates the merchant-level settings for a Square-hosted checkout page.
    #
    # @param merchant_settings [Hash] Describe your updates using the `merchant_settings` object. Make sure it
#  contains only the fields that have changed.Request of type square.rb::CheckoutMerchantSettings, as a Hash
    #   * :payment_methods (Hash)
    #     * :apple_pay (Hash)
    #       * :enabled (Boolean) 
    #     * :google_pay (Hash)
    #       * :enabled (Boolean) 
    #     * :cash_app (Hash)
    #       * :enabled (Boolean) 
    #     * :afterpay_clearpay (Hash)
    #       * :order_eligibility_range (Hash)
    #         * :min (Hash)
    #           * :amount (Long) 
    #           * :currency (square.rb::Currency) 
    #         * :max (Hash)
    #           * :amount (Long) 
    #           * :currency (square.rb::Currency) 
    #       * :item_eligibility_range (Hash)
    #         * :min (Hash)
    #           * :amount (Long) 
    #           * :currency (square.rb::Currency) 
    #         * :max (Hash)
    #           * :amount (Long) 
    #           * :currency (square.rb::Currency) 
    #       * :enabled (Boolean) 
    #   * :updated_at (String) 
    # @param request_options [square.rb::RequestOptions] 
    # @return [square.rb::UpdateMerchantSettingsResponse]
    # @example
#  api = square.rb::Client.new(
#    base_url: "https://api.example.com",
#    environment: square.rb::Environment::PRODUCTION,
#    token: "YOUR_AUTH_TOKEN",
#    version: "Version"
#  )
#  api.checkout.update_merchant_settings(merchant_settings: {  })
    def update_merchant_settings(merchant_settings:, request_options: nil)
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
  req.body = { **(request_options&.additional_body_parameters || {}), merchant_settings: merchant_settings }.compact
  req.url "#{@request_client.get_url(request_options: request_options)}/v2/online-checkout/merchant-settings"
end
      square.rb::UpdateMerchantSettingsResponse.from_json(json_object: response.body)
    end
  end
  class AsyncCheckoutClient
  # @return [square.rb::AsyncRequestClient] 
    attr_reader :request_client
  # @return [square.rb::Checkout::PaymentLinksClient] 
    attr_reader :payment_links


    # @param request_client [square.rb::RequestClient] 
    # @return [square.rb::AsyncCheckoutClient]
    def initialize(request_client:)
      @request_client = request_client
      @payment_links = square.rb::Checkout::AsyncPaymentLinksClient.new(request_client: request_client)
    end
# Retrieves the location-level settings for a Square-hosted checkout page.
    #
    # @param location_id [String] The ID of the location for which to retrieve settings.
    # @param request_options [square.rb::RequestOptions] 
    # @return [square.rb::RetrieveLocationSettingsResponse]
    # @example
#  api = square.rb::Client.new(
#    base_url: "https://api.example.com",
#    environment: square.rb::Environment::PRODUCTION,
#    token: "YOUR_AUTH_TOKEN",
#    version: "Version"
#  )
#  api.checkout.retrieve_location_settings(location_id: "location_id")
    def retrieve_location_settings(location_id:, request_options: nil)
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
  req.url "#{@request_client.get_url(request_options: request_options)}/v2/online-checkout/location-settings/#{location_id}"
end
        square.rb::RetrieveLocationSettingsResponse.from_json(json_object: response.body)
      end
    end
# Updates the location-level settings for a Square-hosted checkout page.
    #
    # @param location_id [String] The ID of the location for which to retrieve settings.
    # @param location_settings [Hash] Describe your updates using the `location_settings` object. Make sure it
#  contains only the fields that have changed.Request of type square.rb::CheckoutLocationSettings, as a Hash
    #   * :location_id (String) 
    #   * :customer_notes_enabled (Boolean) 
    #   * :policies (Array<square.rb::CheckoutLocationSettingsPolicy>) 
    #   * :branding (Hash)
    #     * :header_type (square.rb::CheckoutLocationSettingsBrandingHeaderType) 
    #     * :button_color (String) 
    #     * :button_shape (square.rb::CheckoutLocationSettingsBrandingButtonShape) 
    #   * :tipping (Hash)
    #     * :percentages (Array<Integer>) 
    #     * :smart_tipping_enabled (Boolean) 
    #     * :default_percent (Integer) 
    #     * :smart_tips (Array<square.rb::Money>) 
    #     * :default_smart_tip (Hash)
    #       * :amount (Long) 
    #       * :currency (square.rb::Currency) 
    #   * :coupons (Hash)
    #     * :enabled (Boolean) 
    #   * :updated_at (String) 
    # @param request_options [square.rb::RequestOptions] 
    # @return [square.rb::UpdateLocationSettingsResponse]
    # @example
#  api = square.rb::Client.new(
#    base_url: "https://api.example.com",
#    environment: square.rb::Environment::PRODUCTION,
#    token: "YOUR_AUTH_TOKEN",
#    version: "Version"
#  )
#  api.checkout.update_location_settings(location_id: "location_id", location_settings: {  })
    def update_location_settings(location_id:, location_settings:, request_options: nil)
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
  req.body = { **(request_options&.additional_body_parameters || {}), location_settings: location_settings }.compact
  req.url "#{@request_client.get_url(request_options: request_options)}/v2/online-checkout/location-settings/#{location_id}"
end
        square.rb::UpdateLocationSettingsResponse.from_json(json_object: response.body)
      end
    end
# Retrieves the merchant-level settings for a Square-hosted checkout page.
    #
    # @param request_options [square.rb::RequestOptions] 
    # @return [square.rb::RetrieveMerchantSettingsResponse]
    # @example
#  api = square.rb::Client.new(
#    base_url: "https://api.example.com",
#    environment: square.rb::Environment::PRODUCTION,
#    token: "YOUR_AUTH_TOKEN",
#    version: "Version"
#  )
#  api.checkout.retrieve_merchant_settings
    def retrieve_merchant_settings(request_options: nil)
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
  req.url "#{@request_client.get_url(request_options: request_options)}/v2/online-checkout/merchant-settings"
end
        square.rb::RetrieveMerchantSettingsResponse.from_json(json_object: response.body)
      end
    end
# Updates the merchant-level settings for a Square-hosted checkout page.
    #
    # @param merchant_settings [Hash] Describe your updates using the `merchant_settings` object. Make sure it
#  contains only the fields that have changed.Request of type square.rb::CheckoutMerchantSettings, as a Hash
    #   * :payment_methods (Hash)
    #     * :apple_pay (Hash)
    #       * :enabled (Boolean) 
    #     * :google_pay (Hash)
    #       * :enabled (Boolean) 
    #     * :cash_app (Hash)
    #       * :enabled (Boolean) 
    #     * :afterpay_clearpay (Hash)
    #       * :order_eligibility_range (Hash)
    #         * :min (Hash)
    #           * :amount (Long) 
    #           * :currency (square.rb::Currency) 
    #         * :max (Hash)
    #           * :amount (Long) 
    #           * :currency (square.rb::Currency) 
    #       * :item_eligibility_range (Hash)
    #         * :min (Hash)
    #           * :amount (Long) 
    #           * :currency (square.rb::Currency) 
    #         * :max (Hash)
    #           * :amount (Long) 
    #           * :currency (square.rb::Currency) 
    #       * :enabled (Boolean) 
    #   * :updated_at (String) 
    # @param request_options [square.rb::RequestOptions] 
    # @return [square.rb::UpdateMerchantSettingsResponse]
    # @example
#  api = square.rb::Client.new(
#    base_url: "https://api.example.com",
#    environment: square.rb::Environment::PRODUCTION,
#    token: "YOUR_AUTH_TOKEN",
#    version: "Version"
#  )
#  api.checkout.update_merchant_settings(merchant_settings: {  })
    def update_merchant_settings(merchant_settings:, request_options: nil)
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
  req.body = { **(request_options&.additional_body_parameters || {}), merchant_settings: merchant_settings }.compact
  req.url "#{@request_client.get_url(request_options: request_options)}/v2/online-checkout/merchant-settings"
end
        square.rb::UpdateMerchantSettingsResponse.from_json(json_object: response.body)
      end
    end
  end
end