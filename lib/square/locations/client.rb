# frozen_string_literal: true

module Square
  module Locations
    class Client
      # @return [Square::Locations::Client]
      def initialize(client:)
        @client = client
      end

      # Provides details about all of the seller's [locations](https://developer.squareup.com/docs/locations-api),
      # including those with an inactive status. Locations are listed alphabetically by `name`.
      #
      # @return [Square::Types::ListLocationsResponse]
      def list(request_options: {}, **_params)
        _request = Square::Internal::JSON::Request.new(
          base_url: request_options[:base_url] || Square::Environment::SANDBOX,
          method: "GET",
          path: "v2/locations"
        )
        _response = @client.send(_request)
        if _response.code >= "200" && _response.code < "300"
          return Square::Types::ListLocationsResponse.load(_response.body)
        end

        raise _response.body
      end

      # Creates a [location](https://developer.squareup.com/docs/locations-api).
      # Creating new locations allows for separate configuration of receipt layouts, item prices,
      # and sales reports. Developers can use locations to separate sales activity through applications
      # that integrate with Square from sales activity elsewhere in a seller's account.
      # Locations created programmatically with the Locations API last forever and
      # are visible to the seller for their own management. Therefore, ensure that
      # each location has a sensible and unique name.
      #
      # @return [Square::Types::CreateLocationResponse]
      def create(request_options: {}, **params)
        _request = Square::Internal::JSON::Request.new(
          base_url: request_options[:base_url] || Square::Environment::SANDBOX,
          method: "POST",
          path: "v2/locations",
          body: params
        )
        _response = @client.send(_request)
        if _response.code >= "200" && _response.code < "300"
          return Square::Types::CreateLocationResponse.load(_response.body)
        end

        raise _response.body
      end

      # Retrieves details of a single location. Specify "main"
      # as the location ID to retrieve details of the [main location](https://developer.squareup.com/docs/locations-api#about-the-main-location).
      #
      # @return [Square::Types::GetLocationResponse]
      def get(request_options: {}, **params)
        _request = Square::Internal::JSON::Request.new(
          base_url: request_options[:base_url] || Square::Environment::SANDBOX,
          method: "GET",
          path: "v2/locations/#{params[:location_id]}"
        )
        _response = @client.send(_request)
        if _response.code >= "200" && _response.code < "300"
          return Square::Types::GetLocationResponse.load(_response.body)
        end

        raise _response.body
      end

      # Updates a [location](https://developer.squareup.com/docs/locations-api).
      #
      # @return [Square::Types::UpdateLocationResponse]
      def update(request_options: {}, **params)
        _path_param_names = ["location_id"]

        _request = Square::Internal::JSON::Request.new(
          base_url: request_options[:base_url] || Square::Environment::SANDBOX,
          method: "PUT",
          path: "v2/locations/#{params[:location_id]}",
          body: params.except(*_path_param_names)
        )
        _response = @client.send(_request)
        if _response.code >= "200" && _response.code < "300"
          return Square::Types::UpdateLocationResponse.load(_response.body)
        end

        raise _response.body
      end

      # Links a `checkoutId` to a `checkout_page_url` that customers are
      # directed to in order to provide their payment information using a
      # payment processing workflow hosted on connect.squareup.com.
      #
      #
      # NOTE: The Checkout API has been updated with new features.
      # For more information, see [Checkout API highlights](https://developer.squareup.com/docs/checkout-api#checkout-api-highlights).
      #
      # @return [Square::Types::CreateCheckoutResponse]
      def checkouts(request_options: {}, **params)
        _path_param_names = ["location_id"]

        _request = Square::Internal::JSON::Request.new(
          base_url: request_options[:base_url] || Square::Environment::SANDBOX,
          method: "POST",
          path: "v2/locations/#{params[:location_id]}/checkouts",
          body: params.except(*_path_param_names)
        )
        _response = @client.send(_request)
        if _response.code >= "200" && _response.code < "300"
          return Square::Types::CreateCheckoutResponse.load(_response.body)
        end

        raise _response.body
      end

      # @return [Square::CustomAttributeDefinitions::Client]
      def customAttributeDefinitions
        @customAttributeDefinitions ||= Square::CustomAttributeDefinitions::Client.new(client: @raw_client)
      end

      # @return [Square::CustomAttributes::Client]
      def customAttributes
        @customAttributes ||= Square::CustomAttributes::Client.new(client: @raw_client)
      end

      # @return [Square::Transactions::Client]
      def transactions
        @transactions ||= Square::Transactions::Client.new(client: @raw_client)
      end
    end
  end
end
