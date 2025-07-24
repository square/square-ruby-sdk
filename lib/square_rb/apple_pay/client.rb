# frozen_string_literal: true
require_relative "../../requests"
require_relative "../types/register_domain_response"
require "async"
require_relative "../../requests"

module SquareApiClient
  class ApplePayClient
  # @return [SquareApiClient::RequestClient] 
    attr_reader :request_client


    # @param request_client [SquareApiClient::RequestClient] 
    # @return [SquareApiClient::ApplePayClient]
    def initialize(request_client:)
      @request_client = request_client
    end
# Activates a domain for use with Apple Pay on the Web and Square. A validation
#  is performed on this domain by Apple to ensure that it is properly set up as
#  an Apple Pay enabled domain.
#  This endpoint provides an easy way for platform developers to bulk activate
#  Apple Pay on the Web with Square for merchants using their platform.
#  Note: You will need to host a valid domain verification file on your domain to
#  support Apple Pay.  The
#  current version of this file is always available at
#  eup.com/digital-wallets/apple-pay/apple-developer-merchantid-domain-association,
#  and should be hosted at
#  `.well_known/apple-developer-merchantid-domain-association` on your
#  domain.  This file is subject to change; we strongly recommend checking for
#  updates regularly and avoiding
#  long-lived caches that might not keep in sync with the correct file version.
#  To learn more about the Web Payments SDK and how to add Apple Pay, see [Take an
#  Apple Pay Payment](https://developer.squareup.com/docs/web-payments/apple-pay).
    #
    # @param domain_name [String] A domain name as described in RFC-1034 that will be registered with ApplePay.
    # @param request_options [SquareApiClient::RequestOptions] 
    # @return [SquareApiClient::RegisterDomainResponse]
    # @example
#  api = SquareApiClient::Client.new(
#    base_url: "https://api.example.com",
#    environment: SquareApiClient::Environment::PRODUCTION,
#    token: "YOUR_AUTH_TOKEN",
#    version: "Version"
#  )
#  api.apple_pay.register_domain(domain_name: "example.com")
    def register_domain(domain_name:, request_options: nil)
      response = @request_client.conn.post do | req |
  unless request_options&.timeout_in_seconds.nil?
    req.options.timeout = request_options.timeout_in_seconds
  end
  unless request_options&.token.nil?
    req.headers["Authorization"] = request_options.token
  end
  unless request_options&.version.nil?
    req.headers["Square-Version"] = request_options.version
  end
  req.headers = { **(req.headers || {}), **@request_client.get_headers, **(request_options&.additional_headers || {}) }.compact
  unless request_options.nil? || request_options&.additional_query_parameters.nil?
    req.params = { **(request_options&.additional_query_parameters || {}) }.compact
  end
  req.body = { **(request_options&.additional_body_parameters || {}), domain_name: domain_name }.compact
  req.url "#{@request_client.get_url(request_options: request_options)}/v2/apple-pay/domains"
end
      SquareApiClient::RegisterDomainResponse.from_json(json_object: response.body)
    end
  end
  class AsyncApplePayClient
  # @return [SquareApiClient::AsyncRequestClient] 
    attr_reader :request_client


    # @param request_client [SquareApiClient::RequestClient] 
    # @return [SquareApiClient::AsyncApplePayClient]
    def initialize(request_client:)
      @request_client = request_client
    end
# Activates a domain for use with Apple Pay on the Web and Square. A validation
#  is performed on this domain by Apple to ensure that it is properly set up as
#  an Apple Pay enabled domain.
#  This endpoint provides an easy way for platform developers to bulk activate
#  Apple Pay on the Web with Square for merchants using their platform.
#  Note: You will need to host a valid domain verification file on your domain to
#  support Apple Pay.  The
#  current version of this file is always available at
#  eup.com/digital-wallets/apple-pay/apple-developer-merchantid-domain-association,
#  and should be hosted at
#  `.well_known/apple-developer-merchantid-domain-association` on your
#  domain.  This file is subject to change; we strongly recommend checking for
#  updates regularly and avoiding
#  long-lived caches that might not keep in sync with the correct file version.
#  To learn more about the Web Payments SDK and how to add Apple Pay, see [Take an
#  Apple Pay Payment](https://developer.squareup.com/docs/web-payments/apple-pay).
    #
    # @param domain_name [String] A domain name as described in RFC-1034 that will be registered with ApplePay.
    # @param request_options [SquareApiClient::RequestOptions] 
    # @return [SquareApiClient::RegisterDomainResponse]
    # @example
#  api = SquareApiClient::Client.new(
#    base_url: "https://api.example.com",
#    environment: SquareApiClient::Environment::PRODUCTION,
#    token: "YOUR_AUTH_TOKEN",
#    version: "Version"
#  )
#  api.apple_pay.register_domain(domain_name: "example.com")
    def register_domain(domain_name:, request_options: nil)
      Async do
        response = @request_client.conn.post do | req |
  unless request_options&.timeout_in_seconds.nil?
    req.options.timeout = request_options.timeout_in_seconds
  end
  unless request_options&.token.nil?
    req.headers["Authorization"] = request_options.token
  end
  unless request_options&.version.nil?
    req.headers["Square-Version"] = request_options.version
  end
  req.headers = { **(req.headers || {}), **@request_client.get_headers, **(request_options&.additional_headers || {}) }.compact
  unless request_options.nil? || request_options&.additional_query_parameters.nil?
    req.params = { **(request_options&.additional_query_parameters || {}) }.compact
  end
  req.body = { **(request_options&.additional_body_parameters || {}), domain_name: domain_name }.compact
  req.url "#{@request_client.get_url(request_options: request_options)}/v2/apple-pay/domains"
end
        SquareApiClient::RegisterDomainResponse.from_json(json_object: response.body)
      end
    end
  end
end