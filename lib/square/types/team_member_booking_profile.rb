# frozen_string_literal: true
require "ostruct"
require "json"

module SquareApiClient
# The booking profile of a seller's team member, including the team member's ID,
#  display name, description and whether the team member can be booked as a service
#  provider.
  class TeamMemberBookingProfile
  # @return [String] The ID of the [TeamMember](entity:TeamMember) object for the team member
#  associated with the booking profile.
    attr_reader :team_member_id
  # @return [String] The description of the team member.
    attr_reader :description
  # @return [String] The display name of the team member.
    attr_reader :display_name
  # @return [Boolean] Indicates whether the team member can be booked through the Bookings API or the
#  seller's online booking channel or site (`true`) or not (`false`).
    attr_reader :is_bookable
  # @return [String] The URL of the team member's image for the bookings profile.
    attr_reader :profile_image_url
  # @return [OpenStruct] Additional properties unmapped to the current class definition
    attr_reader :additional_properties
  # @return [Object] 
    attr_reader :_field_set
    protected :_field_set

    OMIT = Object.new

    # @param team_member_id [String] The ID of the [TeamMember](entity:TeamMember) object for the team member
#  associated with the booking profile.
    # @param description [String] The description of the team member.
    # @param display_name [String] The display name of the team member.
    # @param is_bookable [Boolean] Indicates whether the team member can be booked through the Bookings API or the
#  seller's online booking channel or site (`true`) or not (`false`).
    # @param profile_image_url [String] The URL of the team member's image for the bookings profile.
    # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
    # @return [SquareApiClient::TeamMemberBookingProfile]
    def initialize(team_member_id: OMIT, description: OMIT, display_name: OMIT, is_bookable: OMIT, profile_image_url: OMIT, additional_properties: nil)
      @team_member_id = team_member_id if team_member_id != OMIT
      @description = description if description != OMIT
      @display_name = display_name if display_name != OMIT
      @is_bookable = is_bookable if is_bookable != OMIT
      @profile_image_url = profile_image_url if profile_image_url != OMIT
      @additional_properties = additional_properties
      @_field_set = { "team_member_id": team_member_id, "description": description, "display_name": display_name, "is_bookable": is_bookable, "profile_image_url": profile_image_url }.reject do | _k, v |
  v == OMIT
end
    end
# Deserialize a JSON object to an instance of TeamMemberBookingProfile
    #
    # @param json_object [String] 
    # @return [SquareApiClient::TeamMemberBookingProfile]
    def self.from_json(json_object:)
      struct = JSON.parse(json_object, object_class: OpenStruct)
      parsed_json = JSON.parse(json_object)
      team_member_id = parsed_json["team_member_id"]
      description = parsed_json["description"]
      display_name = parsed_json["display_name"]
      is_bookable = parsed_json["is_bookable"]
      profile_image_url = parsed_json["profile_image_url"]
      new(
        team_member_id: team_member_id,
        description: description,
        display_name: display_name,
        is_bookable: is_bookable,
        profile_image_url: profile_image_url,
        additional_properties: struct
      )
    end
# Serialize an instance of TeamMemberBookingProfile to a JSON object
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
      obj.description&.is_a?(String) != false || raise("Passed value for field obj.description is not the expected type, validation failed.")
      obj.display_name&.is_a?(String) != false || raise("Passed value for field obj.display_name is not the expected type, validation failed.")
      obj.is_bookable&.is_a?(Boolean) != false || raise("Passed value for field obj.is_bookable is not the expected type, validation failed.")
      obj.profile_image_url&.is_a?(String) != false || raise("Passed value for field obj.profile_image_url is not the expected type, validation failed.")
    end
  end
end