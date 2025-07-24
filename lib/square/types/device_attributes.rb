# frozen_string_literal: true
require_relative "device_attributes_device_type"
require "ostruct"
require "json"

module SquareApiClient
  class DeviceAttributes
  # @return [SquareApiClient::DEVICE_ATTRIBUTES_DEVICE_TYPE] The device type.
#  See [DeviceType](#type-devicetype) for possible values
    attr_reader :type
  # @return [String] The maker of the device.
    attr_reader :manufacturer
  # @return [String] The specific model of the device.
    attr_reader :model
  # @return [String] A seller-specified name for the device.
    attr_reader :name
  # @return [String] The manufacturer-supplied identifier for the device (where available). In many
#  cases,
#  this identifier will be a serial number.
    attr_reader :manufacturers_id
  # @return [String] The RFC 3339-formatted value of the most recent update to the device
#  information.
#  (Could represent any field update on the device.)
    attr_reader :updated_at
  # @return [String] The current version of software installed on the device.
    attr_reader :version
  # @return [String] The merchant_token identifying the merchant controlling the device.
    attr_reader :merchant_token
  # @return [OpenStruct] Additional properties unmapped to the current class definition
    attr_reader :additional_properties
  # @return [Object] 
    attr_reader :_field_set
    protected :_field_set

    OMIT = Object.new

    # @param type [SquareApiClient::DEVICE_ATTRIBUTES_DEVICE_TYPE] The device type.
#  See [DeviceType](#type-devicetype) for possible values
    # @param manufacturer [String] The maker of the device.
    # @param model [String] The specific model of the device.
    # @param name [String] A seller-specified name for the device.
    # @param manufacturers_id [String] The manufacturer-supplied identifier for the device (where available). In many
#  cases,
#  this identifier will be a serial number.
    # @param updated_at [String] The RFC 3339-formatted value of the most recent update to the device
#  information.
#  (Could represent any field update on the device.)
    # @param version [String] The current version of software installed on the device.
    # @param merchant_token [String] The merchant_token identifying the merchant controlling the device.
    # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
    # @return [SquareApiClient::DeviceAttributes]
    def initialize(type:, manufacturer:, model: OMIT, name: OMIT, manufacturers_id: OMIT, updated_at: OMIT, version: OMIT, merchant_token: OMIT, additional_properties: nil)
      @type = type
      @manufacturer = manufacturer
      @model = model if model != OMIT
      @name = name if name != OMIT
      @manufacturers_id = manufacturers_id if manufacturers_id != OMIT
      @updated_at = updated_at if updated_at != OMIT
      @version = version if version != OMIT
      @merchant_token = merchant_token if merchant_token != OMIT
      @additional_properties = additional_properties
      @_field_set = { "type": type, "manufacturer": manufacturer, "model": model, "name": name, "manufacturers_id": manufacturers_id, "updated_at": updated_at, "version": version, "merchant_token": merchant_token }.reject do | _k, v |
  v == OMIT
end
    end
# Deserialize a JSON object to an instance of DeviceAttributes
    #
    # @param json_object [String] 
    # @return [SquareApiClient::DeviceAttributes]
    def self.from_json(json_object:)
      struct = JSON.parse(json_object, object_class: OpenStruct)
      parsed_json = JSON.parse(json_object)
      type = parsed_json["type"]
      manufacturer = parsed_json["manufacturer"]
      model = parsed_json["model"]
      name = parsed_json["name"]
      manufacturers_id = parsed_json["manufacturers_id"]
      updated_at = parsed_json["updated_at"]
      version = parsed_json["version"]
      merchant_token = parsed_json["merchant_token"]
      new(
        type: type,
        manufacturer: manufacturer,
        model: model,
        name: name,
        manufacturers_id: manufacturers_id,
        updated_at: updated_at,
        version: version,
        merchant_token: merchant_token,
        additional_properties: struct
      )
    end
# Serialize an instance of DeviceAttributes to a JSON object
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
      obj.type.is_a?(String) != false || raise("Passed value for field obj.type is not the expected type, validation failed.")
      obj.manufacturer.is_a?(String) != false || raise("Passed value for field obj.manufacturer is not the expected type, validation failed.")
      obj.model&.is_a?(String) != false || raise("Passed value for field obj.model is not the expected type, validation failed.")
      obj.name&.is_a?(String) != false || raise("Passed value for field obj.name is not the expected type, validation failed.")
      obj.manufacturers_id&.is_a?(String) != false || raise("Passed value for field obj.manufacturers_id is not the expected type, validation failed.")
      obj.updated_at&.is_a?(String) != false || raise("Passed value for field obj.updated_at is not the expected type, validation failed.")
      obj.version&.is_a?(String) != false || raise("Passed value for field obj.version is not the expected type, validation failed.")
      obj.merchant_token&.is_a?(String) != false || raise("Passed value for field obj.merchant_token is not the expected type, validation failed.")
    end
  end
end