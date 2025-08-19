# frozen_string_literal: true
require "ostruct"
require "json"

module SquareApiClient
# The query filter to return the search result whose named attribute values fall
#  between the specified range.
  class CatalogQueryRange
  # @return [String] The name of the attribute to be searched.
    attr_reader :attribute_name
  # @return [Long] The desired minimum value for the search attribute (inclusive).
    attr_reader :attribute_min_value
  # @return [Long] The desired maximum value for the search attribute (inclusive).
    attr_reader :attribute_max_value
  # @return [OpenStruct] Additional properties unmapped to the current class definition
    attr_reader :additional_properties
  # @return [Object] 
    attr_reader :_field_set
    protected :_field_set

    OMIT = Object.new

    # @param attribute_name [String] The name of the attribute to be searched.
    # @param attribute_min_value [Long] The desired minimum value for the search attribute (inclusive).
    # @param attribute_max_value [Long] The desired maximum value for the search attribute (inclusive).
    # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
    # @return [SquareApiClient::CatalogQueryRange]
    def initialize(attribute_name:, attribute_min_value: OMIT, attribute_max_value: OMIT, additional_properties: nil)
      @attribute_name = attribute_name
      @attribute_min_value = attribute_min_value if attribute_min_value != OMIT
      @attribute_max_value = attribute_max_value if attribute_max_value != OMIT
      @additional_properties = additional_properties
      @_field_set = { "attribute_name": attribute_name, "attribute_min_value": attribute_min_value, "attribute_max_value": attribute_max_value }.reject do | _k, v |
  v == OMIT
end
    end
# Deserialize a JSON object to an instance of CatalogQueryRange
    #
    # @param json_object [String] 
    # @return [SquareApiClient::CatalogQueryRange]
    def self.from_json(json_object:)
      struct = JSON.parse(json_object, object_class: OpenStruct)
      parsed_json = JSON.parse(json_object)
      attribute_name = parsed_json["attribute_name"]
      attribute_min_value = parsed_json["attribute_min_value"]
      attribute_max_value = parsed_json["attribute_max_value"]
      new(
        attribute_name: attribute_name,
        attribute_min_value: attribute_min_value,
        attribute_max_value: attribute_max_value,
        additional_properties: struct
      )
    end
# Serialize an instance of CatalogQueryRange to a JSON object
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
      obj.attribute_min_value&.is_a?(Long) != false || raise("Passed value for field obj.attribute_min_value is not the expected type, validation failed.")
      obj.attribute_max_value&.is_a?(Long) != false || raise("Passed value for field obj.attribute_max_value is not the expected type, validation failed.")
    end
  end
end