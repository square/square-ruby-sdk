# frozen_string_literal: true

require "ostruct"
require "json"

module ChromaApiClient
  class ErrorResponse
    # @return [String]
    attr_reader :error
    # @return [String]
    attr_reader :message
    # @return [OpenStruct] Additional properties unmapped to the current class definition
    attr_reader :additional_properties
    # @return [Object]
    attr_reader :_field_set
    protected :_field_set

    OMIT = Object.new

    # @param error [String]
    # @param message [String]
    # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
    # @return [ChromaApiClient::ErrorResponse]
    def initialize(error:, message:, additional_properties: nil)
      @error = error
      @message = message
      @additional_properties = additional_properties
      @_field_set = { "error": error, "message": message }
    end

    # Deserialize a JSON object to an instance of ErrorResponse
    #
    # @param json_object [String]
    # @return [ChromaApiClient::ErrorResponse]
    def self.from_json(json_object:)
      struct = JSON.parse(json_object, object_class: OpenStruct)
      parsed_json = JSON.parse(json_object)
      error = parsed_json["error"]
      message = parsed_json["message"]
      new(
        error: error,
        message: message,
        additional_properties: struct
      )
    end

    # Serialize an instance of ErrorResponse to a JSON object
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
      obj.error.is_a?(String) != false || raise("Passed value for field obj.error is not the expected type, validation failed.")
      obj.message.is_a?(String) != false || raise("Passed value for field obj.message is not the expected type, validation failed.")
    end
  end
end
