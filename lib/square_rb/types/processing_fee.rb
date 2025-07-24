# frozen_string_literal: true
require_relative "money"
require "ostruct"
require "json"

module SquareApiClient
# Represents the Square processing fee.
  class ProcessingFee
  # @return [String] The timestamp of when the fee takes effect, in RFC 3339 format.
    attr_reader :effective_at
  # @return [String] The type of fee assessed or adjusted. The fee type can be `INITIAL` or
#  `ADJUSTMENT`.
    attr_reader :type
  # @return [SquareApiClient::Money] The fee amount, which might be negative, that is assessed or adjusted by Square.
#  Positive values represent funds being assessed, while negative values represent
#  funds being returned.
    attr_reader :amount_money
  # @return [OpenStruct] Additional properties unmapped to the current class definition
    attr_reader :additional_properties
  # @return [Object] 
    attr_reader :_field_set
    protected :_field_set

    OMIT = Object.new

    # @param effective_at [String] The timestamp of when the fee takes effect, in RFC 3339 format.
    # @param type [String] The type of fee assessed or adjusted. The fee type can be `INITIAL` or
#  `ADJUSTMENT`.
    # @param amount_money [SquareApiClient::Money] The fee amount, which might be negative, that is assessed or adjusted by Square.
#  Positive values represent funds being assessed, while negative values represent
#  funds being returned.
    # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
    # @return [SquareApiClient::ProcessingFee]
    def initialize(effective_at: OMIT, type: OMIT, amount_money: OMIT, additional_properties: nil)
      @effective_at = effective_at if effective_at != OMIT
      @type = type if type != OMIT
      @amount_money = amount_money if amount_money != OMIT
      @additional_properties = additional_properties
      @_field_set = { "effective_at": effective_at, "type": type, "amount_money": amount_money }.reject do | _k, v |
  v == OMIT
end
    end
# Deserialize a JSON object to an instance of ProcessingFee
    #
    # @param json_object [String] 
    # @return [SquareApiClient::ProcessingFee]
    def self.from_json(json_object:)
      struct = JSON.parse(json_object, object_class: OpenStruct)
      parsed_json = JSON.parse(json_object)
      effective_at = parsed_json["effective_at"]
      type = parsed_json["type"]
      unless parsed_json["amount_money"].nil?
        amount_money = parsed_json["amount_money"].to_json
        amount_money = SquareApiClient::Money.from_json(json_object: amount_money)
      else
        amount_money = nil
      end
      new(
        effective_at: effective_at,
        type: type,
        amount_money: amount_money,
        additional_properties: struct
      )
    end
# Serialize an instance of ProcessingFee to a JSON object
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
      obj.effective_at&.is_a?(String) != false || raise("Passed value for field obj.effective_at is not the expected type, validation failed.")
      obj.type&.is_a?(String) != false || raise("Passed value for field obj.type is not the expected type, validation failed.")
      obj.amount_money.nil? || SquareApiClient::Money.validate_raw(obj: obj.amount_money)
    end
  end
end