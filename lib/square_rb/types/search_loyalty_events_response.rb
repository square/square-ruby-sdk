# frozen_string_literal: true
require_relative "error"
require_relative "loyalty_event"
require "ostruct"
require "json"

module SquareApiClient
# A response that contains loyalty events that satisfy the search
#  criteria, in order by the `created_at` date.
  class SearchLoyaltyEventsResponse
  # @return [Array<SquareApiClient::Error>] Any errors that occurred during the request.
    attr_reader :errors
  # @return [Array<SquareApiClient::LoyaltyEvent>] The loyalty events that satisfy the search criteria.
    attr_reader :events
  # @return [String] The pagination cursor to be used in a subsequent
#  request. If empty, this is the final response.
#  For more information,
#  see
#  ttps://developer.squareup.com/docs/build-basics/common-api-patterns/pagination).
    attr_reader :cursor
  # @return [OpenStruct] Additional properties unmapped to the current class definition
    attr_reader :additional_properties
  # @return [Object] 
    attr_reader :_field_set
    protected :_field_set

    OMIT = Object.new

    # @param errors [Array<SquareApiClient::Error>] Any errors that occurred during the request.
    # @param events [Array<SquareApiClient::LoyaltyEvent>] The loyalty events that satisfy the search criteria.
    # @param cursor [String] The pagination cursor to be used in a subsequent
#  request. If empty, this is the final response.
#  For more information,
#  see
#  ttps://developer.squareup.com/docs/build-basics/common-api-patterns/pagination).
    # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
    # @return [SquareApiClient::SearchLoyaltyEventsResponse]
    def initialize(errors: OMIT, events: OMIT, cursor: OMIT, additional_properties: nil)
      @errors = errors if errors != OMIT
      @events = events if events != OMIT
      @cursor = cursor if cursor != OMIT
      @additional_properties = additional_properties
      @_field_set = { "errors": errors, "events": events, "cursor": cursor }.reject do | _k, v |
  v == OMIT
end
    end
# Deserialize a JSON object to an instance of SearchLoyaltyEventsResponse
    #
    # @param json_object [String] 
    # @return [SquareApiClient::SearchLoyaltyEventsResponse]
    def self.from_json(json_object:)
      struct = JSON.parse(json_object, object_class: OpenStruct)
      parsed_json = JSON.parse(json_object)
      errors = parsed_json["errors"]&.map do | item |
  item = item.to_json
  SquareApiClient::Error.from_json(json_object: item)
end
      events = parsed_json["events"]&.map do | item |
  item = item.to_json
  SquareApiClient::LoyaltyEvent.from_json(json_object: item)
end
      cursor = parsed_json["cursor"]
      new(
        errors: errors,
        events: events,
        cursor: cursor,
        additional_properties: struct
      )
    end
# Serialize an instance of SearchLoyaltyEventsResponse to a JSON object
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
      obj.cursor&.is_a?(String) != false || raise("Passed value for field obj.cursor is not the expected type, validation failed.")
    end
  end
end