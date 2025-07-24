# frozen_string_literal: true
require "ostruct"
require "json"

module SquareApiClient
# Represents a reward that can be applied to an order if the necessary
#  reward tier criteria are met. Rewards are created through the Loyalty API.
  class OrderReward
  # @return [String] The identifier of the reward.
    attr_reader :id
  # @return [String] The identifier of the reward tier corresponding to this reward.
    attr_reader :reward_tier_id
  # @return [OpenStruct] Additional properties unmapped to the current class definition
    attr_reader :additional_properties
  # @return [Object] 
    attr_reader :_field_set
    protected :_field_set

    OMIT = Object.new

    # @param id [String] The identifier of the reward.
    # @param reward_tier_id [String] The identifier of the reward tier corresponding to this reward.
    # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
    # @return [SquareApiClient::OrderReward]
    def initialize(id:, reward_tier_id:, additional_properties: nil)
      @id = id
      @reward_tier_id = reward_tier_id
      @additional_properties = additional_properties
      @_field_set = { "id": id, "reward_tier_id": reward_tier_id }
    end
# Deserialize a JSON object to an instance of OrderReward
    #
    # @param json_object [String] 
    # @return [SquareApiClient::OrderReward]
    def self.from_json(json_object:)
      struct = JSON.parse(json_object, object_class: OpenStruct)
      parsed_json = JSON.parse(json_object)
      id = parsed_json["id"]
      reward_tier_id = parsed_json["reward_tier_id"]
      new(
        id: id,
        reward_tier_id: reward_tier_id,
        additional_properties: struct
      )
    end
# Serialize an instance of OrderReward to a JSON object
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
      obj.id.is_a?(String) != false || raise("Passed value for field obj.id is not the expected type, validation failed.")
      obj.reward_tier_id.is_a?(String) != false || raise("Passed value for field obj.reward_tier_id is not the expected type, validation failed.")
    end
  end
end