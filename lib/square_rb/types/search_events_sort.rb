# frozen_string_literal: true
require_relative "search_events_sort_field"
require_relative "sort_order"
require "ostruct"
require "json"

module SquareApiClient
# Criteria to sort events by.
  class SearchEventsSort
  # @return [SquareApiClient::SEARCH_EVENTS_SORT_FIELD] Sort events by event types.
#  See [SearchEventsSortField](#type-searcheventssortfield) for possible values
    attr_reader :field
  # @return [SquareApiClient::SortOrder] The order to use for sorting the events.
#  See [SortOrder](#type-sortorder) for possible values
    attr_reader :order
  # @return [OpenStruct] Additional properties unmapped to the current class definition
    attr_reader :additional_properties
  # @return [Object] 
    attr_reader :_field_set
    protected :_field_set

    OMIT = Object.new

    # @param field [SquareApiClient::SEARCH_EVENTS_SORT_FIELD] Sort events by event types.
#  See [SearchEventsSortField](#type-searcheventssortfield) for possible values
    # @param order [SquareApiClient::SortOrder] The order to use for sorting the events.
#  See [SortOrder](#type-sortorder) for possible values
    # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
    # @return [SquareApiClient::SearchEventsSort]
    def initialize(field: OMIT, order: OMIT, additional_properties: nil)
      @field = field if field != OMIT
      @order = order if order != OMIT
      @additional_properties = additional_properties
      @_field_set = { "field": field, "order": order }.reject do | _k, v |
  v == OMIT
end
    end
# Deserialize a JSON object to an instance of SearchEventsSort
    #
    # @param json_object [String] 
    # @return [SquareApiClient::SearchEventsSort]
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
# Serialize an instance of SearchEventsSort to a JSON object
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
      obj.field&.is_a?(String) != false || raise("Passed value for field obj.field is not the expected type, validation failed.")
      obj.order&.is_a?(SquareApiClient::SortOrder) != false || raise("Passed value for field obj.order is not the expected type, validation failed.")
    end
  end
end