# frozen_string_literal: true
require_relative "gift_card_activity_clear_balance_reason"
require "ostruct"
require "json"

module SquareApiClient
# Represents details about a `CLEAR_BALANCE` [gift card activity
#  type](entity:GiftCardActivityType).
  class GiftCardActivityClearBalance
  # @return [SquareApiClient::GiftCardActivityClearBalanceReason] The reason the gift card balance was cleared.
#  See [Reason](#type-reason) for possible values
    attr_reader :reason
  # @return [OpenStruct] Additional properties unmapped to the current class definition
    attr_reader :additional_properties
  # @return [Object] 
    attr_reader :_field_set
    protected :_field_set

    OMIT = Object.new

    # @param reason [SquareApiClient::GiftCardActivityClearBalanceReason] The reason the gift card balance was cleared.
#  See [Reason](#type-reason) for possible values
    # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
    # @return [SquareApiClient::GiftCardActivityClearBalance]
    def initialize(reason:, additional_properties: nil)
      @reason = reason
      @additional_properties = additional_properties
      @_field_set = { "reason": reason }
    end
# Deserialize a JSON object to an instance of GiftCardActivityClearBalance
    #
    # @param json_object [String] 
    # @return [SquareApiClient::GiftCardActivityClearBalance]
    def self.from_json(json_object:)
      struct = JSON.parse(json_object, object_class: OpenStruct)
      parsed_json = JSON.parse(json_object)
      reason = parsed_json["reason"]
      new(reason: reason, additional_properties: struct)
    end
# Serialize an instance of GiftCardActivityClearBalance to a JSON object
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
      obj.reason.is_a?(SquareApiClient::GiftCardActivityClearBalanceReason) != false || raise("Passed value for field obj.reason is not the expected type, validation failed.")
    end
  end
end