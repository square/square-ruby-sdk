# frozen_string_literal: true
require_relative "error"
require "ostruct"
require "json"

module SquareApiClient
# Represents a response from a bulk upsert of order custom attributes.
  class BulkUpsertOrderCustomAttributesResponse
  # @return [Array<SquareApiClient::Error>] Any errors that occurred during the request.
    attr_reader :errors
  # @return [Hash{String => SquareApiClient::UpsertOrderCustomAttributeResponse}] A map of responses that correspond to individual upsert operations for custom
#  attributes.
    attr_reader :values
  # @return [OpenStruct] Additional properties unmapped to the current class definition
    attr_reader :additional_properties
  # @return [Object] 
    attr_reader :_field_set
    protected :_field_set

    OMIT = Object.new

    # @param errors [Array<SquareApiClient::Error>] Any errors that occurred during the request.
    # @param values [Hash{String => SquareApiClient::UpsertOrderCustomAttributeResponse}] A map of responses that correspond to individual upsert operations for custom
#  attributes.
    # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
    # @return [SquareApiClient::BulkUpsertOrderCustomAttributesResponse]
    def initialize(errors: OMIT, values:, additional_properties: nil)
      @errors = errors if errors != OMIT
      @values = values
      @additional_properties = additional_properties
      @_field_set = { "errors": errors, "values": values }.reject do | _k, v |
  v == OMIT
end
    end
# Deserialize a JSON object to an instance of
#  BulkUpsertOrderCustomAttributesResponse
    #
    # @param json_object [String] 
    # @return [SquareApiClient::BulkUpsertOrderCustomAttributesResponse]
    def self.from_json(json_object:)
      struct = JSON.parse(json_object, object_class: OpenStruct)
      parsed_json = JSON.parse(json_object)
      errors = parsed_json["errors"]&.map do | item |
  item = item.to_json
  SquareApiClient::Error.from_json(json_object: item)
end
      values = parsed_json["values"]&.transform_values do | value |
  value = value.to_json
  SquareApiClient::UpsertOrderCustomAttributeResponse.from_json(json_object: value)
end
      new(
        errors: errors,
        values: values,
        additional_properties: struct
      )
    end
# Serialize an instance of BulkUpsertOrderCustomAttributesResponse to a JSON
#  object
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
      obj.values.is_a?(Hash) != false || raise("Passed value for field obj.values is not the expected type, validation failed.")
    end
  end
end