# frozen_string_literal: true
require_relative "booking"
require "ostruct"
require "json"

module SquareApiClient
  class BookingCreatedEventObject
  # @return [SquareApiClient::Booking] The created booking.
    attr_reader :booking
  # @return [OpenStruct] Additional properties unmapped to the current class definition
    attr_reader :additional_properties
  # @return [Object] 
    attr_reader :_field_set
    protected :_field_set

    OMIT = Object.new

    # @param booking [SquareApiClient::Booking] The created booking.
    # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
    # @return [SquareApiClient::BookingCreatedEventObject]
    def initialize(booking: OMIT, additional_properties: nil)
      @booking = booking if booking != OMIT
      @additional_properties = additional_properties
      @_field_set = { "booking": booking }.reject do | _k, v |
  v == OMIT
end
    end
# Deserialize a JSON object to an instance of BookingCreatedEventObject
    #
    # @param json_object [String] 
    # @return [SquareApiClient::BookingCreatedEventObject]
    def self.from_json(json_object:)
      struct = JSON.parse(json_object, object_class: OpenStruct)
      parsed_json = JSON.parse(json_object)
      unless parsed_json["booking"].nil?
        booking = parsed_json["booking"].to_json
        booking = SquareApiClient::Booking.from_json(json_object: booking)
      else
        booking = nil
      end
      new(booking: booking, additional_properties: struct)
    end
# Serialize an instance of BookingCreatedEventObject to a JSON object
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
    end
  end
end