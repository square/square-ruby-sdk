# frozen_string_literal: true

require "ostruct"
require "json"

module ChromaApiClient
  class EmbeddingFunctionNewConfiguration
    # @return [Object]
    attr_reader :config
    # @return [String]
    attr_reader :name
    # @return [OpenStruct] Additional properties unmapped to the current class definition
    attr_reader :additional_properties
    # @return [Object]
    attr_reader :_field_set
    protected :_field_set

    OMIT = Object.new

    # @param config [Object]
    # @param name [String]
    # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
    # @return [ChromaApiClient::EmbeddingFunctionNewConfiguration]
    def initialize(config:, name:, additional_properties: nil)
      @config = config
      @name = name
      @additional_properties = additional_properties
      @_field_set = { "config": config, "name": name }
    end

    # Deserialize a JSON object to an instance of EmbeddingFunctionNewConfiguration
    #
    # @param json_object [String]
    # @return [ChromaApiClient::EmbeddingFunctionNewConfiguration]
    def self.from_json(json_object:)
      struct = JSON.parse(json_object, object_class: OpenStruct)
      parsed_json = JSON.parse(json_object)
      config = parsed_json["config"]
      name = parsed_json["name"]
      new(
        config: config,
        name: name,
        additional_properties: struct
      )
    end

    # Serialize an instance of EmbeddingFunctionNewConfiguration to a JSON object
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
      obj.config.is_a?(Object) != false || raise("Passed value for field obj.config is not the expected type, validation failed.")
      obj.name.is_a?(String) != false || raise("Passed value for field obj.name is not the expected type, validation failed.")
    end
  end
end
