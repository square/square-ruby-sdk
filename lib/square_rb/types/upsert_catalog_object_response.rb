# frozen_string_literal: true
require_relative "error"
require_relative "catalog_object"
require_relative "catalog_id_mapping"
require "ostruct"
require "json"

module SquareApiClient
  class UpsertCatalogObjectResponse
  # @return [Array<SquareApiClient::Error>] Any errors that occurred during the request.
    attr_reader :errors
  # @return [SquareApiClient::CatalogObject] The successfully created or updated CatalogObject.
    attr_reader :catalog_object
  # @return [Array<SquareApiClient::CatalogIdMapping>] The mapping between client and server IDs for this upsert.
    attr_reader :id_mappings
  # @return [OpenStruct] Additional properties unmapped to the current class definition
    attr_reader :additional_properties
  # @return [Object] 
    attr_reader :_field_set
    protected :_field_set

    OMIT = Object.new

    # @param errors [Array<SquareApiClient::Error>] Any errors that occurred during the request.
    # @param catalog_object [SquareApiClient::CatalogObject] The successfully created or updated CatalogObject.
    # @param id_mappings [Array<SquareApiClient::CatalogIdMapping>] The mapping between client and server IDs for this upsert.
    # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
    # @return [SquareApiClient::UpsertCatalogObjectResponse]
    def initialize(errors: OMIT, catalog_object: OMIT, id_mappings: OMIT, additional_properties: nil)
      @errors = errors if errors != OMIT
      @catalog_object = catalog_object if catalog_object != OMIT
      @id_mappings = id_mappings if id_mappings != OMIT
      @additional_properties = additional_properties
      @_field_set = { "errors": errors, "catalog_object": catalog_object, "id_mappings": id_mappings }.reject do | _k, v |
  v == OMIT
end
    end
# Deserialize a JSON object to an instance of UpsertCatalogObjectResponse
    #
    # @param json_object [String] 
    # @return [SquareApiClient::UpsertCatalogObjectResponse]
    def self.from_json(json_object:)
      struct = JSON.parse(json_object, object_class: OpenStruct)
      parsed_json = JSON.parse(json_object)
      errors = parsed_json["errors"]&.map do | item |
  item = item.to_json
  SquareApiClient::Error.from_json(json_object: item)
end
      unless parsed_json["catalog_object"].nil?
        catalog_object = parsed_json["catalog_object"].to_json
        catalog_object = SquareApiClient::CatalogObject.from_json(json_object: catalog_object)
      else
        catalog_object = nil
      end
      id_mappings = parsed_json["id_mappings"]&.map do | item |
  item = item.to_json
  SquareApiClient::CatalogIdMapping.from_json(json_object: item)
end
      new(
        errors: errors,
        catalog_object: catalog_object,
        id_mappings: id_mappings,
        additional_properties: struct
      )
    end
# Serialize an instance of UpsertCatalogObjectResponse to a JSON object
    #
    # @return [String]
    def to_json
      @_field_set&.to_json
    end
# Leveraged for Union-type generation, validate_raw attempts to parse the given
#  hash and check each fields type against the current object's property
#  definitions.
    #
    # @param obj [Object] 
    # @return [Void]
    def self.validate_raw(obj:)
      obj.errors&.is_a?(Array) != false || raise("Passed value for field obj.errors is not the expected type, validation failed.")
      obj.catalog_object.nil? || SquareApiClient::CatalogObject.validate_raw(obj: obj.catalog_object)
      obj.id_mappings&.is_a?(Array) != false || raise("Passed value for field obj.id_mappings is not the expected type, validation failed.")
    end
  end
end