# frozen_string_literal: true
require_relative "application_type"
require "ostruct"
require "json"

module square.rb
  class DeviceComponentDetailsApplicationDetails
  # @return [square.rb::APPLICATION_TYPE] The type of application.
#  See [ApplicationType](#type-applicationtype) for possible values
    attr_reader :application_type
  # @return [String] The version of the application.
    attr_reader :version
  # @return [String] The location_id of the session for the application.
    attr_reader :session_location
  # @return [String] The id of the device code that was used to log in to the device.
    attr_reader :device_code_id
  # @return [OpenStruct] Additional properties unmapped to the current class definition
    attr_reader :additional_properties
  # @return [Object] 
    attr_reader :_field_set
    protected :_field_set

    OMIT = Object.new

    # @param application_type [square.rb::APPLICATION_TYPE] The type of application.
#  See [ApplicationType](#type-applicationtype) for possible values
    # @param version [String] The version of the application.
    # @param session_location [String] The location_id of the session for the application.
    # @param device_code_id [String] The id of the device code that was used to log in to the device.
    # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
    # @return [square.rb::DeviceComponentDetailsApplicationDetails]
    def initialize(application_type: OMIT, version: OMIT, session_location: OMIT, device_code_id: OMIT, additional_properties: nil)
      @application_type = application_type if application_type != OMIT
      @version = version if version != OMIT
      @session_location = session_location if session_location != OMIT
      @device_code_id = device_code_id if device_code_id != OMIT
      @additional_properties = additional_properties
      @_field_set = { "application_type": application_type, "version": version, "session_location": session_location, "device_code_id": device_code_id }.reject do | _k, v |
  v == OMIT
end
    end
# Deserialize a JSON object to an instance of
#  DeviceComponentDetailsApplicationDetails
    #
    # @param json_object [String] 
    # @return [square.rb::DeviceComponentDetailsApplicationDetails]
    def self.from_json(json_object:)
      struct = JSON.parse(json_object, object_class: OpenStruct)
      parsed_json = JSON.parse(json_object)
      application_type = parsed_json["application_type"]
      version = parsed_json["version"]
      session_location = parsed_json["session_location"]
      device_code_id = parsed_json["device_code_id"]
      new(
        application_type: application_type,
        version: version,
        session_location: session_location,
        device_code_id: device_code_id,
        additional_properties: struct
      )
    end
# Serialize an instance of DeviceComponentDetailsApplicationDetails to a JSON
#  object
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
      obj.application_type&.is_a?(String) != false || raise("Passed value for field obj.application_type is not the expected type, validation failed.")
      obj.version&.is_a?(String) != false || raise("Passed value for field obj.version is not the expected type, validation failed.")
      obj.session_location&.is_a?(String) != false || raise("Passed value for field obj.session_location is not the expected type, validation failed.")
      obj.device_code_id&.is_a?(String) != false || raise("Passed value for field obj.device_code_id is not the expected type, validation failed.")
    end
  end
end