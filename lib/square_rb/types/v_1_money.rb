# frozen_string_literal: true
require_relative "currency"
require "ostruct"
require "json"

module SquareApiClient
  class V1Money
  # @return [Integer] Amount in the lowest denominated value of this Currency. E.g. in USD
#  these are cents, in JPY they are Yen (which do not have a 'cent' concept).
    attr_reader :amount
  # @return [SquareApiClient::Currency] 
#  See [Currency](#type-currency) for possible values
    attr_reader :currency_code
  # @return [OpenStruct] Additional properties unmapped to the current class definition
    attr_reader :additional_properties
  # @return [Object] 
    attr_reader :_field_set
    protected :_field_set

    OMIT = Object.new

    # @param amount [Integer] Amount in the lowest denominated value of this Currency. E.g. in USD
#  these are cents, in JPY they are Yen (which do not have a 'cent' concept).
    # @param currency_code [SquareApiClient::Currency] 
#  See [Currency](#type-currency) for possible values
    # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
    # @return [SquareApiClient::V1Money]
    def initialize(amount: OMIT, currency_code: OMIT, additional_properties: nil)
      @amount = amount if amount != OMIT
      @currency_code = currency_code if currency_code != OMIT
      @additional_properties = additional_properties
      @_field_set = { "amount": amount, "currency_code": currency_code }.reject do | _k, v |
  v == OMIT
end
    end
# Deserialize a JSON object to an instance of V1Money
    #
    # @param json_object [String] 
    # @return [SquareApiClient::V1Money]
    def self.from_json(json_object:)
      struct = JSON.parse(json_object, object_class: OpenStruct)
      parsed_json = JSON.parse(json_object)
      amount = parsed_json["amount"]
      currency_code = parsed_json["currency_code"]
      new(
        amount: amount,
        currency_code: currency_code,
        additional_properties: struct
      )
    end
# Serialize an instance of V1Money to a JSON object
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
      obj.amount&.is_a?(Integer) != false || raise("Passed value for field obj.amount is not the expected type, validation failed.")
      obj.currency_code&.is_a?(SquareApiClient::Currency) != false || raise("Passed value for field obj.currency_code is not the expected type, validation failed.")
    end
  end
end