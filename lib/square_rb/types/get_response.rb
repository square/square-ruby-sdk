# frozen_string_literal: true

require_relative "include"
require_relative "hash_map"
require "ostruct"
require "json"

module ChromaApiClient
  class GetResponse
    # @return [Array<String>]
    attr_reader :documents
    # @return [Array<Array<Float>>]
    attr_reader :embeddings
    # @return [Array<String>]
    attr_reader :ids
    # @return [Array<ChromaApiClient::Include>]
    attr_reader :include
    # @return [Array<ChromaApiClient::HASH_MAP>]
    attr_reader :metadatas
    # @return [Array<String>]
    attr_reader :uris
    # @return [OpenStruct] Additional properties unmapped to the current class definition
    attr_reader :additional_properties
    # @return [Object]
    attr_reader :_field_set
    protected :_field_set

    OMIT = Object.new

    # @param documents [Array<String>]
    # @param embeddings [Array<Array<Float>>]
    # @param ids [Array<String>]
    # @param include [Array<ChromaApiClient::Include>]
    # @param metadatas [Array<ChromaApiClient::HASH_MAP>]
    # @param uris [Array<String>]
    # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
    # @return [ChromaApiClient::GetResponse]
    def initialize(ids:, include:, documents: OMIT, embeddings: OMIT, metadatas: OMIT, uris: OMIT,
                   additional_properties: nil)
      @documents = documents if documents != OMIT
      @embeddings = embeddings if embeddings != OMIT
      @ids = ids
      @include = include
      @metadatas = metadatas if metadatas != OMIT
      @uris = uris if uris != OMIT
      @additional_properties = additional_properties
      @_field_set = {
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

    # Deserialize a JSON object to an instance of GetResponse
    #
    # @param json_object [String]
    # @return [ChromaApiClient::GetResponse]
    def self.from_json(json_object:)
      struct = JSON.parse(json_object, object_class: OpenStruct)
      parsed_json = JSON.parse(json_object)
      documents = parsed_json["documents"]
      embeddings = parsed_json["embeddings"]
      ids = parsed_json["ids"]
      include = parsed_json["include"]
      metadatas = parsed_json["metadatas"]&.map do |item|
        item = item.to_json
        item&.transform_values do |value|
          value = value.to_json
          ChromaApiClient::HashMapValue.from_json(json_object: value)
        end
      end
      uris = parsed_json["uris"]
      new(
        documents: documents,
        embeddings: embeddings,
        ids: ids,
        include: include,
        metadatas: metadatas,
        uris: uris,
        additional_properties: struct
      )
    end

    # Serialize an instance of GetResponse to a JSON object
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
      obj.documents&.is_a?(Array) != false || raise("Passed value for field obj.documents is not the expected type, validation failed.")
      obj.embeddings&.is_a?(Array) != false || raise("Passed value for field obj.embeddings is not the expected type, validation failed.")
      obj.ids.is_a?(Array) != false || raise("Passed value for field obj.ids is not the expected type, validation failed.")
      obj.include.is_a?(Array) != false || raise("Passed value for field obj.include is not the expected type, validation failed.")
      obj.metadatas&.is_a?(Array) != false || raise("Passed value for field obj.metadatas is not the expected type, validation failed.")
      obj.uris&.is_a?(Array) != false || raise("Passed value for field obj.uris is not the expected type, validation failed.")
    end
  end
end
