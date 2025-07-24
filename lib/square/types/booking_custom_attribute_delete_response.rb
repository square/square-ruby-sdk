# frozen_string_literal: true
require_relative "error"
require "ostruct"
require "json"

module SquareApiClient
# Represents a response for an individual upsert request in a
#  ributes](api-endpoint:BookingCustomAttributes-BulkDeleteBookingCustomAttributes)
#  operation.
  class BookingCustomAttributeDeleteResponse
  # @return [String] The ID of the [booking](entity:Booking) associated with the custom attribute.
    attr_reader :booking_id
  # @return [Array<SquareApiClient::Error>] Any errors that occurred while processing the individual request.
    attr_reader :errors
  # @return [OpenStruct] Additional properties unmapped to the current class definition
    attr_reader :additional_properties
  # @return [Object] 
    attr_reader :_field_set
    protected :_field_set

    OMIT = Object.new

    # @param booking_id [String] The ID of the [booking](entity:Booking) associated with the custom attribute.
    # @param errors [Array<SquareApiClient::Error>] Any errors that occurred while processing the individual request.
    # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
    # @return [SquareApiClient::BookingCustomAttributeDeleteResponse]
    def initialize(booking_id: OMIT, errors: OMIT, additional_properties: nil)
      @booking_id = booking_id if booking_id != OMIT
      @errors = errors if errors != OMIT
      @additional_properties = additional_properties
      @_field_set = { "booking_id": booking_id, "errors": errors }.reject do | _k, v |
  v == OMIT
end
    end
# Deserialize a JSON object to an instance of BookingCustomAttributeDeleteResponse
    #
    # @param json_object [String] 
    # @return [SquareApiClient::BookingCustomAttributeDeleteResponse]
    def self.from_json(json_object:)
      struct = JSON.parse(json_object, object_class: OpenStruct)
      parsed_json = JSON.parse(json_object)
      booking_id = parsed_json["booking_id"]
      errors = parsed_json["errors"]&.map do | item |
  item = item.to_json
  SquareApiClient::Error.from_json(json_object: item)
end
      new(
        booking_id: booking_id,
        errors: errors,
        additional_properties: struct
      )
    end
# Serialize an instance of BookingCustomAttributeDeleteResponse to a JSON object
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
      obj.booking_id&.is_a?(String) != false || raise("Passed value for field obj.booking_id is not the expected type, validation failed.")
      obj.errors&.is_a?(Array) != false || raise("Passed value for field obj.errors is not the expected type, validation failed.")
    end
  end
end