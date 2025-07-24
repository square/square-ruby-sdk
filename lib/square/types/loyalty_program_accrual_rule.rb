# frozen_string_literal: true
require_relative "loyalty_program_accrual_rule_type"
require_relative "loyalty_program_accrual_rule_visit_data"
require_relative "loyalty_program_accrual_rule_spend_data"
require_relative "loyalty_program_accrual_rule_item_variation_data"
require_relative "loyalty_program_accrual_rule_category_data"
require "ostruct"
require "json"

module square.rb
# Represents an accrual rule, which defines how buyers can earn points from the
#  base [loyalty program](entity:LoyaltyProgram).
  class LoyaltyProgramAccrualRule
  # @return [square.rb::LoyaltyProgramAccrualRuleType] The type of the accrual rule that defines how buyers can earn points.
#  See [LoyaltyProgramAccrualRuleType](#type-loyaltyprogramaccrualruletype) for
#  possible values
    attr_reader :accrual_type
  # @return [Integer] The number of points that
#  buyers earn based on the `accrual_type`.
    attr_reader :points
  # @return [square.rb::LoyaltyProgramAccrualRuleVisitData] Additional data for rules with the `VISIT` accrual type.
    attr_reader :visit_data
  # @return [square.rb::LoyaltyProgramAccrualRuleSpendData] Additional data for rules with the `SPEND` accrual type.
    attr_reader :spend_data
  # @return [square.rb::LoyaltyProgramAccrualRuleItemVariationData] Additional data for rules with the `ITEM_VARIATION` accrual type.
    attr_reader :item_variation_data
  # @return [square.rb::LoyaltyProgramAccrualRuleCategoryData] Additional data for rules with the `CATEGORY` accrual type.
    attr_reader :category_data
  # @return [OpenStruct] Additional properties unmapped to the current class definition
    attr_reader :additional_properties
  # @return [Object] 
    attr_reader :_field_set
    protected :_field_set

    OMIT = Object.new

    # @param accrual_type [square.rb::LoyaltyProgramAccrualRuleType] The type of the accrual rule that defines how buyers can earn points.
#  See [LoyaltyProgramAccrualRuleType](#type-loyaltyprogramaccrualruletype) for
#  possible values
    # @param points [Integer] The number of points that
#  buyers earn based on the `accrual_type`.
    # @param visit_data [square.rb::LoyaltyProgramAccrualRuleVisitData] Additional data for rules with the `VISIT` accrual type.
    # @param spend_data [square.rb::LoyaltyProgramAccrualRuleSpendData] Additional data for rules with the `SPEND` accrual type.
    # @param item_variation_data [square.rb::LoyaltyProgramAccrualRuleItemVariationData] Additional data for rules with the `ITEM_VARIATION` accrual type.
    # @param category_data [square.rb::LoyaltyProgramAccrualRuleCategoryData] Additional data for rules with the `CATEGORY` accrual type.
    # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
    # @return [square.rb::LoyaltyProgramAccrualRule]
    def initialize(accrual_type:, points: OMIT, visit_data: OMIT, spend_data: OMIT, item_variation_data: OMIT, category_data: OMIT, additional_properties: nil)
      @accrual_type = accrual_type
      @points = points if points != OMIT
      @visit_data = visit_data if visit_data != OMIT
      @spend_data = spend_data if spend_data != OMIT
      @item_variation_data = item_variation_data if item_variation_data != OMIT
      @category_data = category_data if category_data != OMIT
      @additional_properties = additional_properties
      @_field_set = { "accrual_type": accrual_type, "points": points, "visit_data": visit_data, "spend_data": spend_data, "item_variation_data": item_variation_data, "category_data": category_data }.reject do | _k, v |
  v == OMIT
end
    end
# Deserialize a JSON object to an instance of LoyaltyProgramAccrualRule
    #
    # @param json_object [String] 
    # @return [square.rb::LoyaltyProgramAccrualRule]
    def self.from_json(json_object:)
      struct = JSON.parse(json_object, object_class: OpenStruct)
      parsed_json = JSON.parse(json_object)
      accrual_type = parsed_json["accrual_type"]
      points = parsed_json["points"]
      unless parsed_json["visit_data"].nil?
        visit_data = parsed_json["visit_data"].to_json
        visit_data = square.rb::LoyaltyProgramAccrualRuleVisitData.from_json(json_object: visit_data)
      else
        visit_data = nil
      end
      unless parsed_json["spend_data"].nil?
        spend_data = parsed_json["spend_data"].to_json
        spend_data = square.rb::LoyaltyProgramAccrualRuleSpendData.from_json(json_object: spend_data)
      else
        spend_data = nil
      end
      unless parsed_json["item_variation_data"].nil?
        item_variation_data = parsed_json["item_variation_data"].to_json
        item_variation_data = square.rb::LoyaltyProgramAccrualRuleItemVariationData.from_json(json_object: item_variation_data)
      else
        item_variation_data = nil
      end
      unless parsed_json["category_data"].nil?
        category_data = parsed_json["category_data"].to_json
        category_data = square.rb::LoyaltyProgramAccrualRuleCategoryData.from_json(json_object: category_data)
      else
        category_data = nil
      end
      new(
        accrual_type: accrual_type,
        points: points,
        visit_data: visit_data,
        spend_data: spend_data,
        item_variation_data: item_variation_data,
        category_data: category_data,
        additional_properties: struct
      )
    end
# Serialize an instance of LoyaltyProgramAccrualRule to a JSON object
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
      obj.accrual_type.is_a?(square.rb::LoyaltyProgramAccrualRuleType) != false || raise("Passed value for field obj.accrual_type is not the expected type, validation failed.")
      obj.points&.is_a?(Integer) != false || raise("Passed value for field obj.points is not the expected type, validation failed.")
      obj.visit_data.nil? || square.rb::LoyaltyProgramAccrualRuleVisitData.validate_raw(obj: obj.visit_data)
      obj.spend_data.nil? || square.rb::LoyaltyProgramAccrualRuleSpendData.validate_raw(obj: obj.spend_data)
      obj.item_variation_data.nil? || square.rb::LoyaltyProgramAccrualRuleItemVariationData.validate_raw(obj: obj.item_variation_data)
      obj.category_data.nil? || square.rb::LoyaltyProgramAccrualRuleCategoryData.validate_raw(obj: obj.category_data)
    end
  end
end