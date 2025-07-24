# frozen_string_literal: true
require_relative "order"
require_relative "error"
require "ostruct"
require "json"

module SquareApiClient
# Defines the fields that are included in the response body of
#  a request to the `CreateOrder` endpoint.
#  Either `errors` or `order` is present in a given response, but never both.
  class CreateOrderResponse
  # @return [SquareApiClient::Order] The newly created order.
    attr_reader :order
  # @return [Array<SquareApiClient::Error>] Any errors that occurred during the request.
    attr_reader :errors
  # @return [OpenStruct] Additional properties unmapped to the current class definition
    attr_reader :additional_properties
  # @return [Object] 
    attr_reader :_field_set
    protected :_field_set

    OMIT = Object.new

    # @param order [SquareApiClient::Order] The newly created order.
    # @param errors [Array<SquareApiClient::Error>] Any errors that occurred during the request.
    # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
    # @return [SquareApiClient::CreateOrderResponse]
    def initialize(order: OMIT, errors: OMIT, additional_properties: nil)
      @order = order if order != OMIT
      @errors = errors if errors != OMIT
      @additional_properties = additional_properties
      @_field_set = { "order": order, "errors": errors }.reject do | _k, v |
  v == OMIT
end
    end
# Deserialize a JSON object to an instance of CreateOrderResponse
    #
    # @param json_object [String] 
    # @return [SquareApiClient::CreateOrderResponse]
    def self.from_json(json_object:)
      struct = JSON.parse(json_object, object_class: OpenStruct)
      parsed_json = JSON.parse(json_object)
      unless parsed_json["order"].nil?
        order = parsed_json["order"].to_json
        order = SquareApiClient::Order.from_json(json_object: order)
      else
        order = nil
      end
      errors = parsed_json["errors"]&.map do | item |
  item = item.to_json
  SquareApiClient::Error.from_json(json_object: item)
end
      new(
        order: order,
        errors: errors,
        additional_properties: struct
      )
    end
# Serialize an instance of CreateOrderResponse to a JSON object
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
      obj.order.nil? || SquareApiClient::Order.validate_raw(obj: obj.order)
      obj.errors&.is_a?(Array) != false || raise("Passed value for field obj.errors is not the expected type, validation failed.")
    end
  end
end