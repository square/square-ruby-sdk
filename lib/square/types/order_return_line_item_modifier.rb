# frozen_string_literal: true
require_relative "money"
require "ostruct"
require "json"

module square.rb
# A line item modifier being returned.
  class OrderReturnLineItemModifier
  # @return [String] A unique ID that identifies the return modifier only within this order.
    attr_reader :uid
  # @return [String] The modifier `uid` from the order's line item that contains the
#  original sale of this line item modifier.
    attr_reader :source_modifier_uid
  # @return [String] The catalog object ID referencing [CatalogModifier](entity:CatalogModifier).
    attr_reader :catalog_object_id
  # @return [Long] The version of the catalog object that this line item modifier references.
    attr_reader :catalog_version
  # @return [String] The name of the item modifier.
    attr_reader :name
  # @return [square.rb::Money] The base price for the modifier.
#  `base_price_money` is required for ad hoc modifiers.
#  If both `catalog_object_id` and `base_price_money` are set, `base_price_money`
#  overrides the predefined [CatalogModifier](entity:CatalogModifier) price.
    attr_reader :base_price_money
  # @return [square.rb::Money] The total price of the item modifier for its line item.
#  This is the modifier's `base_price_money` multiplied by the line item's
#  quantity.
    attr_reader :total_price_money
  # @return [String] The quantity of the line item modifier. The modifier quantity can be 0 or more.
#  For example, suppose a restaurant offers a cheeseburger on the menu. When a
#  buyer orders
#  this item, the restaurant records the purchase by creating an `Order` object
#  with a line item
#  for a burger. The line item includes a line item modifier: the name is cheese
#  and the quantity
#  is 1. The buyer has the option to order extra cheese (or no cheese). If the
#  buyer chooses
#  the extra cheese option, the modifier quantity increases to 2. If the buyer does
#  not want
#  any cheese, the modifier quantity is set to 0.
    attr_reader :quantity
  # @return [OpenStruct] Additional properties unmapped to the current class definition
    attr_reader :additional_properties
  # @return [Object] 
    attr_reader :_field_set
    protected :_field_set

    OMIT = Object.new

    # @param uid [String] A unique ID that identifies the return modifier only within this order.
    # @param source_modifier_uid [String] The modifier `uid` from the order's line item that contains the
#  original sale of this line item modifier.
    # @param catalog_object_id [String] The catalog object ID referencing [CatalogModifier](entity:CatalogModifier).
    # @param catalog_version [Long] The version of the catalog object that this line item modifier references.
    # @param name [String] The name of the item modifier.
    # @param base_price_money [square.rb::Money] The base price for the modifier.
#  `base_price_money` is required for ad hoc modifiers.
#  If both `catalog_object_id` and `base_price_money` are set, `base_price_money`
#  overrides the predefined [CatalogModifier](entity:CatalogModifier) price.
    # @param total_price_money [square.rb::Money] The total price of the item modifier for its line item.
#  This is the modifier's `base_price_money` multiplied by the line item's
#  quantity.
    # @param quantity [String] The quantity of the line item modifier. The modifier quantity can be 0 or more.
#  For example, suppose a restaurant offers a cheeseburger on the menu. When a
#  buyer orders
#  this item, the restaurant records the purchase by creating an `Order` object
#  with a line item
#  for a burger. The line item includes a line item modifier: the name is cheese
#  and the quantity
#  is 1. The buyer has the option to order extra cheese (or no cheese). If the
#  buyer chooses
#  the extra cheese option, the modifier quantity increases to 2. If the buyer does
#  not want
#  any cheese, the modifier quantity is set to 0.
    # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
    # @return [square.rb::OrderReturnLineItemModifier]
    def initialize(uid: OMIT, source_modifier_uid: OMIT, catalog_object_id: OMIT, catalog_version: OMIT, name: OMIT, base_price_money: OMIT, total_price_money: OMIT, quantity: OMIT, additional_properties: nil)
      @uid = uid if uid != OMIT
      @source_modifier_uid = source_modifier_uid if source_modifier_uid != OMIT
      @catalog_object_id = catalog_object_id if catalog_object_id != OMIT
      @catalog_version = catalog_version if catalog_version != OMIT
      @name = name if name != OMIT
      @base_price_money = base_price_money if base_price_money != OMIT
      @total_price_money = total_price_money if total_price_money != OMIT
      @quantity = quantity if quantity != OMIT
      @additional_properties = additional_properties
      @_field_set = { "uid": uid, "source_modifier_uid": source_modifier_uid, "catalog_object_id": catalog_object_id, "catalog_version": catalog_version, "name": name, "base_price_money": base_price_money, "total_price_money": total_price_money, "quantity": quantity }.reject do | _k, v |
  v == OMIT
end
    end
# Deserialize a JSON object to an instance of OrderReturnLineItemModifier
    #
    # @param json_object [String] 
    # @return [square.rb::OrderReturnLineItemModifier]
    def self.from_json(json_object:)
      struct = JSON.parse(json_object, object_class: OpenStruct)
      parsed_json = JSON.parse(json_object)
      uid = parsed_json["uid"]
      source_modifier_uid = parsed_json["source_modifier_uid"]
      catalog_object_id = parsed_json["catalog_object_id"]
      catalog_version = parsed_json["catalog_version"]
      name = parsed_json["name"]
      unless parsed_json["base_price_money"].nil?
        base_price_money = parsed_json["base_price_money"].to_json
        base_price_money = square.rb::Money.from_json(json_object: base_price_money)
      else
        base_price_money = nil
      end
      unless parsed_json["total_price_money"].nil?
        total_price_money = parsed_json["total_price_money"].to_json
        total_price_money = square.rb::Money.from_json(json_object: total_price_money)
      else
        total_price_money = nil
      end
      quantity = parsed_json["quantity"]
      new(
        uid: uid,
        source_modifier_uid: source_modifier_uid,
        catalog_object_id: catalog_object_id,
        catalog_version: catalog_version,
        name: name,
        base_price_money: base_price_money,
        total_price_money: total_price_money,
        quantity: quantity,
        additional_properties: struct
      )
    end
# Serialize an instance of OrderReturnLineItemModifier to a JSON object
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
      obj.source_modifier_uid&.is_a?(String) != false || raise("Passed value for field obj.source_modifier_uid is not the expected type, validation failed.")
      obj.catalog_object_id&.is_a?(String) != false || raise("Passed value for field obj.catalog_object_id is not the expected type, validation failed.")
      obj.catalog_version&.is_a?(Long) != false || raise("Passed value for field obj.catalog_version is not the expected type, validation failed.")
      obj.name&.is_a?(String) != false || raise("Passed value for field obj.name is not the expected type, validation failed.")
      obj.base_price_money.nil? || square.rb::Money.validate_raw(obj: obj.base_price_money)
      obj.total_price_money.nil? || square.rb::Money.validate_raw(obj: obj.total_price_money)
      obj.quantity&.is_a?(String) != false || raise("Passed value for field obj.quantity is not the expected type, validation failed.")
    end
  end
end