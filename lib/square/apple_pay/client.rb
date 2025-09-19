# frozen_string_literal: true

module Square
  module ApplePay
    class Client
      # @return [Square::ApplePay::Client]
      def initialize(client:)
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
      # @return [Square::Types::RegisterDomainResponse]
      def register_domain(request_options: {}, **params)
        _request = Square::Internal::JSON::Request.new(
          base_url: request_options[:base_url] || Square::Environment::PRODUCTION,
          method: "POST",
          path: "v2/apple-pay/domains",
          body: params
        )
        begin
          _response = @client.send(_request)
        rescue Net::HTTPRequestTimeout
          raise Square::Errors::TimeoutError
        end
        code = _response.code.to_i
        if code.between?(200, 299)
          Square::Types::RegisterDomainResponse.load(_response.body)
        else
          error_class = Square::Errors::ResponseError.subclass_for_code(code)
          raise error_class.new(_response.body, code: code)
        end
      end
    end
  end
end
