# frozen_string_literal: true
require_relative "sort_order"
require "ostruct"
require "json"

module square.rb
# The query expression to specify the key to sort search results.
  class CatalogQuerySortedAttribute
  # @return [String] The attribute whose value is used as the sort key.
    attr_reader :attribute_name
  # @return [String] The first attribute value to be returned by the query. Ascending sorts will
#  return only
#  objects with this value or greater, while descending sorts will return only
#  objects with this value
#  or less. If unset, start at the beginning (for ascending sorts) or end (for
#  descending sorts).
    attr_reader :initial_attribute_value
  # @return [square.rb::SortOrder] The desired sort order, `"ASC"` (ascending) or `"DESC"` (descending).
#  See [SortOrder](#type-sortorder) for possible values
    attr_reader :sort_order
  # @return [OpenStruct] Additional properties unmapped to the current class definition
    attr_reader :additional_properties
  # @return [Object] 
    attr_reader :_field_set
    protected :_field_set

    OMIT = Object.new

    # @param attribute_name [String] The attribute whose value is used as the sort key.
    # @param initial_attribute_value [String] The first attribute value to be returned by the query. Ascending sorts will
#  return only
#  objects with this value or greater, while descending sorts will return only
#  objects with this value
#  or less. If unset, start at the beginning (for ascending sorts) or end (for
#  descending sorts).
    # @param sort_order [square.rb::SortOrder] The desired sort order, `"ASC"` (ascending) or `"DESC"` (descending).
#  See [SortOrder](#type-sortorder) for possible values
    # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
    # @return [square.rb::CatalogQuerySortedAttribute]
    def initialize(attribute_name:, initial_attribute_value: OMIT, sort_order: OMIT, additional_properties: nil)
      @attribute_name = attribute_name
      @initial_attribute_value = initial_attribute_value if initial_attribute_value != OMIT
      @sort_order = sort_order if sort_order != OMIT
      @additional_properties = additional_properties
      @_field_set = { "attribute_name": attribute_name, "initial_attribute_value": initial_attribute_value, "sort_order": sort_order }.reject do | _k, v |
  v == OMIT
end
    end
# Deserialize a JSON object to an instance of CatalogQuerySortedAttribute
    #
    # @param json_object [String] 
    # @return [square.rb::CatalogQuerySortedAttribute]
    def self.from_json(json_object:)
      struct = JSON.parse(json_object, object_class: OpenStruct)
      parsed_json = JSON.parse(json_object)
      attribute_name = parsed_json["attribute_name"]
      initial_attribute_value = parsed_json["initial_attribute_value"]
      sort_order = parsed_json["sort_order"]
      new(
        attribute_name: attribute_name,
        initial_attribute_value: initial_attribute_value,
        sort_order: sort_order,
        additional_properties: struct
      )
    end
# Serialize an instance of CatalogQuerySortedAttribute to a JSON object
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
      obj.attribute_name.is_a?(String) != false || raise("Passed value for field obj.attribute_name is not the expected type, validation failed.")
      obj.initial_attribute_value&.is_a?(String) != false || raise("Passed value for field obj.initial_attribute_value is not the expected type, validation failed.")
      obj.sort_order&.is_a?(square.rb::SortOrder) != false || raise("Passed value for field obj.sort_order is not the expected type, validation failed.")
    end
  end
end