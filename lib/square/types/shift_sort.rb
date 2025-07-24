# frozen_string_literal: true
require_relative "shift_sort_field"
require_relative "sort_order"
require "ostruct"
require "json"

module square.rb
# Sets the sort order of search results.
#  Deprecated at Square API version 2025-05-21. See the [migration
#  es](https://developer.squareup.com/docs/labor-api/what-it-does#migration-notes).
  class ShiftSort
  # @return [square.rb::ShiftSortField] The field to sort on.
#  See [ShiftSortField](#type-shiftsortfield) for possible values
    attr_reader :field
  # @return [square.rb::SortOrder] The order in which results are returned. Defaults to DESC.
#  See [SortOrder](#type-sortorder) for possible values
    attr_reader :order
  # @return [OpenStruct] Additional properties unmapped to the current class definition
    attr_reader :additional_properties
  # @return [Object] 
    attr_reader :_field_set
    protected :_field_set

    OMIT = Object.new

    # @param field [square.rb::ShiftSortField] The field to sort on.
#  See [ShiftSortField](#type-shiftsortfield) for possible values
    # @param order [square.rb::SortOrder] The order in which results are returned. Defaults to DESC.
#  See [SortOrder](#type-sortorder) for possible values
    # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
    # @return [square.rb::ShiftSort]
    def initialize(field: OMIT, order: OMIT, additional_properties: nil)
      @field = field if field != OMIT
      @order = order if order != OMIT
      @additional_properties = additional_properties
      @_field_set = { "field": field, "order": order }.reject do | _k, v |
  v == OMIT
end
    end
# Deserialize a JSON object to an instance of ShiftSort
    #
    # @param json_object [String] 
    # @return [square.rb::ShiftSort]
    def self.from_json(json_object:)
      struct = JSON.parse(json_object, object_class: OpenStruct)
      parsed_json = JSON.parse(json_object)
      field = parsed_json["field"]
      order = parsed_json["order"]
      new(
        field: field,
        order: order,
        additional_properties: struct
      )
    end
# Serialize an instance of ShiftSort to a JSON object
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
      obj.field&.is_a?(square.rb::ShiftSortField) != false || raise("Passed value for field obj.field is not the expected type, validation failed.")
      obj.order&.is_a?(square.rb::SortOrder) != false || raise("Passed value for field obj.order is not the expected type, validation failed.")
    end
  end
end