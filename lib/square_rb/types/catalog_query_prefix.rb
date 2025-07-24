# frozen_string_literal: true
require "ostruct"
require "json"

module SquareApiClient
# The query filter to return the search result whose named attribute values are
#  prefixed by the specified attribute value.
  class CatalogQueryPrefix
  # @return [String] The name of the attribute to be searched.
    attr_reader :attribute_name
  # @return [String] The desired prefix of the search attribute value.
    attr_reader :attribute_prefix
  # @return [OpenStruct] Additional properties unmapped to the current class definition
    attr_reader :additional_properties
  # @return [Object] 
    attr_reader :_field_set
    protected :_field_set

    OMIT = Object.new

    # @param attribute_name [String] The name of the attribute to be searched.
    # @param attribute_prefix [String] The desired prefix of the search attribute value.
    # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
    # @return [SquareApiClient::CatalogQueryPrefix]
    def initialize(attribute_name:, attribute_prefix:, additional_properties: nil)
      @attribute_name = attribute_name
      @attribute_prefix = attribute_prefix
      @additional_properties = additional_properties
      @_field_set = { "attribute_name": attribute_name, "attribute_prefix": attribute_prefix }
    end
# Deserialize a JSON object to an instance of CatalogQueryPrefix
    #
    # @param json_object [String] 
    # @return [SquareApiClient::CatalogQueryPrefix]
    def self.from_json(json_object:)
      struct = JSON.parse(json_object, object_class: OpenStruct)
      parsed_json = JSON.parse(json_object)
      attribute_name = parsed_json["attribute_name"]
      attribute_prefix = parsed_json["attribute_prefix"]
      new(
        attribute_name: attribute_name,
        attribute_prefix: attribute_prefix,
        additional_properties: struct
      )
    end
# Serialize an instance of CatalogQueryPrefix to a JSON object
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
      obj.attribute_name.is_a?(String) != false || raise("Passed value for field obj.attribute_name is not the expected type, validation failed.")
      obj.attribute_prefix.is_a?(String) != false || raise("Passed value for field obj.attribute_prefix is not the expected type, validation failed.")
    end
  end
end