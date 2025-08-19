# frozen_string_literal: true
require_relative "booking"
require_relative "error"
require "ostruct"
require "json"

module SquareApiClient
  class CreateBookingResponse
  # @return [SquareApiClient::Booking] The booking that was created.
    attr_reader :booking
  # @return [Array<SquareApiClient::Error>] Errors that occurred during the request.
    attr_reader :errors
  # @return [OpenStruct] Additional properties unmapped to the current class definition
    attr_reader :additional_properties
  # @return [Object] 
    attr_reader :_field_set
    protected :_field_set

    OMIT = Object.new

    # @param booking [SquareApiClient::Booking] The booking that was created.
    # @param errors [Array<SquareApiClient::Error>] Errors that occurred during the request.
    # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
    # @return [SquareApiClient::CreateBookingResponse]
    def initialize(booking: OMIT, errors: OMIT, additional_properties: nil)
      @booking = booking if booking != OMIT
      @errors = errors if errors != OMIT
      @additional_properties = additional_properties
      @_field_set = { "booking": booking, "errors": errors }.reject do | _k, v |
  v == OMIT
end
    end
# Deserialize a JSON object to an instance of CreateBookingResponse
    #
    # @param json_object [String] 
    # @return [SquareApiClient::CreateBookingResponse]
    def self.from_json(json_object:)
      struct = JSON.parse(json_object, object_class: OpenStruct)
      parsed_json = JSON.parse(json_object)
      unless parsed_json["booking"].nil?
        booking = parsed_json["booking"].to_json
        booking = SquareApiClient::Booking.from_json(json_object: booking)
      else
        booking = nil
      end
      errors = parsed_json["errors"]&.map do | item |
  item = item.to_json
  SquareApiClient::Error.from_json(json_object: item)
end
      new(
        booking: booking,
        errors: errors,
        additional_properties: struct
      )
    end
# Serialize an instance of CreateBookingResponse to a JSON object
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
      obj.booking.nil? || SquareApiClient::Booking.validate_raw(obj: obj.booking)
      obj.errors&.is_a?(Array) != false || raise("Passed value for field obj.errors is not the expected type, validation failed.")
    end
  end
end