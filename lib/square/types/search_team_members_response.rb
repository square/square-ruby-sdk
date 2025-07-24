# frozen_string_literal: true
require_relative "team_member"
require_relative "error"
require "ostruct"
require "json"

module square.rb
# Represents a response from a search request containing a filtered list of
#  `TeamMember` objects.
  class SearchTeamMembersResponse
  # @return [Array<square.rb::TeamMember>] The filtered list of `TeamMember` objects.
    attr_reader :team_members
  # @return [String] The opaque cursor for fetching the next page. For more information, see
#  [pagination](https://developer.squareup.com/docs/working-with-apis/pagination).
    attr_reader :cursor
  # @return [Array<square.rb::Error>] The errors that occurred during the request.
    attr_reader :errors
  # @return [OpenStruct] Additional properties unmapped to the current class definition
    attr_reader :additional_properties
  # @return [Object] 
    attr_reader :_field_set
    protected :_field_set

    OMIT = Object.new

    # @param team_members [Array<square.rb::TeamMember>] The filtered list of `TeamMember` objects.
    # @param cursor [String] The opaque cursor for fetching the next page. For more information, see
#  [pagination](https://developer.squareup.com/docs/working-with-apis/pagination).
    # @param errors [Array<square.rb::Error>] The errors that occurred during the request.
    # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
    # @return [square.rb::SearchTeamMembersResponse]
    def initialize(team_members: OMIT, cursor: OMIT, errors: OMIT, additional_properties: nil)
      @team_members = team_members if team_members != OMIT
      @cursor = cursor if cursor != OMIT
      @errors = errors if errors != OMIT
      @additional_properties = additional_properties
      @_field_set = { "team_members": team_members, "cursor": cursor, "errors": errors }.reject do | _k, v |
  v == OMIT
end
    end
# Deserialize a JSON object to an instance of SearchTeamMembersResponse
    #
    # @param json_object [String] 
    # @return [square.rb::SearchTeamMembersResponse]
    def self.from_json(json_object:)
      struct = JSON.parse(json_object, object_class: OpenStruct)
      parsed_json = JSON.parse(json_object)
      team_members = parsed_json["team_members"]&.map do | item |
  item = item.to_json
  square.rb::TeamMember.from_json(json_object: item)
end
      cursor = parsed_json["cursor"]
      errors = parsed_json["errors"]&.map do | item |
  item = item.to_json
  square.rb::Error.from_json(json_object: item)
end
      new(
        team_members: team_members,
        cursor: cursor,
        errors: errors,
        additional_properties: struct
      )
    end
# Serialize an instance of SearchTeamMembersResponse to a JSON object
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
      obj.team_members&.is_a?(Array) != false || raise("Passed value for field obj.team_members is not the expected type, validation failed.")
      obj.cursor&.is_a?(String) != false || raise("Passed value for field obj.cursor is not the expected type, validation failed.")
      obj.errors&.is_a?(Array) != false || raise("Passed value for field obj.errors is not the expected type, validation failed.")
    end
  end
end