# frozen_string_literal: true
require_relative "date_range"
require_relative "scheduled_shift_workday_matcher"
require "ostruct"
require "json"

module SquareApiClient
# A `ScheduledShift` search query filter parameter that sets a range of days that
#  a `Shift` must start or end in before passing the filter condition.
  class ScheduledShiftWorkday
  # @return [SquareApiClient::DateRange] Dates for fetching the scheduled shifts.
    attr_reader :date_range
  # @return [SquareApiClient::ScheduledShiftWorkdayMatcher] The strategy on which the dates are applied.
#  See [ScheduledShiftWorkdayMatcher](#type-scheduledshiftworkdaymatcher) for
#  possible values
    attr_reader :match_scheduled_shifts_by
  # @return [String] Location-specific timezones convert workdays to datetime filters.
#  Every location included in the query must have a timezone or this field
#  must be provided as a fallback. Format: the IANA timezone database
#  identifier for the relevant timezone.
    attr_reader :default_timezone
  # @return [OpenStruct] Additional properties unmapped to the current class definition
    attr_reader :additional_properties
  # @return [Object] 
    attr_reader :_field_set
    protected :_field_set

    OMIT = Object.new

    # @param date_range [SquareApiClient::DateRange] Dates for fetching the scheduled shifts.
    # @param match_scheduled_shifts_by [SquareApiClient::ScheduledShiftWorkdayMatcher] The strategy on which the dates are applied.
#  See [ScheduledShiftWorkdayMatcher](#type-scheduledshiftworkdaymatcher) for
#  possible values
    # @param default_timezone [String] Location-specific timezones convert workdays to datetime filters.
#  Every location included in the query must have a timezone or this field
#  must be provided as a fallback. Format: the IANA timezone database
#  identifier for the relevant timezone.
    # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
    # @return [SquareApiClient::ScheduledShiftWorkday]
    def initialize(date_range: OMIT, match_scheduled_shifts_by: OMIT, default_timezone: OMIT, additional_properties: nil)
      @date_range = date_range if date_range != OMIT
      @match_scheduled_shifts_by = match_scheduled_shifts_by if match_scheduled_shifts_by != OMIT
      @default_timezone = default_timezone if default_timezone != OMIT
      @additional_properties = additional_properties
      @_field_set = { "date_range": date_range, "match_scheduled_shifts_by": match_scheduled_shifts_by, "default_timezone": default_timezone }.reject do | _k, v |
  v == OMIT
end
    end
# Deserialize a JSON object to an instance of ScheduledShiftWorkday
    #
    # @param json_object [String] 
    # @return [SquareApiClient::ScheduledShiftWorkday]
    def self.from_json(json_object:)
      struct = JSON.parse(json_object, object_class: OpenStruct)
      parsed_json = JSON.parse(json_object)
      unless parsed_json["date_range"].nil?
        date_range = parsed_json["date_range"].to_json
        date_range = SquareApiClient::DateRange.from_json(json_object: date_range)
      else
        date_range = nil
      end
      match_scheduled_shifts_by = parsed_json["match_scheduled_shifts_by"]
      default_timezone = parsed_json["default_timezone"]
      new(
        date_range: date_range,
        match_scheduled_shifts_by: match_scheduled_shifts_by,
        default_timezone: default_timezone,
        additional_properties: struct
      )
    end
# Serialize an instance of ScheduledShiftWorkday to a JSON object
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
      obj.date_range.nil? || SquareApiClient::DateRange.validate_raw(obj: obj.date_range)
      obj.match_scheduled_shifts_by&.is_a?(SquareApiClient::ScheduledShiftWorkdayMatcher) != false || raise("Passed value for field obj.match_scheduled_shifts_by is not the expected type, validation failed.")
      obj.default_timezone&.is_a?(String) != false || raise("Passed value for field obj.default_timezone is not the expected type, validation failed.")
    end
  end
end