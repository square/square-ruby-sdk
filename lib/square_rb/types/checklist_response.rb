# frozen_string_literal: true

require "ostruct"
require "json"

module ChromaApiClient
  class ChecklistResponse
    # @return [Integer]
    attr_reader :max_batch_size
    # @return [Boolean]
    attr_reader :supports_base_64_encoding
    # @return [OpenStruct] Additional properties unmapped to the current class definition
    attr_reader :additional_properties
    # @return [Object]
    attr_reader :_field_set
    protected :_field_set

    OMIT = Object.new

    # @param max_batch_size [Integer]
    # @param supports_base_64_encoding [Boolean]
    # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
    # @return [ChromaApiClient::ChecklistResponse]
    def initialize(max_batch_size:, supports_base_64_encoding:, additional_properties: nil)
      @max_batch_size = max_batch_size
      @supports_base_64_encoding = supports_base_64_encoding
      @additional_properties = additional_properties
      @_field_set = { "max_batch_size": max_batch_size, "supports_base64_encoding": supports_base_64_encoding }
    end

    # Deserialize a JSON object to an instance of ChecklistResponse
    #
    # @param json_object [String]
    # @return [ChromaApiClient::ChecklistResponse]
    def self.from_json(json_object:)
      struct = JSON.parse(json_object, object_class: OpenStruct)
      parsed_json = JSON.parse(json_object)
      max_batch_size = parsed_json["max_batch_size"]
      supports_base_64_encoding = parsed_json["supports_base64_encoding"]
      new(
        max_batch_size: max_batch_size,
        supports_base_64_encoding: supports_base_64_encoding,
        additional_properties: struct
      )
    end

    # Serialize an instance of ChecklistResponse to a JSON object
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
      obj.max_batch_size.is_a?(Integer) != false || raise("Passed value for field obj.max_batch_size is not the expected type, validation failed.")
      obj.supports_base_64_encoding.is_a?(Boolean) != false || raise("Passed value for field obj.supports_base_64_encoding is not the expected type, validation failed.")
    end
  end
end
