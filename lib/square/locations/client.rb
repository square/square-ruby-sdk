# frozen_string_literal: true

module Square
  module Locations
    class Client
      # @param client [Square::Internal::Http::RawClient]
      #
      # @return [void]
      def initialize(client:)
        @client = client
      end

      # Provides details about all of the seller's [locations](https://developer.squareup.com/docs/locations-api),
      # including those with an inactive status. Locations are listed alphabetically by `name`.
      #
      # @param request_options [Hash]
      # @param params [Hash]
      # @option request_options [String] :base_url
      # @option request_options [Hash{String => Object}] :additional_headers
      # @option request_options [Hash{String => Object}] :additional_query_parameters
      # @option request_options [Hash{String => Object}] :additional_body_parameters
      # @option request_options [Integer] :timeout_in_seconds
      #
      # @return [Square::Types::ListLocationsResponse]
      def list(request_options: {}, **params)
        Square::Internal::Types::Utils.normalize_keys(params)
        request = Square::Internal::JSON::Request.new(
          base_url: request_options[:base_url],
          method: "GET",
          path: "v2/locations",
          request_options: request_options
        )
        begin
          response = @client.send(request)
        rescue Net::HTTPRequestTimeout
          raise Square::Errors::TimeoutError
        end
        code = response.code.to_i
        if code.between?(200, 299)
          Square::Types::ListLocationsResponse.load(response.body)
        else
          error_class = Square::Errors::ResponseError.subclass_for_code(code)
          raise error_class.new(response.body, code: code)
        end
      end

      # Creates a [location](https://developer.squareup.com/docs/locations-api).
      # Creating new locations allows for separate configuration of receipt layouts, item prices,
      # and sales reports. Developers can use locations to separate sales activity through applications
      # that integrate with Square from sales activity elsewhere in a seller's account.
      # Locations created programmatically with the Locations API last forever and
      # are visible to the seller for their own management. Therefore, ensure that
      # each location has a sensible and unique name.
      #
      # @param request_options [Hash]
      # @param params [Square::Locations::Types::CreateLocationRequest]
      # @option request_options [String] :base_url
      # @option request_options [Hash{String => Object}] :additional_headers
      # @option request_options [Hash{String => Object}] :additional_query_parameters
      # @option request_options [Hash{String => Object}] :additional_body_parameters
      # @option request_options [Integer] :timeout_in_seconds
      #
      # @return [Square::Types::CreateLocationResponse]
      def create(request_options: {}, **params)
        params = Square::Internal::Types::Utils.normalize_keys(params)
        request = Square::Internal::JSON::Request.new(
          base_url: request_options[:base_url],
          method: "POST",
          path: "v2/locations",
          body: Square::Locations::Types::CreateLocationRequest.new(params).to_h,
          request_options: request_options
        )
        begin
          response = @client.send(request)
        rescue Net::HTTPRequestTimeout
          raise Square::Errors::TimeoutError
        end
        code = response.code.to_i
        if code.between?(200, 299)
          Square::Types::CreateLocationResponse.load(response.body)
        else
          error_class = Square::Errors::ResponseError.subclass_for_code(code)
          raise error_class.new(response.body, code: code)
        end
      end

      # Retrieves details of a single location. Specify "main"
      # as the location ID to retrieve details of the [main
      # location](https://developer.squareup.com/docs/locations-api#about-the-main-location).
      #
      # @param request_options [Hash]
      # @param params [Hash]
      # @option request_options [String] :base_url
      # @option request_options [Hash{String => Object}] :additional_headers
      # @option request_options [Hash{String => Object}] :additional_query_parameters
      # @option request_options [Hash{String => Object}] :additional_body_parameters
      # @option request_options [Integer] :timeout_in_seconds
      # @option params [String] :location_id
      #
      # @return [Square::Types::GetLocationResponse]
      def get(request_options: {}, **params)
        params = Square::Internal::Types::Utils.normalize_keys(params)
        request = Square::Internal::JSON::Request.new(
          base_url: request_options[:base_url],
          method: "GET",
          path: "v2/locations/#{params[:location_id]}",
          request_options: request_options
        )
        begin
          response = @client.send(request)
        rescue Net::HTTPRequestTimeout
          raise Square::Errors::TimeoutError
        end
        code = response.code.to_i
        if code.between?(200, 299)
          Square::Types::GetLocationResponse.load(response.body)
        else
          error_class = Square::Errors::ResponseError.subclass_for_code(code)
          raise error_class.new(response.body, code: code)
        end
      end

      # Updates a [location](https://developer.squareup.com/docs/locations-api).
      #
      # @param request_options [Hash]
      # @param params [Square::Locations::Types::UpdateLocationRequest]
      # @option request_options [String] :base_url
      # @option request_options [Hash{String => Object}] :additional_headers
      # @option request_options [Hash{String => Object}] :additional_query_parameters
      # @option request_options [Hash{String => Object}] :additional_body_parameters
      # @option request_options [Integer] :timeout_in_seconds
      # @option params [String] :location_id
      #
      # @return [Square::Types::UpdateLocationResponse]
      def update(request_options: {}, **params)
        params = Square::Internal::Types::Utils.normalize_keys(params)
        request_data = Square::Locations::Types::UpdateLocationRequest.new(params).to_h
        non_body_param_names = ["location_id"]
        body = request_data.except(*non_body_param_names)

        request = Square::Internal::JSON::Request.new(
          base_url: request_options[:base_url],
          method: "PUT",
          path: "v2/locations/#{params[:location_id]}",
          body: body,
          request_options: request_options
        )
        begin
          response = @client.send(request)
        rescue Net::HTTPRequestTimeout
          raise Square::Errors::TimeoutError
        end
        code = response.code.to_i
        if code.between?(200, 299)
          Square::Types::UpdateLocationResponse.load(response.body)
        else
          error_class = Square::Errors::ResponseError.subclass_for_code(code)
          raise error_class.new(response.body, code: code)
        end
      end

      # Links a `checkoutId` to a `checkout_page_url` that customers are
      # directed to in order to provide their payment information using a
      # payment processing workflow hosted on connect.squareup.com.
      #
      #
      # NOTE: The Checkout API has been updated with new features.
      # For more information, see [Checkout API
      # highlights](https://developer.squareup.com/docs/checkout-api#checkout-api-highlights).
      #
      # @param request_options [Hash]
      # @param params [Square::Locations::Types::CreateCheckoutRequest]
      # @option request_options [String] :base_url
      # @option request_options [Hash{String => Object}] :additional_headers
      # @option request_options [Hash{String => Object}] :additional_query_parameters
      # @option request_options [Hash{String => Object}] :additional_body_parameters
      # @option request_options [Integer] :timeout_in_seconds
      # @option params [String] :location_id
      #
      # @return [Square::Types::CreateCheckoutResponse]
      def checkouts(request_options: {}, **params)
        params = Square::Internal::Types::Utils.normalize_keys(params)
        request_data = Square::Locations::Types::CreateCheckoutRequest.new(params).to_h
        non_body_param_names = ["location_id"]
        body = request_data.except(*non_body_param_names)

        request = Square::Internal::JSON::Request.new(
          base_url: request_options[:base_url],
          method: "POST",
          path: "v2/locations/#{params[:location_id]}/checkouts",
          body: body,
          request_options: request_options
        )
        begin
          response = @client.send(request)
        rescue Net::HTTPRequestTimeout
          raise Square::Errors::TimeoutError
        end
        code = response.code.to_i
        if code.between?(200, 299)
          Square::Types::CreateCheckoutResponse.load(response.body)
        else
          error_class = Square::Errors::ResponseError.subclass_for_code(code)
          raise error_class.new(response.body, code: code)
        end
      end

      # @return [Square::CustomAttributeDefinitions::Client]
      def custom_attribute_definitions
        @custom_attribute_definitions ||= Square::Locations::CustomAttributeDefinitions::Client.new(client: @client)
      end

      # @return [Square::CustomAttributes::Client]
      def custom_attributes
        @custom_attributes ||= Square::Locations::CustomAttributes::Client.new(client: @client)
      end

      # @return [Square::Transactions::Client]
      def transactions
        @transactions ||= Square::Locations::Transactions::Client.new(client: @client)
      end
    end
  end
end
