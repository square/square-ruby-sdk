# frozen_string_literal: true
require "ostruct"
require "json"

module SquareApiClient
# The query filter to return the search result by exact match of the specified
#  attribute name and value.
  class CatalogQueryExact
  # @return [String] The name of the attribute to be searched. Matching of the attribute name is
#  exact.
    attr_reader :attribute_name
  # @return [String] The desired value of the search attribute. Matching of the attribute value is
#  case insensitive and can be partial.
#  For example, if a specified value of "sma", objects with the named attribute
#  value of "Small", "small" are both matched.
    attr_reader :attribute_value
  # @return [OpenStruct] Additional properties unmapped to the current class definition
    attr_reader :additional_properties
  # @return [Object] 
    attr_reader :_field_set
    protected :_field_set

    OMIT = Object.new

    # @param attribute_name [String] The name of the attribute to be searched. Matching of the attribute name is
#  exact.
    # @param attribute_value [String] The desired value of the search attribute. Matching of the attribute value is
#  case insensitive and can be partial.
#  For example, if a specified value of "sma", objects with the named attribute
#  value of "Small", "small" are both matched.
    # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
    # @return [SquareApiClient::CatalogQueryExact]
    def initialize(attribute_name:, attribute_value:, additional_properties: nil)
      @attribute_name = attribute_name
      @attribute_value = attribute_value
      @additional_properties = additional_properties
      @_field_set = { "attribute_name": attribute_name, "attribute_value": attribute_value }
    end
# Deserialize a JSON object to an instance of CatalogQueryExact
    #
    # @param json_object [String] 
    # @return [SquareApiClient::CatalogQueryExact]
    def self.from_json(json_object:)
      struct = JSON.parse(json_object, object_class: OpenStruct)
      parsed_json = JSON.parse(json_object)
      attribute_name = parsed_json["attribute_name"]
      attribute_value = parsed_json["attribute_value"]
      new(
        attribute_name: attribute_name,
        attribute_value: attribute_value,
        additional_properties: struct
      )
    end
# Serialize an instance of CatalogQueryExact to a JSON object
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
      obj.attribute_value.is_a?(String) != false || raise("Passed value for field obj.attribute_value is not the expected type, validation failed.")
    end
  end
end