# frozen_string_literal: true
require_relative "oauth_authorization_revoked_event_revoker_type"
require "ostruct"
require "json"

module square.rb
  class OauthAuthorizationRevokedEventRevocationObject
  # @return [String] Timestamp of when the revocation event occurred, in RFC 3339 format.
    attr_reader :revoked_at
  # @return [square.rb::OauthAuthorizationRevokedEventRevokerType] Type of client that performed the revocation, either APPLICATION, MERCHANT, or
#  SQUARE.
#  See
#  izationRevokedEventRevokerType](#type-oauthauthorizationrevokedeventrevokertype)
#  for possible values
    attr_reader :revoker_type
  # @return [OpenStruct] Additional properties unmapped to the current class definition
    attr_reader :additional_properties
  # @return [Object] 
    attr_reader :_field_set
    protected :_field_set

    OMIT = Object.new

    # @param revoked_at [String] Timestamp of when the revocation event occurred, in RFC 3339 format.
    # @param revoker_type [square.rb::OauthAuthorizationRevokedEventRevokerType] Type of client that performed the revocation, either APPLICATION, MERCHANT, or
#  SQUARE.
#  See
#  izationRevokedEventRevokerType](#type-oauthauthorizationrevokedeventrevokertype)
#  for possible values
    # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
    # @return [square.rb::OauthAuthorizationRevokedEventRevocationObject]
    def initialize(revoked_at: OMIT, revoker_type: OMIT, additional_properties: nil)
      @revoked_at = revoked_at if revoked_at != OMIT
      @revoker_type = revoker_type if revoker_type != OMIT
      @additional_properties = additional_properties
      @_field_set = { "revoked_at": revoked_at, "revoker_type": revoker_type }.reject do | _k, v |
  v == OMIT
end
    end
# Deserialize a JSON object to an instance of
#  OauthAuthorizationRevokedEventRevocationObject
    #
    # @param json_object [String] 
    # @return [square.rb::OauthAuthorizationRevokedEventRevocationObject]
    def self.from_json(json_object:)
      struct = JSON.parse(json_object, object_class: OpenStruct)
      parsed_json = JSON.parse(json_object)
      revoked_at = parsed_json["revoked_at"]
      revoker_type = parsed_json["revoker_type"]
      new(
        revoked_at: revoked_at,
        revoker_type: revoker_type,
        additional_properties: struct
      )
    end
# Serialize an instance of OauthAuthorizationRevokedEventRevocationObject to a
#  JSON object
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
      obj.revoked_at&.is_a?(String) != false || raise("Passed value for field obj.revoked_at is not the expected type, validation failed.")
      obj.revoker_type&.is_a?(square.rb::OauthAuthorizationRevokedEventRevokerType) != false || raise("Passed value for field obj.revoker_type is not the expected type, validation failed.")
    end
  end
end