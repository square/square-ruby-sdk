# frozen_string_literal: true
require_relative "time_range"
require "ostruct"
require "json"

module SquareApiClient
# Filter for `Order` objects based on whether their `CREATED_AT`,
#  `CLOSED_AT`, or `UPDATED_AT` timestamps fall within a specified time range.
#  You can specify the time range and which timestamp to filter for. You can filter
#  for only one time range at a time.
#  For each time range, the start time and end time are inclusive. If the end time
#  is absent, it defaults to the time of the first request for the cursor.
#  __Important:__ If you use the `DateTimeFilter` in a `SearchOrders` query,
#  you must set the `sort_field` in [OrdersSort](entity:SearchOrdersSort)
#  to the same field you filter for. For example, if you set the `CLOSED_AT` field
#  in `DateTimeFilter`, you must set the `sort_field` in `SearchOrdersSort` to
#  `CLOSED_AT`. Otherwise, `SearchOrders` throws an error.
#  [Learn more about filtering orders by time
#  manage-orders/search-orders#important-note-about-filtering-orders-by-time-range)
  class SearchOrdersDateTimeFilter
  # @return [SquareApiClient::TimeRange] The time range for filtering on the `created_at` timestamp. If you use this
#  value, you must set the `sort_field` in the `OrdersSearchSort` object to
#  `CREATED_AT`.
    attr_reader :created_at
  # @return [SquareApiClient::TimeRange] The time range for filtering on the `updated_at` timestamp. If you use this
#  value, you must set the `sort_field` in the `OrdersSearchSort` object to
#  `UPDATED_AT`.
    attr_reader :updated_at
  # @return [SquareApiClient::TimeRange] The time range for filtering on the `closed_at` timestamp. If you use this
#  value, you must set the `sort_field` in the `OrdersSearchSort` object to
#  `CLOSED_AT`.
    attr_reader :closed_at
  # @return [OpenStruct] Additional properties unmapped to the current class definition
    attr_reader :additional_properties
  # @return [Object] 
    attr_reader :_field_set
    protected :_field_set

    OMIT = Object.new

    # @param created_at [SquareApiClient::TimeRange] The time range for filtering on the `created_at` timestamp. If you use this
#  value, you must set the `sort_field` in the `OrdersSearchSort` object to
#  `CREATED_AT`.
    # @param updated_at [SquareApiClient::TimeRange] The time range for filtering on the `updated_at` timestamp. If you use this
#  value, you must set the `sort_field` in the `OrdersSearchSort` object to
#  `UPDATED_AT`.
    # @param closed_at [SquareApiClient::TimeRange] The time range for filtering on the `closed_at` timestamp. If you use this
#  value, you must set the `sort_field` in the `OrdersSearchSort` object to
#  `CLOSED_AT`.
    # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
    # @return [SquareApiClient::SearchOrdersDateTimeFilter]
    def initialize(created_at: OMIT, updated_at: OMIT, closed_at: OMIT, additional_properties: nil)
      @created_at = created_at if created_at != OMIT
      @updated_at = updated_at if updated_at != OMIT
      @closed_at = closed_at if closed_at != OMIT
      @additional_properties = additional_properties
      @_field_set = { "created_at": created_at, "updated_at": updated_at, "closed_at": closed_at }.reject do | _k, v |
  v == OMIT
end
    end
# Deserialize a JSON object to an instance of SearchOrdersDateTimeFilter
    #
    # @param json_object [String] 
    # @return [SquareApiClient::SearchOrdersDateTimeFilter]
    def self.from_json(json_object:)
      struct = JSON.parse(json_object, object_class: OpenStruct)
      parsed_json = JSON.parse(json_object)
      unless parsed_json["created_at"].nil?
        created_at = parsed_json["created_at"].to_json
        created_at = SquareApiClient::TimeRange.from_json(json_object: created_at)
      else
        created_at = nil
      end
      unless parsed_json["updated_at"].nil?
        updated_at = parsed_json["updated_at"].to_json
        updated_at = SquareApiClient::TimeRange.from_json(json_object: updated_at)
      else
        updated_at = nil
      end
      unless parsed_json["closed_at"].nil?
        closed_at = parsed_json["closed_at"].to_json
        closed_at = SquareApiClient::TimeRange.from_json(json_object: closed_at)
      else
        closed_at = nil
      end
      new(
        created_at: created_at,
        updated_at: updated_at,
        closed_at: closed_at,
        additional_properties: struct
      )
    end
# Serialize an instance of SearchOrdersDateTimeFilter to a JSON object
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
      obj.created_at.nil? || SquareApiClient::TimeRange.validate_raw(obj: obj.created_at)
      obj.updated_at.nil? || SquareApiClient::TimeRange.validate_raw(obj: obj.updated_at)
      obj.closed_at.nil? || SquareApiClient::TimeRange.validate_raw(obj: obj.closed_at)
    end
  end
end