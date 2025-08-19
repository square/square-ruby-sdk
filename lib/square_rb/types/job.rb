# frozen_string_literal: true
require "ostruct"
require "json"

module SquareApiClient
# Represents a job that can be assigned to [team members](entity:TeamMember). This
#  object defines the
#  job's title and tip eligibility. Compensation is defined in a [job
#  assignment](entity:JobAssignment)
#  in a team member's wage setting.
  class Job
  # @return [String] **Read only** The unique Square-assigned ID of the job. If you need a job ID for
#  an API request,
#  call [ListJobs](api-endpoint:Team-ListJobs) or use the ID returned when you
#  created the job.
#  You can also get job IDs from a team member's wage setting.
    attr_reader :id
  # @return [String] The title of the job.
    attr_reader :title
  # @return [Boolean] Indicates whether team members can earn tips for the job.
    attr_reader :is_tip_eligible
  # @return [String] The timestamp when the job was created, in RFC 3339 format.
    attr_reader :created_at
  # @return [String] The timestamp when the job was last updated, in RFC 3339 format.
    attr_reader :updated_at
  # @return [Integer] **Read only** The current version of the job. Include this field in `UpdateJob`
#  requests to enable
#  [optimistic
#  y](https://developer.squareup.com/docs/working-with-apis/optimistic-concurrency)
#  control and avoid overwrites from concurrent requests. Requests fail if the
#  provided version doesn't
#  match the server version at the time of the request.
    attr_reader :version
  # @return [OpenStruct] Additional properties unmapped to the current class definition
    attr_reader :additional_properties
  # @return [Object] 
    attr_reader :_field_set
    protected :_field_set

    OMIT = Object.new

    # @param id [String] **Read only** The unique Square-assigned ID of the job. If you need a job ID for
#  an API request,
#  call [ListJobs](api-endpoint:Team-ListJobs) or use the ID returned when you
#  created the job.
#  You can also get job IDs from a team member's wage setting.
    # @param title [String] The title of the job.
    # @param is_tip_eligible [Boolean] Indicates whether team members can earn tips for the job.
    # @param created_at [String] The timestamp when the job was created, in RFC 3339 format.
    # @param updated_at [String] The timestamp when the job was last updated, in RFC 3339 format.
    # @param version [Integer] **Read only** The current version of the job. Include this field in `UpdateJob`
#  requests to enable
#  [optimistic
#  y](https://developer.squareup.com/docs/working-with-apis/optimistic-concurrency)
#  control and avoid overwrites from concurrent requests. Requests fail if the
#  provided version doesn't
#  match the server version at the time of the request.
    # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
    # @return [SquareApiClient::Job]
    def initialize(id: OMIT, title: OMIT, is_tip_eligible: OMIT, created_at: OMIT, updated_at: OMIT, version: OMIT, additional_properties: nil)
      @id = id if id != OMIT
      @title = title if title != OMIT
      @is_tip_eligible = is_tip_eligible if is_tip_eligible != OMIT
      @created_at = created_at if created_at != OMIT
      @updated_at = updated_at if updated_at != OMIT
      @version = version if version != OMIT
      @additional_properties = additional_properties
      @_field_set = { "id": id, "title": title, "is_tip_eligible": is_tip_eligible, "created_at": created_at, "updated_at": updated_at, "version": version }.reject do | _k, v |
  v == OMIT
end
    end
# Deserialize a JSON object to an instance of Job
    #
    # @param json_object [String] 
    # @return [SquareApiClient::Job]
    def self.from_json(json_object:)
      struct = JSON.parse(json_object, object_class: OpenStruct)
      parsed_json = JSON.parse(json_object)
      id = parsed_json["id"]
      title = parsed_json["title"]
      is_tip_eligible = parsed_json["is_tip_eligible"]
      created_at = parsed_json["created_at"]
      updated_at = parsed_json["updated_at"]
      version = parsed_json["version"]
      new(
        id: id,
        title: title,
        is_tip_eligible: is_tip_eligible,
        created_at: created_at,
        updated_at: updated_at,
        version: version,
        additional_properties: struct
      )
    end
# Serialize an instance of Job to a JSON object
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
      obj.title&.is_a?(String) != false || raise("Passed value for field obj.title is not the expected type, validation failed.")
      obj.is_tip_eligible&.is_a?(Boolean) != false || raise("Passed value for field obj.is_tip_eligible is not the expected type, validation failed.")
      obj.created_at&.is_a?(String) != false || raise("Passed value for field obj.created_at is not the expected type, validation failed.")
      obj.updated_at&.is_a?(String) != false || raise("Passed value for field obj.updated_at is not the expected type, validation failed.")
      obj.version&.is_a?(Integer) != false || raise("Passed value for field obj.version is not the expected type, validation failed.")
    end
  end
end