# frozen_string_literal: true

module Square
  module Checkout
    class Client
      # @return [Square::Checkout::Client]
      def initialize(client:)
        @client = client
      end

      # Retrieves the location-level settings for a Square-hosted checkout page.
      #
      # @return [Square::Types::RetrieveLocationSettingsResponse]
      def retrieve_location_settings(request_options: {}, **params)
        _request = Square::Internal::JSON::Request.new(
          base_url: request_options[:base_url] || Square::Environment::SANDBOX,
          method: "GET",
          path: "v2/online-checkout/location-settings/#{params[:location_id]}"
        )
        _response = @client.send(_request)
        if _response.code >= "200" && _response.code < "300"
          return Square::Types::RetrieveLocationSettingsResponse.load(_response.body)
        end

        raise _response.body
      end

      # Updates the location-level settings for a Square-hosted checkout page.
      #
      # @return [Square::Types::UpdateLocationSettingsResponse]
      def update_location_settings(request_options: {}, **params)
        _path_param_names = ["location_id"]

        _request = Square::Internal::JSON::Request.new(
          base_url: request_options[:base_url] || Square::Environment::SANDBOX,
          method: "PUT",
          path: "v2/online-checkout/location-settings/#{params[:location_id]}",
          body: params.except(*_path_param_names)
        )
        _response = @client.send(_request)
        if _response.code >= "200" && _response.code < "300"
          return Square::Types::UpdateLocationSettingsResponse.load(_response.body)
        end

        raise _response.body
      end

      # Retrieves the merchant-level settings for a Square-hosted checkout page.
      #
      # @return [Square::Types::RetrieveMerchantSettingsResponse]
      def retrieve_merchant_settings(request_options: {}, **_params)
        _request = Square::Internal::JSON::Request.new(
          base_url: request_options[:base_url] || Square::Environment::SANDBOX,
          method: "GET",
          path: "v2/online-checkout/merchant-settings"
        )
        _response = @client.send(_request)
        if _response.code >= "200" && _response.code < "300"
          return Square::Types::RetrieveMerchantSettingsResponse.load(_response.body)
        end

        raise _response.body
      end

      # Updates the merchant-level settings for a Square-hosted checkout page.
      #
      # @return [Square::Types::UpdateMerchantSettingsResponse]
      def update_merchant_settings(request_options: {}, **params)
        _request = Square::Internal::JSON::Request.new(
          base_url: request_options[:base_url] || Square::Environment::SANDBOX,
          method: "PUT",
          path: "v2/online-checkout/merchant-settings",
          body: params
        )
        _response = @client.send(_request)
        if _response.code >= "200" && _response.code < "300"
          return Square::Types::UpdateMerchantSettingsResponse.load(_response.body)
        end

        raise _response.body
      end

      # @return [Square::PaymentLinks::Client]
      def payment_links
        @payment_links ||= Square::Checkout::PaymentLinks::Client.new(client: @client)
      end
    end
  end
end
