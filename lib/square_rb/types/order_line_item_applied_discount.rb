# frozen_string_literal: true
require_relative "money"
require "ostruct"
require "json"

module SquareApiClient
# Represents an applied portion of a discount to a line item in an order.
#  Order scoped discounts have automatically applied discounts present for each
#  line item.
#  Line-item scoped discounts must have applied discounts added manually for any
#  applicable line
#  items. The corresponding applied money is automatically computed based on
#  participating
#  line items.
  class OrderLineItemAppliedDiscount
  # @return [String] A unique ID that identifies the applied discount only within this order.
    attr_reader :uid
  # @return [String] The `uid` of the discount that the applied discount represents. It must
#  reference a discount present in the `order.discounts` field.
#  This field is immutable. To change which discounts apply to a line item,
#  you must delete the discount and re-add it as a new
#  `OrderLineItemAppliedDiscount`.
    attr_reader :discount_uid
  # @return [SquareApiClient::Money] The amount of money applied by the discount to the line item.
    attr_reader :applied_money
  # @return [OpenStruct] Additional properties unmapped to the current class definition
    attr_reader :additional_properties
  # @return [Object] 
    attr_reader :_field_set
    protected :_field_set

    OMIT = Object.new

    # @param uid [String] A unique ID that identifies the applied discount only within this order.
    # @param discount_uid [String] The `uid` of the discount that the applied discount represents. It must
#  reference a discount present in the `order.discounts` field.
#  This field is immutable. To change which discounts apply to a line item,
#  you must delete the discount and re-add it as a new
#  `OrderLineItemAppliedDiscount`.
    # @param applied_money [SquareApiClient::Money] The amount of money applied by the discount to the line item.
    # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
    # @return [SquareApiClient::OrderLineItemAppliedDiscount]
    def initialize(uid: OMIT, discount_uid:, applied_money: OMIT, additional_properties: nil)
      @uid = uid if uid != OMIT
      @discount_uid = discount_uid
      @applied_money = applied_money if applied_money != OMIT
      @additional_properties = additional_properties
      @_field_set = { "uid": uid, "discount_uid": discount_uid, "applied_money": applied_money }.reject do | _k, v |
  v == OMIT
end
    end
# Deserialize a JSON object to an instance of OrderLineItemAppliedDiscount
    #
    # @param json_object [String] 
    # @return [SquareApiClient::OrderLineItemAppliedDiscount]
    def self.from_json(json_object:)
      struct = JSON.parse(json_object, object_class: OpenStruct)
      parsed_json = JSON.parse(json_object)
      uid = parsed_json["uid"]
      discount_uid = parsed_json["discount_uid"]
      unless parsed_json["applied_money"].nil?
        applied_money = parsed_json["applied_money"].to_json
        applied_money = SquareApiClient::Money.from_json(json_object: applied_money)
      else
        applied_money = nil
      end
      new(
        uid: uid,
        discount_uid: discount_uid,
        applied_money: applied_money,
        additional_properties: struct
      )
    end
# Serialize an instance of OrderLineItemAppliedDiscount to a JSON object
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
      obj.discount_uid.is_a?(String) != false || raise("Passed value for field obj.discount_uid is not the expected type, validation failed.")
      obj.applied_money.nil? || SquareApiClient::Money.validate_raw(obj: obj.applied_money)
    end
  end
end