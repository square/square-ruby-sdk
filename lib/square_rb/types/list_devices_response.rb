# frozen_string_literal: true
require_relative "error"
require_relative "device"
require "ostruct"
require "json"

module SquareApiClient
  class ListDevicesResponse
  # @return [Array<SquareApiClient::Error>] Information about errors that occurred during the request.
    attr_reader :errors
  # @return [Array<SquareApiClient::Device>] The requested list of `Device` objects.
    attr_reader :devices
  # @return [String] The pagination cursor to be used in a subsequent request. If empty,
#  this is the final response.
#  See
#  https://developer.squareup.com/docs/build-basics/common-api-patterns/pagination)
#  for more information.
    attr_reader :cursor
  # @return [OpenStruct] Additional properties unmapped to the current class definition
    attr_reader :additional_properties
  # @return [Object] 
    attr_reader :_field_set
    protected :_field_set

    OMIT = Object.new

    # @param errors [Array<SquareApiClient::Error>] Information about errors that occurred during the request.
    # @param devices [Array<SquareApiClient::Device>] The requested list of `Device` objects.
    # @param cursor [String] The pagination cursor to be used in a subsequent request. If empty,
#  this is the final response.
#  See
#  https://developer.squareup.com/docs/build-basics/common-api-patterns/pagination)
#  for more information.
    # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
    # @return [SquareApiClient::ListDevicesResponse]
    def initialize(errors: OMIT, devices: OMIT, cursor: OMIT, additional_properties: nil)
      @errors = errors if errors != OMIT
      @devices = devices if devices != OMIT
      @cursor = cursor if cursor != OMIT
      @additional_properties = additional_properties
      @_field_set = { "errors": errors, "devices": devices, "cursor": cursor }.reject do | _k, v |
  v == OMIT
end
    end
# Deserialize a JSON object to an instance of ListDevicesResponse
    #
    # @param json_object [String] 
    # @return [SquareApiClient::ListDevicesResponse]
    def self.from_json(json_object:)
      struct = JSON.parse(json_object, object_class: OpenStruct)
      parsed_json = JSON.parse(json_object)
      errors = parsed_json["errors"]&.map do | item |
  item = item.to_json
  SquareApiClient::Error.from_json(json_object: item)
end
      devices = parsed_json["devices"]&.map do | item |
  item = item.to_json
  SquareApiClient::Device.from_json(json_object: item)
end
      cursor = parsed_json["cursor"]
      new(
        errors: errors,
        devices: devices,
        cursor: cursor,
        additional_properties: struct
      )
    end
# Serialize an instance of ListDevicesResponse to a JSON object
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
      obj.devices&.is_a?(Array) != false || raise("Passed value for field obj.devices is not the expected type, validation failed.")
      obj.cursor&.is_a?(String) != false || raise("Passed value for field obj.cursor is not the expected type, validation failed.")
    end
  end
end