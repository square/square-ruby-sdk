# frozen_string_literal: true
require_relative "catalog_query_sorted_attribute"
require_relative "catalog_query_exact"
require_relative "catalog_query_set"
require_relative "catalog_query_prefix"
require_relative "catalog_query_range"
require_relative "catalog_query_text"
require_relative "catalog_query_items_for_tax"
require_relative "catalog_query_items_for_modifier_list"
require_relative "catalog_query_items_for_item_options"
require_relative "catalog_query_item_variations_for_item_option_values"
require "ostruct"
require "json"

module SquareApiClient
# A query composed of one or more different types of filters to narrow the scope
#  of targeted objects when calling the `SearchCatalogObjects` endpoint.
#  Although a query can have multiple filters, only certain query types can be
#  combined per call to
#  [SearchCatalogObjects](api-endpoint:Catalog-SearchCatalogObjects).
#  Any combination of the following types may be used together:
#  - [exact_query](entity:CatalogQueryExact)
#  - [prefix_query](entity:CatalogQueryPrefix)
#  - [range_query](entity:CatalogQueryRange)
#  - [sorted_attribute_query](entity:CatalogQuerySortedAttribute)
#  - [text_query](entity:CatalogQueryText)
#  All other query types cannot be combined with any others.
#  When a query filter is based on an attribute, the attribute must be searchable.
#  Searchable attributes are listed as follows, along their parent types that can
#  be searched for with applicable query filters.
#  Searchable attribute and objects queryable by searchable attributes:
#  - `name`:  `CatalogItem`, `CatalogItemVariation`, `CatalogCategory`,
#  `CatalogTax`, `CatalogDiscount`, `CatalogModifier`, `CatalogModifierList`,
#  `CatalogItemOption`, `CatalogItemOptionValue`
#  - `description`: `CatalogItem`, `CatalogItemOptionValue`
#  - `abbreviation`: `CatalogItem`
#  - `upc`: `CatalogItemVariation`
#  - `sku`: `CatalogItemVariation`
#  - `caption`: `CatalogImage`
#  - `display_name`: `CatalogItemOption`
#  For example, to search for [CatalogItem](entity:CatalogItem) objects by
#  searchable attributes, you can use
#  the `"name"`, `"description"`, or `"abbreviation"` attribute in an applicable
#  query filter.
  class CatalogQuery
  # @return [SquareApiClient::CatalogQuerySortedAttribute] A query expression to sort returned query result by the given attribute.
    attr_reader :sorted_attribute_query
  # @return [SquareApiClient::CatalogQueryExact] An exact query expression to return objects with attribute name and value
#  matching the specified attribute name and value exactly. Value matching is case
#  insensitive.
    attr_reader :exact_query
  # @return [SquareApiClient::CatalogQuerySet] A set query expression to return objects with attribute name and value
#  matching the specified attribute name and any of the specified attribute values
#  exactly.
#  Value matching is case insensitive.
    attr_reader :set_query
  # @return [SquareApiClient::CatalogQueryPrefix] A prefix query expression to return objects with attribute values
#  that have a prefix matching the specified string value. Value matching is case
#  insensitive.
    attr_reader :prefix_query
  # @return [SquareApiClient::CatalogQueryRange] A range query expression to return objects with numeric values
#  that lie in the specified range.
    attr_reader :range_query
  # @return [SquareApiClient::CatalogQueryText] A text query expression to return objects whose searchable attributes contain
#  all of the given
#  keywords, irrespective of their order. For example, if a `CatalogItem` contains
#  custom attribute values of
#  `{"name": "t-shirt"}` and `{"description": "Small, Purple"}`, the query filter
#  of `{"keywords": ["shirt", "sma", "purp"]}`
#  returns this item.
    attr_reader :text_query
  # @return [SquareApiClient::CatalogQueryItemsForTax] A query expression to return items that have any of the specified taxes (as
#  identified by the corresponding `CatalogTax` object IDs) enabled.
    attr_reader :items_for_tax_query
  # @return [SquareApiClient::CatalogQueryItemsForModifierList] A query expression to return items that have any of the given modifier list (as
#  identified by the corresponding `CatalogModifierList`s IDs) enabled.
    attr_reader :items_for_modifier_list_query
  # @return [SquareApiClient::CatalogQueryItemsForItemOptions] A query expression to return items that contains the specified item options (as
#  identified the corresponding `CatalogItemOption` IDs).
    attr_reader :items_for_item_options_query
  # @return [SquareApiClient::CatalogQueryItemVariationsForItemOptionValues] A query expression to return item variations (of the
#  [CatalogItemVariation](entity:CatalogItemVariation) type) that
#  contain all of the specified `CatalogItemOption` IDs.
    attr_reader :item_variations_for_item_option_values_query
  # @return [OpenStruct] Additional properties unmapped to the current class definition
    attr_reader :additional_properties
  # @return [Object] 
    attr_reader :_field_set
    protected :_field_set

    OMIT = Object.new

    # @param sorted_attribute_query [SquareApiClient::CatalogQuerySortedAttribute] A query expression to sort returned query result by the given attribute.
    # @param exact_query [SquareApiClient::CatalogQueryExact] An exact query expression to return objects with attribute name and value
#  matching the specified attribute name and value exactly. Value matching is case
#  insensitive.
    # @param set_query [SquareApiClient::CatalogQuerySet] A set query expression to return objects with attribute name and value
#  matching the specified attribute name and any of the specified attribute values
#  exactly.
#  Value matching is case insensitive.
    # @param prefix_query [SquareApiClient::CatalogQueryPrefix] A prefix query expression to return objects with attribute values
#  that have a prefix matching the specified string value. Value matching is case
#  insensitive.
    # @param range_query [SquareApiClient::CatalogQueryRange] A range query expression to return objects with numeric values
#  that lie in the specified range.
    # @param text_query [SquareApiClient::CatalogQueryText] A text query expression to return objects whose searchable attributes contain
#  all of the given
#  keywords, irrespective of their order. For example, if a `CatalogItem` contains
#  custom attribute values of
#  `{"name": "t-shirt"}` and `{"description": "Small, Purple"}`, the query filter
#  of `{"keywords": ["shirt", "sma", "purp"]}`
#  returns this item.
    # @param items_for_tax_query [SquareApiClient::CatalogQueryItemsForTax] A query expression to return items that have any of the specified taxes (as
#  identified by the corresponding `CatalogTax` object IDs) enabled.
    # @param items_for_modifier_list_query [SquareApiClient::CatalogQueryItemsForModifierList] A query expression to return items that have any of the given modifier list (as
#  identified by the corresponding `CatalogModifierList`s IDs) enabled.
    # @param items_for_item_options_query [SquareApiClient::CatalogQueryItemsForItemOptions] A query expression to return items that contains the specified item options (as
#  identified the corresponding `CatalogItemOption` IDs).
    # @param item_variations_for_item_option_values_query [SquareApiClient::CatalogQueryItemVariationsForItemOptionValues] A query expression to return item variations (of the
#  [CatalogItemVariation](entity:CatalogItemVariation) type) that
#  contain all of the specified `CatalogItemOption` IDs.
    # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
    # @return [SquareApiClient::CatalogQuery]
    def initialize(sorted_attribute_query: OMIT, exact_query: OMIT, set_query: OMIT, prefix_query: OMIT, range_query: OMIT, text_query: OMIT, items_for_tax_query: OMIT, items_for_modifier_list_query: OMIT, items_for_item_options_query: OMIT, item_variations_for_item_option_values_query: OMIT, additional_properties: nil)
      @sorted_attribute_query = sorted_attribute_query if sorted_attribute_query != OMIT
      @exact_query = exact_query if exact_query != OMIT
      @set_query = set_query if set_query != OMIT
      @prefix_query = prefix_query if prefix_query != OMIT
      @range_query = range_query if range_query != OMIT
      @text_query = text_query if text_query != OMIT
      @items_for_tax_query = items_for_tax_query if items_for_tax_query != OMIT
      @items_for_modifier_list_query = items_for_modifier_list_query if items_for_modifier_list_query != OMIT
      @items_for_item_options_query = items_for_item_options_query if items_for_item_options_query != OMIT
      @item_variations_for_item_option_values_query = item_variations_for_item_option_values_query if item_variations_for_item_option_values_query != OMIT
      @additional_properties = additional_properties
      @_field_set = { "sorted_attribute_query": sorted_attribute_query, "exact_query": exact_query, "set_query": set_query, "prefix_query": prefix_query, "range_query": range_query, "text_query": text_query, "items_for_tax_query": items_for_tax_query, "items_for_modifier_list_query": items_for_modifier_list_query, "items_for_item_options_query": items_for_item_options_query, "item_variations_for_item_option_values_query": item_variations_for_item_option_values_query }.reject do | _k, v |
  v == OMIT
end
    end
# Deserialize a JSON object to an instance of CatalogQuery
    #
    # @param json_object [String] 
    # @return [SquareApiClient::CatalogQuery]
    def self.from_json(json_object:)
      struct = JSON.parse(json_object, object_class: OpenStruct)
      parsed_json = JSON.parse(json_object)
      unless parsed_json["sorted_attribute_query"].nil?
        sorted_attribute_query = parsed_json["sorted_attribute_query"].to_json
        sorted_attribute_query = SquareApiClient::CatalogQuerySortedAttribute.from_json(json_object: sorted_attribute_query)
      else
        sorted_attribute_query = nil
      end
      unless parsed_json["exact_query"].nil?
        exact_query = parsed_json["exact_query"].to_json
        exact_query = SquareApiClient::CatalogQueryExact.from_json(json_object: exact_query)
      else
        exact_query = nil
      end
      unless parsed_json["set_query"].nil?
        set_query = parsed_json["set_query"].to_json
        set_query = SquareApiClient::CatalogQuerySet.from_json(json_object: set_query)
      else
        set_query = nil
      end
      unless parsed_json["prefix_query"].nil?
        prefix_query = parsed_json["prefix_query"].to_json
        prefix_query = SquareApiClient::CatalogQueryPrefix.from_json(json_object: prefix_query)
      else
        prefix_query = nil
      end
      unless parsed_json["range_query"].nil?
        range_query = parsed_json["range_query"].to_json
        range_query = SquareApiClient::CatalogQueryRange.from_json(json_object: range_query)
      else
        range_query = nil
      end
      unless parsed_json["text_query"].nil?
        text_query = parsed_json["text_query"].to_json
        text_query = SquareApiClient::CatalogQueryText.from_json(json_object: text_query)
      else
        text_query = nil
      end
      unless parsed_json["items_for_tax_query"].nil?
        items_for_tax_query = parsed_json["items_for_tax_query"].to_json
        items_for_tax_query = SquareApiClient::CatalogQueryItemsForTax.from_json(json_object: items_for_tax_query)
      else
        items_for_tax_query = nil
      end
      unless parsed_json["items_for_modifier_list_query"].nil?
        items_for_modifier_list_query = parsed_json["items_for_modifier_list_query"].to_json
        items_for_modifier_list_query = SquareApiClient::CatalogQueryItemsForModifierList.from_json(json_object: items_for_modifier_list_query)
      else
        items_for_modifier_list_query = nil
      end
      unless parsed_json["items_for_item_options_query"].nil?
        items_for_item_options_query = parsed_json["items_for_item_options_query"].to_json
        items_for_item_options_query = SquareApiClient::CatalogQueryItemsForItemOptions.from_json(json_object: items_for_item_options_query)
      else
        items_for_item_options_query = nil
      end
      unless parsed_json["item_variations_for_item_option_values_query"].nil?
        item_variations_for_item_option_values_query = parsed_json["item_variations_for_item_option_values_query"].to_json
        item_variations_for_item_option_values_query = SquareApiClient::CatalogQueryItemVariationsForItemOptionValues.from_json(json_object: item_variations_for_item_option_values_query)
      else
        item_variations_for_item_option_values_query = nil
      end
      new(
        sorted_attribute_query: sorted_attribute_query,
        exact_query: exact_query,
        set_query: set_query,
        prefix_query: prefix_query,
        range_query: range_query,
        text_query: text_query,
        items_for_tax_query: items_for_tax_query,
        items_for_modifier_list_query: items_for_modifier_list_query,
        items_for_item_options_query: items_for_item_options_query,
        item_variations_for_item_option_values_query: item_variations_for_item_option_values_query,
        additional_properties: struct
      )
    end
# Serialize an instance of CatalogQuery to a JSON object
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
      obj.sorted_attribute_query.nil? || SquareApiClient::CatalogQuerySortedAttribute.validate_raw(obj: obj.sorted_attribute_query)
      obj.exact_query.nil? || SquareApiClient::CatalogQueryExact.validate_raw(obj: obj.exact_query)
      obj.set_query.nil? || SquareApiClient::CatalogQuerySet.validate_raw(obj: obj.set_query)
      obj.prefix_query.nil? || SquareApiClient::CatalogQueryPrefix.validate_raw(obj: obj.prefix_query)
      obj.range_query.nil? || SquareApiClient::CatalogQueryRange.validate_raw(obj: obj.range_query)
      obj.text_query.nil? || SquareApiClient::CatalogQueryText.validate_raw(obj: obj.text_query)
      obj.items_for_tax_query.nil? || SquareApiClient::CatalogQueryItemsForTax.validate_raw(obj: obj.items_for_tax_query)
      obj.items_for_modifier_list_query.nil? || SquareApiClient::CatalogQueryItemsForModifierList.validate_raw(obj: obj.items_for_modifier_list_query)
      obj.items_for_item_options_query.nil? || SquareApiClient::CatalogQueryItemsForItemOptions.validate_raw(obj: obj.items_for_item_options_query)
      obj.item_variations_for_item_option_values_query.nil? || SquareApiClient::CatalogQueryItemVariationsForItemOptionValues.validate_raw(obj: obj.item_variations_for_item_option_values_query)
    end
  end
end