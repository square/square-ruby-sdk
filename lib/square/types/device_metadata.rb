# frozen_string_literal: true
require "ostruct"
require "json"

module square.rb
  class DeviceMetadata
  # @return [String] The Terminal’s remaining battery percentage, between 1-100.
    attr_reader :battery_percentage
  # @return [String] The current charging state of the Terminal.
#  Options: `CHARGING`, `NOT_CHARGING`
    attr_reader :charging_state
  # @return [String] The ID of the Square seller business location associated with the Terminal.
    attr_reader :location_id
  # @return [String] The ID of the Square merchant account that is currently signed-in to the
#  Terminal.
    attr_reader :merchant_id
  # @return [String] The Terminal’s current network connection type.
#  Options: `WIFI`, `ETHERNET`
    attr_reader :network_connection_type
  # @return [String] The country in which the Terminal is authorized to take payments.
    attr_reader :payment_region
  # @return [String] The unique identifier assigned to the Terminal, which can be found on the lower
#  back
#  of the device.
    attr_reader :serial_number
  # @return [String] The current version of the Terminal’s operating system.
    attr_reader :os_version
  # @return [String] The current version of the application running on the Terminal.
    attr_reader :app_version
  # @return [String] The name of the Wi-Fi network to which the Terminal is connected.
    attr_reader :wifi_network_name
  # @return [String] The signal strength of the Wi-FI network connection.
#  Options: `POOR`, `FAIR`, `GOOD`, `EXCELLENT`
    attr_reader :wifi_network_strength
  # @return [String] The IP address of the Terminal.
    attr_reader :ip_address
  # @return [OpenStruct] Additional properties unmapped to the current class definition
    attr_reader :additional_properties
  # @return [Object] 
    attr_reader :_field_set
    protected :_field_set

    OMIT = Object.new

    # @param battery_percentage [String] The Terminal’s remaining battery percentage, between 1-100.
    # @param charging_state [String] The current charging state of the Terminal.
#  Options: `CHARGING`, `NOT_CHARGING`
    # @param location_id [String] The ID of the Square seller business location associated with the Terminal.
    # @param merchant_id [String] The ID of the Square merchant account that is currently signed-in to the
#  Terminal.
    # @param network_connection_type [String] The Terminal’s current network connection type.
#  Options: `WIFI`, `ETHERNET`
    # @param payment_region [String] The country in which the Terminal is authorized to take payments.
    # @param serial_number [String] The unique identifier assigned to the Terminal, which can be found on the lower
#  back
#  of the device.
    # @param os_version [String] The current version of the Terminal’s operating system.
    # @param app_version [String] The current version of the application running on the Terminal.
    # @param wifi_network_name [String] The name of the Wi-Fi network to which the Terminal is connected.
    # @param wifi_network_strength [String] The signal strength of the Wi-FI network connection.
#  Options: `POOR`, `FAIR`, `GOOD`, `EXCELLENT`
    # @param ip_address [String] The IP address of the Terminal.
    # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
    # @return [square.rb::DeviceMetadata]
    def initialize(battery_percentage: OMIT, charging_state: OMIT, location_id: OMIT, merchant_id: OMIT, network_connection_type: OMIT, payment_region: OMIT, serial_number: OMIT, os_version: OMIT, app_version: OMIT, wifi_network_name: OMIT, wifi_network_strength: OMIT, ip_address: OMIT, additional_properties: nil)
      @battery_percentage = battery_percentage if battery_percentage != OMIT
      @charging_state = charging_state if charging_state != OMIT
      @location_id = location_id if location_id != OMIT
      @merchant_id = merchant_id if merchant_id != OMIT
      @network_connection_type = network_connection_type if network_connection_type != OMIT
      @payment_region = payment_region if payment_region != OMIT
      @serial_number = serial_number if serial_number != OMIT
      @os_version = os_version if os_version != OMIT
      @app_version = app_version if app_version != OMIT
      @wifi_network_name = wifi_network_name if wifi_network_name != OMIT
      @wifi_network_strength = wifi_network_strength if wifi_network_strength != OMIT
      @ip_address = ip_address if ip_address != OMIT
      @additional_properties = additional_properties
      @_field_set = { "battery_percentage": battery_percentage, "charging_state": charging_state, "location_id": location_id, "merchant_id": merchant_id, "network_connection_type": network_connection_type, "payment_region": payment_region, "serial_number": serial_number, "os_version": os_version, "app_version": app_version, "wifi_network_name": wifi_network_name, "wifi_network_strength": wifi_network_strength, "ip_address": ip_address }.reject do | _k, v |
  v == OMIT
end
    end
# Deserialize a JSON object to an instance of DeviceMetadata
    #
    # @param json_object [String] 
    # @return [square.rb::DeviceMetadata]
    def self.from_json(json_object:)
      struct = JSON.parse(json_object, object_class: OpenStruct)
      parsed_json = JSON.parse(json_object)
      battery_percentage = parsed_json["battery_percentage"]
      charging_state = parsed_json["charging_state"]
      location_id = parsed_json["location_id"]
      merchant_id = parsed_json["merchant_id"]
      network_connection_type = parsed_json["network_connection_type"]
      payment_region = parsed_json["payment_region"]
      serial_number = parsed_json["serial_number"]
      os_version = parsed_json["os_version"]
      app_version = parsed_json["app_version"]
      wifi_network_name = parsed_json["wifi_network_name"]
      wifi_network_strength = parsed_json["wifi_network_strength"]
      ip_address = parsed_json["ip_address"]
      new(
        battery_percentage: battery_percentage,
        charging_state: charging_state,
        location_id: location_id,
        merchant_id: merchant_id,
        network_connection_type: network_connection_type,
        payment_region: payment_region,
        serial_number: serial_number,
        os_version: os_version,
        app_version: app_version,
        wifi_network_name: wifi_network_name,
        wifi_network_strength: wifi_network_strength,
        ip_address: ip_address,
        additional_properties: struct
      )
    end
# Serialize an instance of DeviceMetadata to a JSON object
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
      obj.battery_percentage&.is_a?(String) != false || raise("Passed value for field obj.battery_percentage is not the expected type, validation failed.")
      obj.charging_state&.is_a?(String) != false || raise("Passed value for field obj.charging_state is not the expected type, validation failed.")
      obj.location_id&.is_a?(String) != false || raise("Passed value for field obj.location_id is not the expected type, validation failed.")
      obj.merchant_id&.is_a?(String) != false || raise("Passed value for field obj.merchant_id is not the expected type, validation failed.")
      obj.network_connection_type&.is_a?(String) != false || raise("Passed value for field obj.network_connection_type is not the expected type, validation failed.")
      obj.payment_region&.is_a?(String) != false || raise("Passed value for field obj.payment_region is not the expected type, validation failed.")
      obj.serial_number&.is_a?(String) != false || raise("Passed value for field obj.serial_number is not the expected type, validation failed.")
      obj.os_version&.is_a?(String) != false || raise("Passed value for field obj.os_version is not the expected type, validation failed.")
      obj.app_version&.is_a?(String) != false || raise("Passed value for field obj.app_version is not the expected type, validation failed.")
      obj.wifi_network_name&.is_a?(String) != false || raise("Passed value for field obj.wifi_network_name is not the expected type, validation failed.")
      obj.wifi_network_strength&.is_a?(String) != false || raise("Passed value for field obj.wifi_network_strength is not the expected type, validation failed.")
      obj.ip_address&.is_a?(String) != false || raise("Passed value for field obj.ip_address is not the expected type, validation failed.")
    end
  end
end