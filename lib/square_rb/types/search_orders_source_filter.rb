# frozen_string_literal: true
require "ostruct"
require "json"

module SquareApiClient
# A filter based on order `source` information.
  class SearchOrdersSourceFilter
  # @return [Array<String>] Filters by the [Source](entity:OrderSource) `name`. The filter returns any
#  orders
#  with a `source.name` that matches any of the listed source names.
#  Max: 10 source names.
    attr_reader :source_names
  # @return [OpenStruct] Additional properties unmapped to the current class definition
    attr_reader :additional_properties
  # @return [Object] 
    attr_reader :_field_set
    protected :_field_set

    OMIT = Object.new

    # @param source_names [Array<String>] Filters by the [Source](entity:OrderSource) `name`. The filter returns any
#  orders
#  with a `source.name` that matches any of the listed source names.
#  Max: 10 source names.
    # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
    # @return [SquareApiClient::SearchOrdersSourceFilter]
    def initialize(source_names: OMIT, additional_properties: nil)
      @source_names = source_names if source_names != OMIT
      @additional_properties = additional_properties
      @_field_set = { "source_names": source_names }.reject do | _k, v |
  v == OMIT
end
    end
# Deserialize a JSON object to an instance of SearchOrdersSourceFilter
    #
    # @param json_object [String] 
    # @return [SquareApiClient::SearchOrdersSourceFilter]
    def self.from_json(json_object:)
      struct = JSON.parse(json_object, object_class: OpenStruct)
      parsed_json = JSON.parse(json_object)
      source_names = parsed_json["source_names"]
      new(source_names: source_names, additional_properties: struct)
    end
# Serialize an instance of SearchOrdersSourceFilter to a JSON object
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
      obj.source_names&.is_a?(Array) != false || raise("Passed value for field obj.source_names is not the expected type, validation failed.")
    end
  end
end