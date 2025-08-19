# frozen_string_literal: true
require_relative "error"
require_relative "loyalty_reward"
require "ostruct"
require "json"

module SquareApiClient
# A response that includes the loyalty reward.
  class GetLoyaltyRewardResponse
  # @return [Array<SquareApiClient::Error>] Any errors that occurred during the request.
    attr_reader :errors
  # @return [SquareApiClient::LoyaltyReward] The loyalty reward retrieved.
    attr_reader :reward
  # @return [OpenStruct] Additional properties unmapped to the current class definition
    attr_reader :additional_properties
  # @return [Object] 
    attr_reader :_field_set
    protected :_field_set

    OMIT = Object.new

    # @param errors [Array<SquareApiClient::Error>] Any errors that occurred during the request.
    # @param reward [SquareApiClient::LoyaltyReward] The loyalty reward retrieved.
    # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
    # @return [SquareApiClient::GetLoyaltyRewardResponse]
    def initialize(errors: OMIT, reward: OMIT, additional_properties: nil)
      @errors = errors if errors != OMIT
      @reward = reward if reward != OMIT
      @additional_properties = additional_properties
      @_field_set = { "errors": errors, "reward": reward }.reject do | _k, v |
  v == OMIT
end
    end
# Deserialize a JSON object to an instance of GetLoyaltyRewardResponse
    #
    # @param json_object [String] 
    # @return [SquareApiClient::GetLoyaltyRewardResponse]
    def self.from_json(json_object:)
      struct = JSON.parse(json_object, object_class: OpenStruct)
      parsed_json = JSON.parse(json_object)
      errors = parsed_json["errors"]&.map do | item |
  item = item.to_json
  SquareApiClient::Error.from_json(json_object: item)
end
      unless parsed_json["reward"].nil?
        reward = parsed_json["reward"].to_json
        reward = SquareApiClient::LoyaltyReward.from_json(json_object: reward)
      else
        reward = nil
      end
      new(
        errors: errors,
        reward: reward,
        additional_properties: struct
      )
    end
# Serialize an instance of GetLoyaltyRewardResponse to a JSON object
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
      obj.errors&.is_a?(Array) != false || raise("Passed value for field obj.errors is not the expected type, validation failed.")
      obj.reward.nil? || SquareApiClient::LoyaltyReward.validate_raw(obj: obj.reward)
    end
  end
end