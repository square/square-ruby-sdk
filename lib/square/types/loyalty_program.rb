# frozen_string_literal: true
require_relative "loyalty_program_status"
require_relative "loyalty_program_reward_tier"
require_relative "loyalty_program_expiration_policy"
require_relative "loyalty_program_terminology"
require_relative "loyalty_program_accrual_rule"
require "ostruct"
require "json"

module SquareApiClient
# Represents a Square loyalty program. Loyalty programs define how buyers can earn
#  points and redeem points for rewards.
#  Square sellers can have only one loyalty program, which is created and managed
#  from the Seller Dashboard.
#  For more information, see [Loyalty Program
#  Overview](https://developer.squareup.com/docs/loyalty/overview).
  class LoyaltyProgram
  # @return [String] The Square-assigned ID of the loyalty program. Updates to
#  the loyalty program do not modify the identifier.
    attr_reader :id
  # @return [SquareApiClient::LoyaltyProgramStatus] Whether the program is currently active.
#  See [LoyaltyProgramStatus](#type-loyaltyprogramstatus) for possible values
    attr_reader :status
  # @return [Array<SquareApiClient::LoyaltyProgramRewardTier>] The list of rewards for buyers, sorted by ascending points.
    attr_reader :reward_tiers
  # @return [SquareApiClient::LoyaltyProgramExpirationPolicy] If present, details for how points expire.
    attr_reader :expiration_policy
  # @return [SquareApiClient::LoyaltyProgramTerminology] A cosmetic name for the “points” currency.
    attr_reader :terminology
  # @return [Array<String>] The [locations](entity:Location) at which the program is active.
    attr_reader :location_ids
  # @return [String] The timestamp when the program was created, in RFC 3339 format.
    attr_reader :created_at
  # @return [String] The timestamp when the reward was last updated, in RFC 3339 format.
    attr_reader :updated_at
  # @return [Array<SquareApiClient::LoyaltyProgramAccrualRule>] Defines how buyers can earn loyalty points from the base loyalty program.
#  To check for associated [loyalty promotions](entity:LoyaltyPromotion) that
#  enable
#  buyers to earn extra points, call
#  [ListLoyaltyPromotions](api-endpoint:Loyalty-ListLoyaltyPromotions).
    attr_reader :accrual_rules
  # @return [OpenStruct] Additional properties unmapped to the current class definition
    attr_reader :additional_properties
  # @return [Object] 
    attr_reader :_field_set
    protected :_field_set

    OMIT = Object.new

    # @param id [String] The Square-assigned ID of the loyalty program. Updates to
#  the loyalty program do not modify the identifier.
    # @param status [SquareApiClient::LoyaltyProgramStatus] Whether the program is currently active.
#  See [LoyaltyProgramStatus](#type-loyaltyprogramstatus) for possible values
    # @param reward_tiers [Array<SquareApiClient::LoyaltyProgramRewardTier>] The list of rewards for buyers, sorted by ascending points.
    # @param expiration_policy [SquareApiClient::LoyaltyProgramExpirationPolicy] If present, details for how points expire.
    # @param terminology [SquareApiClient::LoyaltyProgramTerminology] A cosmetic name for the “points” currency.
    # @param location_ids [Array<String>] The [locations](entity:Location) at which the program is active.
    # @param created_at [String] The timestamp when the program was created, in RFC 3339 format.
    # @param updated_at [String] The timestamp when the reward was last updated, in RFC 3339 format.
    # @param accrual_rules [Array<SquareApiClient::LoyaltyProgramAccrualRule>] Defines how buyers can earn loyalty points from the base loyalty program.
#  To check for associated [loyalty promotions](entity:LoyaltyPromotion) that
#  enable
#  buyers to earn extra points, call
#  [ListLoyaltyPromotions](api-endpoint:Loyalty-ListLoyaltyPromotions).
    # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
    # @return [SquareApiClient::LoyaltyProgram]
    def initialize(id: OMIT, status: OMIT, reward_tiers: OMIT, expiration_policy: OMIT, terminology: OMIT, location_ids: OMIT, created_at: OMIT, updated_at: OMIT, accrual_rules: OMIT, additional_properties: nil)
      @id = id if id != OMIT
      @status = status if status != OMIT
      @reward_tiers = reward_tiers if reward_tiers != OMIT
      @expiration_policy = expiration_policy if expiration_policy != OMIT
      @terminology = terminology if terminology != OMIT
      @location_ids = location_ids if location_ids != OMIT
      @created_at = created_at if created_at != OMIT
      @updated_at = updated_at if updated_at != OMIT
      @accrual_rules = accrual_rules if accrual_rules != OMIT
      @additional_properties = additional_properties
      @_field_set = { "id": id, "status": status, "reward_tiers": reward_tiers, "expiration_policy": expiration_policy, "terminology": terminology, "location_ids": location_ids, "created_at": created_at, "updated_at": updated_at, "accrual_rules": accrual_rules }.reject do | _k, v |
  v == OMIT
end
    end
# Deserialize a JSON object to an instance of LoyaltyProgram
    #
    # @param json_object [String] 
    # @return [SquareApiClient::LoyaltyProgram]
    def self.from_json(json_object:)
      struct = JSON.parse(json_object, object_class: OpenStruct)
      parsed_json = JSON.parse(json_object)
      id = parsed_json["id"]
      status = parsed_json["status"]
      reward_tiers = parsed_json["reward_tiers"]&.map do | item |
  item = item.to_json
  SquareApiClient::LoyaltyProgramRewardTier.from_json(json_object: item)
end
      unless parsed_json["expiration_policy"].nil?
        expiration_policy = parsed_json["expiration_policy"].to_json
        expiration_policy = SquareApiClient::LoyaltyProgramExpirationPolicy.from_json(json_object: expiration_policy)
      else
        expiration_policy = nil
      end
      unless parsed_json["terminology"].nil?
        terminology = parsed_json["terminology"].to_json
        terminology = SquareApiClient::LoyaltyProgramTerminology.from_json(json_object: terminology)
      else
        terminology = nil
      end
      location_ids = parsed_json["location_ids"]
      created_at = parsed_json["created_at"]
      updated_at = parsed_json["updated_at"]
      accrual_rules = parsed_json["accrual_rules"]&.map do | item |
  item = item.to_json
  SquareApiClient::LoyaltyProgramAccrualRule.from_json(json_object: item)
end
      new(
        id: id,
        status: status,
        reward_tiers: reward_tiers,
        expiration_policy: expiration_policy,
        terminology: terminology,
        location_ids: location_ids,
        created_at: created_at,
        updated_at: updated_at,
        accrual_rules: accrual_rules,
        additional_properties: struct
      )
    end
# Serialize an instance of LoyaltyProgram to a JSON object
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
      obj.status&.is_a?(SquareApiClient::LoyaltyProgramStatus) != false || raise("Passed value for field obj.status is not the expected type, validation failed.")
      obj.reward_tiers&.is_a?(Array) != false || raise("Passed value for field obj.reward_tiers is not the expected type, validation failed.")
      obj.expiration_policy.nil? || SquareApiClient::LoyaltyProgramExpirationPolicy.validate_raw(obj: obj.expiration_policy)
      obj.terminology.nil? || SquareApiClient::LoyaltyProgramTerminology.validate_raw(obj: obj.terminology)
      obj.location_ids&.is_a?(Array) != false || raise("Passed value for field obj.location_ids is not the expected type, validation failed.")
      obj.created_at&.is_a?(String) != false || raise("Passed value for field obj.created_at is not the expected type, validation failed.")
      obj.updated_at&.is_a?(String) != false || raise("Passed value for field obj.updated_at is not the expected type, validation failed.")
      obj.accrual_rules&.is_a?(Array) != false || raise("Passed value for field obj.accrual_rules is not the expected type, validation failed.")
    end
  end
end