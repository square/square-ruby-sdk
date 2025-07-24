# frozen_string_literal: true
require_relative "product_type"
require_relative "device_code_status"
require "ostruct"
require "json"

module square.rb
  class DeviceCode
  # @return [String] The unique id for this device code.
    attr_reader :id
  # @return [String] An optional user-defined name for the device code.
    attr_reader :name
  # @return [String] The unique code that can be used to login.
    attr_reader :code
  # @return [String] The unique id of the device that used this code. Populated when the device is
#  paired up.
    attr_reader :device_id
  # @return [square.rb::PRODUCT_TYPE] The targeting product type of the device code.
    attr_reader :product_type
  # @return [String] The location assigned to this code.
    attr_reader :location_id
  # @return [square.rb::DeviceCodeStatus] The pairing status of the device code.
#  See [DeviceCodeStatus](#type-devicecodestatus) for possible values
    attr_reader :status
  # @return [String] When this DeviceCode will expire and no longer login. Timestamp in RFC 3339
#  format.
    attr_reader :pair_by
  # @return [String] When this DeviceCode was created. Timestamp in RFC 3339 format.
    attr_reader :created_at
  # @return [String] When this DeviceCode's status was last changed. Timestamp in RFC 3339 format.
    attr_reader :status_changed_at
  # @return [String] When this DeviceCode was paired. Timestamp in RFC 3339 format.
    attr_reader :paired_at
  # @return [OpenStruct] Additional properties unmapped to the current class definition
    attr_reader :additional_properties
  # @return [Object] 
    attr_reader :_field_set
    protected :_field_set

    OMIT = Object.new

    # @param id [String] The unique id for this device code.
    # @param name [String] An optional user-defined name for the device code.
    # @param code [String] The unique code that can be used to login.
    # @param device_id [String] The unique id of the device that used this code. Populated when the device is
#  paired up.
    # @param product_type [square.rb::PRODUCT_TYPE] The targeting product type of the device code.
    # @param location_id [String] The location assigned to this code.
    # @param status [square.rb::DeviceCodeStatus] The pairing status of the device code.
#  See [DeviceCodeStatus](#type-devicecodestatus) for possible values
    # @param pair_by [String] When this DeviceCode will expire and no longer login. Timestamp in RFC 3339
#  format.
    # @param created_at [String] When this DeviceCode was created. Timestamp in RFC 3339 format.
    # @param status_changed_at [String] When this DeviceCode's status was last changed. Timestamp in RFC 3339 format.
    # @param paired_at [String] When this DeviceCode was paired. Timestamp in RFC 3339 format.
    # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
    # @return [square.rb::DeviceCode]
    def initialize(id: OMIT, name: OMIT, code: OMIT, device_id: OMIT, product_type:, location_id: OMIT, status: OMIT, pair_by: OMIT, created_at: OMIT, status_changed_at: OMIT, paired_at: OMIT, additional_properties: nil)
      @id = id if id != OMIT
      @name = name if name != OMIT
      @code = code if code != OMIT
      @device_id = device_id if device_id != OMIT
      @product_type = product_type
      @location_id = location_id if location_id != OMIT
      @status = status if status != OMIT
      @pair_by = pair_by if pair_by != OMIT
      @created_at = created_at if created_at != OMIT
      @status_changed_at = status_changed_at if status_changed_at != OMIT
      @paired_at = paired_at if paired_at != OMIT
      @additional_properties = additional_properties
      @_field_set = { "id": id, "name": name, "code": code, "device_id": device_id, "product_type": product_type, "location_id": location_id, "status": status, "pair_by": pair_by, "created_at": created_at, "status_changed_at": status_changed_at, "paired_at": paired_at }.reject do | _k, v |
  v == OMIT
end
    end
# Deserialize a JSON object to an instance of DeviceCode
    #
    # @param json_object [String] 
    # @return [square.rb::DeviceCode]
    def self.from_json(json_object:)
      struct = JSON.parse(json_object, object_class: OpenStruct)
      parsed_json = JSON.parse(json_object)
      id = parsed_json["id"]
      name = parsed_json["name"]
      code = parsed_json["code"]
      device_id = parsed_json["device_id"]
      product_type = parsed_json["product_type"]
      location_id = parsed_json["location_id"]
      status = parsed_json["status"]
      pair_by = parsed_json["pair_by"]
      created_at = parsed_json["created_at"]
      status_changed_at = parsed_json["status_changed_at"]
      paired_at = parsed_json["paired_at"]
      new(
        id: id,
        name: name,
        code: code,
        device_id: device_id,
        product_type: product_type,
        location_id: location_id,
        status: status,
        pair_by: pair_by,
        created_at: created_at,
        status_changed_at: status_changed_at,
        paired_at: paired_at,
        additional_properties: struct
      )
    end
# Serialize an instance of DeviceCode to a JSON object
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
      obj.id&.is_a?(String) != false || raise("Passed value for field obj.id is not the expected type, validation failed.")
      obj.name&.is_a?(String) != false || raise("Passed value for field obj.name is not the expected type, validation failed.")
      obj.code&.is_a?(String) != false || raise("Passed value for field obj.code is not the expected type, validation failed.")
      obj.device_id&.is_a?(String) != false || raise("Passed value for field obj.device_id is not the expected type, validation failed.")
      obj.product_type.is_a?(String) != false || raise("Passed value for field obj.product_type is not the expected type, validation failed.")
      obj.location_id&.is_a?(String) != false || raise("Passed value for field obj.location_id is not the expected type, validation failed.")
      obj.status&.is_a?(square.rb::DeviceCodeStatus) != false || raise("Passed value for field obj.status is not the expected type, validation failed.")
      obj.pair_by&.is_a?(String) != false || raise("Passed value for field obj.pair_by is not the expected type, validation failed.")
      obj.created_at&.is_a?(String) != false || raise("Passed value for field obj.created_at is not the expected type, validation failed.")
      obj.status_changed_at&.is_a?(String) != false || raise("Passed value for field obj.status_changed_at is not the expected type, validation failed.")
      obj.paired_at&.is_a?(String) != false || raise("Passed value for field obj.paired_at is not the expected type, validation failed.")
    end
  end
end