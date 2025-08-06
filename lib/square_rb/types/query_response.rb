# frozen_string_literal: true

require_relative "include"
require_relative "hash_map"
require "ostruct"
require "json"

module ChromaApiClient
  class QueryResponse
    # @return [Array<Array<Float>>]
    attr_reader :distances
    # @return [Array<Array<String>>]
    attr_reader :documents
    # @return [Array<Array<Array<Float>>>]
    attr_reader :embeddings
    # @return [Array<Array<String>>]
    attr_reader :ids
    # @return [Array<ChromaApiClient::Include>]
    attr_reader :include
    # @return [Array<Array<ChromaApiClient::HASH_MAP>>]
    attr_reader :metadatas
    # @return [Array<Array<String>>]
    attr_reader :uris
    # @return [OpenStruct] Additional properties unmapped to the current class definition
    attr_reader :additional_properties
    # @return [Object]
    attr_reader :_field_set
    protected :_field_set

    OMIT = Object.new

    # @param distances [Array<Array<Float>>]
    # @param documents [Array<Array<String>>]
    # @param embeddings [Array<Array<Array<Float>>>]
    # @param ids [Array<Array<String>>]
    # @param include [Array<ChromaApiClient::Include>]
    # @param metadatas [Array<Array<ChromaApiClient::HASH_MAP>>]
    # @param uris [Array<Array<String>>]
    # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
    # @return [ChromaApiClient::QueryResponse]
    def initialize(ids:, include:, distances: OMIT, documents: OMIT, embeddings: OMIT, metadatas: OMIT, uris: OMIT,
                   additional_properties: nil)
      @distances = distances if distances != OMIT
      @documents = documents if documents != OMIT
      @embeddings = embeddings if embeddings != OMIT
      @ids = ids
      @include = include
      @metadatas = metadatas if metadatas != OMIT
      @uris = uris if uris != OMIT
      @additional_properties = additional_properties
      @_field_set = {
        "distances": distances,
        "documents": documents,
        "embeddings": embeddings,
        "ids": ids,
        "include": include,
        "metadatas": metadatas,
        "uris": uris
      }.reject do |_k, v|
        v == OMIT
      end
    end

    # Deserialize a JSON object to an instance of QueryResponse
    #
    # @param json_object [String]
    # @return [ChromaApiClient::QueryResponse]
    def self.from_json(json_object:)
      struct = JSON.parse(json_object, object_class: OpenStruct)
      parsed_json = JSON.parse(json_object)
      distances = parsed_json["distances"]
      documents = parsed_json["documents"]
      embeddings = parsed_json["embeddings"]
      ids = parsed_json["ids"]
      include = parsed_json["include"]
      metadatas = parsed_json["metadatas"]&.map do |item|
        item&.map do |item|
          item = item.to_json
          item&.transform_values do |value|
            value = value.to_json
            ChromaApiClient::HashMapValue.from_json(json_object: value)
          end
        end
      end
      uris = parsed_json["uris"]
      new(
        distances: distances,
        documents: documents,
        embeddings: embeddings,
        ids: ids,
        include: include,
        metadatas: metadatas,
        uris: uris,
        additional_properties: struct
      )
    end

    # Serialize an instance of QueryResponse to a JSON object
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
      obj.distances&.is_a?(Array) != false || raise("Passed value for field obj.distances is not the expected type, validation failed.")
      obj.documents&.is_a?(Array) != false || raise("Passed value for field obj.documents is not the expected type, validation failed.")
      obj.embeddings&.is_a?(Array) != false || raise("Passed value for field obj.embeddings is not the expected type, validation failed.")
      obj.ids.is_a?(Array) != false || raise("Passed value for field obj.ids is not the expected type, validation failed.")
      obj.include.is_a?(Array) != false || raise("Passed value for field obj.include is not the expected type, validation failed.")
      obj.metadatas&.is_a?(Array) != false || raise("Passed value for field obj.metadatas is not the expected type, validation failed.")
      obj.uris&.is_a?(Array) != false || raise("Passed value for field obj.uris is not the expected type, validation failed.")
    end
  end
end
