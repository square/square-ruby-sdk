# frozen_string_literal: true
require_relative "search_orders_sort_field"
require_relative "sort_order"
require "ostruct"
require "json"

module square.rb
# Sorting criteria for a `SearchOrders` request. Results can only be sorted
#  by a timestamp field.
  class SearchOrdersSort
  # @return [square.rb::SearchOrdersSortField] The field to sort by.
#  __Important:__ When using a [DateTimeFilter](entity:SearchOrdersFilter),
#  `sort_field` must match the timestamp field that the `DateTimeFilter` uses to
#  filter. For example, if you set your `sort_field` to `CLOSED_AT` and you use a
#  `DateTimeFilter`, your `DateTimeFilter` must filter for orders by their
#  `CLOSED_AT` date.
#  If this field does not match the timestamp field in `DateTimeFilter`,
#  `SearchOrders` returns an error.
#  Default: `CREATED_AT`.
#  See [SearchOrdersSortField](#type-searchorderssortfield) for possible values
    attr_reader :sort_field
  # @return [square.rb::SortOrder] The chronological order in which results are returned. Defaults to `DESC`.
#  See [SortOrder](#type-sortorder) for possible values
    attr_reader :sort_order
  # @return [OpenStruct] Additional properties unmapped to the current class definition
    attr_reader :additional_properties
  # @return [Object] 
    attr_reader :_field_set
    protected :_field_set

    OMIT = Object.new

    # @param sort_field [square.rb::SearchOrdersSortField] The field to sort by.
#  __Important:__ When using a [DateTimeFilter](entity:SearchOrdersFilter),
#  `sort_field` must match the timestamp field that the `DateTimeFilter` uses to
#  filter. For example, if you set your `sort_field` to `CLOSED_AT` and you use a
#  `DateTimeFilter`, your `DateTimeFilter` must filter for orders by their
#  `CLOSED_AT` date.
#  If this field does not match the timestamp field in `DateTimeFilter`,
#  `SearchOrders` returns an error.
#  Default: `CREATED_AT`.
#  See [SearchOrdersSortField](#type-searchorderssortfield) for possible values
    # @param sort_order [square.rb::SortOrder] The chronological order in which results are returned. Defaults to `DESC`.
#  See [SortOrder](#type-sortorder) for possible values
    # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
    # @return [square.rb::SearchOrdersSort]
    def initialize(sort_field:, sort_order: OMIT, additional_properties: nil)
      @sort_field = sort_field
      @sort_order = sort_order if sort_order != OMIT
      @additional_properties = additional_properties
      @_field_set = { "sort_field": sort_field, "sort_order": sort_order }.reject do | _k, v |
  v == OMIT
end
    end
# Deserialize a JSON object to an instance of SearchOrdersSort
    #
    # @param json_object [String] 
    # @return [square.rb::SearchOrdersSort]
    def self.from_json(json_object:)
      struct = JSON.parse(json_object, object_class: OpenStruct)
      parsed_json = JSON.parse(json_object)
      sort_field = parsed_json["sort_field"]
      sort_order = parsed_json["sort_order"]
      new(
        sort_field: sort_field,
        sort_order: sort_order,
        additional_properties: struct
      )
    end
# Serialize an instance of SearchOrdersSort to a JSON object
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
      obj.sort_field.is_a?(square.rb::SearchOrdersSortField) != false || raise("Passed value for field obj.sort_field is not the expected type, validation failed.")
      obj.sort_order&.is_a?(square.rb::SortOrder) != false || raise("Passed value for field obj.sort_order is not the expected type, validation failed.")
    end
  end
end