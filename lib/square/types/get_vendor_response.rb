# frozen_string_literal: true
require_relative "error"
require_relative "vendor"
require "ostruct"
require "json"

module SquareApiClient
# Represents an output from a call to
#  [RetrieveVendor](api-endpoint:Vendors-RetrieveVendor).
  class GetVendorResponse
  # @return [Array<SquareApiClient::Error>] Errors encountered when the request fails.
    attr_reader :errors
  # @return [SquareApiClient::Vendor] The successfully retrieved [Vendor](entity:Vendor) object.
    attr_reader :vendor
  # @return [OpenStruct] Additional properties unmapped to the current class definition
    attr_reader :additional_properties
  # @return [Object] 
    attr_reader :_field_set
    protected :_field_set

    OMIT = Object.new

    # @param errors [Array<SquareApiClient::Error>] Errors encountered when the request fails.
    # @param vendor [SquareApiClient::Vendor] The successfully retrieved [Vendor](entity:Vendor) object.
    # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
    # @return [SquareApiClient::GetVendorResponse]
    def initialize(errors: OMIT, vendor: OMIT, additional_properties: nil)
      @errors = errors if errors != OMIT
      @vendor = vendor if vendor != OMIT
      @additional_properties = additional_properties
      @_field_set = { "errors": errors, "vendor": vendor }.reject do | _k, v |
  v == OMIT
end
    end
# Deserialize a JSON object to an instance of GetVendorResponse
    #
    # @param json_object [String] 
    # @return [SquareApiClient::GetVendorResponse]
    def self.from_json(json_object:)
      struct = JSON.parse(json_object, object_class: OpenStruct)
      parsed_json = JSON.parse(json_object)
      errors = parsed_json["errors"]&.map do | item |
  item = item.to_json
  SquareApiClient::Error.from_json(json_object: item)
end
      unless parsed_json["vendor"].nil?
        vendor = parsed_json["vendor"].to_json
        vendor = SquareApiClient::Vendor.from_json(json_object: vendor)
      else
        vendor = nil
      end
      new(
        errors: errors,
        vendor: vendor,
        additional_properties: struct
      )
    end
# Serialize an instance of GetVendorResponse to a JSON object
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
      obj.vendor.nil? || SquareApiClient::Vendor.validate_raw(obj: obj.vendor)
    end
  end
end