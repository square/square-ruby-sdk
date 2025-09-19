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
          base_url: request_options[:base_url] || Square::Environment::PRODUCTION,
          method: "GET",
          path: "v2/online-checkout/location-settings/#{params[:location_id]}"
        )
        begin
          _response = @client.send(_request)
        rescue Net::HTTPRequestTimeout
          raise Square::Errors::TimeoutError
        end
        code = _response.code.to_i
        if code.between?(200, 299)
          Square::Types::RetrieveLocationSettingsResponse.load(_response.body)
        else
          error_class = Square::Errors::ResponseError.subclass_for_code(code)
          raise error_class.new(_response.body, code: code)
        end
      end

      # Updates the location-level settings for a Square-hosted checkout page.
      #
      # @return [Square::Types::UpdateLocationSettingsResponse]
      def update_location_settings(request_options: {}, **params)
        _path_param_names = ["location_id"]

        _request = Square::Internal::JSON::Request.new(
          base_url: request_options[:base_url] || Square::Environment::PRODUCTION,
          method: "PUT",
          path: "v2/online-checkout/location-settings/#{params[:location_id]}",
          body: params.except(*_path_param_names)
        )
        begin
          _response = @client.send(_request)
        rescue Net::HTTPRequestTimeout
          raise Square::Errors::TimeoutError
        end
        code = _response.code.to_i
        if code.between?(200, 299)
          Square::Types::UpdateLocationSettingsResponse.load(_response.body)
        else
          error_class = Square::Errors::ResponseError.subclass_for_code(code)
          raise error_class.new(_response.body, code: code)
        end
      end

      # Retrieves the merchant-level settings for a Square-hosted checkout page.
      #
      # @return [Square::Types::RetrieveMerchantSettingsResponse]
      def retrieve_merchant_settings(request_options: {}, **_params)
        _request = Square::Internal::JSON::Request.new(
          base_url: request_options[:base_url] || Square::Environment::PRODUCTION,
          method: "GET",
          path: "v2/online-checkout/merchant-settings"
        )
        begin
          _response = @client.send(_request)
        rescue Net::HTTPRequestTimeout
          raise Square::Errors::TimeoutError
        end
        code = _response.code.to_i
        if code.between?(200, 299)
          Square::Types::RetrieveMerchantSettingsResponse.load(_response.body)
        else
          error_class = Square::Errors::ResponseError.subclass_for_code(code)
          raise error_class.new(_response.body, code: code)
        end
      end

      # Updates the merchant-level settings for a Square-hosted checkout page.
      #
      # @return [Square::Types::UpdateMerchantSettingsResponse]
      def update_merchant_settings(request_options: {}, **params)
        _request = Square::Internal::JSON::Request.new(
          base_url: request_options[:base_url] || Square::Environment::PRODUCTION,
          method: "PUT",
          path: "v2/online-checkout/merchant-settings",
          body: params
        )
        begin
          _response = @client.send(_request)
        rescue Net::HTTPRequestTimeout
          raise Square::Errors::TimeoutError
        end
        code = _response.code.to_i
        if code.between?(200, 299)
          Square::Types::UpdateMerchantSettingsResponse.load(_response.body)
        else
          error_class = Square::Errors::ResponseError.subclass_for_code(code)
          raise error_class.new(_response.body, code: code)
        end
      end

      # @return [Square::PaymentLinks::Client]
      def payment_links
        @payment_links ||= Square::Checkout::PaymentLinks::Client.new(client: @client)
      end
    end
  end
end
