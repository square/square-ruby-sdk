# frozen_string_literal: true
require_relative "currency"
require "ostruct"
require "json"

module square.rb
# Represents an amount of money. `Money` fields can be signed or unsigned.
#  Fields that do not explicitly define whether they are signed or unsigned are
#  considered unsigned and can only hold positive amounts. For signed fields, the
#  sign of the value indicates the purpose of the money transfer. See
#  [Working with Monetary
#  (https://developer.squareup.com/docs/build-basics/working-with-monetary-amounts)
#  for more information.
  class Money
  # @return [Long] The amount of money, in the smallest denomination of the currency
#  indicated by `currency`. For example, when `currency` is `USD`, `amount` is
#  in cents. Monetary amounts can be positive or negative. See the specific
#  field description to determine the meaning of the sign in a particular case.
    attr_reader :amount
  # @return [square.rb::Currency] The type of currency, in __ISO 4217 format__. For example, the currency
#  code for US dollars is `USD`.
#  See [Currency](entity:Currency) for possible values.
#  See [Currency](#type-currency) for possible values
    attr_reader :currency
  # @return [OpenStruct] Additional properties unmapped to the current class definition
    attr_reader :additional_properties
  # @return [Object] 
    attr_reader :_field_set
    protected :_field_set

    OMIT = Object.new

    # @param amount [Long] The amount of money, in the smallest denomination of the currency
#  indicated by `currency`. For example, when `currency` is `USD`, `amount` is
#  in cents. Monetary amounts can be positive or negative. See the specific
#  field description to determine the meaning of the sign in a particular case.
    # @param currency [square.rb::Currency] The type of currency, in __ISO 4217 format__. For example, the currency
#  code for US dollars is `USD`.
#  See [Currency](entity:Currency) for possible values.
#  See [Currency](#type-currency) for possible values
    # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
    # @return [square.rb::Money]
    def initialize(amount: OMIT, currency: OMIT, additional_properties: nil)
      @amount = amount if amount != OMIT
      @currency = currency if currency != OMIT
      @additional_properties = additional_properties
      @_field_set = { "amount": amount, "currency": currency }.reject do | _k, v |
  v == OMIT
end
    end
# Deserialize a JSON object to an instance of Money
    #
    # @param json_object [String] 
    # @return [square.rb::Money]
    def self.from_json(json_object:)
      struct = JSON.parse(json_object, object_class: OpenStruct)
      parsed_json = JSON.parse(json_object)
      amount = parsed_json["amount"]
      currency = parsed_json["currency"]
      new(
        amount: amount,
        currency: currency,
        additional_properties: struct
      )
    end
# Serialize an instance of Money to a JSON object
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
      obj.amount&.is_a?(Long) != false || raise("Passed value for field obj.amount is not the expected type, validation failed.")
      obj.currency&.is_a?(square.rb::Currency) != false || raise("Passed value for field obj.currency is not the expected type, validation failed.")
    end
  end
end