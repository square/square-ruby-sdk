# frozen_string_literal: true
require_relative "loyalty_reward_status"
require "ostruct"
require "json"

module SquareApiClient
# The set of search requirements.
  class SearchLoyaltyRewardsRequestLoyaltyRewardQuery
  # @return [String] The ID of the [loyalty account](entity:LoyaltyAccount) to which the loyalty
#  reward belongs.
    attr_reader :loyalty_account_id
  # @return [SquareApiClient::LoyaltyRewardStatus] The status of the loyalty reward.
#  See [LoyaltyRewardStatus](#type-loyaltyrewardstatus) for possible values
    attr_reader :status
  # @return [OpenStruct] Additional properties unmapped to the current class definition
    attr_reader :additional_properties
  # @return [Object] 
    attr_reader :_field_set
    protected :_field_set

    OMIT = Object.new

    # @param loyalty_account_id [String] The ID of the [loyalty account](entity:LoyaltyAccount) to which the loyalty
#  reward belongs.
    # @param status [SquareApiClient::LoyaltyRewardStatus] The status of the loyalty reward.
#  See [LoyaltyRewardStatus](#type-loyaltyrewardstatus) for possible values
    # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
    # @return [SquareApiClient::SearchLoyaltyRewardsRequestLoyaltyRewardQuery]
    def initialize(loyalty_account_id:, status: OMIT, additional_properties: nil)
      @loyalty_account_id = loyalty_account_id
      @status = status if status != OMIT
      @additional_properties = additional_properties
      @_field_set = { "loyalty_account_id": loyalty_account_id, "status": status }.reject do | _k, v |
  v == OMIT
end
    end
# Deserialize a JSON object to an instance of
#  SearchLoyaltyRewardsRequestLoyaltyRewardQuery
    #
    # @param json_object [String] 
    # @return [SquareApiClient::SearchLoyaltyRewardsRequestLoyaltyRewardQuery]
    def self.from_json(json_object:)
      struct = JSON.parse(json_object, object_class: OpenStruct)
      parsed_json = JSON.parse(json_object)
      loyalty_account_id = parsed_json["loyalty_account_id"]
      status = parsed_json["status"]
      new(
        loyalty_account_id: loyalty_account_id,
        status: status,
        additional_properties: struct
      )
    end
# Serialize an instance of SearchLoyaltyRewardsRequestLoyaltyRewardQuery to a JSON
#  object
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
      obj.loyalty_account_id.is_a?(String) != false || raise("Passed value for field obj.loyalty_account_id is not the expected type, validation failed.")
      obj.status&.is_a?(SquareApiClient::LoyaltyRewardStatus) != false || raise("Passed value for field obj.status is not the expected type, validation failed.")
    end
  end
end