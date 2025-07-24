# frozen_string_literal: true
require_relative "error"
require "ostruct"
require "json"

module square.rb
# Represents an output from a call to
#  [BulkUpdateVendors](api-endpoint:Vendors-BulkUpdateVendors).
  class BatchUpdateVendorsResponse
  # @return [Array<square.rb::Error>] Errors encountered when the request fails.
    attr_reader :errors
  # @return [Hash{String => square.rb::UpdateVendorResponse}] A set of [UpdateVendorResponse](entity:UpdateVendorResponse) objects
#  encapsulating successfully created [Vendor](entity:Vendor)
#  objects or error responses for failed attempts. The set is represented by a
#  collection of `Vendor`-ID/`UpdateVendorResponse`-object or
#  `Vendor`-ID/error-object pairs.
    attr_reader :responses
  # @return [OpenStruct] Additional properties unmapped to the current class definition
    attr_reader :additional_properties
  # @return [Object] 
    attr_reader :_field_set
    protected :_field_set

    OMIT = Object.new

    # @param errors [Array<square.rb::Error>] Errors encountered when the request fails.
    # @param responses [Hash{String => square.rb::UpdateVendorResponse}] A set of [UpdateVendorResponse](entity:UpdateVendorResponse) objects
#  encapsulating successfully created [Vendor](entity:Vendor)
#  objects or error responses for failed attempts. The set is represented by a
#  collection of `Vendor`-ID/`UpdateVendorResponse`-object or
#  `Vendor`-ID/error-object pairs.
    # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
    # @return [square.rb::BatchUpdateVendorsResponse]
    def initialize(errors: OMIT, responses: OMIT, additional_properties: nil)
      @errors = errors if errors != OMIT
      @responses = responses if responses != OMIT
      @additional_properties = additional_properties
      @_field_set = { "errors": errors, "responses": responses }.reject do | _k, v |
  v == OMIT
end
    end
# Deserialize a JSON object to an instance of BatchUpdateVendorsResponse
    #
    # @param json_object [String] 
    # @return [square.rb::BatchUpdateVendorsResponse]
    def self.from_json(json_object:)
      struct = JSON.parse(json_object, object_class: OpenStruct)
      parsed_json = JSON.parse(json_object)
      errors = parsed_json["errors"]&.map do | item |
  item = item.to_json
  square.rb::Error.from_json(json_object: item)
end
      responses = parsed_json["responses"]&.transform_values do | value |
  value = value.to_json
  square.rb::UpdateVendorResponse.from_json(json_object: value)
end
      new(
        errors: errors,
        responses: responses,
        additional_properties: struct
      )
    end
# Serialize an instance of BatchUpdateVendorsResponse to a JSON object
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
      obj.responses&.is_a?(Hash) != false || raise("Passed value for field obj.responses is not the expected type, validation failed.")
    end
  end
end