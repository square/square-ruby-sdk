# frozen_string_literal: true

module Square
  module ApplePay
    class Client
      # @param client [Square::Internal::Http::RawClient]
      #
      # @return [void]
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
      # current version of this file is always available at
      # https://app.squareup.com/digital-wallets/apple-pay/apple-developer-merchantid-domain-association,
      # and should be hosted at `.well_known/apple-developer-merchantid-domain-association` on your
      # domain.  This file is subject to change; we strongly recommend checking for updates regularly and avoiding
      # long-lived caches that might not keep in sync with the correct file version.
      #
      # To learn more about the Web Payments SDK and how to add Apple Pay, see [Take an Apple Pay
      # Payment](https://developer.squareup.com/docs/web-payments/apple-pay).
      #
      # @param request_options [Hash]
      # @param params [Square::ApplePay::Types::RegisterDomainRequest]
      # @option request_options [String] :base_url
      # @option request_options [Hash{String => Object}] :additional_headers
      # @option request_options [Hash{String => Object}] :additional_query_parameters
      # @option request_options [Hash{String => Object}] :additional_body_parameters
      # @option request_options [Integer] :timeout_in_seconds
      #
      # @return [Square::Types::RegisterDomainResponse]
      def register_domain(request_options: {}, **params)
        body_prop_names = %i[domain_name]
        body_bag = params.slice(*body_prop_names)

        request = Square::Internal::JSON::Request.new(
          base_url: request_options[:base_url],
          method: "POST",
          path: "v2/apple-pay/domains",
          body: Square::ApplePay::Types::RegisterDomainRequest.new(body_bag).to_h,
          request_options: request_options
        )
        begin
          response = @client.send(request)
        rescue Net::HTTPRequestTimeout
          raise Square::Errors::TimeoutError
        end
        code = response.code.to_i
        if code.between?(200, 299)
          Square::Types::RegisterDomainResponse.load(response.body)
        else
          error_class = Square::Errors::ResponseError.subclass_for_code(code)
          raise error_class.new(response.body, code: code)
        end
      end
    end
  end
end
