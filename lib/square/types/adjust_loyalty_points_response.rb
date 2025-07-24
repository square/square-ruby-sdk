# frozen_string_literal: true
require_relative "error"
require_relative "loyalty_event"
require "ostruct"
require "json"

module square.rb
# Represents an [AdjustLoyaltyPoints](api-endpoint:Loyalty-AdjustLoyaltyPoints)
#  request.
  class AdjustLoyaltyPointsResponse
  # @return [Array<square.rb::Error>] Any errors that occurred during the request.
    attr_reader :errors
  # @return [square.rb::LoyaltyEvent] The resulting event data for the adjustment.
    attr_reader :event
  # @return [OpenStruct] Additional properties unmapped to the current class definition
    attr_reader :additional_properties
  # @return [Object] 
    attr_reader :_field_set
    protected :_field_set

    OMIT = Object.new

    # @param errors [Array<square.rb::Error>] Any errors that occurred during the request.
    # @param event [square.rb::LoyaltyEvent] The resulting event data for the adjustment.
    # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
    # @return [square.rb::AdjustLoyaltyPointsResponse]
    def initialize(errors: OMIT, event: OMIT, additional_properties: nil)
      @errors = errors if errors != OMIT
      @event = event if event != OMIT
      @additional_properties = additional_properties
      @_field_set = { "errors": errors, "event": event }.reject do | _k, v |
  v == OMIT
end
    end
# Deserialize a JSON object to an instance of AdjustLoyaltyPointsResponse
    #
    # @param json_object [String] 
    # @return [square.rb::AdjustLoyaltyPointsResponse]
    def self.from_json(json_object:)
      struct = JSON.parse(json_object, object_class: OpenStruct)
      parsed_json = JSON.parse(json_object)
      errors = parsed_json["errors"]&.map do | item |
  item = item.to_json
  square.rb::Error.from_json(json_object: item)
end
      unless parsed_json["event"].nil?
        event = parsed_json["event"].to_json
        event = square.rb::LoyaltyEvent.from_json(json_object: event)
      else
        event = nil
      end
      new(
        errors: errors,
        event: event,
        additional_properties: struct
      )
    end
# Serialize an instance of AdjustLoyaltyPointsResponse to a JSON object
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
      obj.event.nil? || square.rb::LoyaltyEvent.validate_raw(obj: obj.event)
    end
  end
end