# frozen_string_literal: true
require "ostruct"
require "json"

module square.rb
# Represents additional data for rules with the `ITEM_VARIATION` accrual type.
  class LoyaltyProgramAccrualRuleItemVariationData
  # @return [String] The ID of the `ITEM_VARIATION` [catalog object](entity:CatalogObject) that
#  buyers can purchase to earn
#  points.
    attr_reader :item_variation_id
  # @return [OpenStruct] Additional properties unmapped to the current class definition
    attr_reader :additional_properties
  # @return [Object] 
    attr_reader :_field_set
    protected :_field_set

    OMIT = Object.new

    # @param item_variation_id [String] The ID of the `ITEM_VARIATION` [catalog object](entity:CatalogObject) that
#  buyers can purchase to earn
#  points.
    # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
    # @return [square.rb::LoyaltyProgramAccrualRuleItemVariationData]
    def initialize(item_variation_id:, additional_properties: nil)
      @item_variation_id = item_variation_id
      @additional_properties = additional_properties
      @_field_set = { "item_variation_id": item_variation_id }
    end
# Deserialize a JSON object to an instance of
#  LoyaltyProgramAccrualRuleItemVariationData
    #
    # @param json_object [String] 
    # @return [square.rb::LoyaltyProgramAccrualRuleItemVariationData]
    def self.from_json(json_object:)
      struct = JSON.parse(json_object, object_class: OpenStruct)
      parsed_json = JSON.parse(json_object)
      item_variation_id = parsed_json["item_variation_id"]
      new(item_variation_id: item_variation_id, additional_properties: struct)
    end
# Serialize an instance of LoyaltyProgramAccrualRuleItemVariationData to a JSON
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
      obj.item_variation_id.is_a?(String) != false || raise("Passed value for field obj.item_variation_id is not the expected type, validation failed.")
    end
  end
end