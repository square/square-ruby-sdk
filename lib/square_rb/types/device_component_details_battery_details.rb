# frozen_string_literal: true
require_relative "device_component_details_external_power"
require "ostruct"
require "json"

module SquareApiClient
  class DeviceComponentDetailsBatteryDetails
  # @return [Integer] The battery charge percentage as displayed on the device.
    attr_reader :visible_percent
  # @return [SquareApiClient::DeviceComponentDetailsExternalPower] The status of external_power.
#  See [ExternalPower](#type-externalpower) for possible values
    attr_reader :external_power
  # @return [OpenStruct] Additional properties unmapped to the current class definition
    attr_reader :additional_properties
  # @return [Object] 
    attr_reader :_field_set
    protected :_field_set

    OMIT = Object.new

    # @param visible_percent [Integer] The battery charge percentage as displayed on the device.
    # @param external_power [SquareApiClient::DeviceComponentDetailsExternalPower] The status of external_power.
#  See [ExternalPower](#type-externalpower) for possible values
    # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
    # @return [SquareApiClient::DeviceComponentDetailsBatteryDetails]
    def initialize(visible_percent: OMIT, external_power: OMIT, additional_properties: nil)
      @visible_percent = visible_percent if visible_percent != OMIT
      @external_power = external_power if external_power != OMIT
      @additional_properties = additional_properties
      @_field_set = { "visible_percent": visible_percent, "external_power": external_power }.reject do | _k, v |
  v == OMIT
end
    end
# Deserialize a JSON object to an instance of DeviceComponentDetailsBatteryDetails
    #
    # @param json_object [String] 
    # @return [SquareApiClient::DeviceComponentDetailsBatteryDetails]
    def self.from_json(json_object:)
      struct = JSON.parse(json_object, object_class: OpenStruct)
      parsed_json = JSON.parse(json_object)
      visible_percent = parsed_json["visible_percent"]
      external_power = parsed_json["external_power"]
      new(
        visible_percent: visible_percent,
        external_power: external_power,
        additional_properties: struct
      )
    end
# Serialize an instance of DeviceComponentDetailsBatteryDetails to a JSON object
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
      obj.visible_percent&.is_a?(Integer) != false || raise("Passed value for field obj.visible_percent is not the expected type, validation failed.")
      obj.external_power&.is_a?(SquareApiClient::DeviceComponentDetailsExternalPower) != false || raise("Passed value for field obj.external_power is not the expected type, validation failed.")
    end
  end
end