# frozen_string_literal: true

module Square
  module Merchants
    class Client
      # @return [Square::Merchants::Client]
      def initialize(client:)
        @client = client
      end

      # Provides details about the merchant associated with a given access token.
      #
      # The access token used to connect your application to a Square seller is associated
      # with a single merchant. That means that `ListMerchants` returns a list
      # with a single `Merchant` object. You can specify your personal access token
      # to get your own merchant information or specify an OAuth token to get the
      # information for the merchant that granted your application access.
      #
      # If you know the merchant ID, you can also use the [RetrieveMerchant](api-endpoint:Merchants-RetrieveMerchant)
      # endpoint to retrieve the merchant information.
      #
      # @return [Square::Types::ListMerchantsResponse]
      def list(request_options: {}, **params)
        _query_param_names = [
          ["cursor"],
          %i[cursor]
        ].flatten
        _query = params.slice(*_query_param_names)
        params.except(*_query_param_names)

        _request = Square::Internal::JSON::Request.new(
          base_url: request_options[:base_url] || Square::Environment::PRODUCTION,
          method: "GET",
          path: "v2/merchants",
          query: _query
        )
        begin
          _response = @client.send(_request)
        rescue Net::HTTPRequestTimeout
          raise Square::Errors::TimeoutError
        end
        code = _response.code.to_i
        if code.between?(200, 299)
          Square::Types::ListMerchantsResponse.load(_response.body)
        else
          error_class = Square::Errors::ResponseError.subclass_for_code(code)
          raise error_class.new(_response.body, code: code)
        end
      end

      # Retrieves the `Merchant` object for the given `merchant_id`.
      #
      # @return [Square::Types::GetMerchantResponse]
      def get(request_options: {}, **params)
        _request = Square::Internal::JSON::Request.new(
          base_url: request_options[:base_url] || Square::Environment::PRODUCTION,
          method: "GET",
          path: "v2/merchants/#{params[:merchant_id]}"
        )
        begin
          _response = @client.send(_request)
        rescue Net::HTTPRequestTimeout
          raise Square::Errors::TimeoutError
        end
        code = _response.code.to_i
        if code.between?(200, 299)
          Square::Types::GetMerchantResponse.load(_response.body)
        else
          error_class = Square::Errors::ResponseError.subclass_for_code(code)
          raise error_class.new(_response.body, code: code)
        end
      end

      # @return [Square::CustomAttributeDefinitions::Client]
      def custom_attribute_definitions
        @custom_attribute_definitions ||= Square::Merchants::CustomAttributeDefinitions::Client.new(client: @client)
      end

      # @return [Square::CustomAttributes::Client]
      def custom_attributes
        @custom_attributes ||= Square::Merchants::CustomAttributes::Client.new(client: @client)
      end
    end
  end
end
