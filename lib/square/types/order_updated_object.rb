# frozen_string_literal: true
require_relative "order_updated"
require "ostruct"
require "json"

module SquareApiClient
  class OrderUpdatedObject
  # @return [SquareApiClient::OrderUpdated] Information about the updated order.
    attr_reader :order_updated
  # @return [OpenStruct] Additional properties unmapped to the current class definition
    attr_reader :additional_properties
  # @return [Object] 
    attr_reader :_field_set
    protected :_field_set

    OMIT = Object.new

    # @param order_updated [SquareApiClient::OrderUpdated] Information about the updated order.
    # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
    # @return [SquareApiClient::OrderUpdatedObject]
    def initialize(order_updated: OMIT, additional_properties: nil)
      @order_updated = order_updated if order_updated != OMIT
      @additional_properties = additional_properties
      @_field_set = { "order_updated": order_updated }.reject do | _k, v |
  v == OMIT
end
    end
# Deserialize a JSON object to an instance of OrderUpdatedObject
    #
    # @param json_object [String] 
    # @return [SquareApiClient::OrderUpdatedObject]
    def self.from_json(json_object:)
      struct = JSON.parse(json_object, object_class: OpenStruct)
      parsed_json = JSON.parse(json_object)
      unless parsed_json["order_updated"].nil?
        order_updated = parsed_json["order_updated"].to_json
        order_updated = SquareApiClient::OrderUpdated.from_json(json_object: order_updated)
      else
        order_updated = nil
      end
      new(order_updated: order_updated, additional_properties: struct)
    end
# Serialize an instance of OrderUpdatedObject to a JSON object
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
      obj.order_updated.nil? || SquareApiClient::OrderUpdated.validate_raw(obj: obj.order_updated)
    end
  end
end