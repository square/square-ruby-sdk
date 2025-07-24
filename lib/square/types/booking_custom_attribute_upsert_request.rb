# frozen_string_literal: true
require_relative "custom_attribute"
require "ostruct"
require "json"

module square.rb
# Represents an individual upsert request in a
#  ributes](api-endpoint:BookingCustomAttributes-BulkUpsertBookingCustomAttributes)
#  request. An individual request contains a booking ID, the custom attribute to
#  create or update,
#  and an optional idempotency key.
  class BookingCustomAttributeUpsertRequest
  # @return [String] The ID of the target [booking](entity:Booking).
    attr_reader :booking_id
  # @return [square.rb::CustomAttribute] The custom attribute to create or update, with following fields:
#  - `key`. This key must match the `key` of a custom attribute definition in the
#  Square seller
#  account. If the requesting application is not the definition owner, you must
#  provide the qualified key.
#  - `value`. This value must conform to the `schema` specified by the definition.
#  For more information, see [Value data
#  reup.com/docs/booking-custom-attributes-api/custom-attributes#value-data-types).
#  - `version`. To enable [optimistic
#  loper.squareup.com/docs/build-basics/common-api-patterns/optimistic-concurrency)
#  control for update operations, include this optional field in the request and
#  set the
#  value to the current version of the custom attribute.
    attr_reader :custom_attribute
  # @return [String] A unique identifier for this individual upsert request, used to ensure
#  idempotency.
#  For more information, see
#  tps://developer.squareup.com/docs/build-basics/common-api-patterns/idempotency).
    attr_reader :idempotency_key
  # @return [OpenStruct] Additional properties unmapped to the current class definition
    attr_reader :additional_properties
  # @return [Object] 
    attr_reader :_field_set
    protected :_field_set

    OMIT = Object.new

    # @param booking_id [String] The ID of the target [booking](entity:Booking).
    # @param custom_attribute [square.rb::CustomAttribute] The custom attribute to create or update, with following fields:
#  - `key`. This key must match the `key` of a custom attribute definition in the
#  Square seller
#  account. If the requesting application is not the definition owner, you must
#  provide the qualified key.
#  - `value`. This value must conform to the `schema` specified by the definition.
#  For more information, see [Value data
#  reup.com/docs/booking-custom-attributes-api/custom-attributes#value-data-types).
#  - `version`. To enable [optimistic
#  loper.squareup.com/docs/build-basics/common-api-patterns/optimistic-concurrency)
#  control for update operations, include this optional field in the request and
#  set the
#  value to the current version of the custom attribute.
    # @param idempotency_key [String] A unique identifier for this individual upsert request, used to ensure
#  idempotency.
#  For more information, see
#  tps://developer.squareup.com/docs/build-basics/common-api-patterns/idempotency).
    # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
    # @return [square.rb::BookingCustomAttributeUpsertRequest]
    def initialize(booking_id:, custom_attribute:, idempotency_key: OMIT, additional_properties: nil)
      @booking_id = booking_id
      @custom_attribute = custom_attribute
      @idempotency_key = idempotency_key if idempotency_key != OMIT
      @additional_properties = additional_properties
      @_field_set = { "booking_id": booking_id, "custom_attribute": custom_attribute, "idempotency_key": idempotency_key }.reject do | _k, v |
  v == OMIT
end
    end
# Deserialize a JSON object to an instance of BookingCustomAttributeUpsertRequest
    #
    # @param json_object [String] 
    # @return [square.rb::BookingCustomAttributeUpsertRequest]
    def self.from_json(json_object:)
      struct = JSON.parse(json_object, object_class: OpenStruct)
      parsed_json = JSON.parse(json_object)
      booking_id = parsed_json["booking_id"]
      unless parsed_json["custom_attribute"].nil?
        custom_attribute = parsed_json["custom_attribute"].to_json
        custom_attribute = square.rb::CustomAttribute.from_json(json_object: custom_attribute)
      else
        custom_attribute = nil
      end
      idempotency_key = parsed_json["idempotency_key"]
      new(
        booking_id: booking_id,
        custom_attribute: custom_attribute,
        idempotency_key: idempotency_key,
        additional_properties: struct
      )
    end
# Serialize an instance of BookingCustomAttributeUpsertRequest to a JSON object
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
      square.rb::CustomAttribute.validate_raw(obj: obj.custom_attribute)
      obj.idempotency_key&.is_a?(String) != false || raise("Passed value for field obj.idempotency_key is not the expected type, validation failed.")
    end
  end
end