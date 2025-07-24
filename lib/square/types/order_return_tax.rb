# frozen_string_literal: true
require_relative "order_line_item_tax_type"
require_relative "money"
require_relative "order_line_item_tax_scope"
require "ostruct"
require "json"

module SquareApiClient
# Represents a tax being returned that applies to one or more return line items in
#  an order.
#  Fixed-amount, order-scoped taxes are distributed across all non-zero return line
#  item totals.
#  The amount distributed to each return line item is relative to that item’s
#  contribution to the
#  order subtotal.
  class OrderReturnTax
  # @return [String] A unique ID that identifies the returned tax only within this order.
    attr_reader :uid
  # @return [String] The tax `uid` from the order that contains the original tax charge.
    attr_reader :source_tax_uid
  # @return [String] The catalog object ID referencing [CatalogTax](entity:CatalogTax).
    attr_reader :catalog_object_id
  # @return [Long] The version of the catalog object that this tax references.
    attr_reader :catalog_version
  # @return [String] The tax's name.
    attr_reader :name
  # @return [SquareApiClient::OrderLineItemTaxType] Indicates the calculation method used to apply the tax.
#  See [OrderLineItemTaxType](#type-orderlineitemtaxtype) for possible values
    attr_reader :type
  # @return [String] The percentage of the tax, as a string representation of a decimal number.
#  For example, a value of `"7.25"` corresponds to a percentage of 7.25%.
    attr_reader :percentage
  # @return [SquareApiClient::Money] The amount of money applied by the tax in an order.
    attr_reader :applied_money
  # @return [SquareApiClient::OrderLineItemTaxScope] Indicates the level at which the `OrderReturnTax` applies. For `ORDER` scoped
#  taxes, Square generates references in `applied_taxes` on all
#  `OrderReturnLineItem`s. For `LINE_ITEM` scoped taxes, the tax is only applied to
#  `OrderReturnLineItem`s with references in their `applied_discounts` field.
#  See [OrderLineItemTaxScope](#type-orderlineitemtaxscope) for possible values
    attr_reader :scope
  # @return [OpenStruct] Additional properties unmapped to the current class definition
    attr_reader :additional_properties
  # @return [Object] 
    attr_reader :_field_set
    protected :_field_set

    OMIT = Object.new

    # @param uid [String] A unique ID that identifies the returned tax only within this order.
    # @param source_tax_uid [String] The tax `uid` from the order that contains the original tax charge.
    # @param catalog_object_id [String] The catalog object ID referencing [CatalogTax](entity:CatalogTax).
    # @param catalog_version [Long] The version of the catalog object that this tax references.
    # @param name [String] The tax's name.
    # @param type [SquareApiClient::OrderLineItemTaxType] Indicates the calculation method used to apply the tax.
#  See [OrderLineItemTaxType](#type-orderlineitemtaxtype) for possible values
    # @param percentage [String] The percentage of the tax, as a string representation of a decimal number.
#  For example, a value of `"7.25"` corresponds to a percentage of 7.25%.
    # @param applied_money [SquareApiClient::Money] The amount of money applied by the tax in an order.
    # @param scope [SquareApiClient::OrderLineItemTaxScope] Indicates the level at which the `OrderReturnTax` applies. For `ORDER` scoped
#  taxes, Square generates references in `applied_taxes` on all
#  `OrderReturnLineItem`s. For `LINE_ITEM` scoped taxes, the tax is only applied to
#  `OrderReturnLineItem`s with references in their `applied_discounts` field.
#  See [OrderLineItemTaxScope](#type-orderlineitemtaxscope) for possible values
    # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
    # @return [SquareApiClient::OrderReturnTax]
    def initialize(uid: OMIT, source_tax_uid: OMIT, catalog_object_id: OMIT, catalog_version: OMIT, name: OMIT, type: OMIT, percentage: OMIT, applied_money: OMIT, scope: OMIT, additional_properties: nil)
      @uid = uid if uid != OMIT
      @source_tax_uid = source_tax_uid if source_tax_uid != OMIT
      @catalog_object_id = catalog_object_id if catalog_object_id != OMIT
      @catalog_version = catalog_version if catalog_version != OMIT
      @name = name if name != OMIT
      @type = type if type != OMIT
      @percentage = percentage if percentage != OMIT
      @applied_money = applied_money if applied_money != OMIT
      @scope = scope if scope != OMIT
      @additional_properties = additional_properties
      @_field_set = { "uid": uid, "source_tax_uid": source_tax_uid, "catalog_object_id": catalog_object_id, "catalog_version": catalog_version, "name": name, "type": type, "percentage": percentage, "applied_money": applied_money, "scope": scope }.reject do | _k, v |
  v == OMIT
end
    end
# Deserialize a JSON object to an instance of OrderReturnTax
    #
    # @param json_object [String] 
    # @return [SquareApiClient::OrderReturnTax]
    def self.from_json(json_object:)
      struct = JSON.parse(json_object, object_class: OpenStruct)
      parsed_json = JSON.parse(json_object)
      uid = parsed_json["uid"]
      source_tax_uid = parsed_json["source_tax_uid"]
      catalog_object_id = parsed_json["catalog_object_id"]
      catalog_version = parsed_json["catalog_version"]
      name = parsed_json["name"]
      type = parsed_json["type"]
      percentage = parsed_json["percentage"]
      unless parsed_json["applied_money"].nil?
        applied_money = parsed_json["applied_money"].to_json
        applied_money = SquareApiClient::Money.from_json(json_object: applied_money)
      else
        applied_money = nil
      end
      scope = parsed_json["scope"]
      new(
        uid: uid,
        source_tax_uid: source_tax_uid,
        catalog_object_id: catalog_object_id,
        catalog_version: catalog_version,
        name: name,
        type: type,
        percentage: percentage,
        applied_money: applied_money,
        scope: scope,
        additional_properties: struct
      )
    end
# Serialize an instance of OrderReturnTax to a JSON object
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
      obj.source_tax_uid&.is_a?(String) != false || raise("Passed value for field obj.source_tax_uid is not the expected type, validation failed.")
      obj.catalog_object_id&.is_a?(String) != false || raise("Passed value for field obj.catalog_object_id is not the expected type, validation failed.")
      obj.catalog_version&.is_a?(Long) != false || raise("Passed value for field obj.catalog_version is not the expected type, validation failed.")
      obj.name&.is_a?(String) != false || raise("Passed value for field obj.name is not the expected type, validation failed.")
      obj.type&.is_a?(SquareApiClient::OrderLineItemTaxType) != false || raise("Passed value for field obj.type is not the expected type, validation failed.")
      obj.percentage&.is_a?(String) != false || raise("Passed value for field obj.percentage is not the expected type, validation failed.")
      obj.applied_money.nil? || SquareApiClient::Money.validate_raw(obj: obj.applied_money)
      obj.scope&.is_a?(SquareApiClient::OrderLineItemTaxScope) != false || raise("Passed value for field obj.scope is not the expected type, validation failed.")
    end
  end
end