# frozen_string_literal: true
require_relative "catalog_custom_attribute_definition_selection_config_custom_attribute_selection"
require "ostruct"
require "json"

module SquareApiClient
# Configuration associated with `SELECTION`-type custom attribute definitions.
  class CatalogCustomAttributeDefinitionSelectionConfig
  # @return [Integer] The maximum number of selections that can be set. The maximum value for this
#  attribute is 100. The default value is 1. The value can be modified, but
#  changing the value will not
#  affect existing custom attribute values on objects. Clients need to
#  handle custom attributes with more selected values than allowed by this limit.
    attr_reader :max_allowed_selections
  # @return [Array<SquareApiClient::CatalogCustomAttributeDefinitionSelectionConfigCustomAttributeSelection>] The set of valid `CatalogCustomAttributeSelections`. Up to a maximum of 100
#  selections can be defined. Can be modified.
    attr_reader :allowed_selections
  # @return [OpenStruct] Additional properties unmapped to the current class definition
    attr_reader :additional_properties
  # @return [Object] 
    attr_reader :_field_set
    protected :_field_set

    OMIT = Object.new

    # @param max_allowed_selections [Integer] The maximum number of selections that can be set. The maximum value for this
#  attribute is 100. The default value is 1. The value can be modified, but
#  changing the value will not
#  affect existing custom attribute values on objects. Clients need to
#  handle custom attributes with more selected values than allowed by this limit.
    # @param allowed_selections [Array<SquareApiClient::CatalogCustomAttributeDefinitionSelectionConfigCustomAttributeSelection>] The set of valid `CatalogCustomAttributeSelections`. Up to a maximum of 100
#  selections can be defined. Can be modified.
    # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
    # @return [SquareApiClient::CatalogCustomAttributeDefinitionSelectionConfig]
    def initialize(max_allowed_selections: OMIT, allowed_selections: OMIT, additional_properties: nil)
      @max_allowed_selections = max_allowed_selections if max_allowed_selections != OMIT
      @allowed_selections = allowed_selections if allowed_selections != OMIT
      @additional_properties = additional_properties
      @_field_set = { "max_allowed_selections": max_allowed_selections, "allowed_selections": allowed_selections }.reject do | _k, v |
  v == OMIT
end
    end
# Deserialize a JSON object to an instance of
#  CatalogCustomAttributeDefinitionSelectionConfig
    #
    # @param json_object [String] 
    # @return [SquareApiClient::CatalogCustomAttributeDefinitionSelectionConfig]
    def self.from_json(json_object:)
      struct = JSON.parse(json_object, object_class: OpenStruct)
      parsed_json = JSON.parse(json_object)
      max_allowed_selections = parsed_json["max_allowed_selections"]
      allowed_selections = parsed_json["allowed_selections"]&.map do | item |
  item = item.to_json
  SquareApiClient::CatalogCustomAttributeDefinitionSelectionConfigCustomAttributeSelection.from_json(json_object: item)
end
      new(
        max_allowed_selections: max_allowed_selections,
        allowed_selections: allowed_selections,
        additional_properties: struct
      )
    end
# Serialize an instance of CatalogCustomAttributeDefinitionSelectionConfig to a
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
      obj.max_allowed_selections&.is_a?(Integer) != false || raise("Passed value for field obj.max_allowed_selections is not the expected type, validation failed.")
      obj.allowed_selections&.is_a?(Array) != false || raise("Passed value for field obj.allowed_selections is not the expected type, validation failed.")
    end
  end
end