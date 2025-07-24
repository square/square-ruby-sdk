# frozen_string_literal: true
require "ostruct"
require "json"

module square.rb
# Specific details for curbside pickup.
  class FulfillmentPickupDetailsCurbsidePickupDetails
  # @return [String] Specific details for curbside pickup, such as parking number and vehicle model.
    attr_reader :curbside_details
  # @return [String] The
#  [timestamp](https://developer.squareup.com/docs/build-basics/working-with-dates)
#  indicating when the buyer arrived and is waiting for pickup. The timestamp must
#  be in RFC 3339 format
#  (for example, "2016-09-04T23:59:33.123Z").
    attr_reader :buyer_arrived_at
  # @return [OpenStruct] Additional properties unmapped to the current class definition
    attr_reader :additional_properties
  # @return [Object] 
    attr_reader :_field_set
    protected :_field_set

    OMIT = Object.new

    # @param curbside_details [String] Specific details for curbside pickup, such as parking number and vehicle model.
    # @param buyer_arrived_at [String] The
#  [timestamp](https://developer.squareup.com/docs/build-basics/working-with-dates)
#  indicating when the buyer arrived and is waiting for pickup. The timestamp must
#  be in RFC 3339 format
#  (for example, "2016-09-04T23:59:33.123Z").
    # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
    # @return [square.rb::FulfillmentPickupDetailsCurbsidePickupDetails]
    def initialize(curbside_details: OMIT, buyer_arrived_at: OMIT, additional_properties: nil)
      @curbside_details = curbside_details if curbside_details != OMIT
      @buyer_arrived_at = buyer_arrived_at if buyer_arrived_at != OMIT
      @additional_properties = additional_properties
      @_field_set = { "curbside_details": curbside_details, "buyer_arrived_at": buyer_arrived_at }.reject do | _k, v |
  v == OMIT
end
    end
# Deserialize a JSON object to an instance of
#  FulfillmentPickupDetailsCurbsidePickupDetails
    #
    # @param json_object [String] 
    # @return [square.rb::FulfillmentPickupDetailsCurbsidePickupDetails]
    def self.from_json(json_object:)
      struct = JSON.parse(json_object, object_class: OpenStruct)
      parsed_json = JSON.parse(json_object)
      curbside_details = parsed_json["curbside_details"]
      buyer_arrived_at = parsed_json["buyer_arrived_at"]
      new(
        curbside_details: curbside_details,
        buyer_arrived_at: buyer_arrived_at,
        additional_properties: struct
      )
    end
# Serialize an instance of FulfillmentPickupDetailsCurbsidePickupDetails to a JSON
#  object
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
      obj.curbside_details&.is_a?(String) != false || raise("Passed value for field obj.curbside_details is not the expected type, validation failed.")
      obj.buyer_arrived_at&.is_a?(String) != false || raise("Passed value for field obj.buyer_arrived_at is not the expected type, validation failed.")
    end
  end
end