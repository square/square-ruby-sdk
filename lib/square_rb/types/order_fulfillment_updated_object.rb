# frozen_string_literal: true
require_relative "order_fulfillment_updated"
require "ostruct"
require "json"

module SquareApiClient
  class OrderFulfillmentUpdatedObject
  # @return [SquareApiClient::OrderFulfillmentUpdated] Information about the updated order fulfillment.
    attr_reader :order_fulfillment_updated
  # @return [OpenStruct] Additional properties unmapped to the current class definition
    attr_reader :additional_properties
  # @return [Object] 
    attr_reader :_field_set
    protected :_field_set

    OMIT = Object.new

    # @param order_fulfillment_updated [SquareApiClient::OrderFulfillmentUpdated] Information about the updated order fulfillment.
    # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
    # @return [SquareApiClient::OrderFulfillmentUpdatedObject]
    def initialize(order_fulfillment_updated: OMIT, additional_properties: nil)
      @order_fulfillment_updated = order_fulfillment_updated if order_fulfillment_updated != OMIT
      @additional_properties = additional_properties
      @_field_set = { "order_fulfillment_updated": order_fulfillment_updated }.reject do | _k, v |
  v == OMIT
end
    end
# Deserialize a JSON object to an instance of OrderFulfillmentUpdatedObject
    #
    # @param json_object [String] 
    # @return [SquareApiClient::OrderFulfillmentUpdatedObject]
    def self.from_json(json_object:)
      struct = JSON.parse(json_object, object_class: OpenStruct)
      parsed_json = JSON.parse(json_object)
      unless parsed_json["order_fulfillment_updated"].nil?
        order_fulfillment_updated = parsed_json["order_fulfillment_updated"].to_json
        order_fulfillment_updated = SquareApiClient::OrderFulfillmentUpdated.from_json(json_object: order_fulfillment_updated)
      else
        order_fulfillment_updated = nil
      end
      new(order_fulfillment_updated: order_fulfillment_updated, additional_properties: struct)
    end
# Serialize an instance of OrderFulfillmentUpdatedObject to a JSON object
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
      obj.order_fulfillment_updated.nil? || SquareApiClient::OrderFulfillmentUpdated.validate_raw(obj: obj.order_fulfillment_updated)
    end
  end
end