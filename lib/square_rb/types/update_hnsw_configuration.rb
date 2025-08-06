# frozen_string_literal: true

require "ostruct"
require "json"

module ChromaApiClient
  class UpdateHnswConfiguration
    # @return [Integer]
    attr_reader :batch_size
    # @return [Integer]
    attr_reader :ef_search
    # @return [Integer]
    attr_reader :max_neighbors
    # @return [Integer]
    attr_reader :num_threads
    # @return [Float]
    attr_reader :resize_factor
    # @return [Integer]
    attr_reader :sync_threshold
    # @return [OpenStruct] Additional properties unmapped to the current class definition
    attr_reader :additional_properties
    # @return [Object]
    attr_reader :_field_set
    protected :_field_set

    OMIT = Object.new

    # @param batch_size [Integer]
    # @param ef_search [Integer]
    # @param max_neighbors [Integer]
    # @param num_threads [Integer]
    # @param resize_factor [Float]
    # @param sync_threshold [Integer]
    # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
    # @return [ChromaApiClient::UpdateHnswConfiguration]
    def initialize(batch_size: OMIT, ef_search: OMIT, max_neighbors: OMIT, num_threads: OMIT, resize_factor: OMIT,
                   sync_threshold: OMIT, additional_properties: nil)
      @batch_size = batch_size if batch_size != OMIT
      @ef_search = ef_search if ef_search != OMIT
      @max_neighbors = max_neighbors if max_neighbors != OMIT
      @num_threads = num_threads if num_threads != OMIT
      @resize_factor = resize_factor if resize_factor != OMIT
      @sync_threshold = sync_threshold if sync_threshold != OMIT
      @additional_properties = additional_properties
      @_field_set = {
        "batch_size": batch_size,
        "ef_search": ef_search,
        "max_neighbors": max_neighbors,
        "num_threads": num_threads,
        "resize_factor": resize_factor,
        "sync_threshold": sync_threshold
      }.reject do |_k, v|
        v == OMIT
      end
    end

    # Deserialize a JSON object to an instance of UpdateHnswConfiguration
    #
    # @param json_object [String]
    # @return [ChromaApiClient::UpdateHnswConfiguration]
    def self.from_json(json_object:)
      struct = JSON.parse(json_object, object_class: OpenStruct)
      parsed_json = JSON.parse(json_object)
      batch_size = parsed_json["batch_size"]
      ef_search = parsed_json["ef_search"]
      max_neighbors = parsed_json["max_neighbors"]
      num_threads = parsed_json["num_threads"]
      resize_factor = parsed_json["resize_factor"]
      sync_threshold = parsed_json["sync_threshold"]
      new(
        batch_size: batch_size,
        ef_search: ef_search,
        max_neighbors: max_neighbors,
        num_threads: num_threads,
        resize_factor: resize_factor,
        sync_threshold: sync_threshold,
        additional_properties: struct
      )
    end

    # Serialize an instance of UpdateHnswConfiguration to a JSON object
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
      obj.batch_size&.is_a?(Integer) != false || raise("Passed value for field obj.batch_size is not the expected type, validation failed.")
      obj.ef_search&.is_a?(Integer) != false || raise("Passed value for field obj.ef_search is not the expected type, validation failed.")
      obj.max_neighbors&.is_a?(Integer) != false || raise("Passed value for field obj.max_neighbors is not the expected type, validation failed.")
      obj.num_threads&.is_a?(Integer) != false || raise("Passed value for field obj.num_threads is not the expected type, validation failed.")
      obj.resize_factor&.is_a?(Float) != false || raise("Passed value for field obj.resize_factor is not the expected type, validation failed.")
      obj.sync_threshold&.is_a?(Integer) != false || raise("Passed value for field obj.sync_threshold is not the expected type, validation failed.")
    end
  end
end
