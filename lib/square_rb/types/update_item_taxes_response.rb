# frozen_string_literal: true
require_relative "error"
require "ostruct"
require "json"

module SquareApiClient
  class UpdateItemTaxesResponse
  # @return [Array<SquareApiClient::Error>] Any errors that occurred during the request.
    attr_reader :errors
  # @return [String] The database
#  [timestamp](https://developer.squareup.com/docs/build-basics/working-with-dates)
#  of this update in RFC 3339 format, e.g., `2016-09-04T23:59:33.123Z`.
    attr_reader :updated_at
  # @return [OpenStruct] Additional properties unmapped to the current class definition
    attr_reader :additional_properties
  # @return [Object] 
    attr_reader :_field_set
    protected :_field_set

    OMIT = Object.new

    # @param errors [Array<SquareApiClient::Error>] Any errors that occurred during the request.
    # @param updated_at [String] The database
#  [timestamp](https://developer.squareup.com/docs/build-basics/working-with-dates)
#  of this update in RFC 3339 format, e.g., `2016-09-04T23:59:33.123Z`.
    # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
    # @return [SquareApiClient::UpdateItemTaxesResponse]
    def initialize(errors: OMIT, updated_at: OMIT, additional_properties: nil)
      @errors = errors if errors != OMIT
      @updated_at = updated_at if updated_at != OMIT
      @additional_properties = additional_properties
      @_field_set = { "errors": errors, "updated_at": updated_at }.reject do | _k, v |
  v == OMIT
end
    end
# Deserialize a JSON object to an instance of UpdateItemTaxesResponse
    #
    # @param json_object [String] 
    # @return [SquareApiClient::UpdateItemTaxesResponse]
    def self.from_json(json_object:)
      struct = JSON.parse(json_object, object_class: OpenStruct)
      parsed_json = JSON.parse(json_object)
      errors = parsed_json["errors"]&.map do | item |
  item = item.to_json
  SquareApiClient::Error.from_json(json_object: item)
end
      updated_at = parsed_json["updated_at"]
      new(
        errors: errors,
        updated_at: updated_at,
        additional_properties: struct
      )
    end
# Serialize an instance of UpdateItemTaxesResponse to a JSON object
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
      obj.updated_at&.is_a?(String) != false || raise("Passed value for field obj.updated_at is not the expected type, validation failed.")
    end
  end
end