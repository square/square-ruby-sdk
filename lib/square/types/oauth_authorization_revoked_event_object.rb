# frozen_string_literal: true
require_relative "oauth_authorization_revoked_event_revocation_object"
require "ostruct"
require "json"

module square.rb
  class OauthAuthorizationRevokedEventObject
  # @return [square.rb::OauthAuthorizationRevokedEventRevocationObject] The revocation event.
    attr_reader :revocation
  # @return [OpenStruct] Additional properties unmapped to the current class definition
    attr_reader :additional_properties
  # @return [Object] 
    attr_reader :_field_set
    protected :_field_set

    OMIT = Object.new

    # @param revocation [square.rb::OauthAuthorizationRevokedEventRevocationObject] The revocation event.
    # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
    # @return [square.rb::OauthAuthorizationRevokedEventObject]
    def initialize(revocation: OMIT, additional_properties: nil)
      @revocation = revocation if revocation != OMIT
      @additional_properties = additional_properties
      @_field_set = { "revocation": revocation }.reject do | _k, v |
  v == OMIT
end
    end
# Deserialize a JSON object to an instance of OauthAuthorizationRevokedEventObject
    #
    # @param json_object [String] 
    # @return [square.rb::OauthAuthorizationRevokedEventObject]
    def self.from_json(json_object:)
      struct = JSON.parse(json_object, object_class: OpenStruct)
      parsed_json = JSON.parse(json_object)
      unless parsed_json["revocation"].nil?
        revocation = parsed_json["revocation"].to_json
        revocation = square.rb::OauthAuthorizationRevokedEventRevocationObject.from_json(json_object: revocation)
      else
        revocation = nil
      end
      new(revocation: revocation, additional_properties: struct)
    end
# Serialize an instance of OauthAuthorizationRevokedEventObject to a JSON object
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
      obj.revocation.nil? || square.rb::OauthAuthorizationRevokedEventRevocationObject.validate_raw(obj: obj.revocation)
    end
  end
end