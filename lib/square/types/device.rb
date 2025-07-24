# frozen_string_literal: true
require_relative "device_attributes"
require_relative "component"
require_relative "device_status"
require "ostruct"
require "json"

module square.rb
  class Device
  # @return [String] A synthetic identifier for the device. The identifier includes a standardized
#  prefix and
#  is otherwise an opaque id generated from key device fields.
    attr_reader :id
  # @return [square.rb::DeviceAttributes] A collection of DeviceAttributes representing the device.
    attr_reader :attributes
  # @return [Array<square.rb::Component>] A list of components applicable to the device.
    attr_reader :components
  # @return [square.rb::DeviceStatus] The current status of the device.
    attr_reader :status
  # @return [OpenStruct] Additional properties unmapped to the current class definition
    attr_reader :additional_properties
  # @return [Object] 
    attr_reader :_field_set
    protected :_field_set

    OMIT = Object.new

    # @param id [String] A synthetic identifier for the device. The identifier includes a standardized
#  prefix and
#  is otherwise an opaque id generated from key device fields.
    # @param attributes [square.rb::DeviceAttributes] A collection of DeviceAttributes representing the device.
    # @param components [Array<square.rb::Component>] A list of components applicable to the device.
    # @param status [square.rb::DeviceStatus] The current status of the device.
    # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
    # @return [square.rb::Device]
    def initialize(id: OMIT, attributes:, components: OMIT, status: OMIT, additional_properties: nil)
      @id = id if id != OMIT
      @attributes = attributes
      @components = components if components != OMIT
      @status = status if status != OMIT
      @additional_properties = additional_properties
      @_field_set = { "id": id, "attributes": attributes, "components": components, "status": status }.reject do | _k, v |
  v == OMIT
end
    end
# Deserialize a JSON object to an instance of Device
    #
    # @param json_object [String] 
    # @return [square.rb::Device]
    def self.from_json(json_object:)
      struct = JSON.parse(json_object, object_class: OpenStruct)
      parsed_json = JSON.parse(json_object)
      id = parsed_json["id"]
      unless parsed_json["attributes"].nil?
        attributes = parsed_json["attributes"].to_json
        attributes = square.rb::DeviceAttributes.from_json(json_object: attributes)
      else
        attributes = nil
      end
      components = parsed_json["components"]&.map do | item |
  item = item.to_json
  square.rb::Component.from_json(json_object: item)
end
      unless parsed_json["status"].nil?
        status = parsed_json["status"].to_json
        status = square.rb::DeviceStatus.from_json(json_object: status)
      else
        status = nil
      end
      new(
        id: id,
        attributes: attributes,
        components: components,
        status: status,
        additional_properties: struct
      )
    end
# Serialize an instance of Device to a JSON object
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
      square.rb::DeviceAttributes.validate_raw(obj: obj.attributes)
      obj.components&.is_a?(Array) != false || raise("Passed value for field obj.components is not the expected type, validation failed.")
      obj.status.nil? || square.rb::DeviceStatus.validate_raw(obj: obj.status)
    end
  end
end