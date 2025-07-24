# frozen_string_literal: true
require_relative "team_member_wage"
require_relative "error"
require "ostruct"
require "json"

module SquareApiClient
# The response to a request for a set of `TeamMemberWage` objects. The response
#  contains
#  a set of `TeamMemberWage` objects.
  class ListTeamMemberWagesResponse
  # @return [Array<SquareApiClient::TeamMemberWage>] A page of `TeamMemberWage` results.
    attr_reader :team_member_wages
  # @return [String] The value supplied in the subsequent request to fetch the next page
#  of `TeamMemberWage` results.
    attr_reader :cursor
  # @return [Array<SquareApiClient::Error>] Any errors that occurred during the request.
    attr_reader :errors
  # @return [OpenStruct] Additional properties unmapped to the current class definition
    attr_reader :additional_properties
  # @return [Object] 
    attr_reader :_field_set
    protected :_field_set

    OMIT = Object.new

    # @param team_member_wages [Array<SquareApiClient::TeamMemberWage>] A page of `TeamMemberWage` results.
    # @param cursor [String] The value supplied in the subsequent request to fetch the next page
#  of `TeamMemberWage` results.
    # @param errors [Array<SquareApiClient::Error>] Any errors that occurred during the request.
    # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
    # @return [SquareApiClient::ListTeamMemberWagesResponse]
    def initialize(team_member_wages: OMIT, cursor: OMIT, errors: OMIT, additional_properties: nil)
      @team_member_wages = team_member_wages if team_member_wages != OMIT
      @cursor = cursor if cursor != OMIT
      @errors = errors if errors != OMIT
      @additional_properties = additional_properties
      @_field_set = { "team_member_wages": team_member_wages, "cursor": cursor, "errors": errors }.reject do | _k, v |
  v == OMIT
end
    end
# Deserialize a JSON object to an instance of ListTeamMemberWagesResponse
    #
    # @param json_object [String] 
    # @return [SquareApiClient::ListTeamMemberWagesResponse]
    def self.from_json(json_object:)
      struct = JSON.parse(json_object, object_class: OpenStruct)
      parsed_json = JSON.parse(json_object)
      team_member_wages = parsed_json["team_member_wages"]&.map do | item |
  item = item.to_json
  SquareApiClient::TeamMemberWage.from_json(json_object: item)
end
      cursor = parsed_json["cursor"]
      errors = parsed_json["errors"]&.map do | item |
  item = item.to_json
  SquareApiClient::Error.from_json(json_object: item)
end
      new(
        team_member_wages: team_member_wages,
        cursor: cursor,
        errors: errors,
        additional_properties: struct
      )
    end
# Serialize an instance of ListTeamMemberWagesResponse to a JSON object
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
      obj.team_member_wages&.is_a?(Array) != false || raise("Passed value for field obj.team_member_wages is not the expected type, validation failed.")
      obj.cursor&.is_a?(String) != false || raise("Passed value for field obj.cursor is not the expected type, validation failed.")
      obj.errors&.is_a?(Array) != false || raise("Passed value for field obj.errors is not the expected type, validation failed.")
    end
  end
end