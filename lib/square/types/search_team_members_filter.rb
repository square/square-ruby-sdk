# frozen_string_literal: true
require_relative "team_member_status"
require "ostruct"
require "json"

module SquareApiClient
# Represents a filter used in a search for `TeamMember` objects. `AND` logic is
#  applied
#  between the individual fields, and `OR` logic is applied within list-based
#  fields.
#  For example, setting this filter value:
#  ```
#  filter = (locations_ids = ["A", "B"], status = ACTIVE)
#  ```
#  returns only active team members assigned to either location "A" or "B".
  class SearchTeamMembersFilter
  # @return [Array<String>] When present, filters by team members assigned to the specified locations.
#  When empty, includes team members assigned to any location.
    attr_reader :location_ids
  # @return [SquareApiClient::TeamMemberStatus] When present, filters by team members who match the given status.
#  When empty, includes team members of all statuses.
#  See [TeamMemberStatus](#type-teammemberstatus) for possible values
    attr_reader :status
  # @return [Boolean] When present and set to true, returns the team member who is the owner of the
#  Square account.
    attr_reader :is_owner
  # @return [OpenStruct] Additional properties unmapped to the current class definition
    attr_reader :additional_properties
  # @return [Object] 
    attr_reader :_field_set
    protected :_field_set

    OMIT = Object.new

    # @param location_ids [Array<String>] When present, filters by team members assigned to the specified locations.
#  When empty, includes team members assigned to any location.
    # @param status [SquareApiClient::TeamMemberStatus] When present, filters by team members who match the given status.
#  When empty, includes team members of all statuses.
#  See [TeamMemberStatus](#type-teammemberstatus) for possible values
    # @param is_owner [Boolean] When present and set to true, returns the team member who is the owner of the
#  Square account.
    # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
    # @return [SquareApiClient::SearchTeamMembersFilter]
    def initialize(location_ids: OMIT, status: OMIT, is_owner: OMIT, additional_properties: nil)
      @location_ids = location_ids if location_ids != OMIT
      @status = status if status != OMIT
      @is_owner = is_owner if is_owner != OMIT
      @additional_properties = additional_properties
      @_field_set = { "location_ids": location_ids, "status": status, "is_owner": is_owner }.reject do | _k, v |
  v == OMIT
end
    end
# Deserialize a JSON object to an instance of SearchTeamMembersFilter
    #
    # @param json_object [String] 
    # @return [SquareApiClient::SearchTeamMembersFilter]
    def self.from_json(json_object:)
      struct = JSON.parse(json_object, object_class: OpenStruct)
      parsed_json = JSON.parse(json_object)
      location_ids = parsed_json["location_ids"]
      status = parsed_json["status"]
      is_owner = parsed_json["is_owner"]
      new(
        location_ids: location_ids,
        status: status,
        is_owner: is_owner,
        additional_properties: struct
      )
    end
# Serialize an instance of SearchTeamMembersFilter to a JSON object
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
      obj.location_ids&.is_a?(Array) != false || raise("Passed value for field obj.location_ids is not the expected type, validation failed.")
      obj.status&.is_a?(SquareApiClient::TeamMemberStatus) != false || raise("Passed value for field obj.status is not the expected type, validation failed.")
      obj.is_owner&.is_a?(Boolean) != false || raise("Passed value for field obj.is_owner is not the expected type, validation failed.")
    end
  end
end