# frozen_string_literal: true
require_relative "vendor_status"
require "ostruct"
require "json"

module SquareApiClient
# Defines supported query expressions to search for vendors by.
  class SearchVendorsRequestFilter
  # @return [Array<String>] The names of the [Vendor](entity:Vendor) objects to retrieve.
    attr_reader :name
  # @return [Array<SquareApiClient::VendorStatus>] The statuses of the [Vendor](entity:Vendor) objects to retrieve.
#  See [VendorStatus](#type-vendorstatus) for possible values
    attr_reader :status
  # @return [OpenStruct] Additional properties unmapped to the current class definition
    attr_reader :additional_properties
  # @return [Object] 
    attr_reader :_field_set
    protected :_field_set

    OMIT = Object.new

    # @param name [Array<String>] The names of the [Vendor](entity:Vendor) objects to retrieve.
    # @param status [Array<SquareApiClient::VendorStatus>] The statuses of the [Vendor](entity:Vendor) objects to retrieve.
#  See [VendorStatus](#type-vendorstatus) for possible values
    # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
    # @return [SquareApiClient::SearchVendorsRequestFilter]
    def initialize(name: OMIT, status: OMIT, additional_properties: nil)
      @name = name if name != OMIT
      @status = status if status != OMIT
      @additional_properties = additional_properties
      @_field_set = { "name": name, "status": status }.reject do | _k, v |
  v == OMIT
end
    end
# Deserialize a JSON object to an instance of SearchVendorsRequestFilter
    #
    # @param json_object [String] 
    # @return [SquareApiClient::SearchVendorsRequestFilter]
    def self.from_json(json_object:)
      struct = JSON.parse(json_object, object_class: OpenStruct)
      parsed_json = JSON.parse(json_object)
      name = parsed_json["name"]
      status = parsed_json["status"]
      new(
        name: name,
        status: status,
        additional_properties: struct
      )
    end
# Serialize an instance of SearchVendorsRequestFilter to a JSON object
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
      obj.name&.is_a?(Array) != false || raise("Passed value for field obj.name is not the expected type, validation failed.")
      obj.status&.is_a?(Array) != false || raise("Passed value for field obj.status is not the expected type, validation failed.")
    end
  end
end