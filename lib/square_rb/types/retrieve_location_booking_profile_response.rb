# frozen_string_literal: true
require_relative "location_booking_profile"
require_relative "error"
require "ostruct"
require "json"

module SquareApiClient
  class RetrieveLocationBookingProfileResponse
  # @return [SquareApiClient::LocationBookingProfile] The requested location booking profile.
    attr_reader :location_booking_profile
  # @return [Array<SquareApiClient::Error>] Errors that occurred during the request.
    attr_reader :errors
  # @return [OpenStruct] Additional properties unmapped to the current class definition
    attr_reader :additional_properties
  # @return [Object] 
    attr_reader :_field_set
    protected :_field_set

    OMIT = Object.new

    # @param location_booking_profile [SquareApiClient::LocationBookingProfile] The requested location booking profile.
    # @param errors [Array<SquareApiClient::Error>] Errors that occurred during the request.
    # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
    # @return [SquareApiClient::RetrieveLocationBookingProfileResponse]
    def initialize(location_booking_profile: OMIT, errors: OMIT, additional_properties: nil)
      @location_booking_profile = location_booking_profile if location_booking_profile != OMIT
      @errors = errors if errors != OMIT
      @additional_properties = additional_properties
      @_field_set = { "location_booking_profile": location_booking_profile, "errors": errors }.reject do | _k, v |
  v == OMIT
end
    end
# Deserialize a JSON object to an instance of
#  RetrieveLocationBookingProfileResponse
    #
    # @param json_object [String] 
    # @return [SquareApiClient::RetrieveLocationBookingProfileResponse]
    def self.from_json(json_object:)
      struct = JSON.parse(json_object, object_class: OpenStruct)
      parsed_json = JSON.parse(json_object)
      unless parsed_json["location_booking_profile"].nil?
        location_booking_profile = parsed_json["location_booking_profile"].to_json
        location_booking_profile = SquareApiClient::LocationBookingProfile.from_json(json_object: location_booking_profile)
      else
        location_booking_profile = nil
      end
      errors = parsed_json["errors"]&.map do | item |
  item = item.to_json
  SquareApiClient::Error.from_json(json_object: item)
end
      new(
        location_booking_profile: location_booking_profile,
        errors: errors,
        additional_properties: struct
      )
    end
# Serialize an instance of RetrieveLocationBookingProfileResponse to a JSON object
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
      obj.location_booking_profile.nil? || SquareApiClient::LocationBookingProfile.validate_raw(obj: obj.location_booking_profile)
      obj.errors&.is_a?(Array) != false || raise("Passed value for field obj.errors is not the expected type, validation failed.")
    end
  end
end