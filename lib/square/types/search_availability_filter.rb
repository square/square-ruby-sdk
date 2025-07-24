# frozen_string_literal: true
require_relative "time_range"
require_relative "segment_filter"
require "ostruct"
require "json"

module square.rb
# A query filter to search for buyer-accessible availabilities by.
  class SearchAvailabilityFilter
  # @return [square.rb::TimeRange] The query expression to search for buy-accessible availabilities with their
#  starting times falling within the specified time range.
#  The time range must be at least 24 hours and at most 32 days long.
#  For waitlist availabilities, the time range can be 0 or more up to 367 days
#  long.
    attr_reader :start_at_range
  # @return [String] The query expression to search for buyer-accessible availabilities with their
#  location IDs matching the specified location ID.
#  This query expression cannot be set if `booking_id` is set.
    attr_reader :location_id
  # @return [Array<square.rb::SegmentFilter>] The query expression to search for buyer-accessible availabilities matching the
#  specified list of segment filters.
#  If the size of the `segment_filters` list is `n`, the search returns
#  availabilities with `n` segments per availability.
#  This query expression cannot be set if `booking_id` is set.
    attr_reader :segment_filters
  # @return [String] The query expression to search for buyer-accessible availabilities for an
#  existing booking by matching the specified `booking_id` value.
#  This is commonly used to reschedule an appointment.
#  If this expression is set, the `location_id` and `segment_filters` expressions
#  cannot be set.
    attr_reader :booking_id
  # @return [OpenStruct] Additional properties unmapped to the current class definition
    attr_reader :additional_properties
  # @return [Object] 
    attr_reader :_field_set
    protected :_field_set

    OMIT = Object.new

    # @param start_at_range [square.rb::TimeRange] The query expression to search for buy-accessible availabilities with their
#  starting times falling within the specified time range.
#  The time range must be at least 24 hours and at most 32 days long.
#  For waitlist availabilities, the time range can be 0 or more up to 367 days
#  long.
    # @param location_id [String] The query expression to search for buyer-accessible availabilities with their
#  location IDs matching the specified location ID.
#  This query expression cannot be set if `booking_id` is set.
    # @param segment_filters [Array<square.rb::SegmentFilter>] The query expression to search for buyer-accessible availabilities matching the
#  specified list of segment filters.
#  If the size of the `segment_filters` list is `n`, the search returns
#  availabilities with `n` segments per availability.
#  This query expression cannot be set if `booking_id` is set.
    # @param booking_id [String] The query expression to search for buyer-accessible availabilities for an
#  existing booking by matching the specified `booking_id` value.
#  This is commonly used to reschedule an appointment.
#  If this expression is set, the `location_id` and `segment_filters` expressions
#  cannot be set.
    # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
    # @return [square.rb::SearchAvailabilityFilter]
    def initialize(start_at_range:, location_id: OMIT, segment_filters: OMIT, booking_id: OMIT, additional_properties: nil)
      @start_at_range = start_at_range
      @location_id = location_id if location_id != OMIT
      @segment_filters = segment_filters if segment_filters != OMIT
      @booking_id = booking_id if booking_id != OMIT
      @additional_properties = additional_properties
      @_field_set = { "start_at_range": start_at_range, "location_id": location_id, "segment_filters": segment_filters, "booking_id": booking_id }.reject do | _k, v |
  v == OMIT
end
    end
# Deserialize a JSON object to an instance of SearchAvailabilityFilter
    #
    # @param json_object [String] 
    # @return [square.rb::SearchAvailabilityFilter]
    def self.from_json(json_object:)
      struct = JSON.parse(json_object, object_class: OpenStruct)
      parsed_json = JSON.parse(json_object)
      unless parsed_json["start_at_range"].nil?
        start_at_range = parsed_json["start_at_range"].to_json
        start_at_range = square.rb::TimeRange.from_json(json_object: start_at_range)
      else
        start_at_range = nil
      end
      location_id = parsed_json["location_id"]
      segment_filters = parsed_json["segment_filters"]&.map do | item |
  item = item.to_json
  square.rb::SegmentFilter.from_json(json_object: item)
end
      booking_id = parsed_json["booking_id"]
      new(
        start_at_range: start_at_range,
        location_id: location_id,
        segment_filters: segment_filters,
        booking_id: booking_id,
        additional_properties: struct
      )
    end
# Serialize an instance of SearchAvailabilityFilter to a JSON object
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
      square.rb::TimeRange.validate_raw(obj: obj.start_at_range)
      obj.location_id&.is_a?(String) != false || raise("Passed value for field obj.location_id is not the expected type, validation failed.")
      obj.segment_filters&.is_a?(Array) != false || raise("Passed value for field obj.segment_filters is not the expected type, validation failed.")
      obj.booking_id&.is_a?(String) != false || raise("Passed value for field obj.booking_id is not the expected type, validation failed.")
    end
  end
end