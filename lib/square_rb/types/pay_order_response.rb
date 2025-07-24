# frozen_string_literal: true
require_relative "error"
require_relative "order"
require "ostruct"
require "json"

module SquareApiClient
# Defines the fields that are included in the response body of a request to the
#  [PayOrder](api-endpoint:Orders-PayOrder) endpoint.
  class PayOrderResponse
  # @return [Array<SquareApiClient::Error>] Any errors that occurred during the request.
    attr_reader :errors
  # @return [SquareApiClient::Order] The paid, updated [order](entity:Order).
    attr_reader :order
  # @return [OpenStruct] Additional properties unmapped to the current class definition
    attr_reader :additional_properties
  # @return [Object] 
    attr_reader :_field_set
    protected :_field_set

    OMIT = Object.new

    # @param errors [Array<SquareApiClient::Error>] Any errors that occurred during the request.
    # @param order [SquareApiClient::Order] The paid, updated [order](entity:Order).
    # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
    # @return [SquareApiClient::PayOrderResponse]
    def initialize(errors: OMIT, order: OMIT, additional_properties: nil)
      @errors = errors if errors != OMIT
      @order = order if order != OMIT
      @additional_properties = additional_properties
      @_field_set = { "errors": errors, "order": order }.reject do | _k, v |
  v == OMIT
end
    end
# Deserialize a JSON object to an instance of PayOrderResponse
    #
    # @param json_object [String] 
    # @return [SquareApiClient::PayOrderResponse]
    def self.from_json(json_object:)
      struct = JSON.parse(json_object, object_class: OpenStruct)
      parsed_json = JSON.parse(json_object)
      errors = parsed_json["errors"]&.map do | item |
  item = item.to_json
  SquareApiClient::Error.from_json(json_object: item)
end
      unless parsed_json["order"].nil?
        order = parsed_json["order"].to_json
        order = SquareApiClient::Order.from_json(json_object: order)
      else
        order = nil
      end
      new(
        errors: errors,
        order: order,
        additional_properties: struct
      )
    end
# Serialize an instance of PayOrderResponse to a JSON object
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
      obj.errors&.is_a?(Array) != false || raise("Passed value for field obj.errors is not the expected type, validation failed.")
      obj.order.nil? || SquareApiClient::Order.validate_raw(obj: obj.order)
    end
  end
end