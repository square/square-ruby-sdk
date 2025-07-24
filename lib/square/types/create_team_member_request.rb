# frozen_string_literal: true
require_relative "team_member"
require "ostruct"
require "json"

module square.rb
# Represents a create request for a `TeamMember` object.
  class CreateTeamMemberRequest
  # @return [String] A unique string that identifies this `CreateTeamMember` request.
#  Keys can be any valid string, but must be unique for every request.
#  For more information, see
#  tps://developer.squareup.com/docs/build-basics/common-api-patterns/idempotency).
#  The minimum length is 1 and the maximum length is 45.
    attr_reader :idempotency_key
  # @return [square.rb::TeamMember] **Required** The data used to create the `TeamMember` object. If you include
#  `wage_setting`, you must provide
#  `job_id` for each job assignment. To get job IDs, call
#  [ListJobs](api-endpoint:Team-ListJobs).
    attr_reader :team_member
  # @return [OpenStruct] Additional properties unmapped to the current class definition
    attr_reader :additional_properties
  # @return [Object] 
    attr_reader :_field_set
    protected :_field_set

    OMIT = Object.new

    # @param idempotency_key [String] A unique string that identifies this `CreateTeamMember` request.
#  Keys can be any valid string, but must be unique for every request.
#  For more information, see
#  tps://developer.squareup.com/docs/build-basics/common-api-patterns/idempotency).
#  The minimum length is 1 and the maximum length is 45.
    # @param team_member [square.rb::TeamMember] **Required** The data used to create the `TeamMember` object. If you include
#  `wage_setting`, you must provide
#  `job_id` for each job assignment. To get job IDs, call
#  [ListJobs](api-endpoint:Team-ListJobs).
    # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
    # @return [square.rb::CreateTeamMemberRequest]
    def initialize(idempotency_key: OMIT, team_member: OMIT, additional_properties: nil)
      @idempotency_key = idempotency_key if idempotency_key != OMIT
      @team_member = team_member if team_member != OMIT
      @additional_properties = additional_properties
      @_field_set = { "idempotency_key": idempotency_key, "team_member": team_member }.reject do | _k, v |
  v == OMIT
end
    end
# Deserialize a JSON object to an instance of CreateTeamMemberRequest
    #
    # @param json_object [String] 
    # @return [square.rb::CreateTeamMemberRequest]
    def self.from_json(json_object:)
      struct = JSON.parse(json_object, object_class: OpenStruct)
      parsed_json = JSON.parse(json_object)
      idempotency_key = parsed_json["idempotency_key"]
      unless parsed_json["team_member"].nil?
        team_member = parsed_json["team_member"].to_json
        team_member = square.rb::TeamMember.from_json(json_object: team_member)
      else
        team_member = nil
      end
      new(
        idempotency_key: idempotency_key,
        team_member: team_member,
        additional_properties: struct
      )
    end
# Serialize an instance of CreateTeamMemberRequest to a JSON object
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
      obj.idempotency_key&.is_a?(String) != false || raise("Passed value for field obj.idempotency_key is not the expected type, validation failed.")
      obj.team_member.nil? || square.rb::TeamMember.validate_raw(obj: obj.team_member)
    end
  end
end