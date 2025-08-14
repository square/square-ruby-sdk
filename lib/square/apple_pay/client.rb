
module Square
    module ApplePay
        class Client
            # @option client [Square::Internal::Http::RawClient]
            #
            # @return [Square::ApplePay::Client]
            def initialize(client)
                @client = client
            end

            # Activates a domain for use with Apple Pay on the Web and Square. A validation
            # is performed on this domain by Apple to ensure that it is properly set up as
            # an Apple Pay enabled domain.
            # 
            # This endpoint provides an easy way for platform developers to bulk activate
            # Apple Pay on the Web with Square for merchants using their platform.
            # 
            # Note: You will need to host a valid domain verification file on your domain to support Apple Pay.  The
            # current version of this file is always available at https://app.squareup.com/digital-wallets/apple-pay/apple-developer-merchantid-domain-association,
            # and should be hosted at `.well_known/apple-developer-merchantid-domain-association` on your
            # domain.  This file is subject to change; we strongly recommend checking for updates regularly and avoiding
            # long-lived caches that might not keep in sync with the correct file version.
            # 
            # To learn more about the Web Payments SDK and how to add Apple Pay, see [Take an Apple Pay Payment](https://developer.squareup.com/docs/web-payments/apple-pay).
            #
            # @return [Square::RegisterDomainResponse]
            def register_domain(request_options: {}, **params)
                _request = params

                _response = @client.send(_request)
                if _response.code >= "200" && _response.code < "300"
                    return Square::Types::RegisterDomainResponse.load(_response.body)
                else
                    raise _response.body
                end
            end
        end
    end
end
