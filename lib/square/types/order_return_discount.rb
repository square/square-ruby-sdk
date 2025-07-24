# frozen_string_literal: true
require_relative "order_line_item_discount_type"
require_relative "money"
require_relative "order_line_item_discount_scope"
require "ostruct"
require "json"

module SquareApiClient
# Represents a discount being returned that applies to one or more return line
#  items in an
#  order.
#  Fixed-amount, order-scoped discounts are distributed across all non-zero return
#  line item totals.
#  The amount distributed to each return line item is relative to that item’s
#  contribution to the
#  order subtotal.
  class OrderReturnDiscount
  # @return [String] A unique ID that identifies the returned discount only within this order.
    attr_reader :uid
  # @return [String] The discount `uid` from the order that contains the original application of this
#  discount.
    attr_reader :source_discount_uid
  # @return [String] The catalog object ID referencing [CatalogDiscount](entity:CatalogDiscount).
    attr_reader :catalog_object_id
  # @return [Long] The version of the catalog object that this discount references.
    attr_reader :catalog_version
  # @return [String] The discount's name.
    attr_reader :name
  # @return [SquareApiClient::OrderLineItemDiscountType] The type of the discount. If it is created by the API, it is `FIXED_PERCENTAGE`
#  or `FIXED_AMOUNT`.
#  Discounts that do not reference a catalog object ID must have a type of
#  `FIXED_PERCENTAGE` or `FIXED_AMOUNT`.
#  See [OrderLineItemDiscountType](#type-orderlineitemdiscounttype) for possible
#  values
    attr_reader :type
  # @return [String] The percentage of the tax, as a string representation of a decimal number.
#  A value of `"7.25"` corresponds to a percentage of 7.25%.
#  `percentage` is not set for amount-based discounts.
    attr_reader :percentage
  # @return [SquareApiClient::Money] The total declared monetary amount of the discount.
#  `amount_money` is not set for percentage-based discounts.
    attr_reader :amount_money
  # @return [SquareApiClient::Money] The amount of discount actually applied to this line item. When an amount-based
#  discount is at the order level, this value is different from `amount_money`
#  because the discount
#  is distributed across the line items.
    attr_reader :applied_money
  # @return [SquareApiClient::OrderLineItemDiscountScope] Indicates the level at which the `OrderReturnDiscount` applies. For `ORDER`
#  scoped
#  discounts, the server generates references in `applied_discounts` on all
#  `OrderReturnLineItem`s. For `LINE_ITEM` scoped discounts, the discount is only
#  applied to
#  `OrderReturnLineItem`s with references in their `applied_discounts` field.
#  See [OrderLineItemDiscountScope](#type-orderlineitemdiscountscope) for possible
#  values
    attr_reader :scope
  # @return [OpenStruct] Additional properties unmapped to the current class definition
    attr_reader :additional_properties
  # @return [Object] 
    attr_reader :_field_set
    protected :_field_set

    OMIT = Object.new

    # @param uid [String] A unique ID that identifies the returned discount only within this order.
    # @param source_discount_uid [String] The discount `uid` from the order that contains the original application of this
#  discount.
    # @param catalog_object_id [String] The catalog object ID referencing [CatalogDiscount](entity:CatalogDiscount).
    # @param catalog_version [Long] The version of the catalog object that this discount references.
    # @param name [String] The discount's name.
    # @param type [SquareApiClient::OrderLineItemDiscountType] The type of the discount. If it is created by the API, it is `FIXED_PERCENTAGE`
#  or `FIXED_AMOUNT`.
#  Discounts that do not reference a catalog object ID must have a type of
#  `FIXED_PERCENTAGE` or `FIXED_AMOUNT`.
#  See [OrderLineItemDiscountType](#type-orderlineitemdiscounttype) for possible
#  values
    # @param percentage [String] The percentage of the tax, as a string representation of a decimal number.
#  A value of `"7.25"` corresponds to a percentage of 7.25%.
#  `percentage` is not set for amount-based discounts.
    # @param amount_money [SquareApiClient::Money] The total declared monetary amount of the discount.
#  `amount_money` is not set for percentage-based discounts.
    # @param applied_money [SquareApiClient::Money] The amount of discount actually applied to this line item. When an amount-based
#  discount is at the order level, this value is different from `amount_money`
#  because the discount
#  is distributed across the line items.
    # @param scope [SquareApiClient::OrderLineItemDiscountScope] Indicates the level at which the `OrderReturnDiscount` applies. For `ORDER`
#  scoped
#  discounts, the server generates references in `applied_discounts` on all
#  `OrderReturnLineItem`s. For `LINE_ITEM` scoped discounts, the discount is only
#  applied to
#  `OrderReturnLineItem`s with references in their `applied_discounts` field.
#  See [OrderLineItemDiscountScope](#type-orderlineitemdiscountscope) for possible
#  values
    # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
    # @return [SquareApiClient::OrderReturnDiscount]
    def initialize(uid: OMIT, source_discount_uid: OMIT, catalog_object_id: OMIT, catalog_version: OMIT, name: OMIT, type: OMIT, percentage: OMIT, amount_money: OMIT, applied_money: OMIT, scope: OMIT, additional_properties: nil)
      @uid = uid if uid != OMIT
      @source_discount_uid = source_discount_uid if source_discount_uid != OMIT
      @catalog_object_id = catalog_object_id if catalog_object_id != OMIT
      @catalog_version = catalog_version if catalog_version != OMIT
      @name = name if name != OMIT
      @type = type if type != OMIT
      @percentage = percentage if percentage != OMIT
      @amount_money = amount_money if amount_money != OMIT
      @applied_money = applied_money if applied_money != OMIT
      @scope = scope if scope != OMIT
      @additional_properties = additional_properties
      @_field_set = { "uid": uid, "source_discount_uid": source_discount_uid, "catalog_object_id": catalog_object_id, "catalog_version": catalog_version, "name": name, "type": type, "percentage": percentage, "amount_money": amount_money, "applied_money": applied_money, "scope": scope }.reject do | _k, v |
  v == OMIT
end
    end
# Deserialize a JSON object to an instance of OrderReturnDiscount
    #
    # @param json_object [String] 
    # @return [SquareApiClient::OrderReturnDiscount]
    def self.from_json(json_object:)
      struct = JSON.parse(json_object, object_class: OpenStruct)
      parsed_json = JSON.parse(json_object)
      uid = parsed_json["uid"]
      source_discount_uid = parsed_json["source_discount_uid"]
      catalog_object_id = parsed_json["catalog_object_id"]
      catalog_version = parsed_json["catalog_version"]
      name = parsed_json["name"]
      type = parsed_json["type"]
      percentage = parsed_json["percentage"]
      unless parsed_json["amount_money"].nil?
        amount_money = parsed_json["amount_money"].to_json
        amount_money = SquareApiClient::Money.from_json(json_object: amount_money)
      else
        amount_money = nil
      end
      unless parsed_json["applied_money"].nil?
        applied_money = parsed_json["applied_money"].to_json
        applied_money = SquareApiClient::Money.from_json(json_object: applied_money)
      else
        applied_money = nil
      end
      scope = parsed_json["scope"]
      new(
        uid: uid,
        source_discount_uid: source_discount_uid,
        catalog_object_id: catalog_object_id,
        catalog_version: catalog_version,
        name: name,
        type: type,
        percentage: percentage,
        amount_money: amount_money,
        applied_money: applied_money,
        scope: scope,
        additional_properties: struct
      )
    end
# Serialize an instance of OrderReturnDiscount to a JSON object
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
      obj.source_discount_uid&.is_a?(String) != false || raise("Passed value for field obj.source_discount_uid is not the expected type, validation failed.")
      obj.catalog_object_id&.is_a?(String) != false || raise("Passed value for field obj.catalog_object_id is not the expected type, validation failed.")
      obj.catalog_version&.is_a?(Long) != false || raise("Passed value for field obj.catalog_version is not the expected type, validation failed.")
      obj.name&.is_a?(String) != false || raise("Passed value for field obj.name is not the expected type, validation failed.")
      obj.type&.is_a?(SquareApiClient::OrderLineItemDiscountType) != false || raise("Passed value for field obj.type is not the expected type, validation failed.")
      obj.percentage&.is_a?(String) != false || raise("Passed value for field obj.percentage is not the expected type, validation failed.")
      obj.amount_money.nil? || SquareApiClient::Money.validate_raw(obj: obj.amount_money)
      obj.applied_money.nil? || SquareApiClient::Money.validate_raw(obj: obj.applied_money)
      obj.scope&.is_a?(SquareApiClient::OrderLineItemDiscountScope) != false || raise("Passed value for field obj.scope is not the expected type, validation failed.")
    end
  end
end