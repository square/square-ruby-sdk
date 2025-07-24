# frozen_string_literal: true
require_relative "custom_attribute"
require_relative "error"
require "ostruct"
require "json"

module square.rb
# Represents a response for an individual upsert request in a
#  butes](api-endpoint:MerchantCustomAttributes-BulkUpsertMerchantCustomAttributes)
#  operation.
  class BulkUpsertMerchantCustomAttributesResponseMerchantCustomAttributeUpsertResponse
  # @return [String] The ID of the merchant associated with the custom attribute.
    attr_reader :merchant_id
  # @return [square.rb::CustomAttribute] The new or updated custom attribute.
    attr_reader :custom_attribute
  # @return [Array<square.rb::Error>] Any errors that occurred while processing the individual request.
    attr_reader :errors
  # @return [OpenStruct] Additional properties unmapped to the current class definition
    attr_reader :additional_properties
  # @return [Object] 
    attr_reader :_field_set
    protected :_field_set

    OMIT = Object.new

    # @param merchant_id [String] The ID of the merchant associated with the custom attribute.
    # @param custom_attribute [square.rb::CustomAttribute] The new or updated custom attribute.
    # @param errors [Array<square.rb::Error>] Any errors that occurred while processing the individual request.
    # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
    # @return [square.rb::BulkUpsertMerchantCustomAttributesResponseMerchantCustomAttributeUpsertResponse]
    def initialize(merchant_id: OMIT, custom_attribute: OMIT, errors: OMIT, additional_properties: nil)
      @merchant_id = merchant_id if merchant_id != OMIT
      @custom_attribute = custom_attribute if custom_attribute != OMIT
      @errors = errors if errors != OMIT
      @additional_properties = additional_properties
      @_field_set = { "merchant_id": merchant_id, "custom_attribute": custom_attribute, "errors": errors }.reject do | _k, v |
  v == OMIT
end
    end
# Deserialize a JSON object to an instance of
#  BulkUpsertMerchantCustomAttributesResponseMerchantCustomAttributeUpsertResponse
    #
    # @param json_object [String] 
    # @return [square.rb::BulkUpsertMerchantCustomAttributesResponseMerchantCustomAttributeUpsertResponse]
    def self.from_json(json_object:)
      struct = JSON.parse(json_object, object_class: OpenStruct)
      parsed_json = JSON.parse(json_object)
      merchant_id = parsed_json["merchant_id"]
      unless parsed_json["custom_attribute"].nil?
        custom_attribute = parsed_json["custom_attribute"].to_json
        custom_attribute = square.rb::CustomAttribute.from_json(json_object: custom_attribute)
      else
        custom_attribute = nil
      end
      errors = parsed_json["errors"]&.map do | item |
  item = item.to_json
  square.rb::Error.from_json(json_object: item)
end
      new(
        merchant_id: merchant_id,
        custom_attribute: custom_attribute,
        errors: errors,
        additional_properties: struct
      )
    end
# Serialize an instance of
#  BulkUpsertMerchantCustomAttributesResponseMerchantCustomAttributeUpsertResponse
#  to a JSON object
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
      obj.merchant_id&.is_a?(String) != false || raise("Passed value for field obj.merchant_id is not the expected type, validation failed.")
      obj.custom_attribute.nil? || square.rb::CustomAttribute.validate_raw(obj: obj.custom_attribute)
      obj.errors&.is_a?(Array) != false || raise("Passed value for field obj.errors is not the expected type, validation failed.")
    end
  end
end