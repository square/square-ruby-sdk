# frozen_string_literal: true
require_relative "fulfillment_type"
require_relative "fulfillment_state"
require "ostruct"
require "json"

module SquareApiClient
# Filter based on [order fulfillment](entity:Fulfillment) information.
  class SearchOrdersFulfillmentFilter
  # @return [Array<SquareApiClient::FulfillmentType>] A list of [fulfillment types](entity:FulfillmentType) to filter
#  for. The list returns orders if any of its fulfillments match any of the
#  fulfillment types
#  listed in this field.
#  See [FulfillmentType](#type-fulfillmenttype) for possible values
    attr_reader :fulfillment_types
  # @return [Array<SquareApiClient::FulfillmentState>] A list of [fulfillment states](entity:FulfillmentState) to filter
#  for. The list returns orders if any of its fulfillments match any of the
#  fulfillment states listed in this field.
#  See [FulfillmentState](#type-fulfillmentstate) for possible values
    attr_reader :fulfillment_states
  # @return [OpenStruct] Additional properties unmapped to the current class definition
    attr_reader :additional_properties
  # @return [Object] 
    attr_reader :_field_set
    protected :_field_set

    OMIT = Object.new

    # @param fulfillment_types [Array<SquareApiClient::FulfillmentType>] A list of [fulfillment types](entity:FulfillmentType) to filter
#  for. The list returns orders if any of its fulfillments match any of the
#  fulfillment types
#  listed in this field.
#  See [FulfillmentType](#type-fulfillmenttype) for possible values
    # @param fulfillment_states [Array<SquareApiClient::FulfillmentState>] A list of [fulfillment states](entity:FulfillmentState) to filter
#  for. The list returns orders if any of its fulfillments match any of the
#  fulfillment states listed in this field.
#  See [FulfillmentState](#type-fulfillmentstate) for possible values
    # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
    # @return [SquareApiClient::SearchOrdersFulfillmentFilter]
    def initialize(fulfillment_types: OMIT, fulfillment_states: OMIT, additional_properties: nil)
      @fulfillment_types = fulfillment_types if fulfillment_types != OMIT
      @fulfillment_states = fulfillment_states if fulfillment_states != OMIT
      @additional_properties = additional_properties
      @_field_set = { "fulfillment_types": fulfillment_types, "fulfillment_states": fulfillment_states }.reject do | _k, v |
  v == OMIT
end
    end
# Deserialize a JSON object to an instance of SearchOrdersFulfillmentFilter
    #
    # @param json_object [String] 
    # @return [SquareApiClient::SearchOrdersFulfillmentFilter]
    def self.from_json(json_object:)
      struct = JSON.parse(json_object, object_class: OpenStruct)
      parsed_json = JSON.parse(json_object)
      fulfillment_types = parsed_json["fulfillment_types"]
      fulfillment_states = parsed_json["fulfillment_states"]
      new(
        fulfillment_types: fulfillment_types,
        fulfillment_states: fulfillment_states,
        additional_properties: struct
      )
    end
# Serialize an instance of SearchOrdersFulfillmentFilter to a JSON object
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
      obj.fulfillment_types&.is_a?(Array) != false || raise("Passed value for field obj.fulfillment_types is not the expected type, validation failed.")
      obj.fulfillment_states&.is_a?(Array) != false || raise("Passed value for field obj.fulfillment_states is not the expected type, validation failed.")
    end
  end
end