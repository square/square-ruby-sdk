# frozen_string_literal: true
require_relative "error"
require_relative "loyalty_event"
require "ostruct"
require "json"

module SquareApiClient
# Represents an
#  [AccumulateLoyaltyPoints](api-endpoint:Loyalty-AccumulateLoyaltyPoints)
#  response.
  class AccumulateLoyaltyPointsResponse
  # @return [Array<SquareApiClient::Error>] Any errors that occurred during the request.
    attr_reader :errors
  # @return [SquareApiClient::LoyaltyEvent] The resulting loyalty event. Starting in Square version 2022-08-17, this field
#  is no longer returned.
    attr_reader :event
  # @return [Array<SquareApiClient::LoyaltyEvent>] The resulting loyalty events. If the purchase qualifies for points, the
#  `ACCUMULATE_POINTS` event
#  is always included. When using the Orders API, the `ACCUMULATE_PROMOTION_POINTS`
#  event is included
#  if the purchase also qualifies for a loyalty promotion.
    attr_reader :events
  # @return [OpenStruct] Additional properties unmapped to the current class definition
    attr_reader :additional_properties
  # @return [Object] 
    attr_reader :_field_set
    protected :_field_set

    OMIT = Object.new

    # @param errors [Array<SquareApiClient::Error>] Any errors that occurred during the request.
    # @param event [SquareApiClient::LoyaltyEvent] The resulting loyalty event. Starting in Square version 2022-08-17, this field
#  is no longer returned.
    # @param events [Array<SquareApiClient::LoyaltyEvent>] The resulting loyalty events. If the purchase qualifies for points, the
#  `ACCUMULATE_POINTS` event
#  is always included. When using the Orders API, the `ACCUMULATE_PROMOTION_POINTS`
#  event is included
#  if the purchase also qualifies for a loyalty promotion.
    # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
    # @return [SquareApiClient::AccumulateLoyaltyPointsResponse]
    def initialize(errors: OMIT, event: OMIT, events: OMIT, additional_properties: nil)
      @errors = errors if errors != OMIT
      @event = event if event != OMIT
      @events = events if events != OMIT
      @additional_properties = additional_properties
      @_field_set = { "errors": errors, "event": event, "events": events }.reject do | _k, v |
  v == OMIT
end
    end
# Deserialize a JSON object to an instance of AccumulateLoyaltyPointsResponse
    #
    # @param json_object [String] 
    # @return [SquareApiClient::AccumulateLoyaltyPointsResponse]
    def self.from_json(json_object:)
      struct = JSON.parse(json_object, object_class: OpenStruct)
      parsed_json = JSON.parse(json_object)
      errors = parsed_json["errors"]&.map do | item |
  item = item.to_json
  SquareApiClient::Error.from_json(json_object: item)
end
      unless parsed_json["event"].nil?
        event = parsed_json["event"].to_json
        event = SquareApiClient::LoyaltyEvent.from_json(json_object: event)
      else
        event = nil
      end
      events = parsed_json["events"]&.map do | item |
  item = item.to_json
  SquareApiClient::LoyaltyEvent.from_json(json_object: item)
end
      new(
        errors: errors,
        event: event,
        events: events,
        additional_properties: struct
      )
    end
# Serialize an instance of AccumulateLoyaltyPointsResponse to a JSON object
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
      obj.event.nil? || SquareApiClient::LoyaltyEvent.validate_raw(obj: obj.event)
      obj.events&.is_a?(Array) != false || raise("Passed value for field obj.events is not the expected type, validation failed.")
    end
  end
end