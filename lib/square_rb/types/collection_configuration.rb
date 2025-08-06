# frozen_string_literal: true

require_relative "embedding_function_configuration"
require_relative "hnsw_configuration"
require_relative "spann_configuration"
require "ostruct"
require "json"

module ChromaApiClient
  class CollectionConfiguration
    # @return [ChromaApiClient::EmbeddingFunctionConfiguration]
    attr_reader :embedding_function
    # @return [ChromaApiClient::HnswConfiguration]
    attr_reader :hnsw
    # @return [ChromaApiClient::SpannConfiguration]
    attr_reader :spann
    # @return [OpenStruct] Additional properties unmapped to the current class definition
    attr_reader :additional_properties
    # @return [Object]
    attr_reader :_field_set
    protected :_field_set

    OMIT = Object.new

    # @param embedding_function [ChromaApiClient::EmbeddingFunctionConfiguration]
    # @param hnsw [ChromaApiClient::HnswConfiguration]
    # @param spann [ChromaApiClient::SpannConfiguration]
    # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
    # @return [ChromaApiClient::CollectionConfiguration]
    def initialize(embedding_function: OMIT, hnsw: OMIT, spann: OMIT, additional_properties: nil)
      @embedding_function = embedding_function if embedding_function != OMIT
      @hnsw = hnsw if hnsw != OMIT
      @spann = spann if spann != OMIT
      @additional_properties = additional_properties
      @_field_set = { "embedding_function": embedding_function, "hnsw": hnsw, "spann": spann }.reject do |_k, v|
        v == OMIT
      end
    end

    # Deserialize a JSON object to an instance of CollectionConfiguration
    #
    # @param json_object [String]
    # @return [ChromaApiClient::CollectionConfiguration]
    def self.from_json(json_object:)
      struct = JSON.parse(json_object, object_class: OpenStruct)
      parsed_json = JSON.parse(json_object)
      if parsed_json["embedding_function"].nil?
        embedding_function = nil
      else
        embedding_function = parsed_json["embedding_function"].to_json
        embedding_function = ChromaApiClient::EmbeddingFunctionConfiguration.from_json(json_object: embedding_function)
      end
      if parsed_json["hnsw"].nil?
        hnsw = nil
      else
        hnsw = parsed_json["hnsw"].to_json
        hnsw = ChromaApiClient::HnswConfiguration.from_json(json_object: hnsw)
      end
      if parsed_json["spann"].nil?
        spann = nil
      else
        spann = parsed_json["spann"].to_json
        spann = ChromaApiClient::SpannConfiguration.from_json(json_object: spann)
      end
      new(
        embedding_function: embedding_function,
        hnsw: hnsw,
        spann: spann,
        additional_properties: struct
      )
    end

    # Serialize an instance of CollectionConfiguration to a JSON object
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
      obj.embedding_function.nil? || ChromaApiClient::EmbeddingFunctionConfiguration.validate_raw(obj: obj.embedding_function)
      obj.hnsw.nil? || ChromaApiClient::HnswConfiguration.validate_raw(obj: obj.hnsw)
      obj.spann.nil? || ChromaApiClient::SpannConfiguration.validate_raw(obj: obj.spann)
    end
  end
end
