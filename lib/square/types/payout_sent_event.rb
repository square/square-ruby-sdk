# frozen_string_literal: true
require_relative "payout_sent_event_data"
require "ostruct"
require "json"

module square.rb
# Published when a [Payout](entity:Payout) is sent.
  class PayoutSentEvent
  # @return [String] The ID of the target merchant associated with the event.
    attr_reader :merchant_id
  # @return [String] The ID of the target location associated with the event.
    attr_reader :location_id
  # @return [String] The type of event this represents, `"payout.sent"`.
    attr_reader :type
  # @return [String] A unique ID for the event.
    attr_reader :event_id
  # @return [String] Timestamp of when the event was verified, in RFC 3339 format.
    attr_reader :created_at
  # @return [square.rb::PayoutSentEventData] Data associated with the event.
    attr_reader :data
  # @return [OpenStruct] Additional properties unmapped to the current class definition
    attr_reader :additional_properties
  # @return [Object] 
    attr_reader :_field_set
    protected :_field_set

    OMIT = Object.new

    # @param merchant_id [String] The ID of the target merchant associated with the event.
    # @param location_id [String] The ID of the target location associated with the event.
    # @param type [String] The type of event this represents, `"payout.sent"`.
    # @param event_id [String] A unique ID for the event.
    # @param created_at [String] Timestamp of when the event was verified, in RFC 3339 format.
    # @param data [square.rb::PayoutSentEventData] Data associated with the event.
    # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
    # @return [square.rb::PayoutSentEvent]
    def initialize(merchant_id: OMIT, location_id: OMIT, type: OMIT, event_id: OMIT, created_at: OMIT, data: OMIT, additional_properties: nil)
      @merchant_id = merchant_id if merchant_id != OMIT
      @location_id = location_id if location_id != OMIT
      @type = type if type != OMIT
      @event_id = event_id if event_id != OMIT
      @created_at = created_at if created_at != OMIT
      @data = data if data != OMIT
      @additional_properties = additional_properties
      @_field_set = { "merchant_id": merchant_id, "location_id": location_id, "type": type, "event_id": event_id, "created_at": created_at, "data": data }.reject do | _k, v |
  v == OMIT
end
    end
# Deserialize a JSON object to an instance of PayoutSentEvent
    #
    # @param json_object [String] 
    # @return [square.rb::PayoutSentEvent]
    def self.from_json(json_object:)
      struct = JSON.parse(json_object, object_class: OpenStruct)
      parsed_json = JSON.parse(json_object)
      merchant_id = parsed_json["merchant_id"]
      location_id = parsed_json["location_id"]
      type = parsed_json["type"]
      event_id = parsed_json["event_id"]
      created_at = parsed_json["created_at"]
      unless parsed_json["data"].nil?
        data = parsed_json["data"].to_json
        data = square.rb::PayoutSentEventData.from_json(json_object: data)
      else
        data = nil
      end
      new(
        merchant_id: merchant_id,
        location_id: location_id,
        type: type,
        event_id: event_id,
        created_at: created_at,
        data: data,
        additional_properties: struct
      )
    end
# Serialize an instance of PayoutSentEvent to a JSON object
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
      obj.merchant_id&.is_a?(String) != false || raise("Passed value for field obj.merchant_id is not the expected type, validation failed.")
      obj.location_id&.is_a?(String) != false || raise("Passed value for field obj.location_id is not the expected type, validation failed.")
      obj.type&.is_a?(String) != false || raise("Passed value for field obj.type is not the expected type, validation failed.")
      obj.event_id&.is_a?(String) != false || raise("Passed value for field obj.event_id is not the expected type, validation failed.")
      obj.created_at&.is_a?(String) != false || raise("Passed value for field obj.created_at is not the expected type, validation failed.")
      obj.data.nil? || square.rb::PayoutSentEventData.validate_raw(obj: obj.data)
    end
  end
end