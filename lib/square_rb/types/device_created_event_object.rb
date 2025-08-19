# frozen_string_literal: true
require_relative "device"
require "ostruct"
require "json"

module SquareApiClient
  class DeviceCreatedEventObject
  # @return [SquareApiClient::Device] The created device.
    attr_reader :device
  # @return [OpenStruct] Additional properties unmapped to the current class definition
    attr_reader :additional_properties
  # @return [Object] 
    attr_reader :_field_set
    protected :_field_set

    OMIT = Object.new

    # @param device [SquareApiClient::Device] The created device.
    # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
    # @return [SquareApiClient::DeviceCreatedEventObject]
    def initialize(device: OMIT, additional_properties: nil)
      @device = device if device != OMIT
      @additional_properties = additional_properties
      @_field_set = { "device": device }.reject do | _k, v |
  v == OMIT
end
    end
# Deserialize a JSON object to an instance of DeviceCreatedEventObject
    #
    # @param json_object [String] 
    # @return [SquareApiClient::DeviceCreatedEventObject]
    def self.from_json(json_object:)
      struct = JSON.parse(json_object, object_class: OpenStruct)
      parsed_json = JSON.parse(json_object)
      unless parsed_json["device"].nil?
        device = parsed_json["device"].to_json
        device = SquareApiClient::Device.from_json(json_object: device)
      else
        device = nil
      end
      new(device: device, additional_properties: struct)
    end
# Serialize an instance of DeviceCreatedEventObject to a JSON object
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
      obj.device.nil? || SquareApiClient::Device.validate_raw(obj: obj.device)
    end
  end
end