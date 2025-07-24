# frozen_string_literal: true
require_relative "order_return_line_item"
require_relative "order_return_service_charge"
require_relative "order_return_tax"
require_relative "order_return_discount"
require_relative "order_return_tip"
require_relative "order_rounding_adjustment"
require_relative "order_money_amounts"
require "ostruct"
require "json"

module SquareApiClient
# The set of line items, service charges, taxes, discounts, tips, and other items
#  being returned in an order.
  class OrderReturn
  # @return [String] A unique ID that identifies the return only within this order.
    attr_reader :uid
  # @return [String] An order that contains the original sale of these return line items. This is
#  unset
#  for unlinked returns.
    attr_reader :source_order_id
  # @return [Array<SquareApiClient::OrderReturnLineItem>] A collection of line items that are being returned.
    attr_reader :return_line_items
  # @return [Array<SquareApiClient::OrderReturnServiceCharge>] A collection of service charges that are being returned.
    attr_reader :return_service_charges
  # @return [Array<SquareApiClient::OrderReturnTax>] A collection of references to taxes being returned for an order, including the
#  total
#  applied tax amount to be returned. The taxes must reference a top-level tax ID
#  from the source
#  order.
    attr_reader :return_taxes
  # @return [Array<SquareApiClient::OrderReturnDiscount>] A collection of references to discounts being returned for an order, including
#  the total
#  applied discount amount to be returned. The discounts must reference a top-level
#  discount ID
#  from the source order.
    attr_reader :return_discounts
  # @return [Array<SquareApiClient::OrderReturnTip>] A collection of references to tips being returned for an order.
    attr_reader :return_tips
  # @return [SquareApiClient::OrderRoundingAdjustment] A positive or negative rounding adjustment to the total value being returned.
#  Adjustments are commonly
#  used to apply cash rounding when the minimum unit of the account is smaller than
#  the lowest
#  physical denomination of the currency.
    attr_reader :rounding_adjustment
  # @return [SquareApiClient::OrderMoneyAmounts] An aggregate monetary value being returned by this return entry.
    attr_reader :return_amounts
  # @return [OpenStruct] Additional properties unmapped to the current class definition
    attr_reader :additional_properties
  # @return [Object] 
    attr_reader :_field_set
    protected :_field_set

    OMIT = Object.new

    # @param uid [String] A unique ID that identifies the return only within this order.
    # @param source_order_id [String] An order that contains the original sale of these return line items. This is
#  unset
#  for unlinked returns.
    # @param return_line_items [Array<SquareApiClient::OrderReturnLineItem>] A collection of line items that are being returned.
    # @param return_service_charges [Array<SquareApiClient::OrderReturnServiceCharge>] A collection of service charges that are being returned.
    # @param return_taxes [Array<SquareApiClient::OrderReturnTax>] A collection of references to taxes being returned for an order, including the
#  total
#  applied tax amount to be returned. The taxes must reference a top-level tax ID
#  from the source
#  order.
    # @param return_discounts [Array<SquareApiClient::OrderReturnDiscount>] A collection of references to discounts being returned for an order, including
#  the total
#  applied discount amount to be returned. The discounts must reference a top-level
#  discount ID
#  from the source order.
    # @param return_tips [Array<SquareApiClient::OrderReturnTip>] A collection of references to tips being returned for an order.
    # @param rounding_adjustment [SquareApiClient::OrderRoundingAdjustment] A positive or negative rounding adjustment to the total value being returned.
#  Adjustments are commonly
#  used to apply cash rounding when the minimum unit of the account is smaller than
#  the lowest
#  physical denomination of the currency.
    # @param return_amounts [SquareApiClient::OrderMoneyAmounts] An aggregate monetary value being returned by this return entry.
    # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
    # @return [SquareApiClient::OrderReturn]
    def initialize(uid: OMIT, source_order_id: OMIT, return_line_items: OMIT, return_service_charges: OMIT, return_taxes: OMIT, return_discounts: OMIT, return_tips: OMIT, rounding_adjustment: OMIT, return_amounts: OMIT, additional_properties: nil)
      @uid = uid if uid != OMIT
      @source_order_id = source_order_id if source_order_id != OMIT
      @return_line_items = return_line_items if return_line_items != OMIT
      @return_service_charges = return_service_charges if return_service_charges != OMIT
      @return_taxes = return_taxes if return_taxes != OMIT
      @return_discounts = return_discounts if return_discounts != OMIT
      @return_tips = return_tips if return_tips != OMIT
      @rounding_adjustment = rounding_adjustment if rounding_adjustment != OMIT
      @return_amounts = return_amounts if return_amounts != OMIT
      @additional_properties = additional_properties
      @_field_set = { "uid": uid, "source_order_id": source_order_id, "return_line_items": return_line_items, "return_service_charges": return_service_charges, "return_taxes": return_taxes, "return_discounts": return_discounts, "return_tips": return_tips, "rounding_adjustment": rounding_adjustment, "return_amounts": return_amounts }.reject do | _k, v |
  v == OMIT
end
    end
# Deserialize a JSON object to an instance of OrderReturn
    #
    # @param json_object [String] 
    # @return [SquareApiClient::OrderReturn]
    def self.from_json(json_object:)
      struct = JSON.parse(json_object, object_class: OpenStruct)
      parsed_json = JSON.parse(json_object)
      uid = parsed_json["uid"]
      source_order_id = parsed_json["source_order_id"]
      return_line_items = parsed_json["return_line_items"]&.map do | item |
  item = item.to_json
  SquareApiClient::OrderReturnLineItem.from_json(json_object: item)
end
      return_service_charges = parsed_json["return_service_charges"]&.map do | item |
  item = item.to_json
  SquareApiClient::OrderReturnServiceCharge.from_json(json_object: item)
end
      return_taxes = parsed_json["return_taxes"]&.map do | item |
  item = item.to_json
  SquareApiClient::OrderReturnTax.from_json(json_object: item)
end
      return_discounts = parsed_json["return_discounts"]&.map do | item |
  item = item.to_json
  SquareApiClient::OrderReturnDiscount.from_json(json_object: item)
end
      return_tips = parsed_json["return_tips"]&.map do | item |
  item = item.to_json
  SquareApiClient::OrderReturnTip.from_json(json_object: item)
end
      unless parsed_json["rounding_adjustment"].nil?
        rounding_adjustment = parsed_json["rounding_adjustment"].to_json
        rounding_adjustment = SquareApiClient::OrderRoundingAdjustment.from_json(json_object: rounding_adjustment)
      else
        rounding_adjustment = nil
      end
      unless parsed_json["return_amounts"].nil?
        return_amounts = parsed_json["return_amounts"].to_json
        return_amounts = SquareApiClient::OrderMoneyAmounts.from_json(json_object: return_amounts)
      else
        return_amounts = nil
      end
      new(
        uid: uid,
        source_order_id: source_order_id,
        return_line_items: return_line_items,
        return_service_charges: return_service_charges,
        return_taxes: return_taxes,
        return_discounts: return_discounts,
        return_tips: return_tips,
        rounding_adjustment: rounding_adjustment,
        return_amounts: return_amounts,
        additional_properties: struct
      )
    end
# Serialize an instance of OrderReturn to a JSON object
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
      obj.source_order_id&.is_a?(String) != false || raise("Passed value for field obj.source_order_id is not the expected type, validation failed.")
      obj.return_line_items&.is_a?(Array) != false || raise("Passed value for field obj.return_line_items is not the expected type, validation failed.")
      obj.return_service_charges&.is_a?(Array) != false || raise("Passed value for field obj.return_service_charges is not the expected type, validation failed.")
      obj.return_taxes&.is_a?(Array) != false || raise("Passed value for field obj.return_taxes is not the expected type, validation failed.")
      obj.return_discounts&.is_a?(Array) != false || raise("Passed value for field obj.return_discounts is not the expected type, validation failed.")
      obj.return_tips&.is_a?(Array) != false || raise("Passed value for field obj.return_tips is not the expected type, validation failed.")
      obj.rounding_adjustment.nil? || SquareApiClient::OrderRoundingAdjustment.validate_raw(obj: obj.rounding_adjustment)
      obj.return_amounts.nil? || SquareApiClient::OrderMoneyAmounts.validate_raw(obj: obj.return_amounts)
    end
  end
end