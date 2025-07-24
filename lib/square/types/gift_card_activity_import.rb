# frozen_string_literal: true
require_relative "money"
require "ostruct"
require "json"

module square.rb
# Represents details about an `IMPORT` [gift card activity
#  type](entity:GiftCardActivityType).
#  This activity type is used when Square imports a third-party gift card, in which
#  case the
#  `gan_source` of the gift card is set to `OTHER`.
  class GiftCardActivityImport
  # @return [square.rb::Money] The balance amount on the imported gift card.
    attr_reader :amount_money
  # @return [OpenStruct] Additional properties unmapped to the current class definition
    attr_reader :additional_properties
  # @return [Object] 
    attr_reader :_field_set
    protected :_field_set

    OMIT = Object.new

    # @param amount_money [square.rb::Money] The balance amount on the imported gift card.
    # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
    # @return [square.rb::GiftCardActivityImport]
    def initialize(amount_money:, additional_properties: nil)
      @amount_money = amount_money
      @additional_properties = additional_properties
      @_field_set = { "amount_money": amount_money }
    end
# Deserialize a JSON object to an instance of GiftCardActivityImport
    #
    # @param json_object [String] 
    # @return [square.rb::GiftCardActivityImport]
    def self.from_json(json_object:)
      struct = JSON.parse(json_object, object_class: OpenStruct)
      parsed_json = JSON.parse(json_object)
      unless parsed_json["amount_money"].nil?
        amount_money = parsed_json["amount_money"].to_json
        amount_money = square.rb::Money.from_json(json_object: amount_money)
      else
        amount_money = nil
      end
      new(amount_money: amount_money, additional_properties: struct)
    end
# Serialize an instance of GiftCardActivityImport to a JSON object
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
    end
  end
end