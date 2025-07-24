# frozen_string_literal: true
require_relative "team_member_assigned_locations_assignment_type"
require "ostruct"
require "json"

module square.rb
# An object that represents a team member's assignment to locations.
  class TeamMemberAssignedLocations
  # @return [square.rb::TeamMemberAssignedLocationsAssignmentType] The current assignment type of the team member.
#  See
#  ssignedLocationsAssignmentType](#type-teammemberassignedlocationsassignmenttype)
#  for possible values
    attr_reader :assignment_type
  # @return [Array<String>] The explicit locations that the team member is assigned to.
    attr_reader :location_ids
  # @return [OpenStruct] Additional properties unmapped to the current class definition
    attr_reader :additional_properties
  # @return [Object] 
    attr_reader :_field_set
    protected :_field_set

    OMIT = Object.new

    # @param assignment_type [square.rb::TeamMemberAssignedLocationsAssignmentType] The current assignment type of the team member.
#  See
#  ssignedLocationsAssignmentType](#type-teammemberassignedlocationsassignmenttype)
#  for possible values
    # @param location_ids [Array<String>] The explicit locations that the team member is assigned to.
    # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
    # @return [square.rb::TeamMemberAssignedLocations]
    def initialize(assignment_type: OMIT, location_ids: OMIT, additional_properties: nil)
      @assignment_type = assignment_type if assignment_type != OMIT
      @location_ids = location_ids if location_ids != OMIT
      @additional_properties = additional_properties
      @_field_set = { "assignment_type": assignment_type, "location_ids": location_ids }.reject do | _k, v |
  v == OMIT
end
    end
# Deserialize a JSON object to an instance of TeamMemberAssignedLocations
    #
    # @param json_object [String] 
    # @return [square.rb::TeamMemberAssignedLocations]
    def self.from_json(json_object:)
      struct = JSON.parse(json_object, object_class: OpenStruct)
      parsed_json = JSON.parse(json_object)
      assignment_type = parsed_json["assignment_type"]
      location_ids = parsed_json["location_ids"]
      new(
        assignment_type: assignment_type,
        location_ids: location_ids,
        additional_properties: struct
      )
    end
# Serialize an instance of TeamMemberAssignedLocations to a JSON object
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
      obj.assignment_type&.is_a?(square.rb::TeamMemberAssignedLocationsAssignmentType) != false || raise("Passed value for field obj.assignment_type is not the expected type, validation failed.")
      obj.location_ids&.is_a?(Array) != false || raise("Passed value for field obj.location_ids is not the expected type, validation failed.")
    end
  end
end