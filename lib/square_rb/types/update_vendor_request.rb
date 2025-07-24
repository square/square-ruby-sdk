# frozen_string_literal: true
require_relative "vendor"
require "ostruct"
require "json"

module SquareApiClient
# Represents an input to a call to
#  [UpdateVendor](api-endpoint:Vendors-UpdateVendor).
  class UpdateVendorRequest
  # @return [String] A client-supplied, universally unique identifier (UUID) for the
#  request.
#  See
#  ttps://developer.squareup.com/docs/build-basics/common-api-patterns/idempotency)
#  in the
#  [API Development 101](https://developer.squareup.com/docs/buildbasics) section
#  for more
#  information.
    attr_reader :idempotency_key
  # @return [SquareApiClient::Vendor] The specified [Vendor](entity:Vendor) to be updated.
    attr_reader :vendor
  # @return [OpenStruct] Additional properties unmapped to the current class definition
    attr_reader :additional_properties
  # @return [Object] 
    attr_reader :_field_set
    protected :_field_set

    OMIT = Object.new

    # @param idempotency_key [String] A client-supplied, universally unique identifier (UUID) for the
#  request.
#  See
#  ttps://developer.squareup.com/docs/build-basics/common-api-patterns/idempotency)
#  in the
#  [API Development 101](https://developer.squareup.com/docs/buildbasics) section
#  for more
#  information.
    # @param vendor [SquareApiClient::Vendor] The specified [Vendor](entity:Vendor) to be updated.
    # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
    # @return [SquareApiClient::UpdateVendorRequest]
    def initialize(idempotency_key: OMIT, vendor:, additional_properties: nil)
      @idempotency_key = idempotency_key if idempotency_key != OMIT
      @vendor = vendor
      @additional_properties = additional_properties
      @_field_set = { "idempotency_key": idempotency_key, "vendor": vendor }.reject do | _k, v |
  v == OMIT
end
    end
# Deserialize a JSON object to an instance of UpdateVendorRequest
    #
    # @param json_object [String] 
    # @return [SquareApiClient::UpdateVendorRequest]
    def self.from_json(json_object:)
      struct = JSON.parse(json_object, object_class: OpenStruct)
      parsed_json = JSON.parse(json_object)
      idempotency_key = parsed_json["idempotency_key"]
      unless parsed_json["vendor"].nil?
        vendor = parsed_json["vendor"].to_json
        vendor = SquareApiClient::Vendor.from_json(json_object: vendor)
      else
        vendor = nil
      end
      new(
        idempotency_key: idempotency_key,
        vendor: vendor,
        additional_properties: struct
      )
    end
# Serialize an instance of UpdateVendorRequest to a JSON object
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
      obj.idempotency_key&.is_a?(String) != false || raise("Passed value for field obj.idempotency_key is not the expected type, validation failed.")
      SquareApiClient::Vendor.validate_raw(obj: obj.vendor)
    end
  end
end