# frozen_string_literal: true
require_relative "timecard_filter_status"
require_relative "time_range"
require_relative "timecard_workday"
require "ostruct"
require "json"

module square.rb
# Defines a filter used in a search for `Timecard` records. `AND` logic is
#  used by Square's servers to apply each filter property specified.
  class TimecardFilter
  # @return [Array<String>] Fetch timecards for the specified location.
    attr_reader :location_ids
  # @return [square.rb::TimecardFilterStatus] Fetch a `Timecard` instance by `Timecard.status`.
#  See [TimecardFilterStatus](#type-timecardfilterstatus) for possible values
    attr_reader :status
  # @return [square.rb::TimeRange] Fetch `Timecard` instances that start in the time range - Inclusive.
    attr_reader :start
  # @return [square.rb::TimeRange] Fetch the `Timecard` instances that end in the time range - Inclusive.
    attr_reader :end_
  # @return [square.rb::TimecardWorkday] Fetch the `Timecard` instances based on the workday date range.
    attr_reader :workday
  # @return [Array<String>] Fetch timecards for the specified team members.
    attr_reader :team_member_ids
  # @return [OpenStruct] Additional properties unmapped to the current class definition
    attr_reader :additional_properties
  # @return [Object] 
    attr_reader :_field_set
    protected :_field_set

    OMIT = Object.new

    # @param location_ids [Array<String>] Fetch timecards for the specified location.
    # @param status [square.rb::TimecardFilterStatus] Fetch a `Timecard` instance by `Timecard.status`.
#  See [TimecardFilterStatus](#type-timecardfilterstatus) for possible values
    # @param start [square.rb::TimeRange] Fetch `Timecard` instances that start in the time range - Inclusive.
    # @param end_ [square.rb::TimeRange] Fetch the `Timecard` instances that end in the time range - Inclusive.
    # @param workday [square.rb::TimecardWorkday] Fetch the `Timecard` instances based on the workday date range.
    # @param team_member_ids [Array<String>] Fetch timecards for the specified team members.
    # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
    # @return [square.rb::TimecardFilter]
    def initialize(location_ids: OMIT, status: OMIT, start: OMIT, end_: OMIT, workday: OMIT, team_member_ids: OMIT, additional_properties: nil)
      @location_ids = location_ids if location_ids != OMIT
      @status = status if status != OMIT
      @start = start if start != OMIT
      @end_ = end_ if end_ != OMIT
      @workday = workday if workday != OMIT
      @team_member_ids = team_member_ids if team_member_ids != OMIT
      @additional_properties = additional_properties
      @_field_set = { "location_ids": location_ids, "status": status, "start": start, "end": end_, "workday": workday, "team_member_ids": team_member_ids }.reject do | _k, v |
  v == OMIT
end
    end
# Deserialize a JSON object to an instance of TimecardFilter
    #
    # @param json_object [String] 
    # @return [square.rb::TimecardFilter]
    def self.from_json(json_object:)
      struct = JSON.parse(json_object, object_class: OpenStruct)
      parsed_json = JSON.parse(json_object)
      location_ids = parsed_json["location_ids"]
      status = parsed_json["status"]
      unless parsed_json["start"].nil?
        start = parsed_json["start"].to_json
        start = square.rb::TimeRange.from_json(json_object: start)
      else
        start = nil
      end
      unless parsed_json["end"].nil?
        end_ = parsed_json["end"].to_json
        end_ = square.rb::TimeRange.from_json(json_object: end_)
      else
        end_ = nil
      end
      unless parsed_json["workday"].nil?
        workday = parsed_json["workday"].to_json
        workday = square.rb::TimecardWorkday.from_json(json_object: workday)
      else
        workday = nil
      end
      team_member_ids = parsed_json["team_member_ids"]
      new(
        location_ids: location_ids,
        status: status,
        start: start,
        end_: end_,
        workday: workday,
        team_member_ids: team_member_ids,
        additional_properties: struct
      )
    end
# Serialize an instance of TimecardFilter to a JSON object
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
      obj.location_ids&.is_a?(Array) != false || raise("Passed value for field obj.location_ids is not the expected type, validation failed.")
      obj.status&.is_a?(square.rb::TimecardFilterStatus) != false || raise("Passed value for field obj.status is not the expected type, validation failed.")
      obj.start.nil? || square.rb::TimeRange.validate_raw(obj: obj.start)
      obj.end_.nil? || square.rb::TimeRange.validate_raw(obj: obj.end_)
      obj.workday.nil? || square.rb::TimecardWorkday.validate_raw(obj: obj.workday)
      obj.team_member_ids&.is_a?(Array) != false || raise("Passed value for field obj.team_member_ids is not the expected type, validation failed.")
    end
  end
end