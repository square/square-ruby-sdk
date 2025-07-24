# frozen_string_literal: true
require "ostruct"
require "json"

module square.rb
# Filter events by loyalty account.
  class LoyaltyEventLoyaltyAccountFilter
  # @return [String] The ID of the [loyalty account](entity:LoyaltyAccount) associated with loyalty
#  events.
    attr_reader :loyalty_account_id
  # @return [OpenStruct] Additional properties unmapped to the current class definition
    attr_reader :additional_properties
  # @return [Object] 
    attr_reader :_field_set
    protected :_field_set

    OMIT = Object.new

    # @param loyalty_account_id [String] The ID of the [loyalty account](entity:LoyaltyAccount) associated with loyalty
#  events.
    # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
    # @return [square.rb::LoyaltyEventLoyaltyAccountFilter]
    def initialize(loyalty_account_id:, additional_properties: nil)
      @loyalty_account_id = loyalty_account_id
      @additional_properties = additional_properties
      @_field_set = { "loyalty_account_id": loyalty_account_id }
    end
# Deserialize a JSON object to an instance of LoyaltyEventLoyaltyAccountFilter
    #
    # @param json_object [String] 
    # @return [square.rb::LoyaltyEventLoyaltyAccountFilter]
    def self.from_json(json_object:)
      struct = JSON.parse(json_object, object_class: OpenStruct)
      parsed_json = JSON.parse(json_object)
      loyalty_account_id = parsed_json["loyalty_account_id"]
      new(loyalty_account_id: loyalty_account_id, additional_properties: struct)
    end
# Serialize an instance of LoyaltyEventLoyaltyAccountFilter to a JSON object
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
    end
  end
end