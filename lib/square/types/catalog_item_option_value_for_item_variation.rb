# frozen_string_literal: true
require "ostruct"
require "json"

module square.rb
# A `CatalogItemOptionValue` links an item variation to an item option as
#  an item option value. For example, a t-shirt item may offer a color option and
#  a size option. An item option value would represent each variation of t-shirt:
#  For example, "Color:Red, Size:Small" or "Color:Blue, Size:Medium".
  class CatalogItemOptionValueForItemVariation
  # @return [String] The unique id of an item option.
    attr_reader :item_option_id
  # @return [String] The unique id of the selected value for the item option.
    attr_reader :item_option_value_id
  # @return [OpenStruct] Additional properties unmapped to the current class definition
    attr_reader :additional_properties
  # @return [Object] 
    attr_reader :_field_set
    protected :_field_set

    OMIT = Object.new

    # @param item_option_id [String] The unique id of an item option.
    # @param item_option_value_id [String] The unique id of the selected value for the item option.
    # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
    # @return [square.rb::CatalogItemOptionValueForItemVariation]
    def initialize(item_option_id: OMIT, item_option_value_id: OMIT, additional_properties: nil)
      @item_option_id = item_option_id if item_option_id != OMIT
      @item_option_value_id = item_option_value_id if item_option_value_id != OMIT
      @additional_properties = additional_properties
      @_field_set = { "item_option_id": item_option_id, "item_option_value_id": item_option_value_id }.reject do | _k, v |
  v == OMIT
end
    end
# Deserialize a JSON object to an instance of
#  CatalogItemOptionValueForItemVariation
    #
    # @param json_object [String] 
    # @return [square.rb::CatalogItemOptionValueForItemVariation]
    def self.from_json(json_object:)
      struct = JSON.parse(json_object, object_class: OpenStruct)
      parsed_json = JSON.parse(json_object)
      item_option_id = parsed_json["item_option_id"]
      item_option_value_id = parsed_json["item_option_value_id"]
      new(
        item_option_id: item_option_id,
        item_option_value_id: item_option_value_id,
        additional_properties: struct
      )
    end
# Serialize an instance of CatalogItemOptionValueForItemVariation to a JSON object
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
      obj.item_option_value_id&.is_a?(String) != false || raise("Passed value for field obj.item_option_value_id is not the expected type, validation failed.")
    end
  end
end