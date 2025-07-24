# frozen_string_literal: true
require_relative "labor_shift_created_event_data"
require "ostruct"
require "json"

module SquareApiClient
# Published when a worker starts a [Shift](entity:Shift).
#  Deprecated at Square API version 2025-05-21. Replaced by
#  `labor.timecard.created`.
  class LaborShiftCreatedEvent
  # @return [String] The ID of the merchant associated with the event.
    attr_reader :merchant_id
  # @return [String] The type of event. For this event, the value is `labor.shift.created`.
    attr_reader :type
  # @return [String] The unique ID for the event.
    attr_reader :event_id
  # @return [String] The timestamp of when the event was created, in RFC 3339 format.
    attr_reader :created_at
  # @return [SquareApiClient::LaborShiftCreatedEventData] The data associated with the event.
    attr_reader :data
  # @return [OpenStruct] Additional properties unmapped to the current class definition
    attr_reader :additional_properties
  # @return [Object] 
    attr_reader :_field_set
    protected :_field_set

    OMIT = Object.new

    # @param merchant_id [String] The ID of the merchant associated with the event.
    # @param type [String] The type of event. For this event, the value is `labor.shift.created`.
    # @param event_id [String] The unique ID for the event.
    # @param created_at [String] The timestamp of when the event was created, in RFC 3339 format.
    # @param data [SquareApiClient::LaborShiftCreatedEventData] The data associated with the event.
    # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
    # @return [SquareApiClient::LaborShiftCreatedEvent]
    def initialize(merchant_id: OMIT, type: OMIT, event_id: OMIT, created_at: OMIT, data: OMIT, additional_properties: nil)
      @merchant_id = merchant_id if merchant_id != OMIT
      @type = type if type != OMIT
      @event_id = event_id if event_id != OMIT
      @created_at = created_at if created_at != OMIT
      @data = data if data != OMIT
      @additional_properties = additional_properties
      @_field_set = { "merchant_id": merchant_id, "type": type, "event_id": event_id, "created_at": created_at, "data": data }.reject do | _k, v |
  v == OMIT
end
    end
# Deserialize a JSON object to an instance of LaborShiftCreatedEvent
    #
    # @param json_object [String] 
    # @return [SquareApiClient::LaborShiftCreatedEvent]
    def self.from_json(json_object:)
      struct = JSON.parse(json_object, object_class: OpenStruct)
      parsed_json = JSON.parse(json_object)
      merchant_id = parsed_json["merchant_id"]
      type = parsed_json["type"]
      event_id = parsed_json["event_id"]
      created_at = parsed_json["created_at"]
      unless parsed_json["data"].nil?
        data = parsed_json["data"].to_json
        data = SquareApiClient::LaborShiftCreatedEventData.from_json(json_object: data)
      else
        data = nil
      end
      new(
        merchant_id: merchant_id,
        type: type,
        event_id: event_id,
        created_at: created_at,
        data: data,
        additional_properties: struct
      )
    end
# Serialize an instance of LaborShiftCreatedEvent to a JSON object
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
      obj.type&.is_a?(String) != false || raise("Passed value for field obj.type is not the expected type, validation failed.")
      obj.event_id&.is_a?(String) != false || raise("Passed value for field obj.event_id is not the expected type, validation failed.")
      obj.created_at&.is_a?(String) != false || raise("Passed value for field obj.created_at is not the expected type, validation failed.")
      obj.data.nil? || SquareApiClient::LaborShiftCreatedEventData.validate_raw(obj: obj.data)
    end
  end
end