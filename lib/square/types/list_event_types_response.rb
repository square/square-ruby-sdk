# frozen_string_literal: true
require_relative "error"
require_relative "event_type_metadata"
require "ostruct"
require "json"

module square.rb
# Defines the fields that are included in the response body of
#  a request to the [ListEventTypes](api-endpoint:Events-ListEventTypes) endpoint.
#  Note: if there are errors processing the request, the event types field will not
#  be
#  present.
  class ListEventTypesResponse
  # @return [Array<square.rb::Error>] Information on errors encountered during the request.
    attr_reader :errors
  # @return [Array<String>] The list of event types.
    attr_reader :event_types
  # @return [Array<square.rb::EventTypeMetadata>] Contains the metadata of an event type. For more information, see
#  [EventTypeMetadata](entity:EventTypeMetadata).
    attr_reader :metadata
  # @return [OpenStruct] Additional properties unmapped to the current class definition
    attr_reader :additional_properties
  # @return [Object] 
    attr_reader :_field_set
    protected :_field_set

    OMIT = Object.new

    # @param errors [Array<square.rb::Error>] Information on errors encountered during the request.
    # @param event_types [Array<String>] The list of event types.
    # @param metadata [Array<square.rb::EventTypeMetadata>] Contains the metadata of an event type. For more information, see
#  [EventTypeMetadata](entity:EventTypeMetadata).
    # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
    # @return [square.rb::ListEventTypesResponse]
    def initialize(errors: OMIT, event_types: OMIT, metadata: OMIT, additional_properties: nil)
      @errors = errors if errors != OMIT
      @event_types = event_types if event_types != OMIT
      @metadata = metadata if metadata != OMIT
      @additional_properties = additional_properties
      @_field_set = { "errors": errors, "event_types": event_types, "metadata": metadata }.reject do | _k, v |
  v == OMIT
end
    end
# Deserialize a JSON object to an instance of ListEventTypesResponse
    #
    # @param json_object [String] 
    # @return [square.rb::ListEventTypesResponse]
    def self.from_json(json_object:)
      struct = JSON.parse(json_object, object_class: OpenStruct)
      parsed_json = JSON.parse(json_object)
      errors = parsed_json["errors"]&.map do | item |
  item = item.to_json
  square.rb::Error.from_json(json_object: item)
end
      event_types = parsed_json["event_types"]
      metadata = parsed_json["metadata"]&.map do | item |
  item = item.to_json
  square.rb::EventTypeMetadata.from_json(json_object: item)
end
      new(
        errors: errors,
        event_types: event_types,
        metadata: metadata,
        additional_properties: struct
      )
    end
# Serialize an instance of ListEventTypesResponse to a JSON object
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
      obj.errors&.is_a?(Array) != false || raise("Passed value for field obj.errors is not the expected type, validation failed.")
      obj.event_types&.is_a?(Array) != false || raise("Passed value for field obj.event_types is not the expected type, validation failed.")
      obj.metadata&.is_a?(Array) != false || raise("Passed value for field obj.metadata is not the expected type, validation failed.")
    end
  end
end