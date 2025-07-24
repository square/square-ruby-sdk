# frozen_string_literal: true
require_relative "error"
require_relative "loyalty_reward"
require "ostruct"
require "json"

module SquareApiClient
# A response that includes the loyalty rewards satisfying the search criteria.
  class SearchLoyaltyRewardsResponse
  # @return [Array<SquareApiClient::Error>] Any errors that occurred during the request.
    attr_reader :errors
  # @return [Array<SquareApiClient::LoyaltyReward>] The loyalty rewards that satisfy the search criteria.
#  These are returned in descending order by `updated_at`.
    attr_reader :rewards
  # @return [String] The pagination cursor to be used in a subsequent
#  request. If empty, this is the final response.
    attr_reader :cursor
  # @return [OpenStruct] Additional properties unmapped to the current class definition
    attr_reader :additional_properties
  # @return [Object] 
    attr_reader :_field_set
    protected :_field_set

    OMIT = Object.new

    # @param errors [Array<SquareApiClient::Error>] Any errors that occurred during the request.
    # @param rewards [Array<SquareApiClient::LoyaltyReward>] The loyalty rewards that satisfy the search criteria.
#  These are returned in descending order by `updated_at`.
    # @param cursor [String] The pagination cursor to be used in a subsequent
#  request. If empty, this is the final response.
    # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
    # @return [SquareApiClient::SearchLoyaltyRewardsResponse]
    def initialize(errors: OMIT, rewards: OMIT, cursor: OMIT, additional_properties: nil)
      @errors = errors if errors != OMIT
      @rewards = rewards if rewards != OMIT
      @cursor = cursor if cursor != OMIT
      @additional_properties = additional_properties
      @_field_set = { "errors": errors, "rewards": rewards, "cursor": cursor }.reject do | _k, v |
  v == OMIT
end
    end
# Deserialize a JSON object to an instance of SearchLoyaltyRewardsResponse
    #
    # @param json_object [String] 
    # @return [SquareApiClient::SearchLoyaltyRewardsResponse]
    def self.from_json(json_object:)
      struct = JSON.parse(json_object, object_class: OpenStruct)
      parsed_json = JSON.parse(json_object)
      errors = parsed_json["errors"]&.map do | item |
  item = item.to_json
  SquareApiClient::Error.from_json(json_object: item)
end
      rewards = parsed_json["rewards"]&.map do | item |
  item = item.to_json
  SquareApiClient::LoyaltyReward.from_json(json_object: item)
end
      cursor = parsed_json["cursor"]
      new(
        errors: errors,
        rewards: rewards,
        cursor: cursor,
        additional_properties: struct
      )
    end
# Serialize an instance of SearchLoyaltyRewardsResponse to a JSON object
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
      obj.rewards&.is_a?(Array) != false || raise("Passed value for field obj.rewards is not the expected type, validation failed.")
      obj.cursor&.is_a?(String) != false || raise("Passed value for field obj.cursor is not the expected type, validation failed.")
    end
  end
end