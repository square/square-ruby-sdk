# frozen_string_literal: true
require_relative "custom_attribute"
require_relative "error"
require "ostruct"
require "json"

module SquareApiClient
# Represents a response for an individual upsert request in a
#  butes](api-endpoint:LocationCustomAttributes-BulkUpsertLocationCustomAttributes)
#  operation.
  class BulkUpsertLocationCustomAttributesResponseLocationCustomAttributeUpsertResponse
  # @return [String] The ID of the location associated with the custom attribute.
    attr_reader :location_id
  # @return [SquareApiClient::CustomAttribute] The new or updated custom attribute.
    attr_reader :custom_attribute
  # @return [Array<SquareApiClient::Error>] Any errors that occurred while processing the individual request.
    attr_reader :errors
  # @return [OpenStruct] Additional properties unmapped to the current class definition
    attr_reader :additional_properties
  # @return [Object] 
    attr_reader :_field_set
    protected :_field_set

    OMIT = Object.new

    # @param location_id [String] The ID of the location associated with the custom attribute.
    # @param custom_attribute [SquareApiClient::CustomAttribute] The new or updated custom attribute.
    # @param errors [Array<SquareApiClient::Error>] Any errors that occurred while processing the individual request.
    # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
    # @return [SquareApiClient::BulkUpsertLocationCustomAttributesResponseLocationCustomAttributeUpsertResponse]
    def initialize(location_id: OMIT, custom_attribute: OMIT, errors: OMIT, additional_properties: nil)
      @location_id = location_id if location_id != OMIT
      @custom_attribute = custom_attribute if custom_attribute != OMIT
      @errors = errors if errors != OMIT
      @additional_properties = additional_properties
      @_field_set = { "location_id": location_id, "custom_attribute": custom_attribute, "errors": errors }.reject do | _k, v |
  v == OMIT
end
    end
# Deserialize a JSON object to an instance of
#  BulkUpsertLocationCustomAttributesResponseLocationCustomAttributeUpsertResponse
    #
    # @param json_object [String] 
    # @return [SquareApiClient::BulkUpsertLocationCustomAttributesResponseLocationCustomAttributeUpsertResponse]
    def self.from_json(json_object:)
      struct = JSON.parse(json_object, object_class: OpenStruct)
      parsed_json = JSON.parse(json_object)
      location_id = parsed_json["location_id"]
      unless parsed_json["custom_attribute"].nil?
        custom_attribute = parsed_json["custom_attribute"].to_json
        custom_attribute = SquareApiClient::CustomAttribute.from_json(json_object: custom_attribute)
      else
        custom_attribute = nil
      end
      errors = parsed_json["errors"]&.map do | item |
  item = item.to_json
  SquareApiClient::Error.from_json(json_object: item)
end
      new(
        location_id: location_id,
        custom_attribute: custom_attribute,
        errors: errors,
        additional_properties: struct
      )
    end
# Serialize an instance of
#  BulkUpsertLocationCustomAttributesResponseLocationCustomAttributeUpsertResponse
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
      obj.location_id&.is_a?(String) != false || raise("Passed value for field obj.location_id is not the expected type, validation failed.")
      obj.custom_attribute.nil? || SquareApiClient::CustomAttribute.validate_raw(obj: obj.custom_attribute)
      obj.errors&.is_a?(Array) != false || raise("Passed value for field obj.errors is not the expected type, validation failed.")
    end
  end
end