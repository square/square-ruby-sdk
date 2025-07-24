# frozen_string_literal: true
require "ostruct"
require "json"

module square.rb
# Represents an individual delete request in a
#  butes](api-endpoint:MerchantCustomAttributes-BulkDeleteMerchantCustomAttributes)
#  request. An individual request contains an optional ID of the associated custom
#  attribute definition
#  and optional key of the associated custom attribute definition.
  class BulkDeleteMerchantCustomAttributesRequestMerchantCustomAttributeDeleteRequest
  # @return [String] The key of the associated custom attribute definition.
#  Represented as a qualified key if the requesting app is not the definition
#  owner.
    attr_reader :key
  # @return [OpenStruct] Additional properties unmapped to the current class definition
    attr_reader :additional_properties
  # @return [Object] 
    attr_reader :_field_set
    protected :_field_set

    OMIT = Object.new

    # @param key [String] The key of the associated custom attribute definition.
#  Represented as a qualified key if the requesting app is not the definition
#  owner.
    # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
    # @return [square.rb::BulkDeleteMerchantCustomAttributesRequestMerchantCustomAttributeDeleteRequest]
    def initialize(key: OMIT, additional_properties: nil)
      @key = key if key != OMIT
      @additional_properties = additional_properties
      @_field_set = { "key": key }.reject do | _k, v |
  v == OMIT
end
    end
# Deserialize a JSON object to an instance of
#  BulkDeleteMerchantCustomAttributesRequestMerchantCustomAttributeDeleteRequest
    #
    # @param json_object [String] 
    # @return [square.rb::BulkDeleteMerchantCustomAttributesRequestMerchantCustomAttributeDeleteRequest]
    def self.from_json(json_object:)
      struct = JSON.parse(json_object, object_class: OpenStruct)
      parsed_json = JSON.parse(json_object)
      key = parsed_json["key"]
      new(key: key, additional_properties: struct)
    end
# Serialize an instance of
#  BulkDeleteMerchantCustomAttributesRequestMerchantCustomAttributeDeleteRequest to
#  a JSON object
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
      obj.key&.is_a?(String) != false || raise("Passed value for field obj.key is not the expected type, validation failed.")
    end
  end
end