# frozen_string_literal: true
require_relative "order"
require "ostruct"
require "json"

module SquareApiClient
  class CreateOrderRequest
  # @return [SquareApiClient::Order] The order to create. If this field is set, the only other top-level field that
#  can be
#  set is the `idempotency_key`.
    attr_reader :order
  # @return [String] A value you specify that uniquely identifies this
#  order among orders you have created.
#  If you are unsure whether a particular order was created successfully,
#  you can try it again with the same idempotency key without
#  worrying about creating duplicate orders.
#  For more information, see
#  tps://developer.squareup.com/docs/build-basics/common-api-patterns/idempotency).
    attr_reader :idempotency_key
  # @return [OpenStruct] Additional properties unmapped to the current class definition
    attr_reader :additional_properties
  # @return [Object] 
    attr_reader :_field_set
    protected :_field_set

    OMIT = Object.new

    # @param order [SquareApiClient::Order] The order to create. If this field is set, the only other top-level field that
#  can be
#  set is the `idempotency_key`.
    # @param idempotency_key [String] A value you specify that uniquely identifies this
#  order among orders you have created.
#  If you are unsure whether a particular order was created successfully,
#  you can try it again with the same idempotency key without
#  worrying about creating duplicate orders.
#  For more information, see
#  tps://developer.squareup.com/docs/build-basics/common-api-patterns/idempotency).
    # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
    # @return [SquareApiClient::CreateOrderRequest]
    def initialize(order: OMIT, idempotency_key: OMIT, additional_properties: nil)
      @order = order if order != OMIT
      @idempotency_key = idempotency_key if idempotency_key != OMIT
      @additional_properties = additional_properties
      @_field_set = { "order": order, "idempotency_key": idempotency_key }.reject do | _k, v |
  v == OMIT
end
    end
# Deserialize a JSON object to an instance of CreateOrderRequest
    #
    # @param json_object [String] 
    # @return [SquareApiClient::CreateOrderRequest]
    def self.from_json(json_object:)
      struct = JSON.parse(json_object, object_class: OpenStruct)
      parsed_json = JSON.parse(json_object)
      unless parsed_json["order"].nil?
        order = parsed_json["order"].to_json
        order = SquareApiClient::Order.from_json(json_object: order)
      else
        order = nil
      end
      idempotency_key = parsed_json["idempotency_key"]
      new(
        order: order,
        idempotency_key: idempotency_key,
        additional_properties: struct
      )
    end
# Serialize an instance of CreateOrderRequest to a JSON object
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
      obj.idempotency_key&.is_a?(String) != false || raise("Passed value for field obj.idempotency_key is not the expected type, validation failed.")
    end
  end
end