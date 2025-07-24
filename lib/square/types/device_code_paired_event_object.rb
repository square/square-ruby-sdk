# frozen_string_literal: true
require_relative "device_code"
require "ostruct"
require "json"

module SquareApiClient
  class DeviceCodePairedEventObject
  # @return [SquareApiClient::DeviceCode] The created terminal checkout
    attr_reader :device_code
  # @return [OpenStruct] Additional properties unmapped to the current class definition
    attr_reader :additional_properties
  # @return [Object] 
    attr_reader :_field_set
    protected :_field_set

    OMIT = Object.new

    # @param device_code [SquareApiClient::DeviceCode] The created terminal checkout
    # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
    # @return [SquareApiClient::DeviceCodePairedEventObject]
    def initialize(device_code: OMIT, additional_properties: nil)
      @device_code = device_code if device_code != OMIT
      @additional_properties = additional_properties
      @_field_set = { "device_code": device_code }.reject do | _k, v |
  v == OMIT
end
    end
# Deserialize a JSON object to an instance of DeviceCodePairedEventObject
    #
    # @param json_object [String] 
    # @return [SquareApiClient::DeviceCodePairedEventObject]
    def self.from_json(json_object:)
      struct = JSON.parse(json_object, object_class: OpenStruct)
      parsed_json = JSON.parse(json_object)
      unless parsed_json["device_code"].nil?
        device_code = parsed_json["device_code"].to_json
        device_code = SquareApiClient::DeviceCode.from_json(json_object: device_code)
      else
        device_code = nil
      end
      new(device_code: device_code, additional_properties: struct)
    end
# Serialize an instance of DeviceCodePairedEventObject to a JSON object
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
      obj.device_code.nil? || SquareApiClient::DeviceCode.validate_raw(obj: obj.device_code)
    end
  end
end