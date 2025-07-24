# frozen_string_literal: true
require_relative "time_range"
require_relative "scheduled_shift_workday"
require_relative "scheduled_shift_filter_assignment_status"
require_relative "scheduled_shift_filter_scheduled_shift_status"
require "ostruct"
require "json"

module SquareApiClient
# Defines filter criteria for a
#  [SearchScheduledShifts](api-endpoint:Labor-SearchScheduledShifts)
#  request. Multiple filters in a query are combined as an `AND` operation.
  class ScheduledShiftFilter
  # @return [Array<String>] Return shifts for the specified locations. When omitted, shifts for all
#  locations are returned. If needed, call
#  [ListLocations](api-endpoint:Locations-ListLocations)
#  to get location IDs.
    attr_reader :location_ids
  # @return [SquareApiClient::TimeRange] Return shifts whose `start_at` time is within the specified
#  time range (inclusive).
    attr_reader :start
  # @return [SquareApiClient::TimeRange] Return shifts whose `end_at` time is within the specified
#  time range (inclusive).
    attr_reader :end_
  # @return [SquareApiClient::ScheduledShiftWorkday] Return shifts based on a workday date range.
    attr_reader :workday
  # @return [Array<String>] Return shifts assigned to specified team members. If needed, call
#  [SearchTeamMembers](api-endpoint:Team-SearchTeamMembers) to get team member IDs.
#  To return only the shifts assigned to the specified team members, include the
#  `assignment_status` filter in the query. Otherwise, all unassigned shifts are
#  returned along with shifts assigned to the specified team members.
    attr_reader :team_member_ids
  # @return [SquareApiClient::ScheduledShiftFilterAssignmentStatus] Return shifts based on whether a team member is assigned. A shift is
#  assigned if the `team_member_id` field is populated in the `draft_shift_details`
#  or `published_shift details` field of the shift.
#  To return only draft or published shifts, include the `scheduled_shift_statuses`
#  filter in the query.
#  See
#  cheduledShiftFilterAssignmentStatus](#type-scheduledshiftfilterassignmentstatus)
#  for possible values
    attr_reader :assignment_status
  # @return [Array<SquareApiClient::ScheduledShiftFilterScheduledShiftStatus>] Return shifts based on the draft or published status of the shift.
#  A shift is published if the `published_shift_details` field is present.
#  Note that shifts with `draft_shift_details.is_deleted` set to `true` are ignored
#  with the `DRAFT` filter.
#  See
#  ShiftFilterScheduledShiftStatus](#type-scheduledshiftfilterscheduledshiftstatus)
#  for possible values
    attr_reader :scheduled_shift_statuses
  # @return [OpenStruct] Additional properties unmapped to the current class definition
    attr_reader :additional_properties
  # @return [Object] 
    attr_reader :_field_set
    protected :_field_set

    OMIT = Object.new

    # @param location_ids [Array<String>] Return shifts for the specified locations. When omitted, shifts for all
#  locations are returned. If needed, call
#  [ListLocations](api-endpoint:Locations-ListLocations)
#  to get location IDs.
    # @param start [SquareApiClient::TimeRange] Return shifts whose `start_at` time is within the specified
#  time range (inclusive).
    # @param end_ [SquareApiClient::TimeRange] Return shifts whose `end_at` time is within the specified
#  time range (inclusive).
    # @param workday [SquareApiClient::ScheduledShiftWorkday] Return shifts based on a workday date range.
    # @param team_member_ids [Array<String>] Return shifts assigned to specified team members. If needed, call
#  [SearchTeamMembers](api-endpoint:Team-SearchTeamMembers) to get team member IDs.
#  To return only the shifts assigned to the specified team members, include the
#  `assignment_status` filter in the query. Otherwise, all unassigned shifts are
#  returned along with shifts assigned to the specified team members.
    # @param assignment_status [SquareApiClient::ScheduledShiftFilterAssignmentStatus] Return shifts based on whether a team member is assigned. A shift is
#  assigned if the `team_member_id` field is populated in the `draft_shift_details`
#  or `published_shift details` field of the shift.
#  To return only draft or published shifts, include the `scheduled_shift_statuses`
#  filter in the query.
#  See
#  cheduledShiftFilterAssignmentStatus](#type-scheduledshiftfilterassignmentstatus)
#  for possible values
    # @param scheduled_shift_statuses [Array<SquareApiClient::ScheduledShiftFilterScheduledShiftStatus>] Return shifts based on the draft or published status of the shift.
#  A shift is published if the `published_shift_details` field is present.
#  Note that shifts with `draft_shift_details.is_deleted` set to `true` are ignored
#  with the `DRAFT` filter.
#  See
#  ShiftFilterScheduledShiftStatus](#type-scheduledshiftfilterscheduledshiftstatus)
#  for possible values
    # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
    # @return [SquareApiClient::ScheduledShiftFilter]
    def initialize(location_ids: OMIT, start: OMIT, end_: OMIT, workday: OMIT, team_member_ids: OMIT, assignment_status: OMIT, scheduled_shift_statuses: OMIT, additional_properties: nil)
      @location_ids = location_ids if location_ids != OMIT
      @start = start if start != OMIT
      @end_ = end_ if end_ != OMIT
      @workday = workday if workday != OMIT
      @team_member_ids = team_member_ids if team_member_ids != OMIT
      @assignment_status = assignment_status if assignment_status != OMIT
      @scheduled_shift_statuses = scheduled_shift_statuses if scheduled_shift_statuses != OMIT
      @additional_properties = additional_properties
      @_field_set = { "location_ids": location_ids, "start": start, "end": end_, "workday": workday, "team_member_ids": team_member_ids, "assignment_status": assignment_status, "scheduled_shift_statuses": scheduled_shift_statuses }.reject do | _k, v |
  v == OMIT
end
    end
# Deserialize a JSON object to an instance of ScheduledShiftFilter
    #
    # @param json_object [String] 
    # @return [SquareApiClient::ScheduledShiftFilter]
    def self.from_json(json_object:)
      struct = JSON.parse(json_object, object_class: OpenStruct)
      parsed_json = JSON.parse(json_object)
      location_ids = parsed_json["location_ids"]
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
        workday = SquareApiClient::ScheduledShiftWorkday.from_json(json_object: workday)
      else
        workday = nil
      end
      team_member_ids = parsed_json["team_member_ids"]
      assignment_status = parsed_json["assignment_status"]
      scheduled_shift_statuses = parsed_json["scheduled_shift_statuses"]
      new(
        location_ids: location_ids,
        start: start,
        end_: end_,
        workday: workday,
        team_member_ids: team_member_ids,
        assignment_status: assignment_status,
        scheduled_shift_statuses: scheduled_shift_statuses,
        additional_properties: struct
      )
    end
# Serialize an instance of ScheduledShiftFilter to a JSON object
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
      obj.start.nil? || SquareApiClient::TimeRange.validate_raw(obj: obj.start)
      obj.end_.nil? || SquareApiClient::TimeRange.validate_raw(obj: obj.end_)
      obj.workday.nil? || SquareApiClient::ScheduledShiftWorkday.validate_raw(obj: obj.workday)
      obj.team_member_ids&.is_a?(Array) != false || raise("Passed value for field obj.team_member_ids is not the expected type, validation failed.")
      obj.assignment_status&.is_a?(SquareApiClient::ScheduledShiftFilterAssignmentStatus) != false || raise("Passed value for field obj.assignment_status is not the expected type, validation failed.")
      obj.scheduled_shift_statuses&.is_a?(Array) != false || raise("Passed value for field obj.scheduled_shift_statuses is not the expected type, validation failed.")
    end
  end
end