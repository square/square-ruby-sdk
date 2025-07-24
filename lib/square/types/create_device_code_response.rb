# frozen_string_literal: true
require_relative "error"
require_relative "device_code"
require "ostruct"
require "json"

module square.rb
  class CreateDeviceCodeResponse
  # @return [Array<square.rb::Error>] Any errors that occurred during the request.
    attr_reader :errors
  # @return [square.rb::DeviceCode] The created DeviceCode object containing the device code string.
    attr_reader :device_code
  # @return [OpenStruct] Additional properties unmapped to the current class definition
    attr_reader :additional_properties
  # @return [Object] 
    attr_reader :_field_set
    protected :_field_set

    OMIT = Object.new

    # @param errors [Array<square.rb::Error>] Any errors that occurred during the request.
    # @param device_code [square.rb::DeviceCode] The created DeviceCode object containing the device code string.
    # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
    # @return [square.rb::CreateDeviceCodeResponse]
    def initialize(errors: OMIT, device_code: OMIT, additional_properties: nil)
      @errors = errors if errors != OMIT
      @device_code = device_code if device_code != OMIT
      @additional_properties = additional_properties
      @_field_set = { "errors": errors, "device_code": device_code }.reject do | _k, v |
  v == OMIT
end
    end
# Deserialize a JSON object to an instance of CreateDeviceCodeResponse
    #
    # @param json_object [String] 
    # @return [square.rb::CreateDeviceCodeResponse]
    def self.from_json(json_object:)
      struct = JSON.parse(json_object, object_class: OpenStruct)
      parsed_json = JSON.parse(json_object)
      errors = parsed_json["errors"]&.map do | item |
  item = item.to_json
  square.rb::Error.from_json(json_object: item)
end
      unless parsed_json["device_code"].nil?
        device_code = parsed_json["device_code"].to_json
        device_code = square.rb::DeviceCode.from_json(json_object: device_code)
      else
        device_code = nil
      end
      new(
        errors: errors,
        device_code: device_code,
        additional_properties: struct
      )
    end
# Serialize an instance of CreateDeviceCodeResponse to a JSON object
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
      obj.errors&.is_a?(Array) != false || raise("Passed value for field obj.errors is not the expected type, validation failed.")
      obj.device_code.nil? || square.rb::DeviceCode.validate_raw(obj: obj.device_code)
    end
  end
end