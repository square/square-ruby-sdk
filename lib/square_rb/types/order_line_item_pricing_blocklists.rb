# frozen_string_literal: true
require_relative "order_line_item_pricing_blocklists_blocked_discount"
require_relative "order_line_item_pricing_blocklists_blocked_tax"
require "ostruct"
require "json"

module SquareApiClient
# Describes pricing adjustments that are blocked from automatic
#  application to a line item. For more information, see
#  [Apply Taxes and
#  unts](https://developer.squareup.com/docs/orders-api/apply-taxes-and-discounts).
  class OrderLineItemPricingBlocklists
  # @return [Array<SquareApiClient::OrderLineItemPricingBlocklistsBlockedDiscount>] A list of discounts blocked from applying to the line item.
#  Discounts can be blocked by the `discount_uid` (for ad hoc discounts) or
#  the `discount_catalog_object_id` (for catalog discounts).
    attr_reader :blocked_discounts
  # @return [Array<SquareApiClient::OrderLineItemPricingBlocklistsBlockedTax>] A list of taxes blocked from applying to the line item.
#  Taxes can be blocked by the `tax_uid` (for ad hoc taxes) or
#  the `tax_catalog_object_id` (for catalog taxes).
    attr_reader :blocked_taxes
  # @return [OpenStruct] Additional properties unmapped to the current class definition
    attr_reader :additional_properties
  # @return [Object] 
    attr_reader :_field_set
    protected :_field_set

    OMIT = Object.new

    # @param blocked_discounts [Array<SquareApiClient::OrderLineItemPricingBlocklistsBlockedDiscount>] A list of discounts blocked from applying to the line item.
#  Discounts can be blocked by the `discount_uid` (for ad hoc discounts) or
#  the `discount_catalog_object_id` (for catalog discounts).
    # @param blocked_taxes [Array<SquareApiClient::OrderLineItemPricingBlocklistsBlockedTax>] A list of taxes blocked from applying to the line item.
#  Taxes can be blocked by the `tax_uid` (for ad hoc taxes) or
#  the `tax_catalog_object_id` (for catalog taxes).
    # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
    # @return [SquareApiClient::OrderLineItemPricingBlocklists]
    def initialize(blocked_discounts: OMIT, blocked_taxes: OMIT, additional_properties: nil)
      @blocked_discounts = blocked_discounts if blocked_discounts != OMIT
      @blocked_taxes = blocked_taxes if blocked_taxes != OMIT
      @additional_properties = additional_properties
      @_field_set = { "blocked_discounts": blocked_discounts, "blocked_taxes": blocked_taxes }.reject do | _k, v |
  v == OMIT
end
    end
# Deserialize a JSON object to an instance of OrderLineItemPricingBlocklists
    #
    # @param json_object [String] 
    # @return [SquareApiClient::OrderLineItemPricingBlocklists]
    def self.from_json(json_object:)
      struct = JSON.parse(json_object, object_class: OpenStruct)
      parsed_json = JSON.parse(json_object)
      blocked_discounts = parsed_json["blocked_discounts"]&.map do | item |
  item = item.to_json
  SquareApiClient::OrderLineItemPricingBlocklistsBlockedDiscount.from_json(json_object: item)
end
      blocked_taxes = parsed_json["blocked_taxes"]&.map do | item |
  item = item.to_json
  SquareApiClient::OrderLineItemPricingBlocklistsBlockedTax.from_json(json_object: item)
end
      new(
        blocked_discounts: blocked_discounts,
        blocked_taxes: blocked_taxes,
        additional_properties: struct
      )
    end
# Serialize an instance of OrderLineItemPricingBlocklists to a JSON object
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
      obj.blocked_discounts&.is_a?(Array) != false || raise("Passed value for field obj.blocked_discounts is not the expected type, validation failed.")
      obj.blocked_taxes&.is_a?(Array) != false || raise("Passed value for field obj.blocked_taxes is not the expected type, validation failed.")
    end
  end
end