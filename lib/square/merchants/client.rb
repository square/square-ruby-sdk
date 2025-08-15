
module Square
  module Merchants
    class Client
      # @option client [Square::Internal::Http::RawClient]
      #
      # @return [Square::Merchants::Client]
      def initialize(client)
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
      # @return [Square::ListMerchantsResponse]
      def list(request_options: {}, **params)
        _request = params
        _response = @client.send(_request)
        if _response.code >= "200" && _response.code < "300"
          return Square::Types::ListMerchantsResponse.load(_response.body)
        else
          raise _response.body
        end
      end

      # Retrieves the `Merchant` object for the given `merchant_id`.
      #
      # @return [Square::GetMerchantResponse]
      def get(request_options: {}, **params)
        _request = params
        _response = @client.send(_request)
        if _response.code >= "200" && _response.code < "300"
          return Square::Types::GetMerchantResponse.load(_response.body)
        else
          raise _response.body
        end
      end

    end
  end
end
