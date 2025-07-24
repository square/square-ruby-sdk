# frozen_string_literal: true
require_relative "error"
require "ostruct"
require "json"

module SquareApiClient
# Represents an [ObtainToken](api-endpoint:OAuth-ObtainToken) response.
  class ObtainTokenResponse
  # @return [String] An OAuth access token used to authorize Square API requests on behalf of the
#  seller.
#  Include this token as a bearer token in the `Authorization` header of your API
#  requests.
#  OAuth access tokens expire in 30 days (except `short_lived` access tokens). You
#  should call
#  `ObtainToken` and provide the returned `refresh_token` to get a new access token
#  well before
#  the current one expires. For more information, see [OAuth API:
#  Walkthrough](https://developer.squareup.com/docs/oauth-api/walkthrough).
    attr_reader :access_token
  # @return [String] The type of access token. This value is always `bearer`.
    attr_reader :token_type
  # @return [String] The timestamp of when the `access_token` expires, in [ISO
#  8601](http://www.iso.org/iso/home/standards/iso8601.htm) format.
    attr_reader :expires_at
  # @return [String] The ID of the authorizing [merchant](entity:Merchant) (seller), which represents
#  a business.
    attr_reader :merchant_id
  # @return [String] __LEGACY__ The ID of merchant's subscription.
#  The ID is only present if the merchant signed up for a subscription plan during
#  authorization.
    attr_reader :subscription_id
  # @return [String] __LEGACY__ The ID of the subscription plan the merchant signed
#  up for. The ID is only present if the merchant signed up for a subscription plan
#  during
#  authorization.
    attr_reader :plan_id
  # @return [String] The OpenID token that belongs to this person. This token is only present if the
#  `OPENID` scope is included in the authorization request.
#  Deprecated at version 2021-09-15. Square doesn't support OpenID or other single
#  sign-on (SSO)
#  protocols on top of OAuth.
    attr_reader :id_token
  # @return [String] A refresh token that can be used in an `ObtainToken` request to generate a new
#  access token.
#  With the code flow:
#  - For the `authorization_code` grant type, the refresh token is multi-use and
#  never expires.
#  - For the `refresh_token` grant type, the response returns the same refresh
#  token.
#  With the PKCE flow:
#  - For the `authorization_code` grant type, the refresh token is single-use and
#  expires in 90 days.
#  - For the `refresh_token` grant type, the refresh token is a new single-use
#  refresh token that expires in 90 days.
#  For more information, see [Refresh, Revoke, and Limit the Scope of OAuth
#  kens](https://developer.squareup.com/docs/oauth-api/refresh-revoke-limit-scope).
    attr_reader :refresh_token
  # @return [Boolean] Indicates whether the access_token is short lived. If `true`, the access token
#  expires
#  in 24 hours. If `false`, the access token expires in 30 days.
    attr_reader :short_lived
  # @return [Array<SquareApiClient::Error>] Any errors that occurred during the request.
    attr_reader :errors
  # @return [String] The timestamp of when the `refresh_token` expires, in [ISO
#  8601](http://www.iso.org/iso/home/standards/iso8601.htm)
#  format.
#  This field is only returned for the PKCE flow.
    attr_reader :refresh_token_expires_at
  # @return [OpenStruct] Additional properties unmapped to the current class definition
    attr_reader :additional_properties
  # @return [Object] 
    attr_reader :_field_set
    protected :_field_set

    OMIT = Object.new

    # @param access_token [String] An OAuth access token used to authorize Square API requests on behalf of the
#  seller.
#  Include this token as a bearer token in the `Authorization` header of your API
#  requests.
#  OAuth access tokens expire in 30 days (except `short_lived` access tokens). You
#  should call
#  `ObtainToken` and provide the returned `refresh_token` to get a new access token
#  well before
#  the current one expires. For more information, see [OAuth API:
#  Walkthrough](https://developer.squareup.com/docs/oauth-api/walkthrough).
    # @param token_type [String] The type of access token. This value is always `bearer`.
    # @param expires_at [String] The timestamp of when the `access_token` expires, in [ISO
#  8601](http://www.iso.org/iso/home/standards/iso8601.htm) format.
    # @param merchant_id [String] The ID of the authorizing [merchant](entity:Merchant) (seller), which represents
#  a business.
    # @param subscription_id [String] __LEGACY__ The ID of merchant's subscription.
#  The ID is only present if the merchant signed up for a subscription plan during
#  authorization.
    # @param plan_id [String] __LEGACY__ The ID of the subscription plan the merchant signed
#  up for. The ID is only present if the merchant signed up for a subscription plan
#  during
#  authorization.
    # @param id_token [String] The OpenID token that belongs to this person. This token is only present if the
#  `OPENID` scope is included in the authorization request.
#  Deprecated at version 2021-09-15. Square doesn't support OpenID or other single
#  sign-on (SSO)
#  protocols on top of OAuth.
    # @param refresh_token [String] A refresh token that can be used in an `ObtainToken` request to generate a new
#  access token.
#  With the code flow:
#  - For the `authorization_code` grant type, the refresh token is multi-use and
#  never expires.
#  - For the `refresh_token` grant type, the response returns the same refresh
#  token.
#  With the PKCE flow:
#  - For the `authorization_code` grant type, the refresh token is single-use and
#  expires in 90 days.
#  - For the `refresh_token` grant type, the refresh token is a new single-use
#  refresh token that expires in 90 days.
#  For more information, see [Refresh, Revoke, and Limit the Scope of OAuth
#  kens](https://developer.squareup.com/docs/oauth-api/refresh-revoke-limit-scope).
    # @param short_lived [Boolean] Indicates whether the access_token is short lived. If `true`, the access token
#  expires
#  in 24 hours. If `false`, the access token expires in 30 days.
    # @param errors [Array<SquareApiClient::Error>] Any errors that occurred during the request.
    # @param refresh_token_expires_at [String] The timestamp of when the `refresh_token` expires, in [ISO
#  8601](http://www.iso.org/iso/home/standards/iso8601.htm)
#  format.
#  This field is only returned for the PKCE flow.
    # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
    # @return [SquareApiClient::ObtainTokenResponse]
    def initialize(access_token: OMIT, token_type: OMIT, expires_at: OMIT, merchant_id: OMIT, subscription_id: OMIT, plan_id: OMIT, id_token: OMIT, refresh_token: OMIT, short_lived: OMIT, errors: OMIT, refresh_token_expires_at: OMIT, additional_properties: nil)
      @access_token = access_token if access_token != OMIT
      @token_type = token_type if token_type != OMIT
      @expires_at = expires_at if expires_at != OMIT
      @merchant_id = merchant_id if merchant_id != OMIT
      @subscription_id = subscription_id if subscription_id != OMIT
      @plan_id = plan_id if plan_id != OMIT
      @id_token = id_token if id_token != OMIT
      @refresh_token = refresh_token if refresh_token != OMIT
      @short_lived = short_lived if short_lived != OMIT
      @errors = errors if errors != OMIT
      @refresh_token_expires_at = refresh_token_expires_at if refresh_token_expires_at != OMIT
      @additional_properties = additional_properties
      @_field_set = { "access_token": access_token, "token_type": token_type, "expires_at": expires_at, "merchant_id": merchant_id, "subscription_id": subscription_id, "plan_id": plan_id, "id_token": id_token, "refresh_token": refresh_token, "short_lived": short_lived, "errors": errors, "refresh_token_expires_at": refresh_token_expires_at }.reject do | _k, v |
  v == OMIT
end
    end
# Deserialize a JSON object to an instance of ObtainTokenResponse
    #
    # @param json_object [String] 
    # @return [SquareApiClient::ObtainTokenResponse]
    def self.from_json(json_object:)
      struct = JSON.parse(json_object, object_class: OpenStruct)
      parsed_json = JSON.parse(json_object)
      access_token = parsed_json["access_token"]
      token_type = parsed_json["token_type"]
      expires_at = parsed_json["expires_at"]
      merchant_id = parsed_json["merchant_id"]
      subscription_id = parsed_json["subscription_id"]
      plan_id = parsed_json["plan_id"]
      id_token = parsed_json["id_token"]
      refresh_token = parsed_json["refresh_token"]
      short_lived = parsed_json["short_lived"]
      errors = parsed_json["errors"]&.map do | item |
  item = item.to_json
  SquareApiClient::Error.from_json(json_object: item)
end
      refresh_token_expires_at = parsed_json["refresh_token_expires_at"]
      new(
        access_token: access_token,
        token_type: token_type,
        expires_at: expires_at,
        merchant_id: merchant_id,
        subscription_id: subscription_id,
        plan_id: plan_id,
        id_token: id_token,
        refresh_token: refresh_token,
        short_lived: short_lived,
        errors: errors,
        refresh_token_expires_at: refresh_token_expires_at,
        additional_properties: struct
      )
    end
# Serialize an instance of ObtainTokenResponse to a JSON object
    #
    # @return [String]
    def to_json
      @_field_set&.to_json
    end
# Leveraged for Union-type generation, validate_raw attempts to parse the given
#  hash and check each fields type against the current object's property
#  definitions.
    #
    # @param obj [Object] 
    # @return [Void]
    def self.validate_raw(obj:)
      obj.access_token&.is_a?(String) != false || raise("Passed value for field obj.access_token is not the expected type, validation failed.")
      obj.token_type&.is_a?(String) != false || raise("Passed value for field obj.token_type is not the expected type, validation failed.")
      obj.expires_at&.is_a?(String) != false || raise("Passed value for field obj.expires_at is not the expected type, validation failed.")
      obj.merchant_id&.is_a?(String) != false || raise("Passed value for field obj.merchant_id is not the expected type, validation failed.")
      obj.subscription_id&.is_a?(String) != false || raise("Passed value for field obj.subscription_id is not the expected type, validation failed.")
      obj.plan_id&.is_a?(String) != false || raise("Passed value for field obj.plan_id is not the expected type, validation failed.")
      obj.id_token&.is_a?(String) != false || raise("Passed value for field obj.id_token is not the expected type, validation failed.")
      obj.refresh_token&.is_a?(String) != false || raise("Passed value for field obj.refresh_token is not the expected type, validation failed.")
      obj.short_lived&.is_a?(Boolean) != false || raise("Passed value for field obj.short_lived is not the expected type, validation failed.")
      obj.errors&.is_a?(Array) != false || raise("Passed value for field obj.errors is not the expected type, validation failed.")
      obj.refresh_token_expires_at&.is_a?(String) != false || raise("Passed value for field obj.refresh_token_expires_at is not the expected type, validation failed.")
    end
  end
end