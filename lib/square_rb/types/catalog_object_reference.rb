# frozen_string_literal: true
require "ostruct"
require "json"

module SquareApiClient
# A reference to a Catalog object at a specific version. In general this is
#  used as an entry point into a graph of catalog objects, where the objects exist
#  at a specific version.
  class CatalogObjectReference
  # @return [String] The ID of the referenced object.
    attr_reader :object_id
  # @return [Long] The version of the object.
    attr_reader :catalog_version
  # @return [OpenStruct] Additional properties unmapped to the current class definition
    attr_reader :additional_properties
  # @return [Object] 
    attr_reader :_field_set
    protected :_field_set

    OMIT = Object.new

    # @param object_id [String] The ID of the referenced object.
    # @param catalog_version [Long] The version of the object.
    # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
    # @return [SquareApiClient::CatalogObjectReference]
    def initialize(object_id: OMIT, catalog_version: OMIT, additional_properties: nil)
      @object_id = object_id if object_id != OMIT
      @catalog_version = catalog_version if catalog_version != OMIT
      @additional_properties = additional_properties
      @_field_set = { "object_id": object_id, "catalog_version": catalog_version }.reject do | _k, v |
  v == OMIT
end
    end
# Deserialize a JSON object to an instance of CatalogObjectReference
    #
    # @param json_object [String] 
    # @return [SquareApiClient::CatalogObjectReference]
    def self.from_json(json_object:)
      struct = JSON.parse(json_object, object_class: OpenStruct)
      parsed_json = JSON.parse(json_object)
      object_id = parsed_json["object_id"]
      catalog_version = parsed_json["catalog_version"]
      new(
        object_id: object_id,
        catalog_version: catalog_version,
        additional_properties: struct
      )
    end
# Serialize an instance of CatalogObjectReference to a JSON object
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
      obj.object_id&.is_a?(String) != false || raise("Passed value for field obj.object_id is not the expected type, validation failed.")
      obj.catalog_version&.is_a?(Long) != false || raise("Passed value for field obj.catalog_version is not the expected type, validation failed.")
    end
  end
end