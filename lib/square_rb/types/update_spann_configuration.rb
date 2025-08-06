# frozen_string_literal: true

require "ostruct"
require "json"

module ChromaApiClient
  class UpdateSpannConfiguration
    # @return [Integer]
    attr_reader :ef_search
    # @return [Integer]
    attr_reader :search_nprobe
    # @return [OpenStruct] Additional properties unmapped to the current class definition
    attr_reader :additional_properties
    # @return [Object]
    attr_reader :_field_set
    protected :_field_set

    OMIT = Object.new

    # @param ef_search [Integer]
    # @param search_nprobe [Integer]
    # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
    # @return [ChromaApiClient::UpdateSpannConfiguration]
    def initialize(ef_search: OMIT, search_nprobe: OMIT, additional_properties: nil)
      @ef_search = ef_search if ef_search != OMIT
      @search_nprobe = search_nprobe if search_nprobe != OMIT
      @additional_properties = additional_properties
      @_field_set = { "ef_search": ef_search, "search_nprobe": search_nprobe }.reject do |_k, v|
        v == OMIT
      end
    end

    # Deserialize a JSON object to an instance of UpdateSpannConfiguration
    #
    # @param json_object [String]
    # @return [ChromaApiClient::UpdateSpannConfiguration]
    def self.from_json(json_object:)
      struct = JSON.parse(json_object, object_class: OpenStruct)
      parsed_json = JSON.parse(json_object)
      ef_search = parsed_json["ef_search"]
      search_nprobe = parsed_json["search_nprobe"]
      new(
        ef_search: ef_search,
        search_nprobe: search_nprobe,
        additional_properties: struct
      )
    end

    # Serialize an instance of UpdateSpannConfiguration to a JSON object
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
      obj.ef_search&.is_a?(Integer) != false || raise("Passed value for field obj.ef_search is not the expected type, validation failed.")
      obj.search_nprobe&.is_a?(Integer) != false || raise("Passed value for field obj.search_nprobe is not the expected type, validation failed.")
    end
  end
end
