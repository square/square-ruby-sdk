# frozen_string_literal: true
require_relative "money"
require_relative "payout_fee_type"
require "ostruct"
require "json"

module SquareApiClient
# Represents a payout fee that can incur as part of a payout.
  class PayoutFee
  # @return [SquareApiClient::Money] The money amount of the payout fee.
    attr_reader :amount_money
  # @return [String] The timestamp of when the fee takes effect, in RFC 3339 format.
    attr_reader :effective_at
  # @return [SquareApiClient::PayoutFeeType] The type of fee assessed as part of the payout.
#  See [PayoutFeeType](#type-payoutfeetype) for possible values
    attr_reader :type
  # @return [OpenStruct] Additional properties unmapped to the current class definition
    attr_reader :additional_properties
  # @return [Object] 
    attr_reader :_field_set
    protected :_field_set

    OMIT = Object.new

    # @param amount_money [SquareApiClient::Money] The money amount of the payout fee.
    # @param effective_at [String] The timestamp of when the fee takes effect, in RFC 3339 format.
    # @param type [SquareApiClient::PayoutFeeType] The type of fee assessed as part of the payout.
#  See [PayoutFeeType](#type-payoutfeetype) for possible values
    # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
    # @return [SquareApiClient::PayoutFee]
    def initialize(amount_money: OMIT, effective_at: OMIT, type: OMIT, additional_properties: nil)
      @amount_money = amount_money if amount_money != OMIT
      @effective_at = effective_at if effective_at != OMIT
      @type = type if type != OMIT
      @additional_properties = additional_properties
      @_field_set = { "amount_money": amount_money, "effective_at": effective_at, "type": type }.reject do | _k, v |
  v == OMIT
end
    end
# Deserialize a JSON object to an instance of PayoutFee
    #
    # @param json_object [String] 
    # @return [SquareApiClient::PayoutFee]
    def self.from_json(json_object:)
      struct = JSON.parse(json_object, object_class: OpenStruct)
      parsed_json = JSON.parse(json_object)
      unless parsed_json["amount_money"].nil?
        amount_money = parsed_json["amount_money"].to_json
        amount_money = SquareApiClient::Money.from_json(json_object: amount_money)
      else
        amount_money = nil
      end
      effective_at = parsed_json["effective_at"]
      type = parsed_json["type"]
      new(
        amount_money: amount_money,
        effective_at: effective_at,
        type: type,
        additional_properties: struct
      )
    end
# Serialize an instance of PayoutFee to a JSON object
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
      obj.amount_money.nil? || SquareApiClient::Money.validate_raw(obj: obj.amount_money)
      obj.effective_at&.is_a?(String) != false || raise("Passed value for field obj.effective_at is not the expected type, validation failed.")
      obj.type&.is_a?(SquareApiClient::PayoutFeeType) != false || raise("Passed value for field obj.type is not the expected type, validation failed.")
    end
  end
end