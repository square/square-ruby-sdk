# frozen_string_literal: true
require_relative "money"
require "ostruct"
require "json"

module SquareApiClient
# Represents the details of a tender with `type` `CASH`.
  class TenderCashDetails
  # @return [SquareApiClient::Money] The total amount of cash provided by the buyer, before change is given.
    attr_reader :buyer_tendered_money
  # @return [SquareApiClient::Money] The amount of change returned to the buyer.
    attr_reader :change_back_money
  # @return [OpenStruct] Additional properties unmapped to the current class definition
    attr_reader :additional_properties
  # @return [Object] 
    attr_reader :_field_set
    protected :_field_set

    OMIT = Object.new

    # @param buyer_tendered_money [SquareApiClient::Money] The total amount of cash provided by the buyer, before change is given.
    # @param change_back_money [SquareApiClient::Money] The amount of change returned to the buyer.
    # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
    # @return [SquareApiClient::TenderCashDetails]
    def initialize(buyer_tendered_money: OMIT, change_back_money: OMIT, additional_properties: nil)
      @buyer_tendered_money = buyer_tendered_money if buyer_tendered_money != OMIT
      @change_back_money = change_back_money if change_back_money != OMIT
      @additional_properties = additional_properties
      @_field_set = { "buyer_tendered_money": buyer_tendered_money, "change_back_money": change_back_money }.reject do | _k, v |
  v == OMIT
end
    end
# Deserialize a JSON object to an instance of TenderCashDetails
    #
    # @param json_object [String] 
    # @return [SquareApiClient::TenderCashDetails]
    def self.from_json(json_object:)
      struct = JSON.parse(json_object, object_class: OpenStruct)
      parsed_json = JSON.parse(json_object)
      unless parsed_json["buyer_tendered_money"].nil?
        buyer_tendered_money = parsed_json["buyer_tendered_money"].to_json
        buyer_tendered_money = SquareApiClient::Money.from_json(json_object: buyer_tendered_money)
      else
        buyer_tendered_money = nil
      end
      unless parsed_json["change_back_money"].nil?
        change_back_money = parsed_json["change_back_money"].to_json
        change_back_money = SquareApiClient::Money.from_json(json_object: change_back_money)
      else
        change_back_money = nil
      end
      new(
        buyer_tendered_money: buyer_tendered_money,
        change_back_money: change_back_money,
        additional_properties: struct
      )
    end
# Serialize an instance of TenderCashDetails to a JSON object
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
      obj.buyer_tendered_money.nil? || SquareApiClient::Money.validate_raw(obj: obj.buyer_tendered_money)
      obj.change_back_money.nil? || SquareApiClient::Money.validate_raw(obj: obj.change_back_money)
    end
  end
end