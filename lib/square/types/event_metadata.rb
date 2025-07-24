# frozen_string_literal: true
require "ostruct"
require "json"

module SquareApiClient
# Contains metadata about a particular [Event](entity:Event).
  class EventMetadata
  # @return [String] A unique ID for the event.
    attr_reader :event_id
  # @return [String] The API version of the event. This corresponds to the default API version of the
#  developer application at the time when the event was created.
    attr_reader :api_version
  # @return [OpenStruct] Additional properties unmapped to the current class definition
    attr_reader :additional_properties
  # @return [Object] 
    attr_reader :_field_set
    protected :_field_set

    OMIT = Object.new

    # @param event_id [String] A unique ID for the event.
    # @param api_version [String] The API version of the event. This corresponds to the default API version of the
#  developer application at the time when the event was created.
    # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
    # @return [SquareApiClient::EventMetadata]
    def initialize(event_id: OMIT, api_version: OMIT, additional_properties: nil)
      @event_id = event_id if event_id != OMIT
      @api_version = api_version if api_version != OMIT
      @additional_properties = additional_properties
      @_field_set = { "event_id": event_id, "api_version": api_version }.reject do | _k, v |
  v == OMIT
end
    end
# Deserialize a JSON object to an instance of EventMetadata
    #
    # @param json_object [String] 
    # @return [SquareApiClient::EventMetadata]
    def self.from_json(json_object:)
      struct = JSON.parse(json_object, object_class: OpenStruct)
      parsed_json = JSON.parse(json_object)
      event_id = parsed_json["event_id"]
      api_version = parsed_json["api_version"]
      new(
        event_id: event_id,
        api_version: api_version,
        additional_properties: struct
      )
    end
# Serialize an instance of EventMetadata to a JSON object
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
      obj.event_id&.is_a?(String) != false || raise("Passed value for field obj.event_id is not the expected type, validation failed.")
      obj.api_version&.is_a?(String) != false || raise("Passed value for field obj.api_version is not the expected type, validation failed.")
    end
  end
end