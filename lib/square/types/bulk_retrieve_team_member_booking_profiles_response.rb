# frozen_string_literal: true
require_relative "error"
require "ostruct"
require "json"

module square.rb
# Response payload for the
#  berBookingProfiles](api-endpoint:Bookings-BulkRetrieveTeamMemberBookingProfiles)
#  endpoint.
  class BulkRetrieveTeamMemberBookingProfilesResponse
  # @return [Hash{String => square.rb::GetTeamMemberBookingProfileResponse}] The returned team members' booking profiles, as a map with `team_member_id` as
#  the key and [TeamMemberBookingProfile](entity:TeamMemberBookingProfile) the
#  value.
    attr_reader :team_member_booking_profiles
  # @return [Array<square.rb::Error>] Errors that occurred during the request.
    attr_reader :errors
  # @return [OpenStruct] Additional properties unmapped to the current class definition
    attr_reader :additional_properties
  # @return [Object] 
    attr_reader :_field_set
    protected :_field_set

    OMIT = Object.new

    # @param team_member_booking_profiles [Hash{String => square.rb::GetTeamMemberBookingProfileResponse}] The returned team members' booking profiles, as a map with `team_member_id` as
#  the key and [TeamMemberBookingProfile](entity:TeamMemberBookingProfile) the
#  value.
    # @param errors [Array<square.rb::Error>] Errors that occurred during the request.
    # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
    # @return [square.rb::BulkRetrieveTeamMemberBookingProfilesResponse]
    def initialize(team_member_booking_profiles: OMIT, errors: OMIT, additional_properties: nil)
      @team_member_booking_profiles = team_member_booking_profiles if team_member_booking_profiles != OMIT
      @errors = errors if errors != OMIT
      @additional_properties = additional_properties
      @_field_set = { "team_member_booking_profiles": team_member_booking_profiles, "errors": errors }.reject do | _k, v |
  v == OMIT
end
    end
# Deserialize a JSON object to an instance of
#  BulkRetrieveTeamMemberBookingProfilesResponse
    #
    # @param json_object [String] 
    # @return [square.rb::BulkRetrieveTeamMemberBookingProfilesResponse]
    def self.from_json(json_object:)
      struct = JSON.parse(json_object, object_class: OpenStruct)
      parsed_json = JSON.parse(json_object)
      team_member_booking_profiles = parsed_json["team_member_booking_profiles"]&.transform_values do | value |
  value = value.to_json
  square.rb::GetTeamMemberBookingProfileResponse.from_json(json_object: value)
end
      errors = parsed_json["errors"]&.map do | item |
  item = item.to_json
  square.rb::Error.from_json(json_object: item)
end
      new(
        team_member_booking_profiles: team_member_booking_profiles,
        errors: errors,
        additional_properties: struct
      )
    end
# Serialize an instance of BulkRetrieveTeamMemberBookingProfilesResponse to a JSON
#  object
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
      obj.team_member_booking_profiles&.is_a?(Hash) != false || raise("Passed value for field obj.team_member_booking_profiles is not the expected type, validation failed.")
      obj.errors&.is_a?(Array) != false || raise("Passed value for field obj.errors is not the expected type, validation failed.")
    end
  end
end