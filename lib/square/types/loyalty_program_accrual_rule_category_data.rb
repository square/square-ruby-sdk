# frozen_string_literal: true
require "ostruct"
require "json"

module SquareApiClient
# Represents additional data for rules with the `CATEGORY` accrual type.
  class LoyaltyProgramAccrualRuleCategoryData
  # @return [String] The ID of the `CATEGORY` [catalog object](entity:CatalogObject) that buyers can
#  purchase to earn
#  points.
    attr_reader :category_id
  # @return [OpenStruct] Additional properties unmapped to the current class definition
    attr_reader :additional_properties
  # @return [Object] 
    attr_reader :_field_set
    protected :_field_set

    OMIT = Object.new

    # @param category_id [String] The ID of the `CATEGORY` [catalog object](entity:CatalogObject) that buyers can
#  purchase to earn
#  points.
    # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
    # @return [SquareApiClient::LoyaltyProgramAccrualRuleCategoryData]
    def initialize(category_id:, additional_properties: nil)
      @category_id = category_id
      @additional_properties = additional_properties
      @_field_set = { "category_id": category_id }
    end
# Deserialize a JSON object to an instance of
#  LoyaltyProgramAccrualRuleCategoryData
    #
    # @param json_object [String] 
    # @return [SquareApiClient::LoyaltyProgramAccrualRuleCategoryData]
    def self.from_json(json_object:)
      struct = JSON.parse(json_object, object_class: OpenStruct)
      parsed_json = JSON.parse(json_object)
      category_id = parsed_json["category_id"]
      new(category_id: category_id, additional_properties: struct)
    end
# Serialize an instance of LoyaltyProgramAccrualRuleCategoryData to a JSON object
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
      obj.category_id.is_a?(String) != false || raise("Passed value for field obj.category_id is not the expected type, validation failed.")
    end
  end
end