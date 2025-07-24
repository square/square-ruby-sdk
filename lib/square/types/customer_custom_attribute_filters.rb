# frozen_string_literal: true
require_relative "customer_custom_attribute_filter"
require "ostruct"
require "json"

module square.rb
# The custom attribute filters in a set of [customer
#  filters](entity:CustomerFilter) used in a search query. Use this filter
#  to search based on [custom attributes](entity:CustomAttribute) that are assigned
#  to customer profiles. For more information, see
#  [Search by custom
#  com/docs/customers-api/use-the-api/search-customers#search-by-custom-attribute).
  class CustomerCustomAttributeFilters
  # @return [Array<square.rb::CustomerCustomAttributeFilter>] The custom attribute filters. Each filter must specify `key` and include the
#  `filter` field with a type-specific filter,
#  the `updated_at` field, or both. The provided keys must be unique within the
#  list of custom attribute filters.
    attr_reader :filters
  # @return [OpenStruct] Additional properties unmapped to the current class definition
    attr_reader :additional_properties
  # @return [Object] 
    attr_reader :_field_set
    protected :_field_set

    OMIT = Object.new

    # @param filters [Array<square.rb::CustomerCustomAttributeFilter>] The custom attribute filters. Each filter must specify `key` and include the
#  `filter` field with a type-specific filter,
#  the `updated_at` field, or both. The provided keys must be unique within the
#  list of custom attribute filters.
    # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
    # @return [square.rb::CustomerCustomAttributeFilters]
    def initialize(filters: OMIT, additional_properties: nil)
      @filters = filters if filters != OMIT
      @additional_properties = additional_properties
      @_field_set = { "filters": filters }.reject do | _k, v |
  v == OMIT
end
    end
# Deserialize a JSON object to an instance of CustomerCustomAttributeFilters
    #
    # @param json_object [String] 
    # @return [square.rb::CustomerCustomAttributeFilters]
    def self.from_json(json_object:)
      struct = JSON.parse(json_object, object_class: OpenStruct)
      parsed_json = JSON.parse(json_object)
      filters = parsed_json["filters"]&.map do | item |
  item = item.to_json
  square.rb::CustomerCustomAttributeFilter.from_json(json_object: item)
end
      new(filters: filters, additional_properties: struct)
    end
# Serialize an instance of CustomerCustomAttributeFilters to a JSON object
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
      obj.filters&.is_a?(Array) != false || raise("Passed value for field obj.filters is not the expected type, validation failed.")
    end
  end
end