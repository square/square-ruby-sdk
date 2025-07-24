# frozen_string_literal: true
require "ostruct"
require "json"

module SquareApiClient
# Contains the metadata of a webhook event type.
  class EventTypeMetadata
  # @return [String] The event type.
    attr_reader :event_type
  # @return [String] The API version at which the event type was introduced.
    attr_reader :api_version_introduced
  # @return [String] The release status of the event type.
    attr_reader :release_status
  # @return [OpenStruct] Additional properties unmapped to the current class definition
    attr_reader :additional_properties
  # @return [Object] 
    attr_reader :_field_set
    protected :_field_set

    OMIT = Object.new

    # @param event_type [String] The event type.
    # @param api_version_introduced [String] The API version at which the event type was introduced.
    # @param release_status [String] The release status of the event type.
    # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
    # @return [SquareApiClient::EventTypeMetadata]
    def initialize(event_type: OMIT, api_version_introduced: OMIT, release_status: OMIT, additional_properties: nil)
      @event_type = event_type if event_type != OMIT
      @api_version_introduced = api_version_introduced if api_version_introduced != OMIT
      @release_status = release_status if release_status != OMIT
      @additional_properties = additional_properties
      @_field_set = { "event_type": event_type, "api_version_introduced": api_version_introduced, "release_status": release_status }.reject do | _k, v |
  v == OMIT
end
    end
# Deserialize a JSON object to an instance of EventTypeMetadata
    #
    # @param json_object [String] 
    # @return [SquareApiClient::EventTypeMetadata]
    def self.from_json(json_object:)
      struct = JSON.parse(json_object, object_class: OpenStruct)
      parsed_json = JSON.parse(json_object)
      event_type = parsed_json["event_type"]
      api_version_introduced = parsed_json["api_version_introduced"]
      release_status = parsed_json["release_status"]
      new(
        event_type: event_type,
        api_version_introduced: api_version_introduced,
        release_status: release_status,
        additional_properties: struct
      )
    end
# Serialize an instance of EventTypeMetadata to a JSON object
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
      obj.event_type&.is_a?(String) != false || raise("Passed value for field obj.event_type is not the expected type, validation failed.")
      obj.api_version_introduced&.is_a?(String) != false || raise("Passed value for field obj.api_version_introduced is not the expected type, validation failed.")
      obj.release_status&.is_a?(String) != false || raise("Passed value for field obj.release_status is not the expected type, validation failed.")
    end
  end
end