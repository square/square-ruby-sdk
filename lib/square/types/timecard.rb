# frozen_string_literal: true
require_relative "timecard_wage"
require_relative "break_"
require_relative "timecard_status"
require_relative "money"
require "ostruct"
require "json"

module square.rb
# A record of the hourly rate, start time, and end time of a single timecard
#  (shift)
#  for a team member. This might include a record of the start and end times of
#  breaks
#  taken during the shift.
  class Timecard
  # @return [String] **Read only** The Square-issued UUID for this object.
    attr_reader :id
  # @return [String] The ID of the [location](entity:Location) for this timecard. The location should
#  be based on
#  where the team member clocked in.
    attr_reader :location_id
  # @return [String] **Read only** The time zone calculated from the location based on the
#  `location_id`,
#  provided as a convenience value. Format: the IANA time zone database identifier
#  for the
#  location time zone.
    attr_reader :timezone
  # @return [String] The start time of the timecard, in RFC 3339 format and shifted to the location
#  timezone + offset. Precision up to the minute is respected; seconds are
#  truncated.
    attr_reader :start_at
  # @return [String] The end time of the timecard, in RFC 3339 format and shifted to the location
#  timezone + offset. Precision up to the minute is respected; seconds are
#  truncated.
    attr_reader :end_at
  # @return [square.rb::TimecardWage] Job and pay related information. If the wage is not set on create, it defaults
#  to a wage
#  of zero. If the title is not set on create, it defaults to the name of the role
#  the team member
#  is assigned to, if any.
    attr_reader :wage
  # @return [Array<square.rb::Break>] A list of all the paid or unpaid breaks that were taken during this timecard.
    attr_reader :breaks
  # @return [square.rb::TimecardStatus] Describes the working state of the timecard.
#  See [TimecardStatus](#type-timecardstatus) for possible values
    attr_reader :status
  # @return [Integer] **Read only** The current version of the timecard, which is incremented with
#  each update.
#  This field is used for [optimistic
#  loper.squareup.com/docs/build-basics/common-api-patterns/optimistic-concurrency)
#  control to ensure that requests don't overwrite data from another request.
    attr_reader :version
  # @return [String] The timestamp of when the timecard was created, in RFC 3339 format presented as
#  UTC.
    attr_reader :created_at
  # @return [String] The timestamp of when the timecard was last updated, in RFC 3339 format
#  presented as UTC.
    attr_reader :updated_at
  # @return [String] The ID of the [team member](entity:TeamMember) this timecard belongs to.
    attr_reader :team_member_id
  # @return [square.rb::Money] The cash tips declared by the team member for this timecard.
    attr_reader :declared_cash_tip_money
  # @return [OpenStruct] Additional properties unmapped to the current class definition
    attr_reader :additional_properties
  # @return [Object] 
    attr_reader :_field_set
    protected :_field_set

    OMIT = Object.new

    # @param id [String] **Read only** The Square-issued UUID for this object.
    # @param location_id [String] The ID of the [location](entity:Location) for this timecard. The location should
#  be based on
#  where the team member clocked in.
    # @param timezone [String] **Read only** The time zone calculated from the location based on the
#  `location_id`,
#  provided as a convenience value. Format: the IANA time zone database identifier
#  for the
#  location time zone.
    # @param start_at [String] The start time of the timecard, in RFC 3339 format and shifted to the location
#  timezone + offset. Precision up to the minute is respected; seconds are
#  truncated.
    # @param end_at [String] The end time of the timecard, in RFC 3339 format and shifted to the location
#  timezone + offset. Precision up to the minute is respected; seconds are
#  truncated.
    # @param wage [square.rb::TimecardWage] Job and pay related information. If the wage is not set on create, it defaults
#  to a wage
#  of zero. If the title is not set on create, it defaults to the name of the role
#  the team member
#  is assigned to, if any.
    # @param breaks [Array<square.rb::Break>] A list of all the paid or unpaid breaks that were taken during this timecard.
    # @param status [square.rb::TimecardStatus] Describes the working state of the timecard.
#  See [TimecardStatus](#type-timecardstatus) for possible values
    # @param version [Integer] **Read only** The current version of the timecard, which is incremented with
#  each update.
#  This field is used for [optimistic
#  loper.squareup.com/docs/build-basics/common-api-patterns/optimistic-concurrency)
#  control to ensure that requests don't overwrite data from another request.
    # @param created_at [String] The timestamp of when the timecard was created, in RFC 3339 format presented as
#  UTC.
    # @param updated_at [String] The timestamp of when the timecard was last updated, in RFC 3339 format
#  presented as UTC.
    # @param team_member_id [String] The ID of the [team member](entity:TeamMember) this timecard belongs to.
    # @param declared_cash_tip_money [square.rb::Money] The cash tips declared by the team member for this timecard.
    # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
    # @return [square.rb::Timecard]
    def initialize(id: OMIT, location_id:, timezone: OMIT, start_at:, end_at: OMIT, wage: OMIT, breaks: OMIT, status: OMIT, version: OMIT, created_at: OMIT, updated_at: OMIT, team_member_id:, declared_cash_tip_money: OMIT, additional_properties: nil)
      @id = id if id != OMIT
      @location_id = location_id
      @timezone = timezone if timezone != OMIT
      @start_at = start_at
      @end_at = end_at if end_at != OMIT
      @wage = wage if wage != OMIT
      @breaks = breaks if breaks != OMIT
      @status = status if status != OMIT
      @version = version if version != OMIT
      @created_at = created_at if created_at != OMIT
      @updated_at = updated_at if updated_at != OMIT
      @team_member_id = team_member_id
      @declared_cash_tip_money = declared_cash_tip_money if declared_cash_tip_money != OMIT
      @additional_properties = additional_properties
      @_field_set = { "id": id, "location_id": location_id, "timezone": timezone, "start_at": start_at, "end_at": end_at, "wage": wage, "breaks": breaks, "status": status, "version": version, "created_at": created_at, "updated_at": updated_at, "team_member_id": team_member_id, "declared_cash_tip_money": declared_cash_tip_money }.reject do | _k, v |
  v == OMIT
end
    end
# Deserialize a JSON object to an instance of Timecard
    #
    # @param json_object [String] 
    # @return [square.rb::Timecard]
    def self.from_json(json_object:)
      struct = JSON.parse(json_object, object_class: OpenStruct)
      parsed_json = JSON.parse(json_object)
      id = parsed_json["id"]
      location_id = parsed_json["location_id"]
      timezone = parsed_json["timezone"]
      start_at = parsed_json["start_at"]
      end_at = parsed_json["end_at"]
      unless parsed_json["wage"].nil?
        wage = parsed_json["wage"].to_json
        wage = square.rb::TimecardWage.from_json(json_object: wage)
      else
        wage = nil
      end
      breaks = parsed_json["breaks"]&.map do | item |
  item = item.to_json
  square.rb::Break.from_json(json_object: item)
end
      status = parsed_json["status"]
      version = parsed_json["version"]
      created_at = parsed_json["created_at"]
      updated_at = parsed_json["updated_at"]
      team_member_id = parsed_json["team_member_id"]
      unless parsed_json["declared_cash_tip_money"].nil?
        declared_cash_tip_money = parsed_json["declared_cash_tip_money"].to_json
        declared_cash_tip_money = square.rb::Money.from_json(json_object: declared_cash_tip_money)
      else
        declared_cash_tip_money = nil
      end
      new(
        id: id,
        location_id: location_id,
        timezone: timezone,
        start_at: start_at,
        end_at: end_at,
        wage: wage,
        breaks: breaks,
        status: status,
        version: version,
        created_at: created_at,
        updated_at: updated_at,
        team_member_id: team_member_id,
        declared_cash_tip_money: declared_cash_tip_money,
        additional_properties: struct
      )
    end
# Serialize an instance of Timecard to a JSON object
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
      obj.id&.is_a?(String) != false || raise("Passed value for field obj.id is not the expected type, validation failed.")
      obj.location_id.is_a?(String) != false || raise("Passed value for field obj.location_id is not the expected type, validation failed.")
      obj.timezone&.is_a?(String) != false || raise("Passed value for field obj.timezone is not the expected type, validation failed.")
      obj.start_at.is_a?(String) != false || raise("Passed value for field obj.start_at is not the expected type, validation failed.")
      obj.end_at&.is_a?(String) != false || raise("Passed value for field obj.end_at is not the expected type, validation failed.")
      obj.wage.nil? || square.rb::TimecardWage.validate_raw(obj: obj.wage)
      obj.breaks&.is_a?(Array) != false || raise("Passed value for field obj.breaks is not the expected type, validation failed.")
      obj.status&.is_a?(square.rb::TimecardStatus) != false || raise("Passed value for field obj.status is not the expected type, validation failed.")
      obj.version&.is_a?(Integer) != false || raise("Passed value for field obj.version is not the expected type, validation failed.")
      obj.created_at&.is_a?(String) != false || raise("Passed value for field obj.created_at is not the expected type, validation failed.")
      obj.updated_at&.is_a?(String) != false || raise("Passed value for field obj.updated_at is not the expected type, validation failed.")
      obj.team_member_id.is_a?(String) != false || raise("Passed value for field obj.team_member_id is not the expected type, validation failed.")
      obj.declared_cash_tip_money.nil? || square.rb::Money.validate_raw(obj: obj.declared_cash_tip_money)
    end
  end
end