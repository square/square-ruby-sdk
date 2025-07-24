# frozen_string_literal: true
require_relative "customer_custom_attribute_filter_value"
require_relative "time_range"
require "ostruct"
require "json"

module SquareApiClient
# The custom attribute filter. Use this filter in a set of [custom attribute
#  filters](entity:CustomerCustomAttributeFilters) to search
#  based on the value or last updated date of a customer-related [custom
#  attribute](entity:CustomAttribute).
  class CustomerCustomAttributeFilter
  # @return [String] The `key` of the [custom attribute](entity:CustomAttribute) to filter by. The
#  key is the identifier of the custom attribute
#  (and the corresponding custom attribute definition) and can be retrieved using
#  the [Customer Custom Attributes API](api:CustomerCustomAttributes).
    attr_reader :key
  # @return [SquareApiClient::CustomerCustomAttributeFilterValue] A filter that corresponds to the data type of the target custom attribute. For
#  example, provide the `phone` filter to
#  search based on the value of a `PhoneNumber`-type custom attribute. The data
#  type is specified by the schema field of the custom attribute definition,
#  which can be retrieved using the [Customer Custom Attributes
#  API](api:CustomerCustomAttributes).
#  You must provide this `filter` field, the `updated_at` field, or both.
    attr_reader :filter
  # @return [SquareApiClient::TimeRange] The date range for when the custom attribute was last updated. The date range
#  can include `start_at`, `end_at`, or
#  both. Range boundaries are inclusive. Dates are specified as RFC 3339
#  timestamps.
#  You must provide this `updated_at` field, the `filter` field, or both.
    attr_reader :updated_at
  # @return [OpenStruct] Additional properties unmapped to the current class definition
    attr_reader :additional_properties
  # @return [Object] 
    attr_reader :_field_set
    protected :_field_set

    OMIT = Object.new

    # @param key [String] The `key` of the [custom attribute](entity:CustomAttribute) to filter by. The
#  key is the identifier of the custom attribute
#  (and the corresponding custom attribute definition) and can be retrieved using
#  the [Customer Custom Attributes API](api:CustomerCustomAttributes).
    # @param filter [SquareApiClient::CustomerCustomAttributeFilterValue] A filter that corresponds to the data type of the target custom attribute. For
#  example, provide the `phone` filter to
#  search based on the value of a `PhoneNumber`-type custom attribute. The data
#  type is specified by the schema field of the custom attribute definition,
#  which can be retrieved using the [Customer Custom Attributes
#  API](api:CustomerCustomAttributes).
#  You must provide this `filter` field, the `updated_at` field, or both.
    # @param updated_at [SquareApiClient::TimeRange] The date range for when the custom attribute was last updated. The date range
#  can include `start_at`, `end_at`, or
#  both. Range boundaries are inclusive. Dates are specified as RFC 3339
#  timestamps.
#  You must provide this `updated_at` field, the `filter` field, or both.
    # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
    # @return [SquareApiClient::CustomerCustomAttributeFilter]
    def initialize(key:, filter: OMIT, updated_at: OMIT, additional_properties: nil)
      @key = key
      @filter = filter if filter != OMIT
      @updated_at = updated_at if updated_at != OMIT
      @additional_properties = additional_properties
      @_field_set = { "key": key, "filter": filter, "updated_at": updated_at }.reject do | _k, v |
  v == OMIT
end
    end
# Deserialize a JSON object to an instance of CustomerCustomAttributeFilter
    #
    # @param json_object [String] 
    # @return [SquareApiClient::CustomerCustomAttributeFilter]
    def self.from_json(json_object:)
      struct = JSON.parse(json_object, object_class: OpenStruct)
      parsed_json = JSON.parse(json_object)
      key = parsed_json["key"]
      unless parsed_json["filter"].nil?
        filter = parsed_json["filter"].to_json
        filter = SquareApiClient::CustomerCustomAttributeFilterValue.from_json(json_object: filter)
      else
        filter = nil
      end
      unless parsed_json["updated_at"].nil?
        updated_at = parsed_json["updated_at"].to_json
        updated_at = SquareApiClient::TimeRange.from_json(json_object: updated_at)
      else
        updated_at = nil
      end
      new(
        key: key,
        filter: filter,
        updated_at: updated_at,
        additional_properties: struct
      )
    end
# Serialize an instance of CustomerCustomAttributeFilter to a JSON object
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
      obj.key.is_a?(String) != false || raise("Passed value for field obj.key is not the expected type, validation failed.")
      obj.filter.nil? || SquareApiClient::CustomerCustomAttributeFilterValue.validate_raw(obj: obj.filter)
      obj.updated_at.nil? || SquareApiClient::TimeRange.validate_raw(obj: obj.updated_at)
    end
  end
end