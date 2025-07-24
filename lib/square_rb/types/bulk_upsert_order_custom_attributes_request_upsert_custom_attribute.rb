# frozen_string_literal: true
require_relative "custom_attribute"
require "ostruct"
require "json"

module SquareApiClient
# Represents one upsert within the bulk operation.
  class BulkUpsertOrderCustomAttributesRequestUpsertCustomAttribute
  # @return [SquareApiClient::CustomAttribute] The custom attribute to create or update, with the following fields:
#  - `value`. This value must conform to the `schema` specified by the definition.
#  For more information, see [Value data
#  eup.com/docs/customer-custom-attributes-api/custom-attributes#value-data-types).
#  - `version`. To enable [optimistic
#  loper.squareup.com/docs/build-basics/common-api-patterns/optimistic-concurrency)
#  control, include this optional field and specify the current version of the
#  custom attribute.
    attr_reader :custom_attribute
  # @return [String] A unique identifier for this request, used to ensure idempotency.
#  For more information, see
#  tps://developer.squareup.com/docs/build-basics/common-api-patterns/idempotency).
    attr_reader :idempotency_key
  # @return [String] The ID of the target [order](entity:Order).
    attr_reader :order_id
  # @return [OpenStruct] Additional properties unmapped to the current class definition
    attr_reader :additional_properties
  # @return [Object] 
    attr_reader :_field_set
    protected :_field_set

    OMIT = Object.new

    # @param custom_attribute [SquareApiClient::CustomAttribute] The custom attribute to create or update, with the following fields:
#  - `value`. This value must conform to the `schema` specified by the definition.
#  For more information, see [Value data
#  eup.com/docs/customer-custom-attributes-api/custom-attributes#value-data-types).
#  - `version`. To enable [optimistic
#  loper.squareup.com/docs/build-basics/common-api-patterns/optimistic-concurrency)
#  control, include this optional field and specify the current version of the
#  custom attribute.
    # @param idempotency_key [String] A unique identifier for this request, used to ensure idempotency.
#  For more information, see
#  tps://developer.squareup.com/docs/build-basics/common-api-patterns/idempotency).
    # @param order_id [String] The ID of the target [order](entity:Order).
    # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
    # @return [SquareApiClient::BulkUpsertOrderCustomAttributesRequestUpsertCustomAttribute]
    def initialize(custom_attribute:, idempotency_key: OMIT, order_id:, additional_properties: nil)
      @custom_attribute = custom_attribute
      @idempotency_key = idempotency_key if idempotency_key != OMIT
      @order_id = order_id
      @additional_properties = additional_properties
      @_field_set = { "custom_attribute": custom_attribute, "idempotency_key": idempotency_key, "order_id": order_id }.reject do | _k, v |
  v == OMIT
end
    end
# Deserialize a JSON object to an instance of
#  BulkUpsertOrderCustomAttributesRequestUpsertCustomAttribute
    #
    # @param json_object [String] 
    # @return [SquareApiClient::BulkUpsertOrderCustomAttributesRequestUpsertCustomAttribute]
    def self.from_json(json_object:)
      struct = JSON.parse(json_object, object_class: OpenStruct)
      parsed_json = JSON.parse(json_object)
      unless parsed_json["custom_attribute"].nil?
        custom_attribute = parsed_json["custom_attribute"].to_json
        custom_attribute = SquareApiClient::CustomAttribute.from_json(json_object: custom_attribute)
      else
        custom_attribute = nil
      end
      idempotency_key = parsed_json["idempotency_key"]
      order_id = parsed_json["order_id"]
      new(
        custom_attribute: custom_attribute,
        idempotency_key: idempotency_key,
        order_id: order_id,
        additional_properties: struct
      )
    end
# Serialize an instance of
#  BulkUpsertOrderCustomAttributesRequestUpsertCustomAttribute to a JSON object
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
      SquareApiClient::CustomAttribute.validate_raw(obj: obj.custom_attribute)
      obj.idempotency_key&.is_a?(String) != false || raise("Passed value for field obj.idempotency_key is not the expected type, validation failed.")
      obj.order_id.is_a?(String) != false || raise("Passed value for field obj.order_id is not the expected type, validation failed.")
    end
  end
end