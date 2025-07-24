# frozen_string_literal: true
require "ostruct"
require "json"

module SquareApiClient
# Provides metadata when the event `type` is `DELETE_REWARD`.
  class LoyaltyEventDeleteReward
  # @return [String] The ID of the [loyalty program](entity:LoyaltyProgram).
    attr_reader :loyalty_program_id
  # @return [String] The ID of the deleted [loyalty reward](entity:LoyaltyReward).
#  This field is returned only if the event source is `LOYALTY_API`.
    attr_reader :reward_id
  # @return [Integer] The number of points returned to the loyalty account.
    attr_reader :points
  # @return [OpenStruct] Additional properties unmapped to the current class definition
    attr_reader :additional_properties
  # @return [Object] 
    attr_reader :_field_set
    protected :_field_set

    OMIT = Object.new

    # @param loyalty_program_id [String] The ID of the [loyalty program](entity:LoyaltyProgram).
    # @param reward_id [String] The ID of the deleted [loyalty reward](entity:LoyaltyReward).
#  This field is returned only if the event source is `LOYALTY_API`.
    # @param points [Integer] The number of points returned to the loyalty account.
    # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
    # @return [SquareApiClient::LoyaltyEventDeleteReward]
    def initialize(loyalty_program_id: OMIT, reward_id: OMIT, points: OMIT, additional_properties: nil)
      @loyalty_program_id = loyalty_program_id if loyalty_program_id != OMIT
      @reward_id = reward_id if reward_id != OMIT
      @points = points if points != OMIT
      @additional_properties = additional_properties
      @_field_set = { "loyalty_program_id": loyalty_program_id, "reward_id": reward_id, "points": points }.reject do | _k, v |
  v == OMIT
end
    end
# Deserialize a JSON object to an instance of LoyaltyEventDeleteReward
    #
    # @param json_object [String] 
    # @return [SquareApiClient::LoyaltyEventDeleteReward]
    def self.from_json(json_object:)
      struct = JSON.parse(json_object, object_class: OpenStruct)
      parsed_json = JSON.parse(json_object)
      loyalty_program_id = parsed_json["loyalty_program_id"]
      reward_id = parsed_json["reward_id"]
      points = parsed_json["points"]
      new(
        loyalty_program_id: loyalty_program_id,
        reward_id: reward_id,
        points: points,
        additional_properties: struct
      )
    end
# Serialize an instance of LoyaltyEventDeleteReward to a JSON object
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
      obj.points&.is_a?(Integer) != false || raise("Passed value for field obj.points is not the expected type, validation failed.")
    end
  end
end