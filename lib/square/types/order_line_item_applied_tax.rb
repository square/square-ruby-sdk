# frozen_string_literal: true
require_relative "money"
require "ostruct"
require "json"

module square.rb
# Represents an applied portion of a tax to a line item in an order.
#  Order-scoped taxes automatically include the applied taxes in each line item.
#  Line item taxes must be referenced from any applicable line items.
#  The corresponding applied money is automatically computed, based on the
#  set of participating line items.
  class OrderLineItemAppliedTax
  # @return [String] A unique ID that identifies the applied tax only within this order.
    attr_reader :uid
  # @return [String] The `uid` of the tax for which this applied tax represents. It must reference
#  a tax present in the `order.taxes` field.
#  This field is immutable. To change which taxes apply to a line item, delete and
#  add a new
#  `OrderLineItemAppliedTax`.
    attr_reader :tax_uid
  # @return [square.rb::Money] The amount of money applied by the tax to the line item.
    attr_reader :applied_money
  # @return [OpenStruct] Additional properties unmapped to the current class definition
    attr_reader :additional_properties
  # @return [Object] 
    attr_reader :_field_set
    protected :_field_set

    OMIT = Object.new

    # @param uid [String] A unique ID that identifies the applied tax only within this order.
    # @param tax_uid [String] The `uid` of the tax for which this applied tax represents. It must reference
#  a tax present in the `order.taxes` field.
#  This field is immutable. To change which taxes apply to a line item, delete and
#  add a new
#  `OrderLineItemAppliedTax`.
    # @param applied_money [square.rb::Money] The amount of money applied by the tax to the line item.
    # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
    # @return [square.rb::OrderLineItemAppliedTax]
    def initialize(uid: OMIT, tax_uid:, applied_money: OMIT, additional_properties: nil)
      @uid = uid if uid != OMIT
      @tax_uid = tax_uid
      @applied_money = applied_money if applied_money != OMIT
      @additional_properties = additional_properties
      @_field_set = { "uid": uid, "tax_uid": tax_uid, "applied_money": applied_money }.reject do | _k, v |
  v == OMIT
end
    end
# Deserialize a JSON object to an instance of OrderLineItemAppliedTax
    #
    # @param json_object [String] 
    # @return [square.rb::OrderLineItemAppliedTax]
    def self.from_json(json_object:)
      struct = JSON.parse(json_object, object_class: OpenStruct)
      parsed_json = JSON.parse(json_object)
      uid = parsed_json["uid"]
      tax_uid = parsed_json["tax_uid"]
      unless parsed_json["applied_money"].nil?
        applied_money = parsed_json["applied_money"].to_json
        applied_money = square.rb::Money.from_json(json_object: applied_money)
      else
        applied_money = nil
      end
      new(
        uid: uid,
        tax_uid: tax_uid,
        applied_money: applied_money,
        additional_properties: struct
      )
    end
# Serialize an instance of OrderLineItemAppliedTax to a JSON object
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
      obj.tax_uid.is_a?(String) != false || raise("Passed value for field obj.tax_uid is not the expected type, validation failed.")
      obj.applied_money.nil? || square.rb::Money.validate_raw(obj: obj.applied_money)
    end
  end
end