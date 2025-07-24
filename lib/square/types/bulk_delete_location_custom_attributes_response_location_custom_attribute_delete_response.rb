# frozen_string_literal: true
require_relative "error"
require "ostruct"
require "json"

module square.rb
# Represents an individual delete response in a
#  butes](api-endpoint:LocationCustomAttributes-BulkDeleteLocationCustomAttributes)
#  request.
  class BulkDeleteLocationCustomAttributesResponseLocationCustomAttributeDeleteResponse
  # @return [String] The ID of the location associated with the custom attribute.
    attr_reader :location_id
  # @return [Array<square.rb::Error>] Errors that occurred while processing the individual
#  LocationCustomAttributeDeleteRequest request
    attr_reader :errors
  # @return [OpenStruct] Additional properties unmapped to the current class definition
    attr_reader :additional_properties
  # @return [Object] 
    attr_reader :_field_set
    protected :_field_set

    OMIT = Object.new

    # @param location_id [String] The ID of the location associated with the custom attribute.
    # @param errors [Array<square.rb::Error>] Errors that occurred while processing the individual
#  LocationCustomAttributeDeleteRequest request
    # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
    # @return [square.rb::BulkDeleteLocationCustomAttributesResponseLocationCustomAttributeDeleteResponse]
    def initialize(location_id: OMIT, errors: OMIT, additional_properties: nil)
      @location_id = location_id if location_id != OMIT
      @errors = errors if errors != OMIT
      @additional_properties = additional_properties
      @_field_set = { "location_id": location_id, "errors": errors }.reject do | _k, v |
  v == OMIT
end
    end
# Deserialize a JSON object to an instance of
#  BulkDeleteLocationCustomAttributesResponseLocationCustomAttributeDeleteResponse
    #
    # @param json_object [String] 
    # @return [square.rb::BulkDeleteLocationCustomAttributesResponseLocationCustomAttributeDeleteResponse]
    def self.from_json(json_object:)
      struct = JSON.parse(json_object, object_class: OpenStruct)
      parsed_json = JSON.parse(json_object)
      location_id = parsed_json["location_id"]
      errors = parsed_json["errors"]&.map do | item |
  item = item.to_json
  square.rb::Error.from_json(json_object: item)
end
      new(
        location_id: location_id,
        errors: errors,
        additional_properties: struct
      )
    end
# Serialize an instance of
#  BulkDeleteLocationCustomAttributesResponseLocationCustomAttributeDeleteResponse
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
      obj.errors&.is_a?(Array) != false || raise("Passed value for field obj.errors is not the expected type, validation failed.")
    end
  end
end