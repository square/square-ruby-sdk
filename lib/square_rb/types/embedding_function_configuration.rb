# frozen_string_literal: true

require "json"
require_relative "embedding_function_configuration_type"
require_relative "embedding_function_configuration_one"

module ChromaApiClient
  class EmbeddingFunctionConfiguration
    # Deserialize a JSON object to an instance of EmbeddingFunctionConfiguration
    #
    # @param json_object [String]
    # @return [ChromaApiClient::EmbeddingFunctionConfiguration]
    def self.from_json(json_object:)
      struct = JSON.parse(json_object, object_class: OpenStruct)
      begin
        ChromaApiClient::EmbeddingFunctionConfigurationType.validate_raw(obj: struct)
        return ChromaApiClient::EmbeddingFunctionConfigurationType.from_json(json_object: struct) unless struct.nil?

        return nil
      rescue StandardError
        # noop
      end
      begin
        ChromaApiClient::EmbeddingFunctionConfigurationOne.validate_raw(obj: struct)
        return ChromaApiClient::EmbeddingFunctionConfigurationOne.from_json(json_object: struct) unless struct.nil?

        return nil
      rescue StandardError
        # noop
      end
      struct
    end

    # Leveraged for Union-type generation, validate_raw attempts to parse the given
    #  hash and check each fields type against the current object's property
    #  definitions.
    #
    # @param obj [Object]
    # @return [Void]
    def self.validate_raw(obj:)
      begin
        return ChromaApiClient::EmbeddingFunctionConfigurationType.validate_raw(obj: obj)
      rescue StandardError
        # noop
      end
      begin
        return ChromaApiClient::EmbeddingFunctionConfigurationOne.validate_raw(obj: obj)
      rescue StandardError
        # noop
      end
      raise("Passed value matched no type within the union, validation failed.")
    end
  end
end
