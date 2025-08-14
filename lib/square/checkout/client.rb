
module Square
    module Checkout
        class Client
            # @option client [Square::Internal::Http::RawClient]
            #
            # @return [Square::Checkout::Client]
            def initialize(client)
                @client = client
            end

            # Retrieves the location-level settings for a Square-hosted checkout page.
            #
            # @return [Square::RetrieveLocationSettingsResponse]
            def retrieve_location_settings(request_options: {}, **params)
                _request = params

                _response = @client.send(_request)
                if _response.code >= "200" && _response.code < "300"
                    return Square::Types::RetrieveLocationSettingsResponse.load(_response.body)

                else
                    raise _response.body
            end

            # Updates the location-level settings for a Square-hosted checkout page.
            #
            # @return [Square::UpdateLocationSettingsResponse]
            def update_location_settings(request_options: {}, **params)
                _request = params

                _response = @client.send(_request)
                if _response.code >= "200" && _response.code < "300"
                    return Square::Types::UpdateLocationSettingsResponse.load(_response.body)

                else
                    raise _response.body
            end

            # Retrieves the merchant-level settings for a Square-hosted checkout page.
            #
            # @return [Square::RetrieveMerchantSettingsResponse]
            def retrieve_merchant_settings(request_options: {}, **params)
                _request = params

                _response = @client.send(_request)
                if _response.code >= "200" && _response.code < "300"
                    return Square::Types::RetrieveMerchantSettingsResponse.load(_response.body)

                else
                    raise _response.body
            end

            # Updates the merchant-level settings for a Square-hosted checkout page.
            #
            # @return [Square::UpdateMerchantSettingsResponse]
            def update_merchant_settings(request_options: {}, **params)
                _request = params

                _response = @client.send(_request)
                if _response.code >= "200" && _response.code < "300"
                    return Square::Types::UpdateMerchantSettingsResponse.load(_response.body)

                else
                    raise _response.body
            end
        end
    end
end
