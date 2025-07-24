# frozen_string_literal: true
require "ostruct"
require "json"

module SquareApiClient
# The query filter to return the item variations containing the specified item
#  option value IDs.
  class CatalogQueryItemVariationsForItemOptionValues
  # @return [Array<String>] A set of `CatalogItemOptionValue` IDs to be used to find associated
#  `CatalogItemVariation`s. All ItemVariations that contain all of the given
#  Item Option Values (in any order) will be returned.
    attr_reader :item_option_value_ids
  # @return [OpenStruct] Additional properties unmapped to the current class definition
    attr_reader :additional_properties
  # @return [Object] 
    attr_reader :_field_set
    protected :_field_set

    OMIT = Object.new

    # @param item_option_value_ids [Array<String>] A set of `CatalogItemOptionValue` IDs to be used to find associated
#  `CatalogItemVariation`s. All ItemVariations that contain all of the given
#  Item Option Values (in any order) will be returned.
    # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
    # @return [SquareApiClient::CatalogQueryItemVariationsForItemOptionValues]
    def initialize(item_option_value_ids: OMIT, additional_properties: nil)
      @item_option_value_ids = item_option_value_ids if item_option_value_ids != OMIT
      @additional_properties = additional_properties
      @_field_set = { "item_option_value_ids": item_option_value_ids }.reject do | _k, v |
  v == OMIT
end
    end
# Deserialize a JSON object to an instance of
#  CatalogQueryItemVariationsForItemOptionValues
    #
    # @param json_object [String] 
    # @return [SquareApiClient::CatalogQueryItemVariationsForItemOptionValues]
    def self.from_json(json_object:)
      struct = JSON.parse(json_object, object_class: OpenStruct)
      parsed_json = JSON.parse(json_object)
      item_option_value_ids = parsed_json["item_option_value_ids"]
      new(item_option_value_ids: item_option_value_ids, additional_properties: struct)
    end
# Serialize an instance of CatalogQueryItemVariationsForItemOptionValues to a JSON
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
      obj.item_option_value_ids&.is_a?(Array) != false || raise("Passed value for field obj.item_option_value_ids is not the expected type, validation failed.")
    end
  end
end