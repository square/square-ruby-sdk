
module Square
  module Locations
    class Client
      # @option client [Square::Internal::Http::RawClient]
      #
      # @return [Square::Locations::Client]
      def initialize(client)
        @client = client
      end

      # Provides details about all of the seller's [locations](https://developer.squareup.com/docs/locations-api),
      # including those with an inactive status. Locations are listed alphabetically by `name`.
      #
      # @return [Square::ListLocationsResponse]
      def list(request_options: {}, **params)
        _request = params
        _response = @client.send(_request)
        if _response.code >= "200" && _response.code < "300"
          return Square::Types::ListLocationsResponse.load(_response.body)
        else
          raise _response.body
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
      # @return [Square::CreateLocationResponse]
      def create(request_options: {}, **params)
        _request = params
        _response = @client.send(_request)
        if _response.code >= "200" && _response.code < "300"
          return Square::Types::CreateLocationResponse.load(_response.body)
        else
          raise _response.body
        end
      end

      # Retrieves details of a single location. Specify "main"
      # as the location ID to retrieve details of the [main location](https://developer.squareup.com/docs/locations-api#about-the-main-location).
      #
      # @return [Square::GetLocationResponse]
      def get(request_options: {}, **params)
        _request = params
        _response = @client.send(_request)
        if _response.code >= "200" && _response.code < "300"
          return Square::Types::GetLocationResponse.load(_response.body)
        else
          raise _response.body
        end
      end

      # Updates a [location](https://developer.squareup.com/docs/locations-api).
      #
      # @return [Square::UpdateLocationResponse]
      def update(request_options: {}, **params)
        _request = params
        _response = @client.send(_request)
        if _response.code >= "200" && _response.code < "300"
          return Square::Types::UpdateLocationResponse.load(_response.body)
        else
          raise _response.body
        end
      end

      # Links a `checkoutId` to a `checkout_page_url` that customers are
      # directed to in order to provide their payment information using a
      # payment processing workflow hosted on connect.squareup.com. 
      # 
      # 
      # NOTE: The Checkout API has been updated with new features. 
      # For more information, see [Checkout API highlights](https://developer.squareup.com/docs/checkout-api#checkout-api-highlights).
      #
      # @return [Square::CreateCheckoutResponse]
      def checkouts(request_options: {}, **params)
        _request = params
        _response = @client.send(_request)
        if _response.code >= "200" && _response.code < "300"
          return Square::Types::CreateCheckoutResponse.load(_response.body)
        else
          raise _response.body
        end
      end

    end
  end
end
