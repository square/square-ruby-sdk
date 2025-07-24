# frozen_string_literal: true
require "ostruct"
require "json"

module SquareApiClient
# The booking profile of a seller's location, including the location's ID and
#  whether the location is enabled for online booking.
  class LocationBookingProfile
  # @return [String] The ID of the [location](entity:Location).
    attr_reader :location_id
  # @return [String] Url for the online booking site for this location.
    attr_reader :booking_site_url
  # @return [Boolean] Indicates whether the location is enabled for online booking.
    attr_reader :online_booking_enabled
  # @return [OpenStruct] Additional properties unmapped to the current class definition
    attr_reader :additional_properties
  # @return [Object] 
    attr_reader :_field_set
    protected :_field_set

    OMIT = Object.new

    # @param location_id [String] The ID of the [location](entity:Location).
    # @param booking_site_url [String] Url for the online booking site for this location.
    # @param online_booking_enabled [Boolean] Indicates whether the location is enabled for online booking.
    # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
    # @return [SquareApiClient::LocationBookingProfile]
    def initialize(location_id: OMIT, booking_site_url: OMIT, online_booking_enabled: OMIT, additional_properties: nil)
      @location_id = location_id if location_id != OMIT
      @booking_site_url = booking_site_url if booking_site_url != OMIT
      @online_booking_enabled = online_booking_enabled if online_booking_enabled != OMIT
      @additional_properties = additional_properties
      @_field_set = { "location_id": location_id, "booking_site_url": booking_site_url, "online_booking_enabled": online_booking_enabled }.reject do | _k, v |
  v == OMIT
end
    end
# Deserialize a JSON object to an instance of LocationBookingProfile
    #
    # @param json_object [String] 
    # @return [SquareApiClient::LocationBookingProfile]
    def self.from_json(json_object:)
      struct = JSON.parse(json_object, object_class: OpenStruct)
      parsed_json = JSON.parse(json_object)
      location_id = parsed_json["location_id"]
      booking_site_url = parsed_json["booking_site_url"]
      online_booking_enabled = parsed_json["online_booking_enabled"]
      new(
        location_id: location_id,
        booking_site_url: booking_site_url,
        online_booking_enabled: online_booking_enabled,
        additional_properties: struct
      )
    end
# Serialize an instance of LocationBookingProfile to a JSON object
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
      obj.location_id&.is_a?(String) != false || raise("Passed value for field obj.location_id is not the expected type, validation failed.")
      obj.booking_site_url&.is_a?(String) != false || raise("Passed value for field obj.booking_site_url is not the expected type, validation failed.")
      obj.online_booking_enabled&.is_a?(Boolean) != false || raise("Passed value for field obj.online_booking_enabled is not the expected type, validation failed.")
    end
  end
end