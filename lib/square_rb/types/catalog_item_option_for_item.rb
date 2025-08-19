# frozen_string_literal: true
require "ostruct"
require "json"

module SquareApiClient
# An option that can be assigned to an item.
#  For example, a t-shirt item may offer a color option or a size option.
  class CatalogItemOptionForItem
  # @return [String] The unique id of the item option, used to form the dimensions of the item option
#  matrix in a specified order.
    attr_reader :item_option_id
  # @return [OpenStruct] Additional properties unmapped to the current class definition
    attr_reader :additional_properties
  # @return [Object] 
    attr_reader :_field_set
    protected :_field_set

    OMIT = Object.new

    # @param item_option_id [String] The unique id of the item option, used to form the dimensions of the item option
#  matrix in a specified order.
    # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
    # @return [SquareApiClient::CatalogItemOptionForItem]
    def initialize(item_option_id: OMIT, additional_properties: nil)
      @item_option_id = item_option_id if item_option_id != OMIT
      @additional_properties = additional_properties
      @_field_set = { "item_option_id": item_option_id }.reject do | _k, v |
  v == OMIT
end
    end
# Deserialize a JSON object to an instance of CatalogItemOptionForItem
    #
    # @param json_object [String] 
    # @return [SquareApiClient::CatalogItemOptionForItem]
    def self.from_json(json_object:)
      struct = JSON.parse(json_object, object_class: OpenStruct)
      parsed_json = JSON.parse(json_object)
      item_option_id = parsed_json["item_option_id"]
      new(item_option_id: item_option_id, additional_properties: struct)
    end
# Serialize an instance of CatalogItemOptionForItem to a JSON object
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
      obj.item_option_id&.is_a?(String) != false || raise("Passed value for field obj.item_option_id is not the expected type, validation failed.")
    end
  end
end