# frozen_string_literal: true
require_relative "money"
require "ostruct"
require "json"

module SquareApiClient
# Job and wage information for a [team member](entity:TeamMember).
#  This convenience object provides details needed to specify the `wage`
#  field for a [timecard](entity:Timecard).
  class TeamMemberWage
  # @return [String] The UUID for this object.
    attr_reader :id
  # @return [String] The `TeamMember` that this wage is assigned to.
    attr_reader :team_member_id
  # @return [String] The job title that this wage relates to.
    attr_reader :title
  # @return [SquareApiClient::Money] Can be a custom-set hourly wage or the calculated effective hourly
#  wage based on the annual wage and hours worked per week.
    attr_reader :hourly_rate
  # @return [String] An identifier for the [job](entity:Job) that this wage relates to.
    attr_reader :job_id
  # @return [Boolean] Whether team members are eligible for tips when working this job.
    attr_reader :tip_eligible
  # @return [OpenStruct] Additional properties unmapped to the current class definition
    attr_reader :additional_properties
  # @return [Object] 
    attr_reader :_field_set
    protected :_field_set

    OMIT = Object.new

    # @param id [String] The UUID for this object.
    # @param team_member_id [String] The `TeamMember` that this wage is assigned to.
    # @param title [String] The job title that this wage relates to.
    # @param hourly_rate [SquareApiClient::Money] Can be a custom-set hourly wage or the calculated effective hourly
#  wage based on the annual wage and hours worked per week.
    # @param job_id [String] An identifier for the [job](entity:Job) that this wage relates to.
    # @param tip_eligible [Boolean] Whether team members are eligible for tips when working this job.
    # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
    # @return [SquareApiClient::TeamMemberWage]
    def initialize(id: OMIT, team_member_id: OMIT, title: OMIT, hourly_rate: OMIT, job_id: OMIT, tip_eligible: OMIT, additional_properties: nil)
      @id = id if id != OMIT
      @team_member_id = team_member_id if team_member_id != OMIT
      @title = title if title != OMIT
      @hourly_rate = hourly_rate if hourly_rate != OMIT
      @job_id = job_id if job_id != OMIT
      @tip_eligible = tip_eligible if tip_eligible != OMIT
      @additional_properties = additional_properties
      @_field_set = { "id": id, "team_member_id": team_member_id, "title": title, "hourly_rate": hourly_rate, "job_id": job_id, "tip_eligible": tip_eligible }.reject do | _k, v |
  v == OMIT
end
    end
# Deserialize a JSON object to an instance of TeamMemberWage
    #
    # @param json_object [String] 
    # @return [SquareApiClient::TeamMemberWage]
    def self.from_json(json_object:)
      struct = JSON.parse(json_object, object_class: OpenStruct)
      parsed_json = JSON.parse(json_object)
      id = parsed_json["id"]
      team_member_id = parsed_json["team_member_id"]
      title = parsed_json["title"]
      unless parsed_json["hourly_rate"].nil?
        hourly_rate = parsed_json["hourly_rate"].to_json
        hourly_rate = SquareApiClient::Money.from_json(json_object: hourly_rate)
      else
        hourly_rate = nil
      end
      job_id = parsed_json["job_id"]
      tip_eligible = parsed_json["tip_eligible"]
      new(
        id: id,
        team_member_id: team_member_id,
        title: title,
        hourly_rate: hourly_rate,
        job_id: job_id,
        tip_eligible: tip_eligible,
        additional_properties: struct
      )
    end
# Serialize an instance of TeamMemberWage to a JSON object
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
      obj.team_member_id&.is_a?(String) != false || raise("Passed value for field obj.team_member_id is not the expected type, validation failed.")
      obj.title&.is_a?(String) != false || raise("Passed value for field obj.title is not the expected type, validation failed.")
      obj.hourly_rate.nil? || SquareApiClient::Money.validate_raw(obj: obj.hourly_rate)
      obj.job_id&.is_a?(String) != false || raise("Passed value for field obj.job_id is not the expected type, validation failed.")
      obj.tip_eligible&.is_a?(Boolean) != false || raise("Passed value for field obj.tip_eligible is not the expected type, validation failed.")
    end
  end
end