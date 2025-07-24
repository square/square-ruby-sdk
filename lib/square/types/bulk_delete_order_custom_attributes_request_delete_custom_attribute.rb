# frozen_string_literal: true
require "ostruct"
require "json"

module SquareApiClient
# Represents one delete within the bulk operation.
  class BulkDeleteOrderCustomAttributesRequestDeleteCustomAttribute
  # @return [String] The key of the custom attribute to delete.  This key must match the key
#  of an existing custom attribute definition.
    attr_reader :key
  # @return [String] The ID of the target [order](entity:Order).
    attr_reader :order_id
  # @return [OpenStruct] Additional properties unmapped to the current class definition
    attr_reader :additional_properties
  # @return [Object] 
    attr_reader :_field_set
    protected :_field_set

    OMIT = Object.new

    # @param key [String] The key of the custom attribute to delete.  This key must match the key
#  of an existing custom attribute definition.
    # @param order_id [String] The ID of the target [order](entity:Order).
    # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
    # @return [SquareApiClient::BulkDeleteOrderCustomAttributesRequestDeleteCustomAttribute]
    def initialize(key: OMIT, order_id:, additional_properties: nil)
      @key = key if key != OMIT
      @order_id = order_id
      @additional_properties = additional_properties
      @_field_set = { "key": key, "order_id": order_id }.reject do | _k, v |
  v == OMIT
end
    end
# Deserialize a JSON object to an instance of
#  BulkDeleteOrderCustomAttributesRequestDeleteCustomAttribute
    #
    # @param json_object [String] 
    # @return [SquareApiClient::BulkDeleteOrderCustomAttributesRequestDeleteCustomAttribute]
    def self.from_json(json_object:)
      struct = JSON.parse(json_object, object_class: OpenStruct)
      parsed_json = JSON.parse(json_object)
      key = parsed_json["key"]
      order_id = parsed_json["order_id"]
      new(
        key: key,
        order_id: order_id,
        additional_properties: struct
      )
    end
# Serialize an instance of
#  BulkDeleteOrderCustomAttributesRequestDeleteCustomAttribute to a JSON object
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
      obj.key&.is_a?(String) != false || raise("Passed value for field obj.key is not the expected type, validation failed.")
      obj.order_id.is_a?(String) != false || raise("Passed value for field obj.order_id is not the expected type, validation failed.")
    end
  end
end