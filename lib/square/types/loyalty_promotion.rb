# frozen_string_literal: true
require_relative "loyalty_promotion_incentive"
require_relative "loyalty_promotion_available_time_data"
require_relative "loyalty_promotion_trigger_limit"
require_relative "loyalty_promotion_status"
require_relative "money"
require "ostruct"
require "json"

module square.rb
# Represents a promotion for a [loyalty program](entity:LoyaltyProgram). Loyalty
#  promotions enable buyers
#  to earn extra points on top of those earned from the base program.
#  A loyalty program can have a maximum of 10 loyalty promotions with an `ACTIVE`
#  or `SCHEDULED` status.
  class LoyaltyPromotion
  # @return [String] The Square-assigned ID of the promotion.
    attr_reader :id
  # @return [String] The name of the promotion.
    attr_reader :name
  # @return [square.rb::LoyaltyPromotionIncentive] The points incentive for the promotion. This field defines whether promotion
#  points
#  are earned by multiplying base program points or by adding a specified number of
#  points.
    attr_reader :incentive
  # @return [square.rb::LoyaltyPromotionAvailableTimeData] The scheduling information that defines when purchases can qualify to earn
#  points from an `ACTIVE` promotion.
    attr_reader :available_time
  # @return [square.rb::LoyaltyPromotionTriggerLimit] The number of times a buyer can earn promotion points during a specified
#  interval.
#  If not specified, buyers can trigger the promotion an unlimited number of times.
    attr_reader :trigger_limit
  # @return [square.rb::LoyaltyPromotionStatus] The current status of the promotion.
#  See [LoyaltyPromotionStatus](#type-loyaltypromotionstatus) for possible values
    attr_reader :status
  # @return [String] The timestamp of when the promotion was created, in RFC 3339 format.
    attr_reader :created_at
  # @return [String] The timestamp of when the promotion was canceled, in RFC 3339 format.
    attr_reader :canceled_at
  # @return [String] The timestamp when the promotion was last updated, in RFC 3339 format.
    attr_reader :updated_at
  # @return [String] The ID of the [loyalty program](entity:LoyaltyProgram) associated with the
#  promotion.
    attr_reader :loyalty_program_id
  # @return [square.rb::Money] The minimum purchase amount required to earn promotion points. If specified,
#  this amount is positive.
    attr_reader :minimum_spend_amount_money
  # @return [Array<String>] The IDs of any qualifying `ITEM_VARIATION` [catalog
#  objects](entity:CatalogObject). If specified,
#  the purchase must include at least one of these items to qualify for the
#  promotion.
#  This option is valid only if the base loyalty program uses a `VISIT` or `SPEND`
#  accrual rule.
#  With `SPEND` accrual rules, make sure that qualifying promotional items are not
#  excluded.
#  You can specify `qualifying_item_variation_ids` or `qualifying_category_ids` for
#  a given promotion, but not both.
    attr_reader :qualifying_item_variation_ids
  # @return [Array<String>] The IDs of any qualifying `CATEGORY` [catalog objects](entity:CatalogObject). If
#  specified,
#  the purchase must include at least one item from one of these categories to
#  qualify for the promotion.
#  This option is valid only if the base loyalty program uses a `VISIT` or `SPEND`
#  accrual rule.
#  With `SPEND` accrual rules, make sure that qualifying promotional items are not
#  excluded.
#  You can specify `qualifying_category_ids` or `qualifying_item_variation_ids` for
#  a promotion, but not both.
    attr_reader :qualifying_category_ids
  # @return [OpenStruct] Additional properties unmapped to the current class definition
    attr_reader :additional_properties
  # @return [Object] 
    attr_reader :_field_set
    protected :_field_set

    OMIT = Object.new

    # @param id [String] The Square-assigned ID of the promotion.
    # @param name [String] The name of the promotion.
    # @param incentive [square.rb::LoyaltyPromotionIncentive] The points incentive for the promotion. This field defines whether promotion
#  points
#  are earned by multiplying base program points or by adding a specified number of
#  points.
    # @param available_time [square.rb::LoyaltyPromotionAvailableTimeData] The scheduling information that defines when purchases can qualify to earn
#  points from an `ACTIVE` promotion.
    # @param trigger_limit [square.rb::LoyaltyPromotionTriggerLimit] The number of times a buyer can earn promotion points during a specified
#  interval.
#  If not specified, buyers can trigger the promotion an unlimited number of times.
    # @param status [square.rb::LoyaltyPromotionStatus] The current status of the promotion.
#  See [LoyaltyPromotionStatus](#type-loyaltypromotionstatus) for possible values
    # @param created_at [String] The timestamp of when the promotion was created, in RFC 3339 format.
    # @param canceled_at [String] The timestamp of when the promotion was canceled, in RFC 3339 format.
    # @param updated_at [String] The timestamp when the promotion was last updated, in RFC 3339 format.
    # @param loyalty_program_id [String] The ID of the [loyalty program](entity:LoyaltyProgram) associated with the
#  promotion.
    # @param minimum_spend_amount_money [square.rb::Money] The minimum purchase amount required to earn promotion points. If specified,
#  this amount is positive.
    # @param qualifying_item_variation_ids [Array<String>] The IDs of any qualifying `ITEM_VARIATION` [catalog
#  objects](entity:CatalogObject). If specified,
#  the purchase must include at least one of these items to qualify for the
#  promotion.
#  This option is valid only if the base loyalty program uses a `VISIT` or `SPEND`
#  accrual rule.
#  With `SPEND` accrual rules, make sure that qualifying promotional items are not
#  excluded.
#  You can specify `qualifying_item_variation_ids` or `qualifying_category_ids` for
#  a given promotion, but not both.
    # @param qualifying_category_ids [Array<String>] The IDs of any qualifying `CATEGORY` [catalog objects](entity:CatalogObject). If
#  specified,
#  the purchase must include at least one item from one of these categories to
#  qualify for the promotion.
#  This option is valid only if the base loyalty program uses a `VISIT` or `SPEND`
#  accrual rule.
#  With `SPEND` accrual rules, make sure that qualifying promotional items are not
#  excluded.
#  You can specify `qualifying_category_ids` or `qualifying_item_variation_ids` for
#  a promotion, but not both.
    # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
    # @return [square.rb::LoyaltyPromotion]
    def initialize(id: OMIT, name:, incentive:, available_time:, trigger_limit: OMIT, status: OMIT, created_at: OMIT, canceled_at: OMIT, updated_at: OMIT, loyalty_program_id: OMIT, minimum_spend_amount_money: OMIT, qualifying_item_variation_ids: OMIT, qualifying_category_ids: OMIT, additional_properties: nil)
      @id = id if id != OMIT
      @name = name
      @incentive = incentive
      @available_time = available_time
      @trigger_limit = trigger_limit if trigger_limit != OMIT
      @status = status if status != OMIT
      @created_at = created_at if created_at != OMIT
      @canceled_at = canceled_at if canceled_at != OMIT
      @updated_at = updated_at if updated_at != OMIT
      @loyalty_program_id = loyalty_program_id if loyalty_program_id != OMIT
      @minimum_spend_amount_money = minimum_spend_amount_money if minimum_spend_amount_money != OMIT
      @qualifying_item_variation_ids = qualifying_item_variation_ids if qualifying_item_variation_ids != OMIT
      @qualifying_category_ids = qualifying_category_ids if qualifying_category_ids != OMIT
      @additional_properties = additional_properties
      @_field_set = { "id": id, "name": name, "incentive": incentive, "available_time": available_time, "trigger_limit": trigger_limit, "status": status, "created_at": created_at, "canceled_at": canceled_at, "updated_at": updated_at, "loyalty_program_id": loyalty_program_id, "minimum_spend_amount_money": minimum_spend_amount_money, "qualifying_item_variation_ids": qualifying_item_variation_ids, "qualifying_category_ids": qualifying_category_ids }.reject do | _k, v |
  v == OMIT
end
    end
# Deserialize a JSON object to an instance of LoyaltyPromotion
    #
    # @param json_object [String] 
    # @return [square.rb::LoyaltyPromotion]
    def self.from_json(json_object:)
      struct = JSON.parse(json_object, object_class: OpenStruct)
      parsed_json = JSON.parse(json_object)
      id = parsed_json["id"]
      name = parsed_json["name"]
      unless parsed_json["incentive"].nil?
        incentive = parsed_json["incentive"].to_json
        incentive = square.rb::LoyaltyPromotionIncentive.from_json(json_object: incentive)
      else
        incentive = nil
      end
      unless parsed_json["available_time"].nil?
        available_time = parsed_json["available_time"].to_json
        available_time = square.rb::LoyaltyPromotionAvailableTimeData.from_json(json_object: available_time)
      else
        available_time = nil
      end
      unless parsed_json["trigger_limit"].nil?
        trigger_limit = parsed_json["trigger_limit"].to_json
        trigger_limit = square.rb::LoyaltyPromotionTriggerLimit.from_json(json_object: trigger_limit)
      else
        trigger_limit = nil
      end
      status = parsed_json["status"]
      created_at = parsed_json["created_at"]
      canceled_at = parsed_json["canceled_at"]
      updated_at = parsed_json["updated_at"]
      loyalty_program_id = parsed_json["loyalty_program_id"]
      unless parsed_json["minimum_spend_amount_money"].nil?
        minimum_spend_amount_money = parsed_json["minimum_spend_amount_money"].to_json
        minimum_spend_amount_money = square.rb::Money.from_json(json_object: minimum_spend_amount_money)
      else
        minimum_spend_amount_money = nil
      end
      qualifying_item_variation_ids = parsed_json["qualifying_item_variation_ids"]
      qualifying_category_ids = parsed_json["qualifying_category_ids"]
      new(
        id: id,
        name: name,
        incentive: incentive,
        available_time: available_time,
        trigger_limit: trigger_limit,
        status: status,
        created_at: created_at,
        canceled_at: canceled_at,
        updated_at: updated_at,
        loyalty_program_id: loyalty_program_id,
        minimum_spend_amount_money: minimum_spend_amount_money,
        qualifying_item_variation_ids: qualifying_item_variation_ids,
        qualifying_category_ids: qualifying_category_ids,
        additional_properties: struct
      )
    end
# Serialize an instance of LoyaltyPromotion to a JSON object
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
      obj.id&.is_a?(String) != false || raise("Passed value for field obj.id is not the expected type, validation failed.")
      obj.name.is_a?(String) != false || raise("Passed value for field obj.name is not the expected type, validation failed.")
      square.rb::LoyaltyPromotionIncentive.validate_raw(obj: obj.incentive)
      square.rb::LoyaltyPromotionAvailableTimeData.validate_raw(obj: obj.available_time)
      obj.trigger_limit.nil? || square.rb::LoyaltyPromotionTriggerLimit.validate_raw(obj: obj.trigger_limit)
      obj.status&.is_a?(square.rb::LoyaltyPromotionStatus) != false || raise("Passed value for field obj.status is not the expected type, validation failed.")
      obj.created_at&.is_a?(String) != false || raise("Passed value for field obj.created_at is not the expected type, validation failed.")
      obj.canceled_at&.is_a?(String) != false || raise("Passed value for field obj.canceled_at is not the expected type, validation failed.")
      obj.updated_at&.is_a?(String) != false || raise("Passed value for field obj.updated_at is not the expected type, validation failed.")
      obj.loyalty_program_id&.is_a?(String) != false || raise("Passed value for field obj.loyalty_program_id is not the expected type, validation failed.")
      obj.minimum_spend_amount_money.nil? || square.rb::Money.validate_raw(obj: obj.minimum_spend_amount_money)
      obj.qualifying_item_variation_ids&.is_a?(Array) != false || raise("Passed value for field obj.qualifying_item_variation_ids is not the expected type, validation failed.")
      obj.qualifying_category_ids&.is_a?(Array) != false || raise("Passed value for field obj.qualifying_category_ids is not the expected type, validation failed.")
    end
  end
end