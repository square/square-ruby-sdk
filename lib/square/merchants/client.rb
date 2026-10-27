# frozen_string_literal: true

module Square
  module Merchants
    class Client
      # @param client [Square::Internal::Http::RawClient]
      #
      # @return [void]
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
      # Returns a `Square::Internal::CursorItemIterator` that yields each `Square::Types::Merchant` in the `merchant`
      # field of every page, requesting pages as they are needed. Call `pages` on it to get each page as a
      # `Square::Types::ListMerchantsResponse`, including its other fields.
      #
      # No request is sent by this call. The first page is requested when you start iterating (or call
      # `load_first_page`), so an API error is raised by the loop (or by `load_first_page`), not by this call.
      #
      # @param request_options [Hash]
      # @param params [Hash]
      # @option request_options [String] :base_url
      # @option request_options [Hash{String => Object}] :additional_headers
      # @option request_options [Hash{String => Object}] :additional_query_parameters
      # @option request_options [Hash{String => Object}] :additional_body_parameters
      # @option request_options [Integer] :timeout_in_seconds
      # @option params [Integer, nil] :cursor
      #
      # @example
      #   client.merchants.list(cursor: 1)
      #
      # @return [Square::Internal::CursorItemIterator]
      def list(request_options: {}, **params)
        params = Square::Internal::Types::Utils.normalize_keys(params)
        query_params = {}
        query_params["cursor"] = params[:cursor] if params.key?(:cursor)

        Square::Internal::CursorItemIterator.new(
          cursor_field: :cursor,
          item_field: :merchant,
          initial_cursor: query_params["cursor"]
        ) do |next_cursor|
          query_params["cursor"] = next_cursor
          request = Square::Internal::JSON::Request.new(
            base_url: request_options[:base_url],
            method: "GET",
            path: "v2/merchants",
            query: query_params,
            request_options: request_options
          )
          begin
            response = @client.send(request)
          rescue Net::HTTPRequestTimeout
            raise Square::Errors::TimeoutError
          end
          code = response.code.to_i
          if code.between?(200, 299)
            parsed_response = (response.body.to_s.empty? ? nil : Square::Types::ListMerchantsResponse.load(response.body))
            [parsed_response, response]
          else
            error_class = Square::Errors::ResponseError.subclass_for_code(code)
            raise error_class.new(response.body, code: code)
          end
        end
      end

      # Retrieves the `Merchant` object for the given `merchant_id`.
      #
      # @param request_options [Hash]
      # @param params [Hash]
      # @option request_options [String] :base_url
      # @option request_options [Hash{String => Object}] :additional_headers
      # @option request_options [Hash{String => Object}] :additional_query_parameters
      # @option request_options [Hash{String => Object}] :additional_body_parameters
      # @option request_options [Integer] :timeout_in_seconds
      # @option params [String] :merchant_id
      #
      # @example
      #   client.merchants.get(merchant_id: "merchant_id")
      #
      # @return [Square::Types::GetMerchantResponse]
      def get(request_options: {}, **params)
        params = Square::Internal::Types::Utils.normalize_keys(params)
        request = Square::Internal::JSON::Request.new(
          base_url: request_options[:base_url],
          method: "GET",
          path: "v2/merchants/#{URI.encode_uri_component(params[:merchant_id].to_s)}",
          request_options: request_options
        )
        begin
          response = @client.send(request)
        rescue Net::HTTPRequestTimeout
          raise Square::Errors::TimeoutError
        end
        code = response.code.to_i
        if code.between?(200, 299)
          (response.body.to_s.empty? ? nil : Square::Types::GetMerchantResponse.load(response.body))
        else
          error_class = Square::Errors::ResponseError.subclass_for_code(code)
          raise error_class.new(response.body, code: code)
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
