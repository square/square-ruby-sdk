# frozen_string_literal: true
require "ostruct"
require "json"

module square.rb
# Represents a collection of catalog objects for the purpose of applying a
#  `PricingRule`. Including a catalog object will include all of its subtypes.
#  For example, including a category in a product set will include all of its
#  items and associated item variations in the product set. Including an item in
#  a product set will also include its item variations.
  class CatalogProductSet
  # @return [String] User-defined name for the product set. For example, "Clearance Items"
#  or "Winter Sale Items".
    attr_reader :name
  # @return [Array<String>] Unique IDs for any `CatalogObject` included in this product set. Any
#  number of these catalog objects can be in an order for a pricing rule to apply.
#  This can be used with `product_ids_all` in a parent `CatalogProductSet` to
#  match groups of products for a bulk discount, such as a discount for an
#  entree and side combo.
#  Only one of `product_ids_all`, `product_ids_any`, or `all_products` can be set.
#  Max: 500 catalog object IDs.
    attr_reader :product_ids_any
  # @return [Array<String>] Unique IDs for any `CatalogObject` included in this product set.
#  All objects in this set must be included in an order for a pricing rule to
#  apply.
#  Only one of `product_ids_all`, `product_ids_any`, or `all_products` can be set.
#  Max: 500 catalog object IDs.
    attr_reader :product_ids_all
  # @return [Long] If set, there must be exactly this many items from `products_any` or
#  `products_all`
#  in the cart for the discount to apply.
#  Cannot be combined with either `quantity_min` or `quantity_max`.
    attr_reader :quantity_exact
  # @return [Long] If set, there must be at least this many items from `products_any` or
#  `products_all`
#  in a cart for the discount to apply. See `quantity_exact`. Defaults to 0 if
#  `quantity_exact`, `quantity_min` and `quantity_max` are all unspecified.
    attr_reader :quantity_min
  # @return [Long] If set, the pricing rule will apply to a maximum of this many items from
#  `products_any` or `products_all`.
    attr_reader :quantity_max
  # @return [Boolean] If set to `true`, the product set will include every item in the catalog.
#  Only one of `product_ids_all`, `product_ids_any`, or `all_products` can be set.
    attr_reader :all_products
  # @return [OpenStruct] Additional properties unmapped to the current class definition
    attr_reader :additional_properties
  # @return [Object] 
    attr_reader :_field_set
    protected :_field_set

    OMIT = Object.new

    # @param name [String] User-defined name for the product set. For example, "Clearance Items"
#  or "Winter Sale Items".
    # @param product_ids_any [Array<String>] Unique IDs for any `CatalogObject` included in this product set. Any
#  number of these catalog objects can be in an order for a pricing rule to apply.
#  This can be used with `product_ids_all` in a parent `CatalogProductSet` to
#  match groups of products for a bulk discount, such as a discount for an
#  entree and side combo.
#  Only one of `product_ids_all`, `product_ids_any`, or `all_products` can be set.
#  Max: 500 catalog object IDs.
    # @param product_ids_all [Array<String>] Unique IDs for any `CatalogObject` included in this product set.
#  All objects in this set must be included in an order for a pricing rule to
#  apply.
#  Only one of `product_ids_all`, `product_ids_any`, or `all_products` can be set.
#  Max: 500 catalog object IDs.
    # @param quantity_exact [Long] If set, there must be exactly this many items from `products_any` or
#  `products_all`
#  in the cart for the discount to apply.
#  Cannot be combined with either `quantity_min` or `quantity_max`.
    # @param quantity_min [Long] If set, there must be at least this many items from `products_any` or
#  `products_all`
#  in a cart for the discount to apply. See `quantity_exact`. Defaults to 0 if
#  `quantity_exact`, `quantity_min` and `quantity_max` are all unspecified.
    # @param quantity_max [Long] If set, the pricing rule will apply to a maximum of this many items from
#  `products_any` or `products_all`.
    # @param all_products [Boolean] If set to `true`, the product set will include every item in the catalog.
#  Only one of `product_ids_all`, `product_ids_any`, or `all_products` can be set.
    # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
    # @return [square.rb::CatalogProductSet]
    def initialize(name: OMIT, product_ids_any: OMIT, product_ids_all: OMIT, quantity_exact: OMIT, quantity_min: OMIT, quantity_max: OMIT, all_products: OMIT, additional_properties: nil)
      @name = name if name != OMIT
      @product_ids_any = product_ids_any if product_ids_any != OMIT
      @product_ids_all = product_ids_all if product_ids_all != OMIT
      @quantity_exact = quantity_exact if quantity_exact != OMIT
      @quantity_min = quantity_min if quantity_min != OMIT
      @quantity_max = quantity_max if quantity_max != OMIT
      @all_products = all_products if all_products != OMIT
      @additional_properties = additional_properties
      @_field_set = { "name": name, "product_ids_any": product_ids_any, "product_ids_all": product_ids_all, "quantity_exact": quantity_exact, "quantity_min": quantity_min, "quantity_max": quantity_max, "all_products": all_products }.reject do | _k, v |
  v == OMIT
end
    end
# Deserialize a JSON object to an instance of CatalogProductSet
    #
    # @param json_object [String] 
    # @return [square.rb::CatalogProductSet]
    def self.from_json(json_object:)
      struct = JSON.parse(json_object, object_class: OpenStruct)
      parsed_json = JSON.parse(json_object)
      name = parsed_json["name"]
      product_ids_any = parsed_json["product_ids_any"]
      product_ids_all = parsed_json["product_ids_all"]
      quantity_exact = parsed_json["quantity_exact"]
      quantity_min = parsed_json["quantity_min"]
      quantity_max = parsed_json["quantity_max"]
      all_products = parsed_json["all_products"]
      new(
        name: name,
        product_ids_any: product_ids_any,
        product_ids_all: product_ids_all,
        quantity_exact: quantity_exact,
        quantity_min: quantity_min,
        quantity_max: quantity_max,
        all_products: all_products,
        additional_properties: struct
      )
    end
# Serialize an instance of CatalogProductSet to a JSON object
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
      obj.name&.is_a?(String) != false || raise("Passed value for field obj.name is not the expected type, validation failed.")
      obj.product_ids_any&.is_a?(Array) != false || raise("Passed value for field obj.product_ids_any is not the expected type, validation failed.")
      obj.product_ids_all&.is_a?(Array) != false || raise("Passed value for field obj.product_ids_all is not the expected type, validation failed.")
      obj.quantity_exact&.is_a?(Long) != false || raise("Passed value for field obj.quantity_exact is not the expected type, validation failed.")
      obj.quantity_min&.is_a?(Long) != false || raise("Passed value for field obj.quantity_min is not the expected type, validation failed.")
      obj.quantity_max&.is_a?(Long) != false || raise("Passed value for field obj.quantity_max is not the expected type, validation failed.")
      obj.all_products&.is_a?(Boolean) != false || raise("Passed value for field obj.all_products is not the expected type, validation failed.")
    end
  end
end