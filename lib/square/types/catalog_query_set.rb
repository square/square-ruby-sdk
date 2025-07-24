# frozen_string_literal: true
require "ostruct"
require "json"

module square.rb
# The query filter to return the search result(s) by exact match of the specified
#  `attribute_name` and any of
#  the `attribute_values`.
  class CatalogQuerySet
  # @return [String] The name of the attribute to be searched. Matching of the attribute name is
#  exact.
    attr_reader :attribute_name
  # @return [Array<String>] The desired values of the search attribute. Matching of the attribute values is
#  exact and case insensitive.
#  A maximum of 250 values may be searched in a request.
    attr_reader :attribute_values
  # @return [OpenStruct] Additional properties unmapped to the current class definition
    attr_reader :additional_properties
  # @return [Object] 
    attr_reader :_field_set
    protected :_field_set

    OMIT = Object.new

    # @param attribute_name [String] The name of the attribute to be searched. Matching of the attribute name is
#  exact.
    # @param attribute_values [Array<String>] The desired values of the search attribute. Matching of the attribute values is
#  exact and case insensitive.
#  A maximum of 250 values may be searched in a request.
    # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
    # @return [square.rb::CatalogQuerySet]
    def initialize(attribute_name:, attribute_values:, additional_properties: nil)
      @attribute_name = attribute_name
      @attribute_values = attribute_values
      @additional_properties = additional_properties
      @_field_set = { "attribute_name": attribute_name, "attribute_values": attribute_values }
    end
# Deserialize a JSON object to an instance of CatalogQuerySet
    #
    # @param json_object [String] 
    # @return [square.rb::CatalogQuerySet]
    def self.from_json(json_object:)
      struct = JSON.parse(json_object, object_class: OpenStruct)
      parsed_json = JSON.parse(json_object)
      attribute_name = parsed_json["attribute_name"]
      attribute_values = parsed_json["attribute_values"]
      new(
        attribute_name: attribute_name,
        attribute_values: attribute_values,
        additional_properties: struct
      )
    end
# Serialize an instance of CatalogQuerySet to a JSON object
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
      obj.attribute_values.is_a?(Array) != false || raise("Passed value for field obj.attribute_values is not the expected type, validation failed.")
    end
  end
end