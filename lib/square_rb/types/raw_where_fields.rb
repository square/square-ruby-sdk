# frozen_string_literal: true

require "ostruct"
require "json"

module ChromaApiClient
  class RawWhereFields
    # @return [Object]
    attr_reader :where
    # @return [Object]
    attr_reader :where_document
    # @return [OpenStruct] Additional properties unmapped to the current class definition
    attr_reader :additional_properties
    # @return [Object]
    attr_reader :_field_set
    protected :_field_set

    OMIT = Object.new

    # @param where [Object]
    # @param where_document [Object]
    # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
    # @return [ChromaApiClient::RawWhereFields]
    def initialize(where: OMIT, where_document: OMIT, additional_properties: nil)
      @where = where if where != OMIT
      @where_document = where_document if where_document != OMIT
      @additional_properties = additional_properties
      @_field_set = { "where": where, "where_document": where_document }.reject do |_k, v|
        v == OMIT
      end
    end

    # Deserialize a JSON object to an instance of RawWhereFields
    #
    # @param json_object [String]
    # @return [ChromaApiClient::RawWhereFields]
    def self.from_json(json_object:)
      struct = JSON.parse(json_object, object_class: OpenStruct)
      parsed_json = JSON.parse(json_object)
      where = parsed_json["where"]
      where_document = parsed_json["where_document"]
      new(
        where: where,
        where_document: where_document,
        additional_properties: struct
      )
    end

    # Serialize an instance of RawWhereFields to a JSON object
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
      obj.where&.is_a?(Object) != false || raise("Passed value for field obj.where is not the expected type, validation failed.")
      obj.where_document&.is_a?(Object) != false || raise("Passed value for field obj.where_document is not the expected type, validation failed.")
    end
  end
end
