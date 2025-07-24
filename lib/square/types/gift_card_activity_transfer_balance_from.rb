# frozen_string_literal: true
require_relative "money"
require "ostruct"
require "json"

module square.rb
# Represents details about a `TRANSFER_BALANCE_FROM` [gift card activity
#  type](entity:GiftCardActivityType).
  class GiftCardActivityTransferBalanceFrom
  # @return [String] The ID of the gift card to which the specified amount was transferred.
    attr_reader :transfer_to_gift_card_id
  # @return [square.rb::Money] The amount deducted from the gift card for the transfer. This value is a
#  positive integer.
    attr_reader :amount_money
  # @return [OpenStruct] Additional properties unmapped to the current class definition
    attr_reader :additional_properties
  # @return [Object] 
    attr_reader :_field_set
    protected :_field_set

    OMIT = Object.new

    # @param transfer_to_gift_card_id [String] The ID of the gift card to which the specified amount was transferred.
    # @param amount_money [square.rb::Money] The amount deducted from the gift card for the transfer. This value is a
#  positive integer.
    # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
    # @return [square.rb::GiftCardActivityTransferBalanceFrom]
    def initialize(transfer_to_gift_card_id:, amount_money:, additional_properties: nil)
      @transfer_to_gift_card_id = transfer_to_gift_card_id
      @amount_money = amount_money
      @additional_properties = additional_properties
      @_field_set = { "transfer_to_gift_card_id": transfer_to_gift_card_id, "amount_money": amount_money }
    end
# Deserialize a JSON object to an instance of GiftCardActivityTransferBalanceFrom
    #
    # @param json_object [String] 
    # @return [square.rb::GiftCardActivityTransferBalanceFrom]
    def self.from_json(json_object:)
      struct = JSON.parse(json_object, object_class: OpenStruct)
      parsed_json = JSON.parse(json_object)
      transfer_to_gift_card_id = parsed_json["transfer_to_gift_card_id"]
      unless parsed_json["amount_money"].nil?
        amount_money = parsed_json["amount_money"].to_json
        amount_money = square.rb::Money.from_json(json_object: amount_money)
      else
        amount_money = nil
      end
      new(
        transfer_to_gift_card_id: transfer_to_gift_card_id,
        amount_money: amount_money,
        additional_properties: struct
      )
    end
# Serialize an instance of GiftCardActivityTransferBalanceFrom to a JSON object
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
      obj.transfer_to_gift_card_id.is_a?(String) != false || raise("Passed value for field obj.transfer_to_gift_card_id is not the expected type, validation failed.")
      square.rb::Money.validate_raw(obj: obj.amount_money)
    end
  end
end