# frozen_string_literal: true
require_relative "order"
require_relative "error"
require "ostruct"
require "json"

module square.rb
# Defines the fields that are included in the response body of
#  a request to the `BatchRetrieveOrders` endpoint.
  class BatchGetOrdersResponse
  # @return [Array<square.rb::Order>] The requested orders. This will omit any requested orders that do not exist.
    attr_reader :orders
  # @return [Array<square.rb::Error>] Any errors that occurred during the request.
    attr_reader :errors
  # @return [OpenStruct] Additional properties unmapped to the current class definition
    attr_reader :additional_properties
  # @return [Object] 
    attr_reader :_field_set
    protected :_field_set

    OMIT = Object.new

    # @param orders [Array<square.rb::Order>] The requested orders. This will omit any requested orders that do not exist.
    # @param errors [Array<square.rb::Error>] Any errors that occurred during the request.
    # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
    # @return [square.rb::BatchGetOrdersResponse]
    def initialize(orders: OMIT, errors: OMIT, additional_properties: nil)
      @orders = orders if orders != OMIT
      @errors = errors if errors != OMIT
      @additional_properties = additional_properties
      @_field_set = { "orders": orders, "errors": errors }.reject do | _k, v |
  v == OMIT
end
    end
# Deserialize a JSON object to an instance of BatchGetOrdersResponse
    #
    # @param json_object [String] 
    # @return [square.rb::BatchGetOrdersResponse]
    def self.from_json(json_object:)
      struct = JSON.parse(json_object, object_class: OpenStruct)
      parsed_json = JSON.parse(json_object)
      orders = parsed_json["orders"]&.map do | item |
  item = item.to_json
  square.rb::Order.from_json(json_object: item)
end
      errors = parsed_json["errors"]&.map do | item |
  item = item.to_json
  square.rb::Error.from_json(json_object: item)
end
      new(
        orders: orders,
        errors: errors,
        additional_properties: struct
      )
    end
# Serialize an instance of BatchGetOrdersResponse to a JSON object
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
      obj.orders&.is_a?(Array) != false || raise("Passed value for field obj.orders is not the expected type, validation failed.")
      obj.errors&.is_a?(Array) != false || raise("Passed value for field obj.errors is not the expected type, validation failed.")
    end
  end
end