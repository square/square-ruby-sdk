# frozen_string_literal: true
require_relative "filter_value"
require "ostruct"
require "json"

module square.rb
# A query filter to search for buyer-accessible appointment segments by.
  class SegmentFilter
  # @return [String] The ID of the [CatalogItemVariation](entity:CatalogItemVariation) object
#  representing the service booked in this segment.
    attr_reader :service_variation_id
  # @return [square.rb::FilterValue] A query filter to search for buyer-accessible appointment segments with
#  service-providing team members matching the specified list of team member IDs.
#  Supported query expressions are
#  - `ANY`: return the appointment segments with team members whose IDs match any
#  member in this list.
#  - `NONE`: return the appointment segments with team members whose IDs are not in
#  this list.
#  - `ALL`: not supported.
#  When no expression is specified, any service-providing team member is eligible
#  to fulfill the Booking.
    attr_reader :team_member_id_filter
  # @return [OpenStruct] Additional properties unmapped to the current class definition
    attr_reader :additional_properties
  # @return [Object] 
    attr_reader :_field_set
    protected :_field_set

    OMIT = Object.new

    # @param service_variation_id [String] The ID of the [CatalogItemVariation](entity:CatalogItemVariation) object
#  representing the service booked in this segment.
    # @param team_member_id_filter [square.rb::FilterValue] A query filter to search for buyer-accessible appointment segments with
#  service-providing team members matching the specified list of team member IDs.
#  Supported query expressions are
#  - `ANY`: return the appointment segments with team members whose IDs match any
#  member in this list.
#  - `NONE`: return the appointment segments with team members whose IDs are not in
#  this list.
#  - `ALL`: not supported.
#  When no expression is specified, any service-providing team member is eligible
#  to fulfill the Booking.
    # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
    # @return [square.rb::SegmentFilter]
    def initialize(service_variation_id:, team_member_id_filter: OMIT, additional_properties: nil)
      @service_variation_id = service_variation_id
      @team_member_id_filter = team_member_id_filter if team_member_id_filter != OMIT
      @additional_properties = additional_properties
      @_field_set = { "service_variation_id": service_variation_id, "team_member_id_filter": team_member_id_filter }.reject do | _k, v |
  v == OMIT
end
    end
# Deserialize a JSON object to an instance of SegmentFilter
    #
    # @param json_object [String] 
    # @return [square.rb::SegmentFilter]
    def self.from_json(json_object:)
      struct = JSON.parse(json_object, object_class: OpenStruct)
      parsed_json = JSON.parse(json_object)
      service_variation_id = parsed_json["service_variation_id"]
      unless parsed_json["team_member_id_filter"].nil?
        team_member_id_filter = parsed_json["team_member_id_filter"].to_json
        team_member_id_filter = square.rb::FilterValue.from_json(json_object: team_member_id_filter)
      else
        team_member_id_filter = nil
      end
      new(
        service_variation_id: service_variation_id,
        team_member_id_filter: team_member_id_filter,
        additional_properties: struct
      )
    end
# Serialize an instance of SegmentFilter to a JSON object
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
      obj.service_variation_id.is_a?(String) != false || raise("Passed value for field obj.service_variation_id is not the expected type, validation failed.")
      obj.team_member_id_filter.nil? || square.rb::FilterValue.validate_raw(obj: obj.team_member_id_filter)
    end
  end
end