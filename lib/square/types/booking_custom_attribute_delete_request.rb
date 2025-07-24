# frozen_string_literal: true
require "ostruct"
require "json"

module square.rb
# Represents an individual delete request in a
#  ributes](api-endpoint:BookingCustomAttributes-BulkDeleteBookingCustomAttributes)
#  request. An individual request contains a booking ID, the custom attribute to
#  delete, and an optional idempotency key.
  class BookingCustomAttributeDeleteRequest
  # @return [String] The ID of the target [booking](entity:Booking).
    attr_reader :booking_id
  # @return [String] The key of the custom attribute to delete. This key must match the `key` of a
#  custom attribute definition in the Square seller account. If the requesting
#  application is not
#  the definition owner, you must use the qualified key.
    attr_reader :key
  # @return [OpenStruct] Additional properties unmapped to the current class definition
    attr_reader :additional_properties
  # @return [Object] 
    attr_reader :_field_set
    protected :_field_set

    OMIT = Object.new

    # @param booking_id [String] The ID of the target [booking](entity:Booking).
    # @param key [String] The key of the custom attribute to delete. This key must match the `key` of a
#  custom attribute definition in the Square seller account. If the requesting
#  application is not
#  the definition owner, you must use the qualified key.
    # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
    # @return [square.rb::BookingCustomAttributeDeleteRequest]
    def initialize(booking_id:, key:, additional_properties: nil)
      @booking_id = booking_id
      @key = key
      @additional_properties = additional_properties
      @_field_set = { "booking_id": booking_id, "key": key }
    end
# Deserialize a JSON object to an instance of BookingCustomAttributeDeleteRequest
    #
    # @param json_object [String] 
    # @return [square.rb::BookingCustomAttributeDeleteRequest]
    def self.from_json(json_object:)
      struct = JSON.parse(json_object, object_class: OpenStruct)
      parsed_json = JSON.parse(json_object)
      booking_id = parsed_json["booking_id"]
      key = parsed_json["key"]
      new(
        booking_id: booking_id,
        key: key,
        additional_properties: struct
      )
    end
# Serialize an instance of BookingCustomAttributeDeleteRequest to a JSON object
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
      obj.booking_id.is_a?(String) != false || raise("Passed value for field obj.booking_id is not the expected type, validation failed.")
      obj.key.is_a?(String) != false || raise("Passed value for field obj.key is not the expected type, validation failed.")
    end
  end
end