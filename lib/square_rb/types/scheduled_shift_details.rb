# frozen_string_literal: true
require "ostruct"
require "json"

module SquareApiClient
# Represents shift details for draft and published versions of a [scheduled
#  shift](entity:ScheduledShift),
#  such as job ID, team member assignment, and start and end times.
  class ScheduledShiftDetails
  # @return [String] The ID of the [team member](entity:TeamMember) scheduled for the shift.
    attr_reader :team_member_id
  # @return [String] The ID of the [location](entity:Location) the shift is scheduled for.
    attr_reader :location_id
  # @return [String] The ID of the [job](entity:Job) the shift is scheduled for.
    attr_reader :job_id
  # @return [String] The start time of the shift, in RFC 3339 format in the time zone &plus;
#  offset of the shift location specified in `location_id`. Precision up to the
#  minute
#  is respected; seconds are truncated.
    attr_reader :start_at
  # @return [String] The end time for the shift, in RFC 3339 format in the time zone &plus;
#  offset of the shift location specified in `location_id`. Precision up to the
#  minute
#  is respected; seconds are truncated.
    attr_reader :end_at
  # @return [String] Optional notes for the shift.
    attr_reader :notes
  # @return [Boolean] Indicates whether the draft shift version is deleted. If set to `true` when the
#  shift
#  is published, the entire scheduled shift (including the published shift) is
#  deleted and
#  cannot be accessed using any endpoint.
    attr_reader :is_deleted
  # @return [String] The time zone of the shift location, calculated based on the `location_id`. This
#  field
#  is provided for convenience.
    attr_reader :timezone
  # @return [OpenStruct] Additional properties unmapped to the current class definition
    attr_reader :additional_properties
  # @return [Object] 
    attr_reader :_field_set
    protected :_field_set

    OMIT = Object.new

    # @param team_member_id [String] The ID of the [team member](entity:TeamMember) scheduled for the shift.
    # @param location_id [String] The ID of the [location](entity:Location) the shift is scheduled for.
    # @param job_id [String] The ID of the [job](entity:Job) the shift is scheduled for.
    # @param start_at [String] The start time of the shift, in RFC 3339 format in the time zone &plus;
#  offset of the shift location specified in `location_id`. Precision up to the
#  minute
#  is respected; seconds are truncated.
    # @param end_at [String] The end time for the shift, in RFC 3339 format in the time zone &plus;
#  offset of the shift location specified in `location_id`. Precision up to the
#  minute
#  is respected; seconds are truncated.
    # @param notes [String] Optional notes for the shift.
    # @param is_deleted [Boolean] Indicates whether the draft shift version is deleted. If set to `true` when the
#  shift
#  is published, the entire scheduled shift (including the published shift) is
#  deleted and
#  cannot be accessed using any endpoint.
    # @param timezone [String] The time zone of the shift location, calculated based on the `location_id`. This
#  field
#  is provided for convenience.
    # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
    # @return [SquareApiClient::ScheduledShiftDetails]
    def initialize(team_member_id: OMIT, location_id: OMIT, job_id: OMIT, start_at: OMIT, end_at: OMIT, notes: OMIT, is_deleted: OMIT, timezone: OMIT, additional_properties: nil)
      @team_member_id = team_member_id if team_member_id != OMIT
      @location_id = location_id if location_id != OMIT
      @job_id = job_id if job_id != OMIT
      @start_at = start_at if start_at != OMIT
      @end_at = end_at if end_at != OMIT
      @notes = notes if notes != OMIT
      @is_deleted = is_deleted if is_deleted != OMIT
      @timezone = timezone if timezone != OMIT
      @additional_properties = additional_properties
      @_field_set = { "team_member_id": team_member_id, "location_id": location_id, "job_id": job_id, "start_at": start_at, "end_at": end_at, "notes": notes, "is_deleted": is_deleted, "timezone": timezone }.reject do | _k, v |
  v == OMIT
end
    end
# Deserialize a JSON object to an instance of ScheduledShiftDetails
    #
    # @param json_object [String] 
    # @return [SquareApiClient::ScheduledShiftDetails]
    def self.from_json(json_object:)
      struct = JSON.parse(json_object, object_class: OpenStruct)
      parsed_json = JSON.parse(json_object)
      team_member_id = parsed_json["team_member_id"]
      location_id = parsed_json["location_id"]
      job_id = parsed_json["job_id"]
      start_at = parsed_json["start_at"]
      end_at = parsed_json["end_at"]
      notes = parsed_json["notes"]
      is_deleted = parsed_json["is_deleted"]
      timezone = parsed_json["timezone"]
      new(
        team_member_id: team_member_id,
        location_id: location_id,
        job_id: job_id,
        start_at: start_at,
        end_at: end_at,
        notes: notes,
        is_deleted: is_deleted,
        timezone: timezone,
        additional_properties: struct
      )
    end
# Serialize an instance of ScheduledShiftDetails to a JSON object
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
      obj.team_member_id&.is_a?(String) != false || raise("Passed value for field obj.team_member_id is not the expected type, validation failed.")
      obj.location_id&.is_a?(String) != false || raise("Passed value for field obj.location_id is not the expected type, validation failed.")
      obj.job_id&.is_a?(String) != false || raise("Passed value for field obj.job_id is not the expected type, validation failed.")
      obj.start_at&.is_a?(String) != false || raise("Passed value for field obj.start_at is not the expected type, validation failed.")
      obj.end_at&.is_a?(String) != false || raise("Passed value for field obj.end_at is not the expected type, validation failed.")
      obj.notes&.is_a?(String) != false || raise("Passed value for field obj.notes is not the expected type, validation failed.")
      obj.is_deleted&.is_a?(Boolean) != false || raise("Passed value for field obj.is_deleted is not the expected type, validation failed.")
      obj.timezone&.is_a?(String) != false || raise("Passed value for field obj.timezone is not the expected type, validation failed.")
    end
  end
end