# frozen_string_literal: true
require "ostruct"
require "json"

module SquareApiClient
# Defines an appointment segment of a booking.
  class AppointmentSegment
  # @return [Integer] The time span in minutes of an appointment segment.
    attr_reader :duration_minutes
  # @return [String] The ID of the [CatalogItemVariation](entity:CatalogItemVariation) object
#  representing the service booked in this segment.
    attr_reader :service_variation_id
  # @return [String] The ID of the [TeamMember](entity:TeamMember) object representing the team
#  member booked in this segment.
    attr_reader :team_member_id
  # @return [Long] The current version of the item variation representing the service booked in
#  this segment.
    attr_reader :service_variation_version
  # @return [Integer] Time between the end of this segment and the beginning of the subsequent
#  segment.
    attr_reader :intermission_minutes
  # @return [Boolean] Whether the customer accepts any team member, instead of a specific one, to
#  serve this segment.
    attr_reader :any_team_member
  # @return [Array<String>] The IDs of the seller-accessible resources used for this appointment segment.
    attr_reader :resource_ids
  # @return [OpenStruct] Additional properties unmapped to the current class definition
    attr_reader :additional_properties
  # @return [Object] 
    attr_reader :_field_set
    protected :_field_set

    OMIT = Object.new

    # @param duration_minutes [Integer] The time span in minutes of an appointment segment.
    # @param service_variation_id [String] The ID of the [CatalogItemVariation](entity:CatalogItemVariation) object
#  representing the service booked in this segment.
    # @param team_member_id [String] The ID of the [TeamMember](entity:TeamMember) object representing the team
#  member booked in this segment.
    # @param service_variation_version [Long] The current version of the item variation representing the service booked in
#  this segment.
    # @param intermission_minutes [Integer] Time between the end of this segment and the beginning of the subsequent
#  segment.
    # @param any_team_member [Boolean] Whether the customer accepts any team member, instead of a specific one, to
#  serve this segment.
    # @param resource_ids [Array<String>] The IDs of the seller-accessible resources used for this appointment segment.
    # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
    # @return [SquareApiClient::AppointmentSegment]
    def initialize(duration_minutes: OMIT, service_variation_id: OMIT, team_member_id:, service_variation_version: OMIT, intermission_minutes: OMIT, any_team_member: OMIT, resource_ids: OMIT, additional_properties: nil)
      @duration_minutes = duration_minutes if duration_minutes != OMIT
      @service_variation_id = service_variation_id if service_variation_id != OMIT
      @team_member_id = team_member_id
      @service_variation_version = service_variation_version if service_variation_version != OMIT
      @intermission_minutes = intermission_minutes if intermission_minutes != OMIT
      @any_team_member = any_team_member if any_team_member != OMIT
      @resource_ids = resource_ids if resource_ids != OMIT
      @additional_properties = additional_properties
      @_field_set = { "duration_minutes": duration_minutes, "service_variation_id": service_variation_id, "team_member_id": team_member_id, "service_variation_version": service_variation_version, "intermission_minutes": intermission_minutes, "any_team_member": any_team_member, "resource_ids": resource_ids }.reject do | _k, v |
  v == OMIT
end
    end
# Deserialize a JSON object to an instance of AppointmentSegment
    #
    # @param json_object [String] 
    # @return [SquareApiClient::AppointmentSegment]
    def self.from_json(json_object:)
      struct = JSON.parse(json_object, object_class: OpenStruct)
      parsed_json = JSON.parse(json_object)
      duration_minutes = parsed_json["duration_minutes"]
      service_variation_id = parsed_json["service_variation_id"]
      team_member_id = parsed_json["team_member_id"]
      service_variation_version = parsed_json["service_variation_version"]
      intermission_minutes = parsed_json["intermission_minutes"]
      any_team_member = parsed_json["any_team_member"]
      resource_ids = parsed_json["resource_ids"]
      new(
        duration_minutes: duration_minutes,
        service_variation_id: service_variation_id,
        team_member_id: team_member_id,
        service_variation_version: service_variation_version,
        intermission_minutes: intermission_minutes,
        any_team_member: any_team_member,
        resource_ids: resource_ids,
        additional_properties: struct
      )
    end
# Serialize an instance of AppointmentSegment to a JSON object
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
      obj.duration_minutes&.is_a?(Integer) != false || raise("Passed value for field obj.duration_minutes is not the expected type, validation failed.")
      obj.service_variation_id&.is_a?(String) != false || raise("Passed value for field obj.service_variation_id is not the expected type, validation failed.")
      obj.team_member_id.is_a?(String) != false || raise("Passed value for field obj.team_member_id is not the expected type, validation failed.")
      obj.service_variation_version&.is_a?(Long) != false || raise("Passed value for field obj.service_variation_version is not the expected type, validation failed.")
      obj.intermission_minutes&.is_a?(Integer) != false || raise("Passed value for field obj.intermission_minutes is not the expected type, validation failed.")
      obj.any_team_member&.is_a?(Boolean) != false || raise("Passed value for field obj.any_team_member is not the expected type, validation failed.")
      obj.resource_ids&.is_a?(Array) != false || raise("Passed value for field obj.resource_ids is not the expected type, validation failed.")
    end
  end
end