# frozen_string_literal: true
require_relative "loyalty_event_type"
require "ostruct"
require "json"

module SquareApiClient
# Filter events by event type.
  class LoyaltyEventTypeFilter
  # @return [Array<SquareApiClient::LoyaltyEventType>] The loyalty event types used to filter the result.
#  If multiple values are specified, the endpoint uses a
#  logical OR to combine them.
#  See [LoyaltyEventType](#type-loyaltyeventtype) for possible values
    attr_reader :types
  # @return [OpenStruct] Additional properties unmapped to the current class definition
    attr_reader :additional_properties
  # @return [Object] 
    attr_reader :_field_set
    protected :_field_set

    OMIT = Object.new

    # @param types [Array<SquareApiClient::LoyaltyEventType>] The loyalty event types used to filter the result.
#  If multiple values are specified, the endpoint uses a
#  logical OR to combine them.
#  See [LoyaltyEventType](#type-loyaltyeventtype) for possible values
    # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
    # @return [SquareApiClient::LoyaltyEventTypeFilter]
    def initialize(types:, additional_properties: nil)
      @types = types
      @additional_properties = additional_properties
      @_field_set = { "types": types }
    end
# Deserialize a JSON object to an instance of LoyaltyEventTypeFilter
    #
    # @param json_object [String] 
    # @return [SquareApiClient::LoyaltyEventTypeFilter]
    def self.from_json(json_object:)
      struct = JSON.parse(json_object, object_class: OpenStruct)
      parsed_json = JSON.parse(json_object)
      types = parsed_json["types"]
      new(types: types, additional_properties: struct)
    end
# Serialize an instance of LoyaltyEventTypeFilter to a JSON object
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
      obj.types.is_a?(Array) != false || raise("Passed value for field obj.types is not the expected type, validation failed.")
    end
  end
end