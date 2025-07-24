# frozen_string_literal: true
require_relative "loyalty_event"
require "ostruct"
require "json"

module square.rb
  class LoyaltyEventCreatedEventObject
  # @return [square.rb::LoyaltyEvent] The loyalty event that was created.
    attr_reader :loyalty_event
  # @return [OpenStruct] Additional properties unmapped to the current class definition
    attr_reader :additional_properties
  # @return [Object] 
    attr_reader :_field_set
    protected :_field_set

    OMIT = Object.new

    # @param loyalty_event [square.rb::LoyaltyEvent] The loyalty event that was created.
    # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
    # @return [square.rb::LoyaltyEventCreatedEventObject]
    def initialize(loyalty_event: OMIT, additional_properties: nil)
      @loyalty_event = loyalty_event if loyalty_event != OMIT
      @additional_properties = additional_properties
      @_field_set = { "loyalty_event": loyalty_event }.reject do | _k, v |
  v == OMIT
end
    end
# Deserialize a JSON object to an instance of LoyaltyEventCreatedEventObject
    #
    # @param json_object [String] 
    # @return [square.rb::LoyaltyEventCreatedEventObject]
    def self.from_json(json_object:)
      struct = JSON.parse(json_object, object_class: OpenStruct)
      parsed_json = JSON.parse(json_object)
      unless parsed_json["loyalty_event"].nil?
        loyalty_event = parsed_json["loyalty_event"].to_json
        loyalty_event = square.rb::LoyaltyEvent.from_json(json_object: loyalty_event)
      else
        loyalty_event = nil
      end
      new(loyalty_event: loyalty_event, additional_properties: struct)
    end
# Serialize an instance of LoyaltyEventCreatedEventObject to a JSON object
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
      obj.loyalty_event.nil? || square.rb::LoyaltyEvent.validate_raw(obj: obj.loyalty_event)
    end
  end
end