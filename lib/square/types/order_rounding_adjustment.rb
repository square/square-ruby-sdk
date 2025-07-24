# frozen_string_literal: true
require_relative "money"
require "ostruct"
require "json"

module square.rb
# A rounding adjustment of the money being returned. Commonly used to apply cash
#  rounding
#  when the minimum unit of the account is smaller than the lowest physical
#  denomination of the currency.
  class OrderRoundingAdjustment
  # @return [String] A unique ID that identifies the rounding adjustment only within this order.
    attr_reader :uid
  # @return [String] The name of the rounding adjustment from the original sale order.
    attr_reader :name
  # @return [square.rb::Money] The actual rounding adjustment amount.
    attr_reader :amount_money
  # @return [OpenStruct] Additional properties unmapped to the current class definition
    attr_reader :additional_properties
  # @return [Object] 
    attr_reader :_field_set
    protected :_field_set

    OMIT = Object.new

    # @param uid [String] A unique ID that identifies the rounding adjustment only within this order.
    # @param name [String] The name of the rounding adjustment from the original sale order.
    # @param amount_money [square.rb::Money] The actual rounding adjustment amount.
    # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
    # @return [square.rb::OrderRoundingAdjustment]
    def initialize(uid: OMIT, name: OMIT, amount_money: OMIT, additional_properties: nil)
      @uid = uid if uid != OMIT
      @name = name if name != OMIT
      @amount_money = amount_money if amount_money != OMIT
      @additional_properties = additional_properties
      @_field_set = { "uid": uid, "name": name, "amount_money": amount_money }.reject do | _k, v |
  v == OMIT
end
    end
# Deserialize a JSON object to an instance of OrderRoundingAdjustment
    #
    # @param json_object [String] 
    # @return [square.rb::OrderRoundingAdjustment]
    def self.from_json(json_object:)
      struct = JSON.parse(json_object, object_class: OpenStruct)
      parsed_json = JSON.parse(json_object)
      uid = parsed_json["uid"]
      name = parsed_json["name"]
      unless parsed_json["amount_money"].nil?
        amount_money = parsed_json["amount_money"].to_json
        amount_money = square.rb::Money.from_json(json_object: amount_money)
      else
        amount_money = nil
      end
      new(
        uid: uid,
        name: name,
        amount_money: amount_money,
        additional_properties: struct
      )
    end
# Serialize an instance of OrderRoundingAdjustment to a JSON object
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
      obj.uid&.is_a?(String) != false || raise("Passed value for field obj.uid is not the expected type, validation failed.")
      obj.name&.is_a?(String) != false || raise("Passed value for field obj.name is not the expected type, validation failed.")
      obj.amount_money.nil? || square.rb::Money.validate_raw(obj: obj.amount_money)
    end
  end
end