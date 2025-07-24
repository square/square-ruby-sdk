# frozen_string_literal: true
require_relative "money"
require "ostruct"
require "json"

module square.rb
# Represents details about an `IMPORT_REVERSAL` [gift card activity
#  type](entity:GiftCardActivityType).
  class GiftCardActivityImportReversal
  # @return [square.rb::Money] The amount of money cleared from the third-party gift card when
#  the import was reversed.
    attr_reader :amount_money
  # @return [OpenStruct] Additional properties unmapped to the current class definition
    attr_reader :additional_properties
  # @return [Object] 
    attr_reader :_field_set
    protected :_field_set

    OMIT = Object.new

    # @param amount_money [square.rb::Money] The amount of money cleared from the third-party gift card when
#  the import was reversed.
    # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
    # @return [square.rb::GiftCardActivityImportReversal]
    def initialize(amount_money:, additional_properties: nil)
      @amount_money = amount_money
      @additional_properties = additional_properties
      @_field_set = { "amount_money": amount_money }
    end
# Deserialize a JSON object to an instance of GiftCardActivityImportReversal
    #
    # @param json_object [String] 
    # @return [square.rb::GiftCardActivityImportReversal]
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
# Serialize an instance of GiftCardActivityImportReversal to a JSON object
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