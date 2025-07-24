# frozen_string_literal: true
require "ostruct"
require "json"

module SquareApiClient
  class DeviceComponentDetailsEthernetDetails
  # @return [Boolean] A boolean to represent whether the Ethernet interface is currently active.
    attr_reader :active
  # @return [String] The string representation of the device’s IPv4 address.
    attr_reader :ip_address_v_4
  # @return [OpenStruct] Additional properties unmapped to the current class definition
    attr_reader :additional_properties
  # @return [Object] 
    attr_reader :_field_set
    protected :_field_set

    OMIT = Object.new

    # @param active [Boolean] A boolean to represent whether the Ethernet interface is currently active.
    # @param ip_address_v_4 [String] The string representation of the device’s IPv4 address.
    # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
    # @return [SquareApiClient::DeviceComponentDetailsEthernetDetails]
    def initialize(active: OMIT, ip_address_v_4: OMIT, additional_properties: nil)
      @active = active if active != OMIT
      @ip_address_v_4 = ip_address_v_4 if ip_address_v_4 != OMIT
      @additional_properties = additional_properties
      @_field_set = { "active": active, "ip_address_v4": ip_address_v_4 }.reject do | _k, v |
  v == OMIT
end
    end
# Deserialize a JSON object to an instance of
#  DeviceComponentDetailsEthernetDetails
    #
    # @param json_object [String] 
    # @return [SquareApiClient::DeviceComponentDetailsEthernetDetails]
    def self.from_json(json_object:)
      struct = JSON.parse(json_object, object_class: OpenStruct)
      parsed_json = JSON.parse(json_object)
      active = parsed_json["active"]
      ip_address_v_4 = parsed_json["ip_address_v4"]
      new(
        active: active,
        ip_address_v_4: ip_address_v_4,
        additional_properties: struct
      )
    end
# Serialize an instance of DeviceComponentDetailsEthernetDetails to a JSON object
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
      obj.active&.is_a?(Boolean) != false || raise("Passed value for field obj.active is not the expected type, validation failed.")
      obj.ip_address_v_4&.is_a?(String) != false || raise("Passed value for field obj.ip_address_v_4 is not the expected type, validation failed.")
    end
  end
end