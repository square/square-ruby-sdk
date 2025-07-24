# frozen_string_literal: true
require_relative "order_state"
require "ostruct"
require "json"

module SquareApiClient
# Filter by the current order `state`.
  class SearchOrdersStateFilter
  # @return [Array<SquareApiClient::OrderState>] States to filter for.
#  See [OrderState](#type-orderstate) for possible values
    attr_reader :states
  # @return [OpenStruct] Additional properties unmapped to the current class definition
    attr_reader :additional_properties
  # @return [Object] 
    attr_reader :_field_set
    protected :_field_set

    OMIT = Object.new

    # @param states [Array<SquareApiClient::OrderState>] States to filter for.
#  See [OrderState](#type-orderstate) for possible values
    # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
    # @return [SquareApiClient::SearchOrdersStateFilter]
    def initialize(states:, additional_properties: nil)
      @states = states
      @additional_properties = additional_properties
      @_field_set = { "states": states }
    end
# Deserialize a JSON object to an instance of SearchOrdersStateFilter
    #
    # @param json_object [String] 
    # @return [SquareApiClient::SearchOrdersStateFilter]
    def self.from_json(json_object:)
      struct = JSON.parse(json_object, object_class: OpenStruct)
      parsed_json = JSON.parse(json_object)
      states = parsed_json["states"]
      new(states: states, additional_properties: struct)
    end
# Serialize an instance of SearchOrdersStateFilter to a JSON object
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
      obj.states.is_a?(Array) != false || raise("Passed value for field obj.states is not the expected type, validation failed.")
    end
  end
end