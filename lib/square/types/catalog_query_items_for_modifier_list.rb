# frozen_string_literal: true
require "ostruct"
require "json"

module SquareApiClient
# The query filter to return the items containing the specified modifier list IDs.
  class CatalogQueryItemsForModifierList
  # @return [Array<String>] A set of `CatalogModifierList` IDs to be used to find associated `CatalogItem`s.
    attr_reader :modifier_list_ids
  # @return [OpenStruct] Additional properties unmapped to the current class definition
    attr_reader :additional_properties
  # @return [Object] 
    attr_reader :_field_set
    protected :_field_set

    OMIT = Object.new

    # @param modifier_list_ids [Array<String>] A set of `CatalogModifierList` IDs to be used to find associated `CatalogItem`s.
    # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
    # @return [SquareApiClient::CatalogQueryItemsForModifierList]
    def initialize(modifier_list_ids:, additional_properties: nil)
      @modifier_list_ids = modifier_list_ids
      @additional_properties = additional_properties
      @_field_set = { "modifier_list_ids": modifier_list_ids }
    end
# Deserialize a JSON object to an instance of CatalogQueryItemsForModifierList
    #
    # @param json_object [String] 
    # @return [SquareApiClient::CatalogQueryItemsForModifierList]
    def self.from_json(json_object:)
      struct = JSON.parse(json_object, object_class: OpenStruct)
      parsed_json = JSON.parse(json_object)
      modifier_list_ids = parsed_json["modifier_list_ids"]
      new(modifier_list_ids: modifier_list_ids, additional_properties: struct)
    end
# Serialize an instance of CatalogQueryItemsForModifierList to a JSON object
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
      obj.modifier_list_ids.is_a?(Array) != false || raise("Passed value for field obj.modifier_list_ids is not the expected type, validation failed.")
    end
  end
end