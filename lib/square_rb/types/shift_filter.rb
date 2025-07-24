# frozen_string_literal: true
require_relative "shift_filter_status"
require_relative "time_range"
require_relative "shift_workday"
require "ostruct"
require "json"

module SquareApiClient
# Defines a filter used in a search for `Shift` records. `AND` logic is
#  used by Square's servers to apply each filter property specified.
#  Deprecated at Square API version 2025-05-21. See the [migration
#  es](https://developer.squareup.com/docs/labor-api/what-it-does#migration-notes).
  class ShiftFilter
  # @return [Array<String>] Fetch shifts for the specified location.
    attr_reader :location_ids
  # @return [Array<String>] Fetch shifts for the specified employees. DEPRECATED at version 2020-08-26. Use
#  `team_member_ids` instead.
    attr_reader :employee_ids
  # @return [SquareApiClient::ShiftFilterStatus] Fetch a `Shift` instance by `Shift.status`.
#  See [ShiftFilterStatus](#type-shiftfilterstatus) for possible values
    attr_reader :status
  # @return [SquareApiClient::TimeRange] Fetch `Shift` instances that start in the time range - Inclusive.
    attr_reader :start
  # @return [SquareApiClient::TimeRange] Fetch the `Shift` instances that end in the time range - Inclusive.
    attr_reader :end_
  # @return [SquareApiClient::ShiftWorkday] Fetch the `Shift` instances based on the workday date range.
    attr_reader :workday
  # @return [Array<String>] Fetch shifts for the specified team members. Replaced `employee_ids` at version
#  "2020-08-26".
    attr_reader :team_member_ids
  # @return [OpenStruct] Additional properties unmapped to the current class definition
    attr_reader :additional_properties
  # @return [Object] 
    attr_reader :_field_set
    protected :_field_set

    OMIT = Object.new

    # @param location_ids [Array<String>] Fetch shifts for the specified location.
    # @param employee_ids [Array<String>] Fetch shifts for the specified employees. DEPRECATED at version 2020-08-26. Use
#  `team_member_ids` instead.
    # @param status [SquareApiClient::ShiftFilterStatus] Fetch a `Shift` instance by `Shift.status`.
#  See [ShiftFilterStatus](#type-shiftfilterstatus) for possible values
    # @param start [SquareApiClient::TimeRange] Fetch `Shift` instances that start in the time range - Inclusive.
    # @param end_ [SquareApiClient::TimeRange] Fetch the `Shift` instances that end in the time range - Inclusive.
    # @param workday [SquareApiClient::ShiftWorkday] Fetch the `Shift` instances based on the workday date range.
    # @param team_member_ids [Array<String>] Fetch shifts for the specified team members. Replaced `employee_ids` at version
#  "2020-08-26".
    # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
    # @return [SquareApiClient::ShiftFilter]
    def initialize(location_ids: OMIT, employee_ids: OMIT, status: OMIT, start: OMIT, end_: OMIT, workday: OMIT, team_member_ids: OMIT, additional_properties: nil)
      @location_ids = location_ids if location_ids != OMIT
      @employee_ids = employee_ids if employee_ids != OMIT
      @status = status if status != OMIT
      @start = start if start != OMIT
      @end_ = end_ if end_ != OMIT
      @workday = workday if workday != OMIT
      @team_member_ids = team_member_ids if team_member_ids != OMIT
      @additional_properties = additional_properties
      @_field_set = { "location_ids": location_ids, "employee_ids": employee_ids, "status": status, "start": start, "end": end_, "workday": workday, "team_member_ids": team_member_ids }.reject do | _k, v |
  v == OMIT
end
    end
# Deserialize a JSON object to an instance of ShiftFilter
    #
    # @param json_object [String] 
    # @return [SquareApiClient::ShiftFilter]
    def self.from_json(json_object:)
      struct = JSON.parse(json_object, object_class: OpenStruct)
      parsed_json = JSON.parse(json_object)
      location_ids = parsed_json["location_ids"]
      employee_ids = parsed_json["employee_ids"]
      status = parsed_json["status"]
      unless parsed_json["start"].nil?
        start = parsed_json["start"].to_json
        start = SquareApiClient::TimeRange.from_json(json_object: start)
      else
        start = nil
      end
      unless parsed_json["end"].nil?
        end_ = parsed_json["end"].to_json
        end_ = SquareApiClient::TimeRange.from_json(json_object: end_)
      else
        end_ = nil
      end
      unless parsed_json["workday"].nil?
        workday = parsed_json["workday"].to_json
        workday = SquareApiClient::ShiftWorkday.from_json(json_object: workday)
      else
        workday = nil
      end
      team_member_ids = parsed_json["team_member_ids"]
      new(
        location_ids: location_ids,
        employee_ids: employee_ids,
        status: status,
        start: start,
        end_: end_,
        workday: workday,
        team_member_ids: team_member_ids,
        additional_properties: struct
      )
    end
# Serialize an instance of ShiftFilter to a JSON object
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
      obj.employee_ids&.is_a?(Array) != false || raise("Passed value for field obj.employee_ids is not the expected type, validation failed.")
      obj.status&.is_a?(SquareApiClient::ShiftFilterStatus) != false || raise("Passed value for field obj.status is not the expected type, validation failed.")
      obj.start.nil? || SquareApiClient::TimeRange.validate_raw(obj: obj.start)
      obj.end_.nil? || SquareApiClient::TimeRange.validate_raw(obj: obj.end_)
      obj.workday.nil? || SquareApiClient::ShiftWorkday.validate_raw(obj: obj.workday)
      obj.team_member_ids&.is_a?(Array) != false || raise("Passed value for field obj.team_member_ids is not the expected type, validation failed.")
    end
  end
end