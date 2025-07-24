# frozen_string_literal: true
require_relative "device_component_details_measurement"
require "ostruct"
require "json"

module square.rb
  class DeviceComponentDetailsWiFiDetails
  # @return [Boolean] A boolean to represent whether the WiFI interface is currently active.
    attr_reader :active
  # @return [String] The name of the connected WIFI network.
    attr_reader :ssid
  # @return [String] The string representation of the device’s IPv4 address.
    attr_reader :ip_address_v_4
  # @return [String] The security protocol for a secure connection (e.g. WPA2). None provided if the
#  connection
#  is unsecured.
    attr_reader :secure_connection
  # @return [square.rb::DeviceComponentDetailsMeasurement] A representation of signal strength of the WIFI network connection.
    attr_reader :signal_strength
  # @return [OpenStruct] Additional properties unmapped to the current class definition
    attr_reader :additional_properties
  # @return [Object] 
    attr_reader :_field_set
    protected :_field_set

    OMIT = Object.new

    # @param active [Boolean] A boolean to represent whether the WiFI interface is currently active.
    # @param ssid [String] The name of the connected WIFI network.
    # @param ip_address_v_4 [String] The string representation of the device’s IPv4 address.
    # @param secure_connection [String] The security protocol for a secure connection (e.g. WPA2). None provided if the
#  connection
#  is unsecured.
    # @param signal_strength [square.rb::DeviceComponentDetailsMeasurement] A representation of signal strength of the WIFI network connection.
    # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
    # @return [square.rb::DeviceComponentDetailsWiFiDetails]
    def initialize(active: OMIT, ssid: OMIT, ip_address_v_4: OMIT, secure_connection: OMIT, signal_strength: OMIT, additional_properties: nil)
      @active = active if active != OMIT
      @ssid = ssid if ssid != OMIT
      @ip_address_v_4 = ip_address_v_4 if ip_address_v_4 != OMIT
      @secure_connection = secure_connection if secure_connection != OMIT
      @signal_strength = signal_strength if signal_strength != OMIT
      @additional_properties = additional_properties
      @_field_set = { "active": active, "ssid": ssid, "ip_address_v4": ip_address_v_4, "secure_connection": secure_connection, "signal_strength": signal_strength }.reject do | _k, v |
  v == OMIT
end
    end
# Deserialize a JSON object to an instance of DeviceComponentDetailsWiFiDetails
    #
    # @param json_object [String] 
    # @return [square.rb::DeviceComponentDetailsWiFiDetails]
    def self.from_json(json_object:)
      struct = JSON.parse(json_object, object_class: OpenStruct)
      parsed_json = JSON.parse(json_object)
      active = parsed_json["active"]
      ssid = parsed_json["ssid"]
      ip_address_v_4 = parsed_json["ip_address_v4"]
      secure_connection = parsed_json["secure_connection"]
      unless parsed_json["signal_strength"].nil?
        signal_strength = parsed_json["signal_strength"].to_json
        signal_strength = square.rb::DeviceComponentDetailsMeasurement.from_json(json_object: signal_strength)
      else
        signal_strength = nil
      end
      new(
        active: active,
        ssid: ssid,
        ip_address_v_4: ip_address_v_4,
        secure_connection: secure_connection,
        signal_strength: signal_strength,
        additional_properties: struct
      )
    end
# Serialize an instance of DeviceComponentDetailsWiFiDetails to a JSON object
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
      obj.ssid&.is_a?(String) != false || raise("Passed value for field obj.ssid is not the expected type, validation failed.")
      obj.ip_address_v_4&.is_a?(String) != false || raise("Passed value for field obj.ip_address_v_4 is not the expected type, validation failed.")
      obj.secure_connection&.is_a?(String) != false || raise("Passed value for field obj.secure_connection is not the expected type, validation failed.")
      obj.signal_strength.nil? || square.rb::DeviceComponentDetailsMeasurement.validate_raw(obj: obj.signal_strength)
    end
  end
end