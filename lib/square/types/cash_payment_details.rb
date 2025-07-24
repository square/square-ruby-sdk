# frozen_string_literal: true
require_relative "money"
require "ostruct"
require "json"

module SquareApiClient
# Stores details about a cash payment. Contains only non-confidential information.
#  For more information, see
#  [Take Cash
#  ](https://developer.squareup.com/docs/payments-api/take-payments/cash-payments).
  class CashPaymentDetails
  # @return [SquareApiClient::Money] The amount and currency of the money supplied by the buyer.
    attr_reader :buyer_supplied_money
  # @return [SquareApiClient::Money] The amount of change due back to the buyer.
#  This read-only field is calculated
#  from the `amount_money` and `buyer_supplied_money` fields.
    attr_reader :change_back_money
  # @return [OpenStruct] Additional properties unmapped to the current class definition
    attr_reader :additional_properties
  # @return [Object] 
    attr_reader :_field_set
    protected :_field_set

    OMIT = Object.new

    # @param buyer_supplied_money [SquareApiClient::Money] The amount and currency of the money supplied by the buyer.
    # @param change_back_money [SquareApiClient::Money] The amount of change due back to the buyer.
#  This read-only field is calculated
#  from the `amount_money` and `buyer_supplied_money` fields.
    # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
    # @return [SquareApiClient::CashPaymentDetails]
    def initialize(buyer_supplied_money:, change_back_money: OMIT, additional_properties: nil)
      @buyer_supplied_money = buyer_supplied_money
      @change_back_money = change_back_money if change_back_money != OMIT
      @additional_properties = additional_properties
      @_field_set = { "buyer_supplied_money": buyer_supplied_money, "change_back_money": change_back_money }.reject do | _k, v |
  v == OMIT
end
    end
# Deserialize a JSON object to an instance of CashPaymentDetails
    #
    # @param json_object [String] 
    # @return [SquareApiClient::CashPaymentDetails]
    def self.from_json(json_object:)
      struct = JSON.parse(json_object, object_class: OpenStruct)
      parsed_json = JSON.parse(json_object)
      unless parsed_json["buyer_supplied_money"].nil?
        buyer_supplied_money = parsed_json["buyer_supplied_money"].to_json
        buyer_supplied_money = SquareApiClient::Money.from_json(json_object: buyer_supplied_money)
      else
        buyer_supplied_money = nil
      end
      unless parsed_json["change_back_money"].nil?
        change_back_money = parsed_json["change_back_money"].to_json
        change_back_money = SquareApiClient::Money.from_json(json_object: change_back_money)
      else
        change_back_money = nil
      end
      new(
        buyer_supplied_money: buyer_supplied_money,
        change_back_money: change_back_money,
        additional_properties: struct
      )
    end
# Serialize an instance of CashPaymentDetails to a JSON object
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
      SquareApiClient::Money.validate_raw(obj: obj.buyer_supplied_money)
      obj.change_back_money.nil? || SquareApiClient::Money.validate_raw(obj: obj.change_back_money)
    end
  end
end