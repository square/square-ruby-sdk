# frozen_string_literal: true
require_relative "business_booking_profile"
require_relative "error"
require "ostruct"
require "json"

module SquareApiClient
  class GetBusinessBookingProfileResponse
  # @return [SquareApiClient::BusinessBookingProfile] The seller's booking profile.
    attr_reader :business_booking_profile
  # @return [Array<SquareApiClient::Error>] Errors that occurred during the request.
    attr_reader :errors
  # @return [OpenStruct] Additional properties unmapped to the current class definition
    attr_reader :additional_properties
  # @return [Object] 
    attr_reader :_field_set
    protected :_field_set

    OMIT = Object.new

    # @param business_booking_profile [SquareApiClient::BusinessBookingProfile] The seller's booking profile.
    # @param errors [Array<SquareApiClient::Error>] Errors that occurred during the request.
    # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
    # @return [SquareApiClient::GetBusinessBookingProfileResponse]
    def initialize(business_booking_profile: OMIT, errors: OMIT, additional_properties: nil)
      @business_booking_profile = business_booking_profile if business_booking_profile != OMIT
      @errors = errors if errors != OMIT
      @additional_properties = additional_properties
      @_field_set = { "business_booking_profile": business_booking_profile, "errors": errors }.reject do | _k, v |
  v == OMIT
end
    end
# Deserialize a JSON object to an instance of GetBusinessBookingProfileResponse
    #
    # @param json_object [String] 
    # @return [SquareApiClient::GetBusinessBookingProfileResponse]
    def self.from_json(json_object:)
      struct = JSON.parse(json_object, object_class: OpenStruct)
      parsed_json = JSON.parse(json_object)
      unless parsed_json["business_booking_profile"].nil?
        business_booking_profile = parsed_json["business_booking_profile"].to_json
        business_booking_profile = SquareApiClient::BusinessBookingProfile.from_json(json_object: business_booking_profile)
      else
        business_booking_profile = nil
      end
      errors = parsed_json["errors"]&.map do | item |
  item = item.to_json
  SquareApiClient::Error.from_json(json_object: item)
end
      new(
        business_booking_profile: business_booking_profile,
        errors: errors,
        additional_properties: struct
      )
    end
# Serialize an instance of GetBusinessBookingProfileResponse to a JSON object
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
      obj.business_booking_profile.nil? || SquareApiClient::BusinessBookingProfile.validate_raw(obj: obj.business_booking_profile)
      obj.errors&.is_a?(Array) != false || raise("Passed value for field obj.errors is not the expected type, validation failed.")
    end
  end
end