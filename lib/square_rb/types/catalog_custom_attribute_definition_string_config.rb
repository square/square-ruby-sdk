# frozen_string_literal: true
require "ostruct"
require "json"

module SquareApiClient
# Configuration associated with Custom Attribute Definitions of type `STRING`.
  class CatalogCustomAttributeDefinitionStringConfig
  # @return [Boolean] If true, each Custom Attribute instance associated with this Custom Attribute
#  Definition must have a unique value within the seller's catalog. For
#  example, this may be used for a value like a SKU that should not be
#  duplicated within a seller's catalog. May not be modified after the
#  definition has been created.
    attr_reader :enforce_uniqueness
  # @return [OpenStruct] Additional properties unmapped to the current class definition
    attr_reader :additional_properties
  # @return [Object] 
    attr_reader :_field_set
    protected :_field_set

    OMIT = Object.new

    # @param enforce_uniqueness [Boolean] If true, each Custom Attribute instance associated with this Custom Attribute
#  Definition must have a unique value within the seller's catalog. For
#  example, this may be used for a value like a SKU that should not be
#  duplicated within a seller's catalog. May not be modified after the
#  definition has been created.
    # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
    # @return [SquareApiClient::CatalogCustomAttributeDefinitionStringConfig]
    def initialize(enforce_uniqueness: OMIT, additional_properties: nil)
      @enforce_uniqueness = enforce_uniqueness if enforce_uniqueness != OMIT
      @additional_properties = additional_properties
      @_field_set = { "enforce_uniqueness": enforce_uniqueness }.reject do | _k, v |
  v == OMIT
end
    end
# Deserialize a JSON object to an instance of
#  CatalogCustomAttributeDefinitionStringConfig
    #
    # @param json_object [String] 
    # @return [SquareApiClient::CatalogCustomAttributeDefinitionStringConfig]
    def self.from_json(json_object:)
      struct = JSON.parse(json_object, object_class: OpenStruct)
      parsed_json = JSON.parse(json_object)
      enforce_uniqueness = parsed_json["enforce_uniqueness"]
      new(enforce_uniqueness: enforce_uniqueness, additional_properties: struct)
    end
# Serialize an instance of CatalogCustomAttributeDefinitionStringConfig to a JSON
#  object
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
      obj.enforce_uniqueness&.is_a?(Boolean) != false || raise("Passed value for field obj.enforce_uniqueness is not the expected type, validation failed.")
    end
  end
end