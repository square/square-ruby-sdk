# frozen_string_literal: true
require_relative "error"
require "ostruct"
require "json"

module SquareApiClient
# Defines the fields that are included in the response body of
#  a request to the `CreateMobileAuthorizationCode` endpoint.
  class CreateMobileAuthorizationCodeResponse
  # @return [String] The generated authorization code that connects a mobile application instance
#  to a Square account.
    attr_reader :authorization_code
  # @return [String] The timestamp when `authorization_code` expires, in
#  [RFC 3339](https://tools.ietf.org/html/rfc3339) format (for example,
#  "2016-09-04T23:59:33.123Z").
    attr_reader :expires_at
  # @return [Array<SquareApiClient::Error>] Any errors that occurred during the request.
    attr_reader :errors
  # @return [OpenStruct] Additional properties unmapped to the current class definition
    attr_reader :additional_properties
  # @return [Object] 
    attr_reader :_field_set
    protected :_field_set

    OMIT = Object.new

    # @param authorization_code [String] The generated authorization code that connects a mobile application instance
#  to a Square account.
    # @param expires_at [String] The timestamp when `authorization_code` expires, in
#  [RFC 3339](https://tools.ietf.org/html/rfc3339) format (for example,
#  "2016-09-04T23:59:33.123Z").
    # @param errors [Array<SquareApiClient::Error>] Any errors that occurred during the request.
    # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
    # @return [SquareApiClient::CreateMobileAuthorizationCodeResponse]
    def initialize(authorization_code: OMIT, expires_at: OMIT, errors: OMIT, additional_properties: nil)
      @authorization_code = authorization_code if authorization_code != OMIT
      @expires_at = expires_at if expires_at != OMIT
      @errors = errors if errors != OMIT
      @additional_properties = additional_properties
      @_field_set = { "authorization_code": authorization_code, "expires_at": expires_at, "errors": errors }.reject do | _k, v |
  v == OMIT
end
    end
# Deserialize a JSON object to an instance of
#  CreateMobileAuthorizationCodeResponse
    #
    # @param json_object [String] 
    # @return [SquareApiClient::CreateMobileAuthorizationCodeResponse]
    def self.from_json(json_object:)
      struct = JSON.parse(json_object, object_class: OpenStruct)
      parsed_json = JSON.parse(json_object)
      authorization_code = parsed_json["authorization_code"]
      expires_at = parsed_json["expires_at"]
      errors = parsed_json["errors"]&.map do | item |
  item = item.to_json
  SquareApiClient::Error.from_json(json_object: item)
end
      new(
        authorization_code: authorization_code,
        expires_at: expires_at,
        errors: errors,
        additional_properties: struct
      )
    end
# Serialize an instance of CreateMobileAuthorizationCodeResponse to a JSON object
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
      obj.authorization_code&.is_a?(String) != false || raise("Passed value for field obj.authorization_code is not the expected type, validation failed.")
      obj.expires_at&.is_a?(String) != false || raise("Passed value for field obj.expires_at is not the expected type, validation failed.")
      obj.errors&.is_a?(Array) != false || raise("Passed value for field obj.errors is not the expected type, validation failed.")
    end
  end
end