# frozen_string_literal: true
require_relative "../../requests"
require_relative "../types/create_mobile_authorization_code_response"
require "async"
require_relative "../../requests"

module SquareApiClient
  class MobileClient
  # @return [SquareApiClient::RequestClient] 
    attr_reader :request_client


    # @param request_client [SquareApiClient::RequestClient] 
    # @return [SquareApiClient::MobileClient]
    def initialize(request_client:)
      @request_client = request_client
    end
# __Note:__ This endpoint is used by the deprecated Reader SDK.
#  Developers should update their integration to use the [Mobile Payments
#  SDK](https://developer.squareup.com/docs/mobile-payments-sdk), which includes
#  its own authorization methods.
#  Generates code to authorize a mobile application to connect to a Square card
#  reader.
#  Authorization codes are one-time-use codes and expire 60 minutes after being
#  issued.
#  The `Authorization` header you provide to this endpoint must have the following
#  format:
#  ```
#  Authorization: Bearer ACCESS_TOKEN
#  ```
#  Replace `ACCESS_TOKEN` with a
#  [valid production authorization
#  credential](https://developer.squareup.com/docs/build-basics/access-tokens).
    #
    # @param location_id [String] The Square location ID that the authorization code should be tied to.
    # @param request_options [SquareApiClient::RequestOptions] 
    # @return [SquareApiClient::CreateMobileAuthorizationCodeResponse]
    # @example
#  api = SquareApiClient::Client.new(
#    base_url: "https://api.example.com",
#    environment: SquareApiClient::Environment::PRODUCTION,
#    token: "YOUR_AUTH_TOKEN",
#    version: "Version"
#  )
#  api.mobile.authorization_code(location_id: "YOUR_LOCATION_ID")
    def authorization_code(location_id: nil, request_options: nil)
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
  req.body = { **(request_options&.additional_body_parameters || {}), location_id: location_id }.compact
  req.url "#{@request_client.get_url(request_options: request_options)}/mobile/authorization-code"
end
      SquareApiClient::CreateMobileAuthorizationCodeResponse.from_json(json_object: response.body)
    end
  end
  class AsyncMobileClient
  # @return [SquareApiClient::AsyncRequestClient] 
    attr_reader :request_client


    # @param request_client [SquareApiClient::RequestClient] 
    # @return [SquareApiClient::AsyncMobileClient]
    def initialize(request_client:)
      @request_client = request_client
    end
# __Note:__ This endpoint is used by the deprecated Reader SDK.
#  Developers should update their integration to use the [Mobile Payments
#  SDK](https://developer.squareup.com/docs/mobile-payments-sdk), which includes
#  its own authorization methods.
#  Generates code to authorize a mobile application to connect to a Square card
#  reader.
#  Authorization codes are one-time-use codes and expire 60 minutes after being
#  issued.
#  The `Authorization` header you provide to this endpoint must have the following
#  format:
#  ```
#  Authorization: Bearer ACCESS_TOKEN
#  ```
#  Replace `ACCESS_TOKEN` with a
#  [valid production authorization
#  credential](https://developer.squareup.com/docs/build-basics/access-tokens).
    #
    # @param location_id [String] The Square location ID that the authorization code should be tied to.
    # @param request_options [SquareApiClient::RequestOptions] 
    # @return [SquareApiClient::CreateMobileAuthorizationCodeResponse]
    # @example
#  api = SquareApiClient::Client.new(
#    base_url: "https://api.example.com",
#    environment: SquareApiClient::Environment::PRODUCTION,
#    token: "YOUR_AUTH_TOKEN",
#    version: "Version"
#  )
#  api.mobile.authorization_code(location_id: "YOUR_LOCATION_ID")
    def authorization_code(location_id: nil, request_options: nil)
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
  req.body = { **(request_options&.additional_body_parameters || {}), location_id: location_id }.compact
  req.url "#{@request_client.get_url(request_options: request_options)}/mobile/authorization-code"
end
        SquareApiClient::CreateMobileAuthorizationCodeResponse.from_json(json_object: response.body)
      end
    end
  end
end