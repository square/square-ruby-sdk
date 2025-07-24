# frozen_string_literal: true
require "ostruct"
require "json"

module SquareApiClient
# Filter events by location.
  class LoyaltyEventLocationFilter
  # @return [Array<String>] The [location](entity:Location) IDs for loyalty events to query.
#  If multiple values are specified, the endpoint uses
#  a logical OR to combine them.
    attr_reader :location_ids
  # @return [OpenStruct] Additional properties unmapped to the current class definition
    attr_reader :additional_properties
  # @return [Object] 
    attr_reader :_field_set
    protected :_field_set

    OMIT = Object.new

    # @param location_ids [Array<String>] The [location](entity:Location) IDs for loyalty events to query.
#  If multiple values are specified, the endpoint uses
#  a logical OR to combine them.
    # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
    # @return [SquareApiClient::LoyaltyEventLocationFilter]
    def initialize(location_ids:, additional_properties: nil)
      @location_ids = location_ids
      @additional_properties = additional_properties
      @_field_set = { "location_ids": location_ids }
    end
# Deserialize a JSON object to an instance of LoyaltyEventLocationFilter
    #
    # @param json_object [String] 
    # @return [SquareApiClient::LoyaltyEventLocationFilter]
    def self.from_json(json_object:)
      struct = JSON.parse(json_object, object_class: OpenStruct)
      parsed_json = JSON.parse(json_object)
      location_ids = parsed_json["location_ids"]
      new(location_ids: location_ids, additional_properties: struct)
    end
# Serialize an instance of LoyaltyEventLocationFilter to a JSON object
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
      obj.location_ids.is_a?(Array) != false || raise("Passed value for field obj.location_ids is not the expected type, validation failed.")
    end
  end
end