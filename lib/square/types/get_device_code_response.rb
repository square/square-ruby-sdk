# frozen_string_literal: true
require_relative "error"
require_relative "device_code"
require "ostruct"
require "json"

module SquareApiClient
  class GetDeviceCodeResponse
  # @return [Array<SquareApiClient::Error>] Any errors that occurred during the request.
    attr_reader :errors
  # @return [SquareApiClient::DeviceCode] The queried DeviceCode.
    attr_reader :device_code
  # @return [OpenStruct] Additional properties unmapped to the current class definition
    attr_reader :additional_properties
  # @return [Object] 
    attr_reader :_field_set
    protected :_field_set

    OMIT = Object.new

    # @param errors [Array<SquareApiClient::Error>] Any errors that occurred during the request.
    # @param device_code [SquareApiClient::DeviceCode] The queried DeviceCode.
    # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
    # @return [SquareApiClient::GetDeviceCodeResponse]
    def initialize(errors: OMIT, device_code: OMIT, additional_properties: nil)
      @errors = errors if errors != OMIT
      @device_code = device_code if device_code != OMIT
      @additional_properties = additional_properties
      @_field_set = { "errors": errors, "device_code": device_code }.reject do | _k, v |
  v == OMIT
end
    end
# Deserialize a JSON object to an instance of GetDeviceCodeResponse
    #
    # @param json_object [String] 
    # @return [SquareApiClient::GetDeviceCodeResponse]
    def self.from_json(json_object:)
      struct = JSON.parse(json_object, object_class: OpenStruct)
      parsed_json = JSON.parse(json_object)
      errors = parsed_json["errors"]&.map do | item |
  item = item.to_json
  SquareApiClient::Error.from_json(json_object: item)
end
      unless parsed_json["device_code"].nil?
        device_code = parsed_json["device_code"].to_json
        device_code = SquareApiClient::DeviceCode.from_json(json_object: device_code)
      else
        device_code = nil
      end
      new(
        errors: errors,
        device_code: device_code,
        additional_properties: struct
      )
    end
# Serialize an instance of GetDeviceCodeResponse to a JSON object
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
      obj.device_code.nil? || SquareApiClient::DeviceCode.validate_raw(obj: obj.device_code)
    end
  end
end