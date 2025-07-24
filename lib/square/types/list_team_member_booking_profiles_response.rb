# frozen_string_literal: true
require_relative "team_member_booking_profile"
require_relative "error"
require "ostruct"
require "json"

module square.rb
  class ListTeamMemberBookingProfilesResponse
  # @return [Array<square.rb::TeamMemberBookingProfile>] The list of team member booking profiles. The results are returned in the
#  ascending order of the time
#  when the team member booking profiles were last updated. Multiple booking
#  profiles updated at the same time
#  are further sorted in the ascending order of their IDs.
    attr_reader :team_member_booking_profiles
  # @return [String] The pagination cursor to be used in the subsequent request to get the next page
#  of the results. Stop retrieving the next page of the results when the cursor is
#  not set.
    attr_reader :cursor
  # @return [Array<square.rb::Error>] Errors that occurred during the request.
    attr_reader :errors
  # @return [OpenStruct] Additional properties unmapped to the current class definition
    attr_reader :additional_properties
  # @return [Object] 
    attr_reader :_field_set
    protected :_field_set

    OMIT = Object.new

    # @param team_member_booking_profiles [Array<square.rb::TeamMemberBookingProfile>] The list of team member booking profiles. The results are returned in the
#  ascending order of the time
#  when the team member booking profiles were last updated. Multiple booking
#  profiles updated at the same time
#  are further sorted in the ascending order of their IDs.
    # @param cursor [String] The pagination cursor to be used in the subsequent request to get the next page
#  of the results. Stop retrieving the next page of the results when the cursor is
#  not set.
    # @param errors [Array<square.rb::Error>] Errors that occurred during the request.
    # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
    # @return [square.rb::ListTeamMemberBookingProfilesResponse]
    def initialize(team_member_booking_profiles: OMIT, cursor: OMIT, errors: OMIT, additional_properties: nil)
      @team_member_booking_profiles = team_member_booking_profiles if team_member_booking_profiles != OMIT
      @cursor = cursor if cursor != OMIT
      @errors = errors if errors != OMIT
      @additional_properties = additional_properties
      @_field_set = { "team_member_booking_profiles": team_member_booking_profiles, "cursor": cursor, "errors": errors }.reject do | _k, v |
  v == OMIT
end
    end
# Deserialize a JSON object to an instance of
#  ListTeamMemberBookingProfilesResponse
    #
    # @param json_object [String] 
    # @return [square.rb::ListTeamMemberBookingProfilesResponse]
    def self.from_json(json_object:)
      struct = JSON.parse(json_object, object_class: OpenStruct)
      parsed_json = JSON.parse(json_object)
      team_member_booking_profiles = parsed_json["team_member_booking_profiles"]&.map do | item |
  item = item.to_json
  square.rb::TeamMemberBookingProfile.from_json(json_object: item)
end
      cursor = parsed_json["cursor"]
      errors = parsed_json["errors"]&.map do | item |
  item = item.to_json
  square.rb::Error.from_json(json_object: item)
end
      new(
        team_member_booking_profiles: team_member_booking_profiles,
        cursor: cursor,
        errors: errors,
        additional_properties: struct
      )
    end
# Serialize an instance of ListTeamMemberBookingProfilesResponse to a JSON object
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
      obj.team_member_booking_profiles&.is_a?(Array) != false || raise("Passed value for field obj.team_member_booking_profiles is not the expected type, validation failed.")
      obj.cursor&.is_a?(String) != false || raise("Passed value for field obj.cursor is not the expected type, validation failed.")
      obj.errors&.is_a?(Array) != false || raise("Passed value for field obj.errors is not the expected type, validation failed.")
    end
  end
end