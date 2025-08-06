# frozen_string_literal: true

require "ostruct"
require "json"

module ChromaApiClient
  class GetUserIdentityResponse
    # @return [Array<String>]
    attr_reader :databases
    # @return [String]
    attr_reader :tenant
    # @return [String]
    attr_reader :user_id
    # @return [OpenStruct] Additional properties unmapped to the current class definition
    attr_reader :additional_properties
    # @return [Object]
    attr_reader :_field_set
    protected :_field_set

    OMIT = Object.new

    # @param databases [Array<String>]
    # @param tenant [String]
    # @param user_id [String]
    # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
    # @return [ChromaApiClient::GetUserIdentityResponse]
    def initialize(databases:, tenant:, user_id:, additional_properties: nil)
      @databases = databases
      @tenant = tenant
      @user_id = user_id
      @additional_properties = additional_properties
      @_field_set = { "databases": databases, "tenant": tenant, "user_id": user_id }
    end

    # Deserialize a JSON object to an instance of GetUserIdentityResponse
    #
    # @param json_object [String]
    # @return [ChromaApiClient::GetUserIdentityResponse]
    def self.from_json(json_object:)
      struct = JSON.parse(json_object, object_class: OpenStruct)
      parsed_json = JSON.parse(json_object)
      databases = parsed_json["databases"]
      tenant = parsed_json["tenant"]
      user_id = parsed_json["user_id"]
      new(
        databases: databases,
        tenant: tenant,
        user_id: user_id,
        additional_properties: struct
      )
    end

    # Serialize an instance of GetUserIdentityResponse to a JSON object
    #
    # @return [String]
    def to_json(*_args)
      @_field_set&.to_json
    end

    # Leveraged for Union-type generation, validate_raw attempts to parse the given
    #  hash and check each fields type against the current object's property
    #  definitions.
    #
    # @param obj [Object]
    # @return [Void]
    def self.validate_raw(obj:)
      obj.databases.is_a?(Array) != false || raise("Passed value for field obj.databases is not the expected type, validation failed.")
      obj.tenant.is_a?(String) != false || raise("Passed value for field obj.tenant is not the expected type, validation failed.")
      obj.user_id.is_a?(String) != false || raise("Passed value for field obj.user_id is not the expected type, validation failed.")
    end
  end
end
