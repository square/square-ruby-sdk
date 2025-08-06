# frozen_string_literal: true

require_relative "hnsw_space"
require "ostruct"
require "json"

module ChromaApiClient
  class HnswConfiguration
    # @return [Integer]
    attr_reader :ef_construction
    # @return [Integer]
    attr_reader :ef_search
    # @return [Integer]
    attr_reader :max_neighbors
    # @return [Float]
    attr_reader :resize_factor
    # @return [ChromaApiClient::HnswSpace]
    attr_reader :space
    # @return [Integer]
    attr_reader :sync_threshold
    # @return [OpenStruct] Additional properties unmapped to the current class definition
    attr_reader :additional_properties
    # @return [Object]
    attr_reader :_field_set
    protected :_field_set

    OMIT = Object.new

    # @param ef_construction [Integer]
    # @param ef_search [Integer]
    # @param max_neighbors [Integer]
    # @param resize_factor [Float]
    # @param space [ChromaApiClient::HnswSpace]
    # @param sync_threshold [Integer]
    # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
    # @return [ChromaApiClient::HnswConfiguration]
    def initialize(ef_construction: OMIT, ef_search: OMIT, max_neighbors: OMIT, resize_factor: OMIT, space: OMIT,
                   sync_threshold: OMIT, additional_properties: nil)
      @ef_construction = ef_construction if ef_construction != OMIT
      @ef_search = ef_search if ef_search != OMIT
      @max_neighbors = max_neighbors if max_neighbors != OMIT
      @resize_factor = resize_factor if resize_factor != OMIT
      @space = space if space != OMIT
      @sync_threshold = sync_threshold if sync_threshold != OMIT
      @additional_properties = additional_properties
      @_field_set = {
        "ef_construction": ef_construction,
        "ef_search": ef_search,
        "max_neighbors": max_neighbors,
        "resize_factor": resize_factor,
        "space": space,
        "sync_threshold": sync_threshold
      }.reject do |_k, v|
        v == OMIT
      end
    end

    # Deserialize a JSON object to an instance of HnswConfiguration
    #
    # @param json_object [String]
    # @return [ChromaApiClient::HnswConfiguration]
    def self.from_json(json_object:)
      struct = JSON.parse(json_object, object_class: OpenStruct)
      parsed_json = JSON.parse(json_object)
      ef_construction = parsed_json["ef_construction"]
      ef_search = parsed_json["ef_search"]
      max_neighbors = parsed_json["max_neighbors"]
      resize_factor = parsed_json["resize_factor"]
      space = parsed_json["space"]
      sync_threshold = parsed_json["sync_threshold"]
      new(
        ef_construction: ef_construction,
        ef_search: ef_search,
        max_neighbors: max_neighbors,
        resize_factor: resize_factor,
        space: space,
        sync_threshold: sync_threshold,
        additional_properties: struct
      )
    end

    # Serialize an instance of HnswConfiguration to a JSON object
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
      obj.ef_construction&.is_a?(Integer) != false || raise("Passed value for field obj.ef_construction is not the expected type, validation failed.")
      obj.ef_search&.is_a?(Integer) != false || raise("Passed value for field obj.ef_search is not the expected type, validation failed.")
      obj.max_neighbors&.is_a?(Integer) != false || raise("Passed value for field obj.max_neighbors is not the expected type, validation failed.")
      obj.resize_factor&.is_a?(Float) != false || raise("Passed value for field obj.resize_factor is not the expected type, validation failed.")
      obj.space&.is_a?(ChromaApiClient::HnswSpace) != false || raise("Passed value for field obj.space is not the expected type, validation failed.")
      obj.sync_threshold&.is_a?(Integer) != false || raise("Passed value for field obj.sync_threshold is not the expected type, validation failed.")
    end
  end
end
