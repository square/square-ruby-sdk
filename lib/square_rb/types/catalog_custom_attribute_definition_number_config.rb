# frozen_string_literal: true
require "ostruct"
require "json"

module SquareApiClient
  class CatalogCustomAttributeDefinitionNumberConfig
  # @return [Integer] An integer between 0 and 5 that represents the maximum number of
#  positions allowed after the decimal in number custom attribute values
#  For example:
#  - if the precision is 0, the quantity can be 1, 2, 3, etc.
#  - if the precision is 1, the quantity can be 0.1, 0.2, etc.
#  - if the precision is 2, the quantity can be 0.01, 0.12, etc.
#  Default: 5
    attr_reader :precision
  # @return [OpenStruct] Additional properties unmapped to the current class definition
    attr_reader :additional_properties
  # @return [Object] 
    attr_reader :_field_set
    protected :_field_set

    OMIT = Object.new

    # @param precision [Integer] An integer between 0 and 5 that represents the maximum number of
#  positions allowed after the decimal in number custom attribute values
#  For example:
#  - if the precision is 0, the quantity can be 1, 2, 3, etc.
#  - if the precision is 1, the quantity can be 0.1, 0.2, etc.
#  - if the precision is 2, the quantity can be 0.01, 0.12, etc.
#  Default: 5
    # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
    # @return [SquareApiClient::CatalogCustomAttributeDefinitionNumberConfig]
    def initialize(precision: OMIT, additional_properties: nil)
      @precision = precision if precision != OMIT
      @additional_properties = additional_properties
      @_field_set = { "precision": precision }.reject do | _k, v |
  v == OMIT
end
    end
# Deserialize a JSON object to an instance of
#  CatalogCustomAttributeDefinitionNumberConfig
    #
    # @param json_object [String] 
    # @return [SquareApiClient::CatalogCustomAttributeDefinitionNumberConfig]
    def self.from_json(json_object:)
      struct = JSON.parse(json_object, object_class: OpenStruct)
      parsed_json = JSON.parse(json_object)
      precision = parsed_json["precision"]
      new(precision: precision, additional_properties: struct)
    end
# Serialize an instance of CatalogCustomAttributeDefinitionNumberConfig to a JSON
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
      obj.precision&.is_a?(Integer) != false || raise("Passed value for field obj.precision is not the expected type, validation failed.")
    end
  end
end