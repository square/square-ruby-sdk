# frozen_string_literal: true
require_relative "money"
require_relative "loyalty_program_accrual_rule_tax_mode"
require "ostruct"
require "json"

module square.rb
# Represents additional data for rules with the `VISIT` accrual type.
  class LoyaltyProgramAccrualRuleVisitData
  # @return [square.rb::Money] The minimum purchase required during the visit to quality for points.
    attr_reader :minimum_amount_money
  # @return [square.rb::LoyaltyProgramAccrualRuleTaxMode] Indicates how taxes should be treated when calculating the purchase amount to
#  determine whether the visit qualifies for points.
#  This setting applies only if `minimum_amount_money` is specified.
#  See [LoyaltyProgramAccrualRuleTaxMode](#type-loyaltyprogramaccrualruletaxmode)
#  for possible values
    attr_reader :tax_mode
  # @return [OpenStruct] Additional properties unmapped to the current class definition
    attr_reader :additional_properties
  # @return [Object] 
    attr_reader :_field_set
    protected :_field_set

    OMIT = Object.new

    # @param minimum_amount_money [square.rb::Money] The minimum purchase required during the visit to quality for points.
    # @param tax_mode [square.rb::LoyaltyProgramAccrualRuleTaxMode] Indicates how taxes should be treated when calculating the purchase amount to
#  determine whether the visit qualifies for points.
#  This setting applies only if `minimum_amount_money` is specified.
#  See [LoyaltyProgramAccrualRuleTaxMode](#type-loyaltyprogramaccrualruletaxmode)
#  for possible values
    # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
    # @return [square.rb::LoyaltyProgramAccrualRuleVisitData]
    def initialize(minimum_amount_money: OMIT, tax_mode:, additional_properties: nil)
      @minimum_amount_money = minimum_amount_money if minimum_amount_money != OMIT
      @tax_mode = tax_mode
      @additional_properties = additional_properties
      @_field_set = { "minimum_amount_money": minimum_amount_money, "tax_mode": tax_mode }.reject do | _k, v |
  v == OMIT
end
    end
# Deserialize a JSON object to an instance of LoyaltyProgramAccrualRuleVisitData
    #
    # @param json_object [String] 
    # @return [square.rb::LoyaltyProgramAccrualRuleVisitData]
    def self.from_json(json_object:)
      struct = JSON.parse(json_object, object_class: OpenStruct)
      parsed_json = JSON.parse(json_object)
      unless parsed_json["minimum_amount_money"].nil?
        minimum_amount_money = parsed_json["minimum_amount_money"].to_json
        minimum_amount_money = square.rb::Money.from_json(json_object: minimum_amount_money)
      else
        minimum_amount_money = nil
      end
      tax_mode = parsed_json["tax_mode"]
      new(
        minimum_amount_money: minimum_amount_money,
        tax_mode: tax_mode,
        additional_properties: struct
      )
    end
# Serialize an instance of LoyaltyProgramAccrualRuleVisitData to a JSON object
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
      obj.minimum_amount_money.nil? || square.rb::Money.validate_raw(obj: obj.minimum_amount_money)
      obj.tax_mode.is_a?(square.rb::LoyaltyProgramAccrualRuleTaxMode) != false || raise("Passed value for field obj.tax_mode is not the expected type, validation failed.")
    end
  end
end