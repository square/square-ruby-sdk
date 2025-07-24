# frozen_string_literal: true
require "ostruct"
require "json"

module square.rb
# Provides metadata when the event `type` is `REDEEM_REWARD`.
  class LoyaltyEventRedeemReward
  # @return [String] The ID of the [loyalty program](entity:LoyaltyProgram).
    attr_reader :loyalty_program_id
  # @return [String] The ID of the redeemed [loyalty reward](entity:LoyaltyReward).
#  This field is returned only if the event source is `LOYALTY_API`.
    attr_reader :reward_id
  # @return [String] The ID of the [order](entity:Order) that redeemed the reward.
#  This field is returned only if the Orders API is used to process orders.
    attr_reader :order_id
  # @return [OpenStruct] Additional properties unmapped to the current class definition
    attr_reader :additional_properties
  # @return [Object] 
    attr_reader :_field_set
    protected :_field_set

    OMIT = Object.new

    # @param loyalty_program_id [String] The ID of the [loyalty program](entity:LoyaltyProgram).
    # @param reward_id [String] The ID of the redeemed [loyalty reward](entity:LoyaltyReward).
#  This field is returned only if the event source is `LOYALTY_API`.
    # @param order_id [String] The ID of the [order](entity:Order) that redeemed the reward.
#  This field is returned only if the Orders API is used to process orders.
    # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
    # @return [square.rb::LoyaltyEventRedeemReward]
    def initialize(loyalty_program_id: OMIT, reward_id: OMIT, order_id: OMIT, additional_properties: nil)
      @loyalty_program_id = loyalty_program_id if loyalty_program_id != OMIT
      @reward_id = reward_id if reward_id != OMIT
      @order_id = order_id if order_id != OMIT
      @additional_properties = additional_properties
      @_field_set = { "loyalty_program_id": loyalty_program_id, "reward_id": reward_id, "order_id": order_id }.reject do | _k, v |
  v == OMIT
end
    end
# Deserialize a JSON object to an instance of LoyaltyEventRedeemReward
    #
    # @param json_object [String] 
    # @return [square.rb::LoyaltyEventRedeemReward]
    def self.from_json(json_object:)
      struct = JSON.parse(json_object, object_class: OpenStruct)
      parsed_json = JSON.parse(json_object)
      loyalty_program_id = parsed_json["loyalty_program_id"]
      reward_id = parsed_json["reward_id"]
      order_id = parsed_json["order_id"]
      new(
        loyalty_program_id: loyalty_program_id,
        reward_id: reward_id,
        order_id: order_id,
        additional_properties: struct
      )
    end
# Serialize an instance of LoyaltyEventRedeemReward to a JSON object
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
      obj.loyalty_program_id&.is_a?(String) != false || raise("Passed value for field obj.loyalty_program_id is not the expected type, validation failed.")
      obj.reward_id&.is_a?(String) != false || raise("Passed value for field obj.reward_id is not the expected type, validation failed.")
      obj.order_id&.is_a?(String) != false || raise("Passed value for field obj.order_id is not the expected type, validation failed.")
    end
  end
end