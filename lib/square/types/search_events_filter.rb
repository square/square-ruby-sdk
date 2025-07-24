# frozen_string_literal: true
require_relative "time_range"
require "ostruct"
require "json"

module square.rb
# Criteria to filter events by.
  class SearchEventsFilter
  # @return [Array<String>] Filter events by event types.
    attr_reader :event_types
  # @return [Array<String>] Filter events by merchant.
    attr_reader :merchant_ids
  # @return [Array<String>] Filter events by location.
    attr_reader :location_ids
  # @return [square.rb::TimeRange] Filter events by when they were created.
    attr_reader :created_at
  # @return [OpenStruct] Additional properties unmapped to the current class definition
    attr_reader :additional_properties
  # @return [Object] 
    attr_reader :_field_set
    protected :_field_set

    OMIT = Object.new

    # @param event_types [Array<String>] Filter events by event types.
    # @param merchant_ids [Array<String>] Filter events by merchant.
    # @param location_ids [Array<String>] Filter events by location.
    # @param created_at [square.rb::TimeRange] Filter events by when they were created.
    # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
    # @return [square.rb::SearchEventsFilter]
    def initialize(event_types: OMIT, merchant_ids: OMIT, location_ids: OMIT, created_at: OMIT, additional_properties: nil)
      @event_types = event_types if event_types != OMIT
      @merchant_ids = merchant_ids if merchant_ids != OMIT
      @location_ids = location_ids if location_ids != OMIT
      @created_at = created_at if created_at != OMIT
      @additional_properties = additional_properties
      @_field_set = { "event_types": event_types, "merchant_ids": merchant_ids, "location_ids": location_ids, "created_at": created_at }.reject do | _k, v |
  v == OMIT
end
    end
# Deserialize a JSON object to an instance of SearchEventsFilter
    #
    # @param json_object [String] 
    # @return [square.rb::SearchEventsFilter]
    def self.from_json(json_object:)
      struct = JSON.parse(json_object, object_class: OpenStruct)
      parsed_json = JSON.parse(json_object)
      event_types = parsed_json["event_types"]
      merchant_ids = parsed_json["merchant_ids"]
      location_ids = parsed_json["location_ids"]
      unless parsed_json["created_at"].nil?
        created_at = parsed_json["created_at"].to_json
        created_at = square.rb::TimeRange.from_json(json_object: created_at)
      else
        created_at = nil
      end
      new(
        event_types: event_types,
        merchant_ids: merchant_ids,
        location_ids: location_ids,
        created_at: created_at,
        additional_properties: struct
      )
    end
# Serialize an instance of SearchEventsFilter to a JSON object
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
      obj.event_types&.is_a?(Array) != false || raise("Passed value for field obj.event_types is not the expected type, validation failed.")
      obj.merchant_ids&.is_a?(Array) != false || raise("Passed value for field obj.merchant_ids is not the expected type, validation failed.")
      obj.location_ids&.is_a?(Array) != false || raise("Passed value for field obj.location_ids is not the expected type, validation failed.")
      obj.created_at.nil? || square.rb::TimeRange.validate_raw(obj: obj.created_at)
    end
  end
end