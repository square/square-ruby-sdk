# frozen_string_literal: true
require_relative "error"
require_relative "device_code"
require "ostruct"
require "json"

module square.rb
  class ListDeviceCodesResponse
  # @return [Array<square.rb::Error>] Any errors that occurred during the request.
    attr_reader :errors
  # @return [Array<square.rb::DeviceCode>] The queried DeviceCode.
    attr_reader :device_codes
  # @return [String] A pagination cursor to retrieve the next set of results for your
#  original query to the endpoint. This value is present only if the request
#  succeeded and additional results are available.
#  See [Paginating
#  results](https://developer.squareup.com/docs/working-with-apis/pagination) for
#  more information.
    attr_reader :cursor
  # @return [OpenStruct] Additional properties unmapped to the current class definition
    attr_reader :additional_properties
  # @return [Object] 
    attr_reader :_field_set
    protected :_field_set

    OMIT = Object.new

    # @param errors [Array<square.rb::Error>] Any errors that occurred during the request.
    # @param device_codes [Array<square.rb::DeviceCode>] The queried DeviceCode.
    # @param cursor [String] A pagination cursor to retrieve the next set of results for your
#  original query to the endpoint. This value is present only if the request
#  succeeded and additional results are available.
#  See [Paginating
#  results](https://developer.squareup.com/docs/working-with-apis/pagination) for
#  more information.
    # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
    # @return [square.rb::ListDeviceCodesResponse]
    def initialize(errors: OMIT, device_codes: OMIT, cursor: OMIT, additional_properties: nil)
      @errors = errors if errors != OMIT
      @device_codes = device_codes if device_codes != OMIT
      @cursor = cursor if cursor != OMIT
      @additional_properties = additional_properties
      @_field_set = { "errors": errors, "device_codes": device_codes, "cursor": cursor }.reject do | _k, v |
  v == OMIT
end
    end
# Deserialize a JSON object to an instance of ListDeviceCodesResponse
    #
    # @param json_object [String] 
    # @return [square.rb::ListDeviceCodesResponse]
    def self.from_json(json_object:)
      struct = JSON.parse(json_object, object_class: OpenStruct)
      parsed_json = JSON.parse(json_object)
      errors = parsed_json["errors"]&.map do | item |
  item = item.to_json
  square.rb::Error.from_json(json_object: item)
end
      device_codes = parsed_json["device_codes"]&.map do | item |
  item = item.to_json
  square.rb::DeviceCode.from_json(json_object: item)
end
      cursor = parsed_json["cursor"]
      new(
        errors: errors,
        device_codes: device_codes,
        cursor: cursor,
        additional_properties: struct
      )
    end
# Serialize an instance of ListDeviceCodesResponse to a JSON object
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
      obj.device_codes&.is_a?(Array) != false || raise("Passed value for field obj.device_codes is not the expected type, validation failed.")
      obj.cursor&.is_a?(String) != false || raise("Passed value for field obj.cursor is not the expected type, validation failed.")
    end
  end
end