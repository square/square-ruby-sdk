# frozen_string_literal: true
require_relative "money"
require_relative "loyalty_program_accrual_rule_tax_mode"
require "ostruct"
require "json"

module SquareApiClient
# Represents additional data for rules with the `SPEND` accrual type.
  class LoyaltyProgramAccrualRuleSpendData
  # @return [SquareApiClient::Money] The amount that buyers must spend to earn points.
#  For example, given an "Earn 1 point for every $10 spent" accrual rule, a buyer
#  who spends $105 earns 10 points.
    attr_reader :amount_money
  # @return [Array<String>] The IDs of any `CATEGORY` catalog objects that are excluded from points accrual.
#  You can use the
#  [BatchRetrieveCatalogObjects](api-endpoint:Catalog-BatchRetrieveCatalogObjects)
#  endpoint to retrieve information about the excluded categories.
    attr_reader :excluded_category_ids
  # @return [Array<String>] The IDs of any `ITEM_VARIATION` catalog objects that are excluded from points
#  accrual.
#  You can use the
#  [BatchRetrieveCatalogObjects](api-endpoint:Catalog-BatchRetrieveCatalogObjects)
#  endpoint to retrieve information about the excluded item variations.
    attr_reader :excluded_item_variation_ids
  # @return [SquareApiClient::LoyaltyProgramAccrualRuleTaxMode] Indicates how taxes should be treated when calculating the purchase amount used
#  for points accrual.
#  See [LoyaltyProgramAccrualRuleTaxMode](#type-loyaltyprogramaccrualruletaxmode)
#  for possible values
    attr_reader :tax_mode
  # @return [OpenStruct] Additional properties unmapped to the current class definition
    attr_reader :additional_properties
  # @return [Object] 
    attr_reader :_field_set
    protected :_field_set

    OMIT = Object.new

    # @param amount_money [SquareApiClient::Money] The amount that buyers must spend to earn points.
#  For example, given an "Earn 1 point for every $10 spent" accrual rule, a buyer
#  who spends $105 earns 10 points.
    # @param excluded_category_ids [Array<String>] The IDs of any `CATEGORY` catalog objects that are excluded from points accrual.
#  You can use the
#  [BatchRetrieveCatalogObjects](api-endpoint:Catalog-BatchRetrieveCatalogObjects)
#  endpoint to retrieve information about the excluded categories.
    # @param excluded_item_variation_ids [Array<String>] The IDs of any `ITEM_VARIATION` catalog objects that are excluded from points
#  accrual.
#  You can use the
#  [BatchRetrieveCatalogObjects](api-endpoint:Catalog-BatchRetrieveCatalogObjects)
#  endpoint to retrieve information about the excluded item variations.
    # @param tax_mode [SquareApiClient::LoyaltyProgramAccrualRuleTaxMode] Indicates how taxes should be treated when calculating the purchase amount used
#  for points accrual.
#  See [LoyaltyProgramAccrualRuleTaxMode](#type-loyaltyprogramaccrualruletaxmode)
#  for possible values
    # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
    # @return [SquareApiClient::LoyaltyProgramAccrualRuleSpendData]
    def initialize(amount_money:, excluded_category_ids: OMIT, excluded_item_variation_ids: OMIT, tax_mode:, additional_properties: nil)
      @amount_money = amount_money
      @excluded_category_ids = excluded_category_ids if excluded_category_ids != OMIT
      @excluded_item_variation_ids = excluded_item_variation_ids if excluded_item_variation_ids != OMIT
      @tax_mode = tax_mode
      @additional_properties = additional_properties
      @_field_set = { "amount_money": amount_money, "excluded_category_ids": excluded_category_ids, "excluded_item_variation_ids": excluded_item_variation_ids, "tax_mode": tax_mode }.reject do | _k, v |
  v == OMIT
end
    end
# Deserialize a JSON object to an instance of LoyaltyProgramAccrualRuleSpendData
    #
    # @param json_object [String] 
    # @return [SquareApiClient::LoyaltyProgramAccrualRuleSpendData]
    def self.from_json(json_object:)
      struct = JSON.parse(json_object, object_class: OpenStruct)
      parsed_json = JSON.parse(json_object)
      unless parsed_json["amount_money"].nil?
        amount_money = parsed_json["amount_money"].to_json
        amount_money = SquareApiClient::Money.from_json(json_object: amount_money)
      else
        amount_money = nil
      end
      excluded_category_ids = parsed_json["excluded_category_ids"]
      excluded_item_variation_ids = parsed_json["excluded_item_variation_ids"]
      tax_mode = parsed_json["tax_mode"]
      new(
        amount_money: amount_money,
        excluded_category_ids: excluded_category_ids,
        excluded_item_variation_ids: excluded_item_variation_ids,
        tax_mode: tax_mode,
        additional_properties: struct
      )
    end
# Serialize an instance of LoyaltyProgramAccrualRuleSpendData to a JSON object
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
      SquareApiClient::Money.validate_raw(obj: obj.amount_money)
      obj.excluded_category_ids&.is_a?(Array) != false || raise("Passed value for field obj.excluded_category_ids is not the expected type, validation failed.")
      obj.excluded_item_variation_ids&.is_a?(Array) != false || raise("Passed value for field obj.excluded_item_variation_ids is not the expected type, validation failed.")
      obj.tax_mode.is_a?(SquareApiClient::LoyaltyProgramAccrualRuleTaxMode) != false || raise("Passed value for field obj.tax_mode is not the expected type, validation failed.")
    end
  end
end