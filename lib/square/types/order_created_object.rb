# frozen_string_literal: true
require_relative "order_created"
require "ostruct"
require "json"

module SquareApiClient
  class OrderCreatedObject
  # @return [SquareApiClient::OrderCreated] Information about the created order.
    attr_reader :order_created
  # @return [OpenStruct] Additional properties unmapped to the current class definition
    attr_reader :additional_properties
  # @return [Object] 
    attr_reader :_field_set
    protected :_field_set

    OMIT = Object.new

    # @param order_created [SquareApiClient::OrderCreated] Information about the created order.
    # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
    # @return [SquareApiClient::OrderCreatedObject]
    def initialize(order_created: OMIT, additional_properties: nil)
      @order_created = order_created if order_created != OMIT
      @additional_properties = additional_properties
      @_field_set = { "order_created": order_created }.reject do | _k, v |
  v == OMIT
end
    end
# Deserialize a JSON object to an instance of OrderCreatedObject
    #
    # @param json_object [String] 
    # @return [SquareApiClient::OrderCreatedObject]
    def self.from_json(json_object:)
      struct = JSON.parse(json_object, object_class: OpenStruct)
      parsed_json = JSON.parse(json_object)
      unless parsed_json["order_created"].nil?
        order_created = parsed_json["order_created"].to_json
        order_created = SquareApiClient::OrderCreated.from_json(json_object: order_created)
      else
        order_created = nil
      end
      new(order_created: order_created, additional_properties: struct)
    end
# Serialize an instance of OrderCreatedObject to a JSON object
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
      obj.order_created.nil? || SquareApiClient::OrderCreated.validate_raw(obj: obj.order_created)
    end
  end
end