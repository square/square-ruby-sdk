# frozen_string_literal: true
require_relative "appointment_segment"
require "ostruct"
require "json"

module SquareApiClient
# Defines an appointment slot that encapsulates the appointment segments, location
#  and starting time available for booking.
  class Availability
  # @return [String] The RFC 3339 timestamp specifying the beginning time of the slot available for
#  booking.
    attr_reader :start_at
  # @return [String] The ID of the location available for booking.
    attr_reader :location_id
  # @return [Array<SquareApiClient::AppointmentSegment>] The list of appointment segments available for booking
    attr_reader :appointment_segments
  # @return [OpenStruct] Additional properties unmapped to the current class definition
    attr_reader :additional_properties
  # @return [Object] 
    attr_reader :_field_set
    protected :_field_set

    OMIT = Object.new

    # @param start_at [String] The RFC 3339 timestamp specifying the beginning time of the slot available for
#  booking.
    # @param location_id [String] The ID of the location available for booking.
    # @param appointment_segments [Array<SquareApiClient::AppointmentSegment>] The list of appointment segments available for booking
    # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
    # @return [SquareApiClient::Availability]
    def initialize(start_at: OMIT, location_id: OMIT, appointment_segments: OMIT, additional_properties: nil)
      @start_at = start_at if start_at != OMIT
      @location_id = location_id if location_id != OMIT
      @appointment_segments = appointment_segments if appointment_segments != OMIT
      @additional_properties = additional_properties
      @_field_set = { "start_at": start_at, "location_id": location_id, "appointment_segments": appointment_segments }.reject do | _k, v |
  v == OMIT
end
    end
# Deserialize a JSON object to an instance of Availability
    #
    # @param json_object [String] 
    # @return [SquareApiClient::Availability]
    def self.from_json(json_object:)
      struct = JSON.parse(json_object, object_class: OpenStruct)
      parsed_json = JSON.parse(json_object)
      start_at = parsed_json["start_at"]
      location_id = parsed_json["location_id"]
      appointment_segments = parsed_json["appointment_segments"]&.map do | item |
  item = item.to_json
  SquareApiClient::AppointmentSegment.from_json(json_object: item)
end
      new(
        start_at: start_at,
        location_id: location_id,
        appointment_segments: appointment_segments,
        additional_properties: struct
      )
    end
# Serialize an instance of Availability to a JSON object
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
      obj.start_at&.is_a?(String) != false || raise("Passed value for field obj.start_at is not the expected type, validation failed.")
      obj.location_id&.is_a?(String) != false || raise("Passed value for field obj.location_id is not the expected type, validation failed.")
      obj.appointment_segments&.is_a?(Array) != false || raise("Passed value for field obj.appointment_segments is not the expected type, validation failed.")
    end
  end
end