# frozen_string_literal: true
require_relative "error"
require "ostruct"
require "json"

module SquareApiClient
# Defines the fields that are included in the response body of
#  a request to the `RetrieveTokenStatus` endpoint.
  class RetrieveTokenStatusResponse
  # @return [Array<String>] The list of scopes associated with an access token.
    attr_reader :scopes
  # @return [String] The date and time when the `access_token` expires, in RFC 3339 format. Empty if
#  the token never expires.
    attr_reader :expires_at
  # @return [String] The Square-issued application ID associated with the access token. This is the
#  same application ID used to obtain the token.
    attr_reader :client_id
  # @return [String] The ID of the authorizing merchant's business.
    attr_reader :merchant_id
  # @return [Array<SquareApiClient::Error>] Any errors that occurred during the request.
    attr_reader :errors
  # @return [OpenStruct] Additional properties unmapped to the current class definition
    attr_reader :additional_properties
  # @return [Object] 
    attr_reader :_field_set
    protected :_field_set

    OMIT = Object.new

    # @param scopes [Array<String>] The list of scopes associated with an access token.
    # @param expires_at [String] The date and time when the `access_token` expires, in RFC 3339 format. Empty if
#  the token never expires.
    # @param client_id [String] The Square-issued application ID associated with the access token. This is the
#  same application ID used to obtain the token.
    # @param merchant_id [String] The ID of the authorizing merchant's business.
    # @param errors [Array<SquareApiClient::Error>] Any errors that occurred during the request.
    # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
    # @return [SquareApiClient::RetrieveTokenStatusResponse]
    def initialize(scopes: OMIT, expires_at: OMIT, client_id: OMIT, merchant_id: OMIT, errors: OMIT, additional_properties: nil)
      @scopes = scopes if scopes != OMIT
      @expires_at = expires_at if expires_at != OMIT
      @client_id = client_id if client_id != OMIT
      @merchant_id = merchant_id if merchant_id != OMIT
      @errors = errors if errors != OMIT
      @additional_properties = additional_properties
      @_field_set = { "scopes": scopes, "expires_at": expires_at, "client_id": client_id, "merchant_id": merchant_id, "errors": errors }.reject do | _k, v |
  v == OMIT
end
    end
# Deserialize a JSON object to an instance of RetrieveTokenStatusResponse
    #
    # @param json_object [String] 
    # @return [SquareApiClient::RetrieveTokenStatusResponse]
    def self.from_json(json_object:)
      struct = JSON.parse(json_object, object_class: OpenStruct)
      parsed_json = JSON.parse(json_object)
      scopes = parsed_json["scopes"]
      expires_at = parsed_json["expires_at"]
      client_id = parsed_json["client_id"]
      merchant_id = parsed_json["merchant_id"]
      errors = parsed_json["errors"]&.map do | item |
  item = item.to_json
  SquareApiClient::Error.from_json(json_object: item)
end
      new(
        scopes: scopes,
        expires_at: expires_at,
        client_id: client_id,
        merchant_id: merchant_id,
        errors: errors,
        additional_properties: struct
      )
    end
# Serialize an instance of RetrieveTokenStatusResponse to a JSON object
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
      obj.scopes&.is_a?(Array) != false || raise("Passed value for field obj.scopes is not the expected type, validation failed.")
      obj.expires_at&.is_a?(String) != false || raise("Passed value for field obj.expires_at is not the expected type, validation failed.")
      obj.client_id&.is_a?(String) != false || raise("Passed value for field obj.client_id is not the expected type, validation failed.")
      obj.merchant_id&.is_a?(String) != false || raise("Passed value for field obj.merchant_id is not the expected type, validation failed.")
      obj.errors&.is_a?(Array) != false || raise("Passed value for field obj.errors is not the expected type, validation failed.")
    end
  end
end