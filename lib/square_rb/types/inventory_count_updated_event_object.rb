# frozen_string_literal: true
require_relative "inventory_count"
require "ostruct"
require "json"

module SquareApiClient
  class InventoryCountUpdatedEventObject
  # @return [Array<SquareApiClient::InventoryCount>] The inventory counts.
    attr_reader :inventory_counts
  # @return [OpenStruct] Additional properties unmapped to the current class definition
    attr_reader :additional_properties
  # @return [Object] 
    attr_reader :_field_set
    protected :_field_set

    OMIT = Object.new

    # @param inventory_counts [Array<SquareApiClient::InventoryCount>] The inventory counts.
    # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
    # @return [SquareApiClient::InventoryCountUpdatedEventObject]
    def initialize(inventory_counts: OMIT, additional_properties: nil)
      @inventory_counts = inventory_counts if inventory_counts != OMIT
      @additional_properties = additional_properties
      @_field_set = { "inventory_counts": inventory_counts }.reject do | _k, v |
  v == OMIT
end
    end
# Deserialize a JSON object to an instance of InventoryCountUpdatedEventObject
    #
    # @param json_object [String] 
    # @return [SquareApiClient::InventoryCountUpdatedEventObject]
    def self.from_json(json_object:)
      struct = JSON.parse(json_object, object_class: OpenStruct)
      parsed_json = JSON.parse(json_object)
      inventory_counts = parsed_json["inventory_counts"]&.map do | item |
  item = item.to_json
  SquareApiClient::InventoryCount.from_json(json_object: item)
end
      new(inventory_counts: inventory_counts, additional_properties: struct)
    end
# Serialize an instance of InventoryCountUpdatedEventObject to a JSON object
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
      obj.inventory_counts&.is_a?(Array) != false || raise("Passed value for field obj.inventory_counts is not the expected type, validation failed.")
    end
  end
end