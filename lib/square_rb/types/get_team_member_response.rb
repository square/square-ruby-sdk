# frozen_string_literal: true
require_relative "team_member"
require_relative "error"
require "ostruct"
require "json"

module SquareApiClient
# Represents a response from a retrieve request containing a `TeamMember` object
#  or error messages.
  class GetTeamMemberResponse
  # @return [SquareApiClient::TeamMember] The successfully retrieved `TeamMember` object.
    attr_reader :team_member
  # @return [Array<SquareApiClient::Error>] The errors that occurred during the request.
    attr_reader :errors
  # @return [OpenStruct] Additional properties unmapped to the current class definition
    attr_reader :additional_properties
  # @return [Object] 
    attr_reader :_field_set
    protected :_field_set

    OMIT = Object.new

    # @param team_member [SquareApiClient::TeamMember] The successfully retrieved `TeamMember` object.
    # @param errors [Array<SquareApiClient::Error>] The errors that occurred during the request.
    # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
    # @return [SquareApiClient::GetTeamMemberResponse]
    def initialize(team_member: OMIT, errors: OMIT, additional_properties: nil)
      @team_member = team_member if team_member != OMIT
      @errors = errors if errors != OMIT
      @additional_properties = additional_properties
      @_field_set = { "team_member": team_member, "errors": errors }.reject do | _k, v |
  v == OMIT
end
    end
# Deserialize a JSON object to an instance of GetTeamMemberResponse
    #
    # @param json_object [String] 
    # @return [SquareApiClient::GetTeamMemberResponse]
    def self.from_json(json_object:)
      struct = JSON.parse(json_object, object_class: OpenStruct)
      parsed_json = JSON.parse(json_object)
      unless parsed_json["team_member"].nil?
        team_member = parsed_json["team_member"].to_json
        team_member = SquareApiClient::TeamMember.from_json(json_object: team_member)
      else
        team_member = nil
      end
      errors = parsed_json["errors"]&.map do | item |
  item = item.to_json
  SquareApiClient::Error.from_json(json_object: item)
end
      new(
        team_member: team_member,
        errors: errors,
        additional_properties: struct
      )
    end
# Serialize an instance of GetTeamMemberResponse to a JSON object
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
      obj.team_member.nil? || SquareApiClient::TeamMember.validate_raw(obj: obj.team_member)
      obj.errors&.is_a?(Array) != false || raise("Passed value for field obj.errors is not the expected type, validation failed.")
    end
  end
end