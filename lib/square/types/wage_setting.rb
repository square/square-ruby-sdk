# frozen_string_literal: true
require_relative "job_assignment"
require "ostruct"
require "json"

module square.rb
# Represents information about the overtime exemption status, job assignments, and
#  compensation
#  for a [team member](entity:TeamMember).
  class WageSetting
  # @return [String] The ID of the team member associated with the wage setting.
    attr_reader :team_member_id
  # @return [Array<square.rb::JobAssignment>] **Required** The ordered list of jobs that the team member is assigned to.
#  The first job assignment is considered the team member's primary job.
    attr_reader :job_assignments
  # @return [Boolean] Whether the team member is exempt from the overtime rules of the seller's
#  country.
    attr_reader :is_overtime_exempt
  # @return [Integer] **Read only** Used for resolving concurrency issues. The request fails if the
#  version
#  provided does not match the server version at the time of the request. If not
#  provided,
#  Square executes a blind write, potentially overwriting data from another write.
#  For more information,
#  see [optimistic
#  ](https://developer.squareup.com/docs/working-with-apis/optimistic-concurrency).
    attr_reader :version
  # @return [String] The timestamp when the wage setting was created, in RFC 3339 format.
    attr_reader :created_at
  # @return [String] The timestamp when the wage setting was last updated, in RFC 3339 format.
    attr_reader :updated_at
  # @return [OpenStruct] Additional properties unmapped to the current class definition
    attr_reader :additional_properties
  # @return [Object] 
    attr_reader :_field_set
    protected :_field_set

    OMIT = Object.new

    # @param team_member_id [String] The ID of the team member associated with the wage setting.
    # @param job_assignments [Array<square.rb::JobAssignment>] **Required** The ordered list of jobs that the team member is assigned to.
#  The first job assignment is considered the team member's primary job.
    # @param is_overtime_exempt [Boolean] Whether the team member is exempt from the overtime rules of the seller's
#  country.
    # @param version [Integer] **Read only** Used for resolving concurrency issues. The request fails if the
#  version
#  provided does not match the server version at the time of the request. If not
#  provided,
#  Square executes a blind write, potentially overwriting data from another write.
#  For more information,
#  see [optimistic
#  ](https://developer.squareup.com/docs/working-with-apis/optimistic-concurrency).
    # @param created_at [String] The timestamp when the wage setting was created, in RFC 3339 format.
    # @param updated_at [String] The timestamp when the wage setting was last updated, in RFC 3339 format.
    # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
    # @return [square.rb::WageSetting]
    def initialize(team_member_id: OMIT, job_assignments: OMIT, is_overtime_exempt: OMIT, version: OMIT, created_at: OMIT, updated_at: OMIT, additional_properties: nil)
      @team_member_id = team_member_id if team_member_id != OMIT
      @job_assignments = job_assignments if job_assignments != OMIT
      @is_overtime_exempt = is_overtime_exempt if is_overtime_exempt != OMIT
      @version = version if version != OMIT
      @created_at = created_at if created_at != OMIT
      @updated_at = updated_at if updated_at != OMIT
      @additional_properties = additional_properties
      @_field_set = { "team_member_id": team_member_id, "job_assignments": job_assignments, "is_overtime_exempt": is_overtime_exempt, "version": version, "created_at": created_at, "updated_at": updated_at }.reject do | _k, v |
  v == OMIT
end
    end
# Deserialize a JSON object to an instance of WageSetting
    #
    # @param json_object [String] 
    # @return [square.rb::WageSetting]
    def self.from_json(json_object:)
      struct = JSON.parse(json_object, object_class: OpenStruct)
      parsed_json = JSON.parse(json_object)
      team_member_id = parsed_json["team_member_id"]
      job_assignments = parsed_json["job_assignments"]&.map do | item |
  item = item.to_json
  square.rb::JobAssignment.from_json(json_object: item)
end
      is_overtime_exempt = parsed_json["is_overtime_exempt"]
      version = parsed_json["version"]
      created_at = parsed_json["created_at"]
      updated_at = parsed_json["updated_at"]
      new(
        team_member_id: team_member_id,
        job_assignments: job_assignments,
        is_overtime_exempt: is_overtime_exempt,
        version: version,
        created_at: created_at,
        updated_at: updated_at,
        additional_properties: struct
      )
    end
# Serialize an instance of WageSetting to a JSON object
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
      obj.job_assignments&.is_a?(Array) != false || raise("Passed value for field obj.job_assignments is not the expected type, validation failed.")
      obj.is_overtime_exempt&.is_a?(Boolean) != false || raise("Passed value for field obj.is_overtime_exempt is not the expected type, validation failed.")
      obj.version&.is_a?(Integer) != false || raise("Passed value for field obj.version is not the expected type, validation failed.")
      obj.created_at&.is_a?(String) != false || raise("Passed value for field obj.created_at is not the expected type, validation failed.")
      obj.updated_at&.is_a?(String) != false || raise("Passed value for field obj.updated_at is not the expected type, validation failed.")
    end
  end
end