# frozen_string_literal: true

require_relative "hnsw_space"
require "ostruct"
require "json"

module ChromaApiClient
  class SpannConfiguration
    # @return [Integer]
    attr_reader :ef_construction
    # @return [Integer]
    attr_reader :ef_search
    # @return [Integer]
    attr_reader :max_neighbors
    # @return [Integer]
    attr_reader :merge_threshold
    # @return [Integer]
    attr_reader :reassign_neighbor_count
    # @return [Integer]
    attr_reader :search_nprobe
    # @return [ChromaApiClient::HnswSpace]
    attr_reader :space
    # @return [Integer]
    attr_reader :split_threshold
    # @return [Integer]
    attr_reader :write_nprobe
    # @return [OpenStruct] Additional properties unmapped to the current class definition
    attr_reader :additional_properties
    # @return [Object]
    attr_reader :_field_set
    protected :_field_set

    OMIT = Object.new

    # @param ef_construction [Integer]
    # @param ef_search [Integer]
    # @param max_neighbors [Integer]
    # @param merge_threshold [Integer]
    # @param reassign_neighbor_count [Integer]
    # @param search_nprobe [Integer]
    # @param space [ChromaApiClient::HnswSpace]
    # @param split_threshold [Integer]
    # @param write_nprobe [Integer]
    # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
    # @return [ChromaApiClient::SpannConfiguration]
    def initialize(ef_construction: OMIT, ef_search: OMIT, max_neighbors: OMIT, merge_threshold: OMIT,
                   reassign_neighbor_count: OMIT, search_nprobe: OMIT, space: OMIT, split_threshold: OMIT, write_nprobe: OMIT, additional_properties: nil)
      @ef_construction = ef_construction if ef_construction != OMIT
      @ef_search = ef_search if ef_search != OMIT
      @max_neighbors = max_neighbors if max_neighbors != OMIT
      @merge_threshold = merge_threshold if merge_threshold != OMIT
      @reassign_neighbor_count = reassign_neighbor_count if reassign_neighbor_count != OMIT
      @search_nprobe = search_nprobe if search_nprobe != OMIT
      @space = space if space != OMIT
      @split_threshold = split_threshold if split_threshold != OMIT
      @write_nprobe = write_nprobe if write_nprobe != OMIT
      @additional_properties = additional_properties
      @_field_set = {
        "ef_construction": ef_construction,
        "ef_search": ef_search,
        "max_neighbors": max_neighbors,
        "merge_threshold": merge_threshold,
        "reassign_neighbor_count": reassign_neighbor_count,
        "search_nprobe": search_nprobe,
        "space": space,
        "split_threshold": split_threshold,
        "write_nprobe": write_nprobe
      }.reject do |_k, v|
        v == OMIT
      end
    end

    # Deserialize a JSON object to an instance of SpannConfiguration
    #
    # @param json_object [String]
    # @return [ChromaApiClient::SpannConfiguration]
    def self.from_json(json_object:)
      struct = JSON.parse(json_object, object_class: OpenStruct)
      parsed_json = JSON.parse(json_object)
      ef_construction = parsed_json["ef_construction"]
      ef_search = parsed_json["ef_search"]
      max_neighbors = parsed_json["max_neighbors"]
      merge_threshold = parsed_json["merge_threshold"]
      reassign_neighbor_count = parsed_json["reassign_neighbor_count"]
      search_nprobe = parsed_json["search_nprobe"]
      space = parsed_json["space"]
      split_threshold = parsed_json["split_threshold"]
      write_nprobe = parsed_json["write_nprobe"]
      new(
        ef_construction: ef_construction,
        ef_search: ef_search,
        max_neighbors: max_neighbors,
        merge_threshold: merge_threshold,
        reassign_neighbor_count: reassign_neighbor_count,
        search_nprobe: search_nprobe,
        space: space,
        split_threshold: split_threshold,
        write_nprobe: write_nprobe,
        additional_properties: struct
      )
    end

    # Serialize an instance of SpannConfiguration to a JSON object
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
      obj.merge_threshold&.is_a?(Integer) != false || raise("Passed value for field obj.merge_threshold is not the expected type, validation failed.")
      obj.reassign_neighbor_count&.is_a?(Integer) != false || raise("Passed value for field obj.reassign_neighbor_count is not the expected type, validation failed.")
      obj.search_nprobe&.is_a?(Integer) != false || raise("Passed value for field obj.search_nprobe is not the expected type, validation failed.")
      obj.space&.is_a?(ChromaApiClient::HnswSpace) != false || raise("Passed value for field obj.space is not the expected type, validation failed.")
      obj.split_threshold&.is_a?(Integer) != false || raise("Passed value for field obj.split_threshold is not the expected type, validation failed.")
      obj.write_nprobe&.is_a?(Integer) != false || raise("Passed value for field obj.write_nprobe is not the expected type, validation failed.")
    end
  end
end
