# frozen_string_literal: true
require "ostruct"
require "json"

module SquareApiClient
# Details about the device that took the payment.
  class DeviceDetails
  # @return [String] The Square-issued ID of the device.
    attr_reader :device_id
  # @return [String] The Square-issued installation ID for the device.
    attr_reader :device_installation_id
  # @return [String] The name of the device set by the seller.
    attr_reader :device_name
  # @return [OpenStruct] Additional properties unmapped to the current class definition
    attr_reader :additional_properties
  # @return [Object] 
    attr_reader :_field_set
    protected :_field_set

    OMIT = Object.new

    # @param device_id [String] The Square-issued ID of the device.
    # @param device_installation_id [String] The Square-issued installation ID for the device.
    # @param device_name [String] The name of the device set by the seller.
    # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
    # @return [SquareApiClient::DeviceDetails]
    def initialize(device_id: OMIT, device_installation_id: OMIT, device_name: OMIT, additional_properties: nil)
      @device_id = device_id if device_id != OMIT
      @device_installation_id = device_installation_id if device_installation_id != OMIT
      @device_name = device_name if device_name != OMIT
      @additional_properties = additional_properties
      @_field_set = { "device_id": device_id, "device_installation_id": device_installation_id, "device_name": device_name }.reject do | _k, v |
  v == OMIT
end
    end
# Deserialize a JSON object to an instance of DeviceDetails
    #
    # @param json_object [String] 
    # @return [SquareApiClient::DeviceDetails]
    def self.from_json(json_object:)
      struct = JSON.parse(json_object, object_class: OpenStruct)
      parsed_json = JSON.parse(json_object)
      device_id = parsed_json["device_id"]
      device_installation_id = parsed_json["device_installation_id"]
      device_name = parsed_json["device_name"]
      new(
        device_id: device_id,
        device_installation_id: device_installation_id,
        device_name: device_name,
        additional_properties: struct
      )
    end
# Serialize an instance of DeviceDetails to a JSON object
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
      obj.device_id&.is_a?(String) != false || raise("Passed value for field obj.device_id is not the expected type, validation failed.")
      obj.device_installation_id&.is_a?(String) != false || raise("Passed value for field obj.device_installation_id is not the expected type, validation failed.")
      obj.device_name&.is_a?(String) != false || raise("Passed value for field obj.device_name is not the expected type, validation failed.")
    end
  end
end