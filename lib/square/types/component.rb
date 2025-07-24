# frozen_string_literal: true
require_relative "component_component_type"
require_relative "device_component_details_application_details"
require_relative "device_component_details_card_reader_details"
require_relative "device_component_details_battery_details"
require_relative "device_component_details_wi_fi_details"
require_relative "device_component_details_ethernet_details"
require "ostruct"
require "json"

module SquareApiClient
# The wrapper object for the component entries of a given component type.
  class Component
  # @return [SquareApiClient::ComponentComponentType] The type of this component. Each component type has expected properties
#  expressed
#  in a structured format within its corresponding `*_details` field.
#  See [ComponentType](#type-componenttype) for possible values
    attr_reader :type
  # @return [SquareApiClient::DeviceComponentDetailsApplicationDetails] Structured data for an `Application`, set for Components of type `APPLICATION`.
    attr_reader :application_details
  # @return [SquareApiClient::DeviceComponentDetailsCardReaderDetails] Structured data for a `CardReader`, set for Components of type `CARD_READER`.
    attr_reader :card_reader_details
  # @return [SquareApiClient::DeviceComponentDetailsBatteryDetails] Structured data for a `Battery`, set for Components of type `BATTERY`.
    attr_reader :battery_details
  # @return [SquareApiClient::DeviceComponentDetailsWiFiDetails] Structured data for a `WiFi` interface, set for Components of type `WIFI`.
    attr_reader :wifi_details
  # @return [SquareApiClient::DeviceComponentDetailsEthernetDetails] Structured data for an `Ethernet` interface, set for Components of type
#  `ETHERNET`.
    attr_reader :ethernet_details
  # @return [OpenStruct] Additional properties unmapped to the current class definition
    attr_reader :additional_properties
  # @return [Object] 
    attr_reader :_field_set
    protected :_field_set

    OMIT = Object.new

    # @param type [SquareApiClient::ComponentComponentType] The type of this component. Each component type has expected properties
#  expressed
#  in a structured format within its corresponding `*_details` field.
#  See [ComponentType](#type-componenttype) for possible values
    # @param application_details [SquareApiClient::DeviceComponentDetailsApplicationDetails] Structured data for an `Application`, set for Components of type `APPLICATION`.
    # @param card_reader_details [SquareApiClient::DeviceComponentDetailsCardReaderDetails] Structured data for a `CardReader`, set for Components of type `CARD_READER`.
    # @param battery_details [SquareApiClient::DeviceComponentDetailsBatteryDetails] Structured data for a `Battery`, set for Components of type `BATTERY`.
    # @param wifi_details [SquareApiClient::DeviceComponentDetailsWiFiDetails] Structured data for a `WiFi` interface, set for Components of type `WIFI`.
    # @param ethernet_details [SquareApiClient::DeviceComponentDetailsEthernetDetails] Structured data for an `Ethernet` interface, set for Components of type
#  `ETHERNET`.
    # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
    # @return [SquareApiClient::Component]
    def initialize(type:, application_details: OMIT, card_reader_details: OMIT, battery_details: OMIT, wifi_details: OMIT, ethernet_details: OMIT, additional_properties: nil)
      @type = type
      @application_details = application_details if application_details != OMIT
      @card_reader_details = card_reader_details if card_reader_details != OMIT
      @battery_details = battery_details if battery_details != OMIT
      @wifi_details = wifi_details if wifi_details != OMIT
      @ethernet_details = ethernet_details if ethernet_details != OMIT
      @additional_properties = additional_properties
      @_field_set = { "type": type, "application_details": application_details, "card_reader_details": card_reader_details, "battery_details": battery_details, "wifi_details": wifi_details, "ethernet_details": ethernet_details }.reject do | _k, v |
  v == OMIT
end
    end
# Deserialize a JSON object to an instance of Component
    #
    # @param json_object [String] 
    # @return [SquareApiClient::Component]
    def self.from_json(json_object:)
      struct = JSON.parse(json_object, object_class: OpenStruct)
      parsed_json = JSON.parse(json_object)
      type = parsed_json["type"]
      unless parsed_json["application_details"].nil?
        application_details = parsed_json["application_details"].to_json
        application_details = SquareApiClient::DeviceComponentDetailsApplicationDetails.from_json(json_object: application_details)
      else
        application_details = nil
      end
      unless parsed_json["card_reader_details"].nil?
        card_reader_details = parsed_json["card_reader_details"].to_json
        card_reader_details = SquareApiClient::DeviceComponentDetailsCardReaderDetails.from_json(json_object: card_reader_details)
      else
        card_reader_details = nil
      end
      unless parsed_json["battery_details"].nil?
        battery_details = parsed_json["battery_details"].to_json
        battery_details = SquareApiClient::DeviceComponentDetailsBatteryDetails.from_json(json_object: battery_details)
      else
        battery_details = nil
      end
      unless parsed_json["wifi_details"].nil?
        wifi_details = parsed_json["wifi_details"].to_json
        wifi_details = SquareApiClient::DeviceComponentDetailsWiFiDetails.from_json(json_object: wifi_details)
      else
        wifi_details = nil
      end
      unless parsed_json["ethernet_details"].nil?
        ethernet_details = parsed_json["ethernet_details"].to_json
        ethernet_details = SquareApiClient::DeviceComponentDetailsEthernetDetails.from_json(json_object: ethernet_details)
      else
        ethernet_details = nil
      end
      new(
        type: type,
        application_details: application_details,
        card_reader_details: card_reader_details,
        battery_details: battery_details,
        wifi_details: wifi_details,
        ethernet_details: ethernet_details,
        additional_properties: struct
      )
    end
# Serialize an instance of Component to a JSON object
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
      obj.type.is_a?(SquareApiClient::ComponentComponentType) != false || raise("Passed value for field obj.type is not the expected type, validation failed.")
      obj.application_details.nil? || SquareApiClient::DeviceComponentDetailsApplicationDetails.validate_raw(obj: obj.application_details)
      obj.card_reader_details.nil? || SquareApiClient::DeviceComponentDetailsCardReaderDetails.validate_raw(obj: obj.card_reader_details)
      obj.battery_details.nil? || SquareApiClient::DeviceComponentDetailsBatteryDetails.validate_raw(obj: obj.battery_details)
      obj.wifi_details.nil? || SquareApiClient::DeviceComponentDetailsWiFiDetails.validate_raw(obj: obj.wifi_details)
      obj.ethernet_details.nil? || SquareApiClient::DeviceComponentDetailsEthernetDetails.validate_raw(obj: obj.ethernet_details)
    end
  end
end