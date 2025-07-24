# frozen_string_literal: true
require_relative "money"
require_relative "gift_card_activity_adjust_increment_reason"
require "ostruct"
require "json"

module square.rb
# Represents details about an `ADJUST_INCREMENT` [gift card activity
#  type](entity:GiftCardActivityType).
  class GiftCardActivityAdjustIncrement
  # @return [square.rb::Money] The amount added to the gift card balance. This value is a positive integer.
    attr_reader :amount_money
  # @return [square.rb::GiftCardActivityAdjustIncrementReason] The reason the gift card balance was adjusted.
#  See [Reason](#type-reason) for possible values
    attr_reader :reason
  # @return [OpenStruct] Additional properties unmapped to the current class definition
    attr_reader :additional_properties
  # @return [Object] 
    attr_reader :_field_set
    protected :_field_set

    OMIT = Object.new

    # @param amount_money [square.rb::Money] The amount added to the gift card balance. This value is a positive integer.
    # @param reason [square.rb::GiftCardActivityAdjustIncrementReason] The reason the gift card balance was adjusted.
#  See [Reason](#type-reason) for possible values
    # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
    # @return [square.rb::GiftCardActivityAdjustIncrement]
    def initialize(amount_money:, reason:, additional_properties: nil)
      @amount_money = amount_money
      @reason = reason
      @additional_properties = additional_properties
      @_field_set = { "amount_money": amount_money, "reason": reason }
    end
# Deserialize a JSON object to an instance of GiftCardActivityAdjustIncrement
    #
    # @param json_object [String] 
    # @return [square.rb::GiftCardActivityAdjustIncrement]
    def self.from_json(json_object:)
      struct = JSON.parse(json_object, object_class: OpenStruct)
      parsed_json = JSON.parse(json_object)
      unless parsed_json["amount_money"].nil?
        amount_money = parsed_json["amount_money"].to_json
        amount_money = square.rb::Money.from_json(json_object: amount_money)
      else
        amount_money = nil
      end
      reason = parsed_json["reason"]
      new(
        amount_money: amount_money,
        reason: reason,
        additional_properties: struct
      )
    end
# Serialize an instance of GiftCardActivityAdjustIncrement to a JSON object
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
      square.rb::Money.validate_raw(obj: obj.amount_money)
      obj.reason.is_a?(square.rb::GiftCardActivityAdjustIncrementReason) != false || raise("Passed value for field obj.reason is not the expected type, validation failed.")
    end
  end
end