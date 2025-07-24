# frozen_string_literal: true
require_relative "loyalty_reward_status"
require "ostruct"
require "json"

module SquareApiClient
# Represents a contract to redeem loyalty points for a [reward
#  tier](entity:LoyaltyProgramRewardTier) discount. Loyalty rewards can be in an
#  ISSUED, REDEEMED, or DELETED state.
#  For more information, see [Manage loyalty
#  rewards](https://developer.squareup.com/docs/loyalty-api/loyalty-rewards).
  class LoyaltyReward
  # @return [String] The Square-assigned ID of the loyalty reward.
    attr_reader :id
  # @return [SquareApiClient::LoyaltyRewardStatus] The status of a loyalty reward.
#  See [LoyaltyRewardStatus](#type-loyaltyrewardstatus) for possible values
    attr_reader :status
  # @return [String] The Square-assigned ID of the [loyalty account](entity:LoyaltyAccount) to which
#  the reward belongs.
    attr_reader :loyalty_account_id
  # @return [String] The Square-assigned ID of the [reward tier](entity:LoyaltyProgramRewardTier)
#  used to create the reward.
    attr_reader :reward_tier_id
  # @return [Integer] The number of loyalty points used for the reward.
    attr_reader :points
  # @return [String] The Square-assigned ID of the [order](entity:Order) to which the reward is
#  attached.
    attr_reader :order_id
  # @return [String] The timestamp when the reward was created, in RFC 3339 format.
    attr_reader :created_at
  # @return [String] The timestamp when the reward was last updated, in RFC 3339 format.
    attr_reader :updated_at
  # @return [String] The timestamp when the reward was redeemed, in RFC 3339 format.
    attr_reader :redeemed_at
  # @return [OpenStruct] Additional properties unmapped to the current class definition
    attr_reader :additional_properties
  # @return [Object] 
    attr_reader :_field_set
    protected :_field_set

    OMIT = Object.new

    # @param id [String] The Square-assigned ID of the loyalty reward.
    # @param status [SquareApiClient::LoyaltyRewardStatus] The status of a loyalty reward.
#  See [LoyaltyRewardStatus](#type-loyaltyrewardstatus) for possible values
    # @param loyalty_account_id [String] The Square-assigned ID of the [loyalty account](entity:LoyaltyAccount) to which
#  the reward belongs.
    # @param reward_tier_id [String] The Square-assigned ID of the [reward tier](entity:LoyaltyProgramRewardTier)
#  used to create the reward.
    # @param points [Integer] The number of loyalty points used for the reward.
    # @param order_id [String] The Square-assigned ID of the [order](entity:Order) to which the reward is
#  attached.
    # @param created_at [String] The timestamp when the reward was created, in RFC 3339 format.
    # @param updated_at [String] The timestamp when the reward was last updated, in RFC 3339 format.
    # @param redeemed_at [String] The timestamp when the reward was redeemed, in RFC 3339 format.
    # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
    # @return [SquareApiClient::LoyaltyReward]
    def initialize(id: OMIT, status: OMIT, loyalty_account_id:, reward_tier_id:, points: OMIT, order_id: OMIT, created_at: OMIT, updated_at: OMIT, redeemed_at: OMIT, additional_properties: nil)
      @id = id if id != OMIT
      @status = status if status != OMIT
      @loyalty_account_id = loyalty_account_id
      @reward_tier_id = reward_tier_id
      @points = points if points != OMIT
      @order_id = order_id if order_id != OMIT
      @created_at = created_at if created_at != OMIT
      @updated_at = updated_at if updated_at != OMIT
      @redeemed_at = redeemed_at if redeemed_at != OMIT
      @additional_properties = additional_properties
      @_field_set = { "id": id, "status": status, "loyalty_account_id": loyalty_account_id, "reward_tier_id": reward_tier_id, "points": points, "order_id": order_id, "created_at": created_at, "updated_at": updated_at, "redeemed_at": redeemed_at }.reject do | _k, v |
  v == OMIT
end
    end
# Deserialize a JSON object to an instance of LoyaltyReward
    #
    # @param json_object [String] 
    # @return [SquareApiClient::LoyaltyReward]
    def self.from_json(json_object:)
      struct = JSON.parse(json_object, object_class: OpenStruct)
      parsed_json = JSON.parse(json_object)
      id = parsed_json["id"]
      status = parsed_json["status"]
      loyalty_account_id = parsed_json["loyalty_account_id"]
      reward_tier_id = parsed_json["reward_tier_id"]
      points = parsed_json["points"]
      order_id = parsed_json["order_id"]
      created_at = parsed_json["created_at"]
      updated_at = parsed_json["updated_at"]
      redeemed_at = parsed_json["redeemed_at"]
      new(
        id: id,
        status: status,
        loyalty_account_id: loyalty_account_id,
        reward_tier_id: reward_tier_id,
        points: points,
        order_id: order_id,
        created_at: created_at,
        updated_at: updated_at,
        redeemed_at: redeemed_at,
        additional_properties: struct
      )
    end
# Serialize an instance of LoyaltyReward to a JSON object
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
      obj.status&.is_a?(SquareApiClient::LoyaltyRewardStatus) != false || raise("Passed value for field obj.status is not the expected type, validation failed.")
      obj.loyalty_account_id.is_a?(String) != false || raise("Passed value for field obj.loyalty_account_id is not the expected type, validation failed.")
      obj.reward_tier_id.is_a?(String) != false || raise("Passed value for field obj.reward_tier_id is not the expected type, validation failed.")
      obj.points&.is_a?(Integer) != false || raise("Passed value for field obj.points is not the expected type, validation failed.")
      obj.order_id&.is_a?(String) != false || raise("Passed value for field obj.order_id is not the expected type, validation failed.")
      obj.created_at&.is_a?(String) != false || raise("Passed value for field obj.created_at is not the expected type, validation failed.")
      obj.updated_at&.is_a?(String) != false || raise("Passed value for field obj.updated_at is not the expected type, validation failed.")
      obj.redeemed_at&.is_a?(String) != false || raise("Passed value for field obj.redeemed_at is not the expected type, validation failed.")
    end
  end
end