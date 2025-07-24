# frozen_string_literal: true
require_relative "error"
require_relative "vendor"
require "ostruct"
require "json"

module SquareApiClient
# Represents an output from a call to
#  [SearchVendors](api-endpoint:Vendors-SearchVendors).
  class SearchVendorsResponse
  # @return [Array<SquareApiClient::Error>] Errors encountered when the request fails.
    attr_reader :errors
  # @return [Array<SquareApiClient::Vendor>] The [Vendor](entity:Vendor) objects matching the specified search filter.
    attr_reader :vendors
  # @return [String] The pagination cursor to be used in a subsequent request. If unset,
#  this is the final response.
#  See the
#  [Pagination](https://developer.squareup.com/docs/working-with-apis/pagination)
#  guide for more information.
    attr_reader :cursor
  # @return [OpenStruct] Additional properties unmapped to the current class definition
    attr_reader :additional_properties
  # @return [Object] 
    attr_reader :_field_set
    protected :_field_set

    OMIT = Object.new

    # @param errors [Array<SquareApiClient::Error>] Errors encountered when the request fails.
    # @param vendors [Array<SquareApiClient::Vendor>] The [Vendor](entity:Vendor) objects matching the specified search filter.
    # @param cursor [String] The pagination cursor to be used in a subsequent request. If unset,
#  this is the final response.
#  See the
#  [Pagination](https://developer.squareup.com/docs/working-with-apis/pagination)
#  guide for more information.
    # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
    # @return [SquareApiClient::SearchVendorsResponse]
    def initialize(errors: OMIT, vendors: OMIT, cursor: OMIT, additional_properties: nil)
      @errors = errors if errors != OMIT
      @vendors = vendors if vendors != OMIT
      @cursor = cursor if cursor != OMIT
      @additional_properties = additional_properties
      @_field_set = { "errors": errors, "vendors": vendors, "cursor": cursor }.reject do | _k, v |
  v == OMIT
end
    end
# Deserialize a JSON object to an instance of SearchVendorsResponse
    #
    # @param json_object [String] 
    # @return [SquareApiClient::SearchVendorsResponse]
    def self.from_json(json_object:)
      struct = JSON.parse(json_object, object_class: OpenStruct)
      parsed_json = JSON.parse(json_object)
      errors = parsed_json["errors"]&.map do | item |
  item = item.to_json
  SquareApiClient::Error.from_json(json_object: item)
end
      vendors = parsed_json["vendors"]&.map do | item |
  item = item.to_json
  SquareApiClient::Vendor.from_json(json_object: item)
end
      cursor = parsed_json["cursor"]
      new(
        errors: errors,
        vendors: vendors,
        cursor: cursor,
        additional_properties: struct
      )
    end
# Serialize an instance of SearchVendorsResponse to a JSON object
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
      obj.vendors&.is_a?(Array) != false || raise("Passed value for field obj.vendors is not the expected type, validation failed.")
      obj.cursor&.is_a?(String) != false || raise("Passed value for field obj.cursor is not the expected type, validation failed.")
    end
  end
end