# frozen_string_literal: true
require_relative "error"
require_relative "event"
require_relative "event_metadata"
require "ostruct"
require "json"

module square.rb
# Defines the fields that are included in the response body of
#  a request to the [SearchEvents](api-endpoint:Events-SearchEvents) endpoint.
#  Note: if there are errors processing the request, the events field will not be
#  present.
  class SearchEventsResponse
  # @return [Array<square.rb::Error>] Information on errors encountered during the request.
    attr_reader :errors
  # @return [Array<square.rb::Event>] The list of [Event](entity:Event)s returned by the search.
    attr_reader :events
  # @return [Array<square.rb::EventMetadata>] Contains the metadata of an event. For more information, see
#  [Event](entity:Event).
    attr_reader :metadata
  # @return [String] When a response is truncated, it includes a cursor that you can use in a
#  subsequent request to fetch the next set of events. If empty, this is the final
#  response.
#  For more information, see
#  ttps://developer.squareup.com/docs/build-basics/common-api-patterns/pagination).
    attr_reader :cursor
  # @return [OpenStruct] Additional properties unmapped to the current class definition
    attr_reader :additional_properties
  # @return [Object] 
    attr_reader :_field_set
    protected :_field_set

    OMIT = Object.new

    # @param errors [Array<square.rb::Error>] Information on errors encountered during the request.
    # @param events [Array<square.rb::Event>] The list of [Event](entity:Event)s returned by the search.
    # @param metadata [Array<square.rb::EventMetadata>] Contains the metadata of an event. For more information, see
#  [Event](entity:Event).
    # @param cursor [String] When a response is truncated, it includes a cursor that you can use in a
#  subsequent request to fetch the next set of events. If empty, this is the final
#  response.
#  For more information, see
#  ttps://developer.squareup.com/docs/build-basics/common-api-patterns/pagination).
    # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
    # @return [square.rb::SearchEventsResponse]
    def initialize(errors: OMIT, events: OMIT, metadata: OMIT, cursor: OMIT, additional_properties: nil)
      @errors = errors if errors != OMIT
      @events = events if events != OMIT
      @metadata = metadata if metadata != OMIT
      @cursor = cursor if cursor != OMIT
      @additional_properties = additional_properties
      @_field_set = { "errors": errors, "events": events, "metadata": metadata, "cursor": cursor }.reject do | _k, v |
  v == OMIT
end
    end
# Deserialize a JSON object to an instance of SearchEventsResponse
    #
    # @param json_object [String] 
    # @return [square.rb::SearchEventsResponse]
    def self.from_json(json_object:)
      struct = JSON.parse(json_object, object_class: OpenStruct)
      parsed_json = JSON.parse(json_object)
      errors = parsed_json["errors"]&.map do | item |
  item = item.to_json
  square.rb::Error.from_json(json_object: item)
end
      events = parsed_json["events"]&.map do | item |
  item = item.to_json
  square.rb::Event.from_json(json_object: item)
end
      metadata = parsed_json["metadata"]&.map do | item |
  item = item.to_json
  square.rb::EventMetadata.from_json(json_object: item)
end
      cursor = parsed_json["cursor"]
      new(
        errors: errors,
        events: events,
        metadata: metadata,
        cursor: cursor,
        additional_properties: struct
      )
    end
# Serialize an instance of SearchEventsResponse to a JSON object
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
      obj.events&.is_a?(Array) != false || raise("Passed value for field obj.events is not the expected type, validation failed.")
      obj.metadata&.is_a?(Array) != false || raise("Passed value for field obj.metadata is not the expected type, validation failed.")
      obj.cursor&.is_a?(String) != false || raise("Passed value for field obj.cursor is not the expected type, validation failed.")
    end
  end
end