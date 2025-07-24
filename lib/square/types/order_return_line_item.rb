# frozen_string_literal: true
require_relative "order_quantity_unit"
require_relative "order_line_item_item_type"
require_relative "order_return_line_item_modifier"
require_relative "order_line_item_applied_tax"
require_relative "order_line_item_applied_discount"
require_relative "money"
require_relative "order_line_item_applied_service_charge"
require "ostruct"
require "json"

module square.rb
# The line item being returned in an order.
  class OrderReturnLineItem
  # @return [String] A unique ID for this return line-item entry.
    attr_reader :uid
  # @return [String] The `uid` of the line item in the original sale order.
    attr_reader :source_line_item_uid
  # @return [String] The name of the line item.
    attr_reader :name
  # @return [String] The quantity returned, formatted as a decimal number.
#  For example, `"3"`.
#  Line items with a `quantity_unit` can have non-integer quantities.
#  For example, `"1.70000"`.
    attr_reader :quantity
  # @return [square.rb::OrderQuantityUnit] The unit and precision that this return line item's quantity is measured in.
    attr_reader :quantity_unit
  # @return [String] The note of the return line item.
    attr_reader :note
  # @return [String] The [CatalogItemVariation](entity:CatalogItemVariation) ID applied to this
#  return line item.
    attr_reader :catalog_object_id
  # @return [Long] The version of the catalog object that this line item references.
    attr_reader :catalog_version
  # @return [String] The name of the variation applied to this return line item.
    attr_reader :variation_name
  # @return [square.rb::OrderLineItemItemType] The type of line item: an itemized return, a non-itemized return (custom
#  amount),
#  or the return of an unactivated gift card sale.
#  See [OrderLineItemItemType](#type-orderlineitemitemtype) for possible values
    attr_reader :item_type
  # @return [Array<square.rb::OrderReturnLineItemModifier>] The [CatalogModifier](entity:CatalogModifier)s applied to this line item.
    attr_reader :return_modifiers
  # @return [Array<square.rb::OrderLineItemAppliedTax>] The list of references to `OrderReturnTax` entities applied to the return line
#  item. Each
#  `OrderLineItemAppliedTax` has a `tax_uid` that references the `uid` of a
#  top-level
#  `OrderReturnTax` applied to the return line item. On reads, the applied amount
#  is populated.
    attr_reader :applied_taxes
  # @return [Array<square.rb::OrderLineItemAppliedDiscount>] The list of references to `OrderReturnDiscount` entities applied to the return
#  line item. Each
#  `OrderLineItemAppliedDiscount` has a `discount_uid` that references the `uid` of
#  a top-level
#  `OrderReturnDiscount` applied to the return line item. On reads, the applied
#  amount
#  is populated.
    attr_reader :applied_discounts
  # @return [square.rb::Money] The base price for a single unit of the line item.
    attr_reader :base_price_money
  # @return [square.rb::Money] The total price of all item variations returned in this line item.
#  The price is calculated as `base_price_money` multiplied by `quantity` and
#  does not include modifiers.
    attr_reader :variation_total_price_money
  # @return [square.rb::Money] The gross return amount of money calculated as (item base price + modifiers
#  price) * quantity.
    attr_reader :gross_return_money
  # @return [square.rb::Money] The total amount of tax money to return for the line item.
    attr_reader :total_tax_money
  # @return [square.rb::Money] The total amount of discount money to return for the line item.
    attr_reader :total_discount_money
  # @return [square.rb::Money] The total amount of money to return for this line item.
    attr_reader :total_money
  # @return [Array<square.rb::OrderLineItemAppliedServiceCharge>] The list of references to `OrderReturnServiceCharge` entities applied to the
#  return
#  line item. Each `OrderLineItemAppliedServiceCharge` has a `service_charge_uid`
#  that
#  references the `uid` of a top-level `OrderReturnServiceCharge` applied to the
#  return line
#  item. On reads, the applied amount is populated.
    attr_reader :applied_service_charges
  # @return [square.rb::Money] The total amount of apportioned service charge money to return for the line
#  item.
    attr_reader :total_service_charge_money
  # @return [OpenStruct] Additional properties unmapped to the current class definition
    attr_reader :additional_properties
  # @return [Object] 
    attr_reader :_field_set
    protected :_field_set

    OMIT = Object.new

    # @param uid [String] A unique ID for this return line-item entry.
    # @param source_line_item_uid [String] The `uid` of the line item in the original sale order.
    # @param name [String] The name of the line item.
    # @param quantity [String] The quantity returned, formatted as a decimal number.
#  For example, `"3"`.
#  Line items with a `quantity_unit` can have non-integer quantities.
#  For example, `"1.70000"`.
    # @param quantity_unit [square.rb::OrderQuantityUnit] The unit and precision that this return line item's quantity is measured in.
    # @param note [String] The note of the return line item.
    # @param catalog_object_id [String] The [CatalogItemVariation](entity:CatalogItemVariation) ID applied to this
#  return line item.
    # @param catalog_version [Long] The version of the catalog object that this line item references.
    # @param variation_name [String] The name of the variation applied to this return line item.
    # @param item_type [square.rb::OrderLineItemItemType] The type of line item: an itemized return, a non-itemized return (custom
#  amount),
#  or the return of an unactivated gift card sale.
#  See [OrderLineItemItemType](#type-orderlineitemitemtype) for possible values
    # @param return_modifiers [Array<square.rb::OrderReturnLineItemModifier>] The [CatalogModifier](entity:CatalogModifier)s applied to this line item.
    # @param applied_taxes [Array<square.rb::OrderLineItemAppliedTax>] The list of references to `OrderReturnTax` entities applied to the return line
#  item. Each
#  `OrderLineItemAppliedTax` has a `tax_uid` that references the `uid` of a
#  top-level
#  `OrderReturnTax` applied to the return line item. On reads, the applied amount
#  is populated.
    # @param applied_discounts [Array<square.rb::OrderLineItemAppliedDiscount>] The list of references to `OrderReturnDiscount` entities applied to the return
#  line item. Each
#  `OrderLineItemAppliedDiscount` has a `discount_uid` that references the `uid` of
#  a top-level
#  `OrderReturnDiscount` applied to the return line item. On reads, the applied
#  amount
#  is populated.
    # @param base_price_money [square.rb::Money] The base price for a single unit of the line item.
    # @param variation_total_price_money [square.rb::Money] The total price of all item variations returned in this line item.
#  The price is calculated as `base_price_money` multiplied by `quantity` and
#  does not include modifiers.
    # @param gross_return_money [square.rb::Money] The gross return amount of money calculated as (item base price + modifiers
#  price) * quantity.
    # @param total_tax_money [square.rb::Money] The total amount of tax money to return for the line item.
    # @param total_discount_money [square.rb::Money] The total amount of discount money to return for the line item.
    # @param total_money [square.rb::Money] The total amount of money to return for this line item.
    # @param applied_service_charges [Array<square.rb::OrderLineItemAppliedServiceCharge>] The list of references to `OrderReturnServiceCharge` entities applied to the
#  return
#  line item. Each `OrderLineItemAppliedServiceCharge` has a `service_charge_uid`
#  that
#  references the `uid` of a top-level `OrderReturnServiceCharge` applied to the
#  return line
#  item. On reads, the applied amount is populated.
    # @param total_service_charge_money [square.rb::Money] The total amount of apportioned service charge money to return for the line
#  item.
    # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
    # @return [square.rb::OrderReturnLineItem]
    def initialize(uid: OMIT, source_line_item_uid: OMIT, name: OMIT, quantity:, quantity_unit: OMIT, note: OMIT, catalog_object_id: OMIT, catalog_version: OMIT, variation_name: OMIT, item_type: OMIT, return_modifiers: OMIT, applied_taxes: OMIT, applied_discounts: OMIT, base_price_money: OMIT, variation_total_price_money: OMIT, gross_return_money: OMIT, total_tax_money: OMIT, total_discount_money: OMIT, total_money: OMIT, applied_service_charges: OMIT, total_service_charge_money: OMIT, additional_properties: nil)
      @uid = uid if uid != OMIT
      @source_line_item_uid = source_line_item_uid if source_line_item_uid != OMIT
      @name = name if name != OMIT
      @quantity = quantity
      @quantity_unit = quantity_unit if quantity_unit != OMIT
      @note = note if note != OMIT
      @catalog_object_id = catalog_object_id if catalog_object_id != OMIT
      @catalog_version = catalog_version if catalog_version != OMIT
      @variation_name = variation_name if variation_name != OMIT
      @item_type = item_type if item_type != OMIT
      @return_modifiers = return_modifiers if return_modifiers != OMIT
      @applied_taxes = applied_taxes if applied_taxes != OMIT
      @applied_discounts = applied_discounts if applied_discounts != OMIT
      @base_price_money = base_price_money if base_price_money != OMIT
      @variation_total_price_money = variation_total_price_money if variation_total_price_money != OMIT
      @gross_return_money = gross_return_money if gross_return_money != OMIT
      @total_tax_money = total_tax_money if total_tax_money != OMIT
      @total_discount_money = total_discount_money if total_discount_money != OMIT
      @total_money = total_money if total_money != OMIT
      @applied_service_charges = applied_service_charges if applied_service_charges != OMIT
      @total_service_charge_money = total_service_charge_money if total_service_charge_money != OMIT
      @additional_properties = additional_properties
      @_field_set = { "uid": uid, "source_line_item_uid": source_line_item_uid, "name": name, "quantity": quantity, "quantity_unit": quantity_unit, "note": note, "catalog_object_id": catalog_object_id, "catalog_version": catalog_version, "variation_name": variation_name, "item_type": item_type, "return_modifiers": return_modifiers, "applied_taxes": applied_taxes, "applied_discounts": applied_discounts, "base_price_money": base_price_money, "variation_total_price_money": variation_total_price_money, "gross_return_money": gross_return_money, "total_tax_money": total_tax_money, "total_discount_money": total_discount_money, "total_money": total_money, "applied_service_charges": applied_service_charges, "total_service_charge_money": total_service_charge_money }.reject do | _k, v |
  v == OMIT
end
    end
# Deserialize a JSON object to an instance of OrderReturnLineItem
    #
    # @param json_object [String] 
    # @return [square.rb::OrderReturnLineItem]
    def self.from_json(json_object:)
      struct = JSON.parse(json_object, object_class: OpenStruct)
      parsed_json = JSON.parse(json_object)
      uid = parsed_json["uid"]
      source_line_item_uid = parsed_json["source_line_item_uid"]
      name = parsed_json["name"]
      quantity = parsed_json["quantity"]
      unless parsed_json["quantity_unit"].nil?
        quantity_unit = parsed_json["quantity_unit"].to_json
        quantity_unit = square.rb::OrderQuantityUnit.from_json(json_object: quantity_unit)
      else
        quantity_unit = nil
      end
      note = parsed_json["note"]
      catalog_object_id = parsed_json["catalog_object_id"]
      catalog_version = parsed_json["catalog_version"]
      variation_name = parsed_json["variation_name"]
      item_type = parsed_json["item_type"]
      return_modifiers = parsed_json["return_modifiers"]&.map do | item |
  item = item.to_json
  square.rb::OrderReturnLineItemModifier.from_json(json_object: item)
end
      applied_taxes = parsed_json["applied_taxes"]&.map do | item |
  item = item.to_json
  square.rb::OrderLineItemAppliedTax.from_json(json_object: item)
end
      applied_discounts = parsed_json["applied_discounts"]&.map do | item |
  item = item.to_json
  square.rb::OrderLineItemAppliedDiscount.from_json(json_object: item)
end
      unless parsed_json["base_price_money"].nil?
        base_price_money = parsed_json["base_price_money"].to_json
        base_price_money = square.rb::Money.from_json(json_object: base_price_money)
      else
        base_price_money = nil
      end
      unless parsed_json["variation_total_price_money"].nil?
        variation_total_price_money = parsed_json["variation_total_price_money"].to_json
        variation_total_price_money = square.rb::Money.from_json(json_object: variation_total_price_money)
      else
        variation_total_price_money = nil
      end
      unless parsed_json["gross_return_money"].nil?
        gross_return_money = parsed_json["gross_return_money"].to_json
        gross_return_money = square.rb::Money.from_json(json_object: gross_return_money)
      else
        gross_return_money = nil
      end
      unless parsed_json["total_tax_money"].nil?
        total_tax_money = parsed_json["total_tax_money"].to_json
        total_tax_money = square.rb::Money.from_json(json_object: total_tax_money)
      else
        total_tax_money = nil
      end
      unless parsed_json["total_discount_money"].nil?
        total_discount_money = parsed_json["total_discount_money"].to_json
        total_discount_money = square.rb::Money.from_json(json_object: total_discount_money)
      else
        total_discount_money = nil
      end
      unless parsed_json["total_money"].nil?
        total_money = parsed_json["total_money"].to_json
        total_money = square.rb::Money.from_json(json_object: total_money)
      else
        total_money = nil
      end
      applied_service_charges = parsed_json["applied_service_charges"]&.map do | item |
  item = item.to_json
  square.rb::OrderLineItemAppliedServiceCharge.from_json(json_object: item)
end
      unless parsed_json["total_service_charge_money"].nil?
        total_service_charge_money = parsed_json["total_service_charge_money"].to_json
        total_service_charge_money = square.rb::Money.from_json(json_object: total_service_charge_money)
      else
        total_service_charge_money = nil
      end
      new(
        uid: uid,
        source_line_item_uid: source_line_item_uid,
        name: name,
        quantity: quantity,
        quantity_unit: quantity_unit,
        note: note,
        catalog_object_id: catalog_object_id,
        catalog_version: catalog_version,
        variation_name: variation_name,
        item_type: item_type,
        return_modifiers: return_modifiers,
        applied_taxes: applied_taxes,
        applied_discounts: applied_discounts,
        base_price_money: base_price_money,
        variation_total_price_money: variation_total_price_money,
        gross_return_money: gross_return_money,
        total_tax_money: total_tax_money,
        total_discount_money: total_discount_money,
        total_money: total_money,
        applied_service_charges: applied_service_charges,
        total_service_charge_money: total_service_charge_money,
        additional_properties: struct
      )
    end
# Serialize an instance of OrderReturnLineItem to a JSON object
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
      obj.source_line_item_uid&.is_a?(String) != false || raise("Passed value for field obj.source_line_item_uid is not the expected type, validation failed.")
      obj.name&.is_a?(String) != false || raise("Passed value for field obj.name is not the expected type, validation failed.")
      obj.quantity.is_a?(String) != false || raise("Passed value for field obj.quantity is not the expected type, validation failed.")
      obj.quantity_unit.nil? || square.rb::OrderQuantityUnit.validate_raw(obj: obj.quantity_unit)
      obj.note&.is_a?(String) != false || raise("Passed value for field obj.note is not the expected type, validation failed.")
      obj.catalog_object_id&.is_a?(String) != false || raise("Passed value for field obj.catalog_object_id is not the expected type, validation failed.")
      obj.catalog_version&.is_a?(Long) != false || raise("Passed value for field obj.catalog_version is not the expected type, validation failed.")
      obj.variation_name&.is_a?(String) != false || raise("Passed value for field obj.variation_name is not the expected type, validation failed.")
      obj.item_type&.is_a?(square.rb::OrderLineItemItemType) != false || raise("Passed value for field obj.item_type is not the expected type, validation failed.")
      obj.return_modifiers&.is_a?(Array) != false || raise("Passed value for field obj.return_modifiers is not the expected type, validation failed.")
      obj.applied_taxes&.is_a?(Array) != false || raise("Passed value for field obj.applied_taxes is not the expected type, validation failed.")
      obj.applied_discounts&.is_a?(Array) != false || raise("Passed value for field obj.applied_discounts is not the expected type, validation failed.")
      obj.base_price_money.nil? || square.rb::Money.validate_raw(obj: obj.base_price_money)
      obj.variation_total_price_money.nil? || square.rb::Money.validate_raw(obj: obj.variation_total_price_money)
      obj.gross_return_money.nil? || square.rb::Money.validate_raw(obj: obj.gross_return_money)
      obj.total_tax_money.nil? || square.rb::Money.validate_raw(obj: obj.total_tax_money)
      obj.total_discount_money.nil? || square.rb::Money.validate_raw(obj: obj.total_discount_money)
      obj.total_money.nil? || square.rb::Money.validate_raw(obj: obj.total_money)
      obj.applied_service_charges&.is_a?(Array) != false || raise("Passed value for field obj.applied_service_charges is not the expected type, validation failed.")
      obj.total_service_charge_money.nil? || square.rb::Money.validate_raw(obj: obj.total_service_charge_money)
    end
  end
end