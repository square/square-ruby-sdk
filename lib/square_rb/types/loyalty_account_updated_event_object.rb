# frozen_string_literal: true
require_relative "loyalty_account"
require "ostruct"
require "json"

module SquareApiClient
  class LoyaltyAccountUpdatedEventObject
  # @return [SquareApiClient::LoyaltyAccount] The loyalty account that was updated.
    attr_reader :loyalty_account
  # @return [OpenStruct] Additional properties unmapped to the current class definition
    attr_reader :additional_properties
  # @return [Object] 
    attr_reader :_field_set
    protected :_field_set

    OMIT = Object.new

    # @param loyalty_account [SquareApiClient::LoyaltyAccount] The loyalty account that was updated.
    # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
    # @return [SquareApiClient::LoyaltyAccountUpdatedEventObject]
    def initialize(loyalty_account: OMIT, additional_properties: nil)
      @loyalty_account = loyalty_account if loyalty_account != OMIT
      @additional_properties = additional_properties
      @_field_set = { "loyalty_account": loyalty_account }.reject do | _k, v |
  v == OMIT
end
    end
# Deserialize a JSON object to an instance of LoyaltyAccountUpdatedEventObject
    #
    # @param json_object [String] 
    # @return [SquareApiClient::LoyaltyAccountUpdatedEventObject]
    def self.from_json(json_object:)
      struct = JSON.parse(json_object, object_class: OpenStruct)
      parsed_json = JSON.parse(json_object)
      unless parsed_json["loyalty_account"].nil?
        loyalty_account = parsed_json["loyalty_account"].to_json
        loyalty_account = SquareApiClient::LoyaltyAccount.from_json(json_object: loyalty_account)
      else
        loyalty_account = nil
      end
      new(loyalty_account: loyalty_account, additional_properties: struct)
    end
# Serialize an instance of LoyaltyAccountUpdatedEventObject to a JSON object
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
      obj.loyalty_account.nil? || SquareApiClient::LoyaltyAccount.validate_raw(obj: obj.loyalty_account)
    end
  end
end