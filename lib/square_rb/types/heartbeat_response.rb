# frozen_string_literal: true

require "ostruct"
require "json"

module ChromaApiClient
  class HeartbeatResponse
    # @return [Integer]
    attr_reader :nanosecond_heartbeat
    # @return [OpenStruct] Additional properties unmapped to the current class definition
    attr_reader :additional_properties
    # @return [Object]
    attr_reader :_field_set
    protected :_field_set

    OMIT = Object.new

    # @param nanosecond_heartbeat [Integer]
    # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
    # @return [ChromaApiClient::HeartbeatResponse]
    def initialize(nanosecond_heartbeat:, additional_properties: nil)
      @nanosecond_heartbeat = nanosecond_heartbeat
      @additional_properties = additional_properties
      @_field_set = { "nanosecond heartbeat": nanosecond_heartbeat }
    end

    # Deserialize a JSON object to an instance of HeartbeatResponse
    #
    # @param json_object [String]
    # @return [ChromaApiClient::HeartbeatResponse]
    def self.from_json(json_object:)
      struct = JSON.parse(json_object, object_class: OpenStruct)
      parsed_json = JSON.parse(json_object)
      nanosecond_heartbeat = parsed_json["nanosecond heartbeat"]
      new(nanosecond_heartbeat: nanosecond_heartbeat, additional_properties: struct)
    end

    # Serialize an instance of HeartbeatResponse to a JSON object
    #
    # @return [String]
    def to_json(*_args)
      @_field_set&.to_json
    end

    # Leveraged for Union-type generation, validate_raw attempts to parse the given
    #  hash and check each fields type against the current object's property
    #  definitions.
    #
    # @param obj [Object]
    # @return [Void]
    def self.validate_raw(obj:)
      obj.nanosecond_heartbeat.is_a?(Integer) != false || raise("Passed value for field obj.nanosecond_heartbeat is not the expected type, validation failed.")
    end
  end
end
