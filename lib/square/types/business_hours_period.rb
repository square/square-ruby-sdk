# frozen_string_literal: true
require_relative "day_of_week"
require "ostruct"
require "json"

module square.rb
# Represents a period of time during which a business location is open.
  class BusinessHoursPeriod
  # @return [square.rb::DayOfWeek] The day of the week for this time period.
#  See [DayOfWeek](#type-dayofweek) for possible values
    attr_reader :day_of_week
  # @return [String] The start time of a business hours period, specified in local time using
#  partial-time
#  RFC 3339 format. For example, `8:30:00` for a period starting at 8:30 in the
#  morning.
#  Note that the seconds value is always :00, but it is appended for conformance to
#  the RFC.
    attr_reader :start_local_time
  # @return [String] The end time of a business hours period, specified in local time using
#  partial-time
#  RFC 3339 format. For example, `21:00:00` for a period ending at 9:00 in the
#  evening.
#  Note that the seconds value is always :00, but it is appended for conformance to
#  the RFC.
    attr_reader :end_local_time
  # @return [OpenStruct] Additional properties unmapped to the current class definition
    attr_reader :additional_properties
  # @return [Object] 
    attr_reader :_field_set
    protected :_field_set

    OMIT = Object.new

    # @param day_of_week [square.rb::DayOfWeek] The day of the week for this time period.
#  See [DayOfWeek](#type-dayofweek) for possible values
    # @param start_local_time [String] The start time of a business hours period, specified in local time using
#  partial-time
#  RFC 3339 format. For example, `8:30:00` for a period starting at 8:30 in the
#  morning.
#  Note that the seconds value is always :00, but it is appended for conformance to
#  the RFC.
    # @param end_local_time [String] The end time of a business hours period, specified in local time using
#  partial-time
#  RFC 3339 format. For example, `21:00:00` for a period ending at 9:00 in the
#  evening.
#  Note that the seconds value is always :00, but it is appended for conformance to
#  the RFC.
    # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
    # @return [square.rb::BusinessHoursPeriod]
    def initialize(day_of_week: OMIT, start_local_time: OMIT, end_local_time: OMIT, additional_properties: nil)
      @day_of_week = day_of_week if day_of_week != OMIT
      @start_local_time = start_local_time if start_local_time != OMIT
      @end_local_time = end_local_time if end_local_time != OMIT
      @additional_properties = additional_properties
      @_field_set = { "day_of_week": day_of_week, "start_local_time": start_local_time, "end_local_time": end_local_time }.reject do | _k, v |
  v == OMIT
end
    end
# Deserialize a JSON object to an instance of BusinessHoursPeriod
    #
    # @param json_object [String] 
    # @return [square.rb::BusinessHoursPeriod]
    def self.from_json(json_object:)
      struct = JSON.parse(json_object, object_class: OpenStruct)
      parsed_json = JSON.parse(json_object)
      day_of_week = parsed_json["day_of_week"]
      start_local_time = parsed_json["start_local_time"]
      end_local_time = parsed_json["end_local_time"]
      new(
        day_of_week: day_of_week,
        start_local_time: start_local_time,
        end_local_time: end_local_time,
        additional_properties: struct
      )
    end
# Serialize an instance of BusinessHoursPeriod to a JSON object
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
      obj.day_of_week&.is_a?(square.rb::DayOfWeek) != false || raise("Passed value for field obj.day_of_week is not the expected type, validation failed.")
      obj.start_local_time&.is_a?(String) != false || raise("Passed value for field obj.start_local_time is not the expected type, validation failed.")
      obj.end_local_time&.is_a?(String) != false || raise("Passed value for field obj.end_local_time is not the expected type, validation failed.")
    end
  end
end