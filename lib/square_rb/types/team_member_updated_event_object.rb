# frozen_string_literal: true
require_relative "team_member"
require "ostruct"
require "json"

module SquareApiClient
  class TeamMemberUpdatedEventObject
  # @return [SquareApiClient::TeamMember] The updated team member.
    attr_reader :team_member
  # @return [OpenStruct] Additional properties unmapped to the current class definition
    attr_reader :additional_properties
  # @return [Object] 
    attr_reader :_field_set
    protected :_field_set

    OMIT = Object.new

    # @param team_member [SquareApiClient::TeamMember] The updated team member.
    # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
    # @return [SquareApiClient::TeamMemberUpdatedEventObject]
    def initialize(team_member: OMIT, additional_properties: nil)
      @team_member = team_member if team_member != OMIT
      @additional_properties = additional_properties
      @_field_set = { "team_member": team_member }.reject do | _k, v |
  v == OMIT
end
    end
# Deserialize a JSON object to an instance of TeamMemberUpdatedEventObject
    #
    # @param json_object [String] 
    # @return [SquareApiClient::TeamMemberUpdatedEventObject]
    def self.from_json(json_object:)
      struct = JSON.parse(json_object, object_class: OpenStruct)
      parsed_json = JSON.parse(json_object)
      unless parsed_json["team_member"].nil?
        team_member = parsed_json["team_member"].to_json
        team_member = SquareApiClient::TeamMember.from_json(json_object: team_member)
      else
        team_member = nil
      end
      new(team_member: team_member, additional_properties: struct)
    end
# Serialize an instance of TeamMemberUpdatedEventObject to a JSON object
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
    end
  end
end