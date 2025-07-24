# frozen_string_literal: true
require_relative "location_booking_profile"
require_relative "error"
require "ostruct"
require "json"

module square.rb
  class ListLocationBookingProfilesResponse
  # @return [Array<square.rb::LocationBookingProfile>] The list of a seller's location booking profiles.
    attr_reader :location_booking_profiles
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

    # @param location_booking_profiles [Array<square.rb::LocationBookingProfile>] The list of a seller's location booking profiles.
    # @param cursor [String] The pagination cursor to be used in the subsequent request to get the next page
#  of the results. Stop retrieving the next page of the results when the cursor is
#  not set.
    # @param errors [Array<square.rb::Error>] Errors that occurred during the request.
    # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
    # @return [square.rb::ListLocationBookingProfilesResponse]
    def initialize(location_booking_profiles: OMIT, cursor: OMIT, errors: OMIT, additional_properties: nil)
      @location_booking_profiles = location_booking_profiles if location_booking_profiles != OMIT
      @cursor = cursor if cursor != OMIT
      @errors = errors if errors != OMIT
      @additional_properties = additional_properties
      @_field_set = { "location_booking_profiles": location_booking_profiles, "cursor": cursor, "errors": errors }.reject do | _k, v |
  v == OMIT
end
    end
# Deserialize a JSON object to an instance of ListLocationBookingProfilesResponse
    #
    # @param json_object [String] 
    # @return [square.rb::ListLocationBookingProfilesResponse]
    def self.from_json(json_object:)
      struct = JSON.parse(json_object, object_class: OpenStruct)
      parsed_json = JSON.parse(json_object)
      location_booking_profiles = parsed_json["location_booking_profiles"]&.map do | item |
  item = item.to_json
  square.rb::LocationBookingProfile.from_json(json_object: item)
end
      cursor = parsed_json["cursor"]
      errors = parsed_json["errors"]&.map do | item |
  item = item.to_json
  square.rb::Error.from_json(json_object: item)
end
      new(
        location_booking_profiles: location_booking_profiles,
        cursor: cursor,
        errors: errors,
        additional_properties: struct
      )
    end
# Serialize an instance of ListLocationBookingProfilesResponse to a JSON object
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
      obj.location_booking_profiles&.is_a?(Array) != false || raise("Passed value for field obj.location_booking_profiles is not the expected type, validation failed.")
      obj.cursor&.is_a?(String) != false || raise("Passed value for field obj.cursor is not the expected type, validation failed.")
      obj.errors&.is_a?(Array) != false || raise("Passed value for field obj.errors is not the expected type, validation failed.")
    end
  end
end