# frozen_string_literal: true
require_relative "money"
require "ostruct"
require "json"

module square.rb
# Stores details about a cash refund. Contains only non-confidential information.
  class DestinationDetailsCashRefundDetails
  # @return [square.rb::Money] The amount and currency of the money supplied by the seller.
    attr_reader :seller_supplied_money
  # @return [square.rb::Money] The amount of change due back to the seller.
#  This read-only field is calculated
#  from the `amount_money` and `seller_supplied_money` fields.
    attr_reader :change_back_money
  # @return [OpenStruct] Additional properties unmapped to the current class definition
    attr_reader :additional_properties
  # @return [Object] 
    attr_reader :_field_set
    protected :_field_set

    OMIT = Object.new

    # @param seller_supplied_money [square.rb::Money] The amount and currency of the money supplied by the seller.
    # @param change_back_money [square.rb::Money] The amount of change due back to the seller.
#  This read-only field is calculated
#  from the `amount_money` and `seller_supplied_money` fields.
    # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
    # @return [square.rb::DestinationDetailsCashRefundDetails]
    def initialize(seller_supplied_money:, change_back_money: OMIT, additional_properties: nil)
      @seller_supplied_money = seller_supplied_money
      @change_back_money = change_back_money if change_back_money != OMIT
      @additional_properties = additional_properties
      @_field_set = { "seller_supplied_money": seller_supplied_money, "change_back_money": change_back_money }.reject do | _k, v |
  v == OMIT
end
    end
# Deserialize a JSON object to an instance of DestinationDetailsCashRefundDetails
    #
    # @param json_object [String] 
    # @return [square.rb::DestinationDetailsCashRefundDetails]
    def self.from_json(json_object:)
      struct = JSON.parse(json_object, object_class: OpenStruct)
      parsed_json = JSON.parse(json_object)
      unless parsed_json["seller_supplied_money"].nil?
        seller_supplied_money = parsed_json["seller_supplied_money"].to_json
        seller_supplied_money = square.rb::Money.from_json(json_object: seller_supplied_money)
      else
        seller_supplied_money = nil
      end
      unless parsed_json["change_back_money"].nil?
        change_back_money = parsed_json["change_back_money"].to_json
        change_back_money = square.rb::Money.from_json(json_object: change_back_money)
      else
        change_back_money = nil
      end
      new(
        seller_supplied_money: seller_supplied_money,
        change_back_money: change_back_money,
        additional_properties: struct
      )
    end
# Serialize an instance of DestinationDetailsCashRefundDetails to a JSON object
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
      square.rb::Money.validate_raw(obj: obj.seller_supplied_money)
      obj.change_back_money.nil? || square.rb::Money.validate_raw(obj: obj.change_back_money)
    end
  end
end